# 本地构建文档

本项目文档使用 MkDocs + Material for MkDocs 构建，支持中英双语和版本管理（mike）。本文档面向开发者，说明如何在本机构建与预览文档站；详细说明见 [Docs/README.md](Docs/README.md)。

## 环境要求

- Python 3.x
- pip / pip3

## 快速开始

```bash
# 进入文档目录
cd Docs

# 安装依赖（首次）
./build.sh i

# 本地预览，访问 http://127.0.0.1:8000
mkdocs serve

# 构建网站
./build.sh
```

构建结果输出到 `site/` 目录。

## 构建命令

| 命令 | 说明 |
|------|------|
| `./build.sh i` | 安装 MkDocs 和所有依赖 |
| `./build.sh b` | 仅构建网站（包含中英文） |
| `./build.sh r` | 构建 + 清理无用文件 |
| `./build.sh o` | 构建 + 压缩 + 清理（推荐生产环境） |
| `./build.sh mr` | mike 部署所有 git 标签版本 + 当前为 latest，输出到 `out/` |
| `./build.sh -h` | 显示帮助信息 |

## 版本控制（mike）

部署文档版本：

```bash
# 部署稳定版
mike deploy --push --update-aliases v0.0.6 stable

# 部署开发版
mike deploy --push dev dev

# 设置默认版本
mike set-default --push stable

# 列出所有版本
mike list
```

## 搜索语言配置

默认支持中文和英文搜索。如需添加其他语言，修改 `Docs/build.sh` 中的 `SEARCH_LANGS` 数组：

```bash
SEARCH_LANGS=("zh" "en" "ja")  # 添加日语支持
```

## 项目结构

```
Docs/
├── build.sh          # 构建脚本
├── mkdocs.yml        # MkDocs 配置
├── docs/             # 文档源文件
│   ├── index.md      # 首页（中文）
│   ├── index.en.md   # 首页（英文）
│   ├── quick_start/  # 快速入门
│   ├── guide/        # 用户指南（设备、网络、远程、场景等）
│   ├── support/      # 常见问题与排查
│   ├── community/    # 社区与联系
│   ├── changelog/    # 更新日志
│   └── ...
├── Changelog/        # 更新日志源文件（使用 snippets 引用）
└── site/             # 构建输出目录
```

## CI/CD

GitHub Actions（`.github/workflows/deploy.yml`）在 push `main` 分支或打 `v*` 标签时自动构建并双端部署：自建服务器（docs.chutuotek.com）与 GitHub Pages（chutuotek.github.io/flexkvm）。