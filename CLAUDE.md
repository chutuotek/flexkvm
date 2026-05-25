# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

FlexKVM 产品文档仓库，使用 MkDocs + Material for MkDocs 构建多语言（中/英）文档网站。文档托管于 GitHub Pages 和自建服务器，支持版本管理（mike）。

## 常用命令

```bash
# 进入文档目录
cd Docs

# 安装依赖
./build.sh i

# 本地预览（访问 http://127.0.0.1:8000）
mkdocs serve

# 构建网站（仅构建）
./build.sh b

# 构建 + 清理无用文件
./build.sh r

# 构建 + 压缩 + 清理（生产环境推荐）
./build.sh o

# 部署所有版本到 out/（用于 mike 版本管理）
./build.sh mr

# 查看 mike 版本列表
mike list
```

## 文档架构

```
Docs/
├── mkdocs.yml          # MkDocs 配置（导航、主题、插件）
├── build.sh            # 构建脚本（安装、构建、压缩、mike 部署）
├── docs/               # 文档源文件（中/英双语）
│   ├── index.md        # 中文首页
│   ├── index.en.md     # 英文首页（i18n 使用 suffix 模式）
│   ├── product/        # 产品介绍
│   ├── quick_start/    # 快速入门（核心文档）
│   ├── guide/          # 用户指南（设备、远程控制、账号、网络、系统、高级功能等）
│   ├── support/        # 常见问题与故障排查
│   ├── community/      # 社区与联系
│   └── changelog/      # 更新日志
├── Changelog/          # CHANGELOG.md 源文件（通过 snippets 引用）
└── site/               # 构建输出目录
```

## 关键配置说明

- **i18n 配置**：使用 `suffix` 模式，英文文件以 `.en.md` 结尾
- **snippets 插件**：引用外部文件，`base_path` 包含 `docs`、`..`（Docs 目录）、`../..`（仓库根目录），用于引用 `Changelog/` 中的更新日志
- **版本管理**：mike 部署到 `gh-pages` 分支，默认版本 `stable`
- **导航结构**：首页 → 产品 → 快速入门 → 用户指南（多级子目录） → 常见问题 → 社区 → 更新日志

## 文档写作规范

- 中文为主语言，英文为 `.en.md` 后缀的翻译版本
- 图片存放于各目录的 `images/` 子目录
- 使用 Material for MkDocs 的 admonition、tabs、details 等扩展
- 状态指示、步骤说明使用表格呈现

## CI/CD 流程

GitHub Actions（`.github/workflows/deploy.yml`）：
- 触发：main 分支 push、v* 标签、Docs 目录变更
- 构建：从 git tags 部署历史版本，当前版本部署为 `latest`
- 双输出：自建服务器（rsync）+ GitHub Pages

## 项目级技能

- `doc-review-user`：从用户视角审查文档，检查前置条件、步骤完整性、示例可运行性、歧义等维度