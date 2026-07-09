#!/bin/bash
# MkDocs build script

SITE_DIR="site"
# MIKE_VERSION 和 MIKE_ALIAS 现在会自动检测（可通过环境变量覆盖）
MIKE_VERSION="${MIKE_VERSION:-}"
MIKE_ALIAS="${MIKE_ALIAS:-}"
SEARCH_LANGS=("zh" "en")
LUNR_BASE_SUPPORT=(
    "lunr.stemmer.support.min.js"
    "lunr.wordcut.js"
    "lunr.tinyseg.js"
    "lunr.multi.min.js"
)

# Blacklist: tags to skip during mike deploy (space-separated)
MIKE_BLACKLIST=(${MIKE_BLACKLIST:-})

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# ==============================================================================
# Functions
# ==============================================================================

show_help() {
    cat << EOF
Usage: ./build.sh [COMMAND]

Commands:
  i      Install MkDocs and dependencies
  b      Build site
  r      Build + Remove unnecessary files
  o      Build + Remove unnecessary files + Gzip compress
  c      Cleanup site directory
  h      Show this help message

Mike commands (versioned docs to out/):
  mb     Mike deploy ALL versions from git tags + current as 'latest'
  mr     Same as 'mb' (with cleanup)
  mo     Mike deploy with ICP filing (optimized for production)

Environment:
  MIKE_BLACKLIST              # Tags to skip (e.g., "v0.0.5 v0.0.6")

Version detection:
  - All git tags (v*) are deployed with their version number
  - Current HEAD (no tag) is deployed as 'latest'
  - Blacklisted tags are skipped

Examples:
  ./build.sh mr               # Deploy all versions + cleanup
  ./build.sh mo               # Deploy with ICP filing + cleanup
  MIKE_BLACKLIST="v0.0.5 v0.0.6" ./build.sh mr
EOF
}

install_deps() {
    echo -e "${GREEN}=== Installing MkDocs and dependencies ===${NC}"

    local pip_cmd="pip"
    command -v pip3 &>/dev/null && pip_cmd="pip3"

    if ! command -v "$pip_cmd" &>/dev/null; then
        echo -e "${YELLOW}Error: pip is not installed${NC}"
        exit 1
    fi

    echo -e "${BLUE}Updating pip...${NC}"
    $pip_cmd install --upgrade pip

    echo -e "${BLUE}Installing packages...${NC}"
    $pip_cmd install mkdocs mkdocs-material \
        mkdocs-section-index \
        mkdocs-git-revision-date-localized-plugin \
        mkdocs-minify-plugin \
        pymdown-extensions \
        markdown-checklist \
        mkdocs-static-i18n \
        mike

    echo -e "${GREEN}=== Installation complete! ===${NC}"
    mkdocs --version
}

get_file_size() {
    local size
    size=$(stat -f%z "$1" 2>/dev/null) || size=$(stat -c%s "$1" 2>/dev/null) || size="0"
    [ -z "$size" ] && size="0"
    echo "$size"
}

format_size() {
    local size=$1
    if [ "$size" -ge 1073741824 ]; then
        awk "BEGIN {printf \"%.2f GB\", $size/1073741824}"
    elif [ "$size" -ge 1048576 ]; then
        awk "BEGIN {printf \"%.2f MB\", $size/1048576}"
    elif [ "$size" -ge 1024 ]; then
        awk "BEGIN {printf \"%.2f KB\", $size/1024}"
    else
        echo "${size} B"
    fi
}

get_dir_size() {
    local size
    size=$(du -sb "$1" 2>/dev/null | cut -f1) || size="0"
    [ -z "$size" ] && size="0"
    echo "$size"
}

print_summary() {
    local dir="${1:-$SITE_DIR}"
    [ ! -d "$dir" ] && return
    local size=$(get_dir_size "$dir")
    echo -e "${BLUE}Site size: $(format_size $size)${NC}"
}

cleanup_files() {
    local target_dir="${1:-$SITE_DIR}"
    local removed_size=0 removed_count=0

    echo -e "${GREEN}=== Cleanup: $target_dir ===${NC}"

    # Remove source maps
    while IFS= read -r -d '' f; do
        local s=$(get_file_size "$f")
        rm -f "$f"
        removed_size=$((removed_size + s))
        removed_count=$((removed_count + 1))
        echo "  Removed: ${f#$target_dir/} ($(format_size $s))"
    done < <(find "$target_dir" -type f -name '*.map' -print0 2>/dev/null)

    # Build keep pattern for lunr files
    local keep_pattern=""
    for lang in "${SEARCH_LANGS[@]}"; do
        keep_pattern+="lunr.${lang}.min.js|"
    done
    for f in "${LUNR_BASE_SUPPORT[@]}"; do
        keep_pattern+="$f|"
    done
    keep_pattern="${keep_pattern%|}"

    # Remove unused lunr files
    local lunr_dir="$target_dir/assets/javascripts/lunr/min"
    if [ -d "$lunr_dir" ]; then
        while IFS= read -r -d '' f; do
            local fn=$(basename "$f")
            if ! echo "$fn" | grep -qE "^($keep_pattern)(.gz)?$"; then
                local s=$(get_file_size "$f")
                rm -f "$f"
                removed_size=$((removed_size + s))
                removed_count=$((removed_count + 1))
                echo "  Removed: ${f#$target_dir/} ($(format_size $s))"
            fi
        done < <(find "$lunr_dir" -type f \( -name 'lunr.*.min.js' -o -name 'lunr.*.js.gz' \) -print0 2>/dev/null)
    fi

    # Remove unused lunr directories (keep only 'min')
    local lunr_base="$target_dir/assets/javascripts/lunr"
    if [ -d "$lunr_base" ]; then
        while IFS= read -r -d '' d; do
            local dn=$(basename "$d")
            if [ "$dn" != "min" ]; then
                local s=$(get_dir_size "$d")
                rm -rf "$d"
                removed_size=$((removed_size + s))
                removed_count=$((removed_count + 1))
                echo "  Removed: ${d#$target_dir/} ($(format_size $s))"
            fi
        done < <(find "$lunr_base" -mindepth 1 -maxdepth 1 -type d -print0 2>/dev/null)
    fi

    [ "$removed_count" -gt 0 ] && \
        echo -e "${BLUE}Removed $removed_count files, saved $(format_size $removed_size)${NC}"
}

compress_files() {
    local target_dir="${1:-$SITE_DIR}"
    echo -e "${GREEN}=== Compressing: $target_dir ===${NC}"

    local before_size=$(get_dir_size "$target_dir")
    [ "$before_size" -eq 0 ] && {
        echo -e "${YELLOW}Directory is empty or does not exist${NC}"
        return 1
    }

    local total_orig=0 total_comp=0 file_count=0

    find "$target_dir" -type f \( -name '*.html' -o -name '*.css' -o -name '*.js' \
        -o -name '*.json' -o -name '*.svg' -o -name '*.txt' \
        -o -name '*.xml' -o -name '*.woff' -o -name '*.woff2' \) ! -name '*.gz' \
        -print0 2>/dev/null | while IFS= read -r -d '' file; do
        local orig_size=$(get_file_size "$file")
        gzip -9 -c "$file" > "$file.gz" 2>/dev/null || continue
        local comp_size=$(get_file_size "$file.gz")
        rm -f "$file"
        echo "  ${file#$target_dir/}.gz: $(format_size $orig_size) -> $(format_size $comp_size)"
    done

    local after_size=$(get_dir_size "$target_dir")
    local saved=$((before_size - after_size))
    local ratio=$(awk "BEGIN {printf \"%.1f\", ($saved/$before_size)*100}")

    echo -e "${BLUE}$(format_size $before_size) -> $(format_size $after_size) (saved $ratio%)${NC}"
}

strip_png_from_site() {
    local target_dir="${1:-$SITE_DIR}"
    local count=$(find "$target_dir" -name '*.png' -type f 2>/dev/null | wc -l)
    if [ "$count" -gt 0 ]; then
        find "$target_dir" -name '*.png' -type f -delete 2>/dev/null
        echo -e "${BLUE}Removed $count PNG files from $target_dir${NC}"
    fi
}

build_site() {
    echo -e "${GREEN}=== Building site ===${NC}"
    mkdocs build || { echo -e "${YELLOW}Build failed!${NC}"; exit 1; }
    strip_png_from_site
    print_summary
}

finalize_build() {
    echo -e "${BLUE}=== Finalizing to out/ ===${NC}"
    rm -rf out
    cp -r site out
    rm -rf site
    print_summary out
}

add_icp_filing() {
    local mkdocs_file="mkdocs.yml"
    local icp_line='  <br/>\n  <a href="https://beian.miit.gov.cn/" target="_blank">粤ICP备2025435626号</a>'
    echo -e "${BLUE}=== Adding ICP filing to mkdocs.yml ===${NC}"
    sed -i "/^copyright:/a\\$icp_line" "$mkdocs_file"
}

remove_icp_filing() {
    local mkdocs_file="mkdocs.yml"
    echo -e "${BLUE}=== Removing ICP filing from mkdocs.yml ===${NC}"
    sed -i '/beian.miit.gov.cn/d' "$mkdocs_file"
}

mike_deploy() {
    local cleanup="${1:-false}"
    local add_icp="${2:-false}"
    local branch="${3:-gh-pages}"

    echo -e "${GREEN}=== Deploying with mike to $branch branch ===${NC}"

    # Add ICP filing if requested
    [ "$add_icp" = true ] && add_icp_filing

    local repo_root=$(git rev-parse --show-toplevel)
    local current_branch=$(git -C "$repo_root" branch --show-current)
    local deployed=0

    # 清理本地 gh-pages 分支（如果存在）
    echo -e "${BLUE}=== Cleaning local $branch branch ===${NC}"
    if git show-ref --verify --quiet "refs/heads/$branch" 2>/dev/null; then
        git branch -D "$branch" 2>/dev/null
        echo -e "${YELLOW}Deleted local $branch branch${NC}"
    fi

    # Deploy all versions from git tags (历史版本)
    echo -e "${BLUE}=== Deploying historical versions from git tags ===${NC}"
    for tag in $(git -C "$repo_root" tag -l "v*" | sort -V); do
        # Check if tag has mkdocs.yml
        git -C "$repo_root" show "$tag:Docs/mkdocs.yml" &>/dev/null || continue

        # Skip blacklisted tags
        local skipped=false
        for black in "${MIKE_BLACKLIST[@]}"; do
            if [ "$tag" = "$black" ]; then
                echo -e "${YELLOW}Skipped (blacklisted): $tag${NC}"
                skipped=true
                break
            fi
        done
        [ "$skipped" = true ] && continue

        echo -e "${BLUE}Deploying: $tag${NC}"
        git -C "$repo_root" checkout "$tag" 2>/dev/null || true
        mike deploy "$tag" --branch "$branch" --ignore-remote || true
        deployed=$((deployed + 1))
    done

    # Checkout back to original branch
    git -C "$repo_root" checkout "$current_branch" 2>/dev/null

    echo -e "${BLUE}Deployed $deployed historical versions${NC}"

    # Deploy current version as 'latest' (部署当前版本为 latest)
    echo -e "${BLUE}Deploying current version as: latest${NC}"
    mike deploy "latest" --branch "$branch" --ignore-remote || true

    # Export to out directory
    local temp_dir=".git/mike-temp"
    rm -rf "$temp_dir"
    git worktree add "$temp_dir" "$branch"

    rm -rf out
    cp -r "$temp_dir" out

    git worktree remove "$temp_dir" 2>/dev/null || rm -rf "$temp_dir"

    strip_png_from_site out

    # Create redirect index.html at root
    cat > out/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Redirecting...</title>
    <meta http-equiv="refresh" content="0; url=latest/">
    <script>window.location.href = 'latest/';</script>
</head>
<body>
    <p>Redirecting to <a href="latest/">latest/</a>...</p>
</body>
</html>
EOF

    [ "$cleanup" = true ] && cleanup_files out

    # Restore mkdocs.yml if ICP was added
    [ "$add_icp" = true ] && remove_icp_filing

    echo -e "${GREEN}=== Deploy complete! ===${NC}"
    mike list
    echo -e "${BLUE}Output: out/ (index.html redirects to latest/)${NC}"
}

# ==============================================================================
# Main
# ==============================================================================

case "${1:-}" in
    h|-h|--help|"")  show_help ;;
    i)               install_deps ;;
    b)               rm -rf site out; build_site; finalize_build ;;
    r)               rm -rf site out; build_site; cleanup_files; finalize_build ;;
    o)               rm -rf site out; build_site; compress_files; cleanup_files; finalize_build ;;
    c)               rm -rf site out ;;
    mb)              rm -rf site out; mike_deploy false false ;;
    mr)              rm -rf site out; mike_deploy true false ;;
    mo)              rm -rf site out; mike_deploy true true ;;
    *)               echo -e "${YELLOW}Unknown: $1${NC}"; show_help; exit 1 ;;
esac
