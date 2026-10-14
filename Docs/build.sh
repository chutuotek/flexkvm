#!/bin/bash
# MkDocs build script

SITE_DIR="site"
SEARCH_LANGS=("zh" "en")
LUNR_BASE_SUPPORT=(
    "lunr.stemmer.support.min.js"
    "lunr.wordcut.js"
    "lunr.tinyseg.js"
    "lunr.multi.min.js"
)

# Blacklist: tags to skip during mike deploy (space-separated)
MIKE_BLACKLIST=(${MIKE_BLACKLIST:-})

# 站点域名：非空时注入 mkdocs.yml 的 site_url（mike 部署到 GitHub Pages 需要）
SITE_URL="${SITE_URL:-}"

# mike 分支名：GitHub Pages / 自建服务器
MIKE_BRANCH_GITHUB="gh-pages"
MIKE_BRANCH_SERVER="gh-pages-server"

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
Usage: ./build.sh <COMMAND> [OPTIONS]

Commands:
  deps                Install MkDocs and dependencies
  serve               Local preview at http://127.0.0.1:8000
  build               Build site into out/
  clean               Remove site/ and out/
  deploy <target>     Deploy versioned docs via mike
                        github   GitHub Pages (branch: $MIKE_BRANCH_GITHUB)
                        server   Self-hosted, with ICP filing (branch: $MIKE_BRANCH_SERVER)
  help                Show this message

Options:
  --gzip              (build)  Gzip compress instead of deleting originals
  --keep              (build/deploy)  Keep source maps & unused lunr files

Environment:
  MIKE_BLACKLIST      Tags to skip during deploy (e.g., "v0.0.5 v0.0.6")
  SITE_URL            Inject site_url into mkdocs.yml (needed for GitHub Pages)

Deploy basics:
  - All git tags (v*) are deployed with their version number
  - Current HEAD (no tag) is deployed as 'latest'
  - Blacklisted tags are skipped

Examples:
  ./build.sh deps
  ./build.sh serve
  ./build.sh build --gzip
  ./build.sh deploy server                          # self-hosted, includes ICP
  SITE_URL=https://chutuotek.github.io/flexkvm \\
    ./build.sh deploy github                        # GitHub Pages
  MIKE_BLACKLIST="v0.0.5 v0.0.6" ./build.sh deploy server
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
    $pip_cmd install --upgrade pip || {
        echo -e "${YELLOW}Error: failed to upgrade pip${NC}"
        exit 1
    }

    echo -e "${BLUE}Installing packages...${NC}"
    $pip_cmd install mkdocs mkdocs-material \
        mkdocs-section-index \
        mkdocs-git-revision-date-localized-plugin \
        mkdocs-minify-plugin \
        pymdown-extensions \
        markdown-checklist \
        mkdocs-static-i18n \
        mike || {
        echo -e "${YELLOW}Error: failed to install dependencies${NC}"
        exit 1
    }

    command -v mkdocs &>/dev/null || {
        echo -e "${YELLOW}Error: mkdocs is not available after installation${NC}"
        exit 1
    }

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

build_site() {
    echo -e "${GREEN}=== Building site ===${NC}"
    mkdocs build || { echo -e "${YELLOW}Build failed!${NC}"; exit 1; }
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
    # 与 add_icp_filing 对称：注入的是「<br/> + 备案链接」两行，
    # 只删链接行会残留 <br/>（重复调用会不断累积），故连同紧邻上方的
    # 那个 <br/> 一起删。用 have 标志暂存上一行，避免误丢空行。
    awk '
        /beian\.miit\.gov\.cn/ {
            if (have && prev ~ /^  <br\/>$/) have = 0
            next
        }
        { if (have) print prev; prev = $0; have = 1 }
        END { if (have) print prev }
    ' "$mkdocs_file" > "$mkdocs_file.tmp" && mv "$mkdocs_file.tmp" "$mkdocs_file"
}

# 注入 site_url（GitHub Pages 需要正确的绝对域名）。已有则跳过。
add_site_url() {
    local url="$1"
    local mkdocs_file="mkdocs.yml"
    [ -z "$url" ] && return 0
    if grep -q "^site_url:" "$mkdocs_file"; then
        echo -e "${BLUE}=== site_url already set, skipping ===${NC}"
        return 0
    fi
    echo -e "${BLUE}=== Injecting site_url: $url ===${NC}"
    sed -i "/^repo_url:/a site_url: $url" "$mkdocs_file"
}

remove_site_url() {
    local mkdocs_file="mkdocs.yml"
    echo -e "${BLUE}=== Removing site_url from mkdocs.yml ===${NC}"
    sed -i '/^site_url:/d' "$mkdocs_file"
}

mike_deploy() {
    local branch="${1:-$MIKE_BRANCH_GITHUB}"
    local keep="${2:-false}"
    local add_icp="${3:-false}"

    echo -e "${GREEN}=== Deploying with mike to $branch branch ===${NC}"

    local repo_root=$(git rev-parse --show-toplevel)
    local current_branch=$(git -C "$repo_root" branch --show-current)
    [ -z "$current_branch" ] && current_branch="main"
    local deployed=0

    # 临时改写 mkdocs.yml：ICP（自建站）、site_url（GitHub Pages）。
    # 循环里 checkout 每个 tag 会把工作区重置，所以每次 checkout 后都要重新注入
    # （见 loop 内 apply_mkdocs_overrides 调用），故这里也封装成一个动作。
    apply_mkdocs_overrides() {
        [ "$add_icp" = true ] && add_icp_filing
        [ -n "$SITE_URL" ] && add_site_url "$SITE_URL"
    }

    apply_mkdocs_overrides

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
        # 丢弃当前改动再切 tag，否则 checkout 会被本地修改阻塞
        git -C "$repo_root" checkout -- . 2>/dev/null || true
        git -C "$repo_root" checkout "$tag" 2>/dev/null || true
        # tag 检出后 mkdocs.yml 是 tag 的版本，需重新注入本次覆盖项
        apply_mkdocs_overrides
        mike deploy "$tag" --branch "$branch" --ignore-remote-status || true
        deployed=$((deployed + 1))
    done

    # Checkout back to original branch
    git -C "$repo_root" checkout -- . 2>/dev/null || true
    git -C "$repo_root" checkout "$current_branch" 2>/dev/null || true
    # 回到原分支后重新注入，保证 latest 带上覆盖项
    apply_mkdocs_overrides

    echo -e "${BLUE}Deployed $deployed historical versions${NC}"

    # Deploy current version as 'latest' (部署当前版本为 latest)
    echo -e "${BLUE}Deploying current version as: latest${NC}"
    mike deploy "latest" --branch "$branch" --ignore-remote-status || true

    # Export to out directory
    local temp_dir=".git/mike-temp"
    rm -rf "$temp_dir"
    git worktree add "$temp_dir" "$branch"

    rm -rf out
    cp -r "$temp_dir" out

    git worktree remove "$temp_dir" 2>/dev/null || rm -rf "$temp_dir"

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

    [ "$keep" = false ] && cleanup_files out

    # 还原 mkdocs.yml 的临时改写
    git -C "$repo_root" checkout -- mkdocs.yml 2>/dev/null || \
        { [ "$add_icp" = true ] && remove_icp_filing; [ -n "$SITE_URL" ] && remove_site_url; }

    echo -e "${GREEN}=== Deploy complete! ===${NC}"
    mike list
    echo -e "${BLUE}Output: out/ (index.html redirects to latest/)${NC}"
}

# ==============================================================================
# Main
# ==============================================================================

CMD="${1:-help}"
[ "$CMD" = "-h" ] || [ "$CMD" = "--help" ] && CMD="help"

# 解析选项：--gzip（压缩）、--keep（保留 source map 与多余 lunr 文件）
GZIP=false
KEEP=false
shift 2>/dev/null || shift $#
TARGET=""
for arg in "$@"; do
    case "$arg" in
        --gzip) GZIP=true ;;
        --keep) KEEP=true ;;
        -*)     echo -e "${YELLOW}Unknown option: $arg${NC}"; show_help; exit 1 ;;
        *)      TARGET="$arg" ;;
    esac
done

# 是否需要清理构建产物（默认清理；--keep 时保留）
need_cleanup() { [ "$KEEP" = true ] && return 1 || return 0; }

case "$CMD" in
    help|"")     show_help ;;

    deps)        install_deps ;;

    serve)       mkdocs serve ;;

    clean)       rm -rf site out
                 echo -e "${GREEN}=== Removed site/ and out/ ===${NC}" ;;

    build)
        rm -rf site out
        build_site
        [ "$GZIP" = true ] && compress_files
        need_cleanup && cleanup_files
        finalize_build
        ;;

    deploy)
        case "$TARGET" in
            github)
                rm -rf site out
                mike_deploy "$MIKE_BRANCH_GITHUB" "$KEEP" false
                ;;
            server)
                rm -rf site out
                mike_deploy "$MIKE_BRANCH_SERVER" "$KEEP" true
                ;;
            ""|*)
                echo -e "${YELLOW}Error: 'deploy' needs a target: github | server${NC}"
                show_help
                exit 1
                ;;
        esac
        ;;

    *)           echo -e "${YELLOW}Unknown command: $CMD${NC}"; show_help; exit 1 ;;
esac
