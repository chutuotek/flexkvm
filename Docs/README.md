# FlexKVM 文档构建

FlexKVM 项目文档使用 MkDocs + Material for MkDocs 构建，支持多语言（中文/英文）和版本控制。

## 环境要求

- Python 3.x
- pip / pip3

## 快速开始

### 1. 安装依赖

```bash
./build.sh i
```

这将自动安装以下依赖：
- MkDocs
- Material for MkDocs 主题
- 必需的插件（i18n、mike、minify 等）

### 2. 本地预览

```bash
mkdocs serve
```

访问 http://127.0.0.1:8000 查看文档

### 3. 构建网站

```bash
./build.sh
```

构建结果输出到 `site/` 目录

## 构建命令

| 命令 | 说明 |
|------|------|
| `./build.sh i` | 安装 MkDocs 和所有依赖 |
| `./build.sh` | 仅构建网站（包含中英文） |
| `./build.sh c` | 构建 + gzip 压缩 |
| `./build.sh w` | 构建 + 清理无用文件 |
| `./build.sh o` | 构建 + 压缩 + 清理（推荐生产环境） |
| `./build.sh --help` | 显示帮助信息 |

## 版本控制 (mike)

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

默认支持中文和英文搜索。如需添加其他语言，修改 `build.sh` 中的 `SEARCH_LANGS` 数组：

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
│   ├── changelog/    # 更新日志
│   ├── product/      # 产品介绍
│   ├── guide/   # 用户指南
│   └── ...
├── Changelog/        # 更新日志源文件（使用 snippets 引用）
└── site/             # 构建输出目录
```
