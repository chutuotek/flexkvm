# AGENTS.md

## 项目

FlexKVM 是 ChuoTuoTEK 出品的 IP-KVM 带外管理设备（HDMI+USB 远程控屏、键鼠、电源、ISO 挂载）。本仓库是它的**官方产品文档仓库**（`chutuotek/flexkvm`），不含固件/App 源码。

- 文档站用 **MkDocs + Material for MkDocs** 构建，**中英双语**（i18n `suffix` 模式，英文文件以 `.en.md` 结尾），**mike** 做版本管理
- 双端部署：GitHub Pages（chutuotek.github.io/flexkvm）+ 自建服务器（flexkvm.com）
- 分支：`dev` 日常开发，`main` 稳定分支；版本通过 git tag `v*` 管理
- 在线文档站：<https://flexkvm.com>

## 仓库结构

```
FlexKVM/
├── BUILD.md                 # 本地构建指南（面向开发者；README 只保留产品内容）
├── Docs/                    # 文档工程（主要工作目录）
│   ├── mkdocs.yml           # 站点配置：主题、插件、i18n 翻译、nav 导航
│   ├── build.sh             # 构建脚本（安装/构建/压缩/mike 部署）
│   ├── docs/                # 文档源文件
│   │   ├── index.md         # 首页（中文，默认语言）
│   │   ├── index.en.md      # 首页英文翻译
│   │   ├── quick_start/     # 快速入门
│   │   ├── guide/           # 用户指南（product/network/remote/peripherals/system/security/maintenance/interaction/scenarios 等子目录）
│   │   ├── support/         # 常见问题与故障排查
│   │   ├── community/       # 社区与联系
│   │   └── changelog/       # 更新日志页（snippets 引用 Changelog/ 源文件）
│   ├── site/                # 构建输出（gitignored，勿提交）
│   └── out/                 # mike 版本化构建输出（gitignored，勿提交）
├── Changelog/               # 更新日志源文件
│   ├── Stable/CHANGELOG.md / CHANGELOG_CN.md
│   └── Dev/CHANGELOG.md / CHANGELOG_CN.md
├── .github/workflows/deploy.yml   # CI/CD：push main/v* 标签触发双端部署
├── .agents/                  # agent 技能与规则（见"写作规范"）
└── img/                     # 仓库级杂项图片（README 社群二维码等）
```

## 常用命令

```bash
cd Docs
./build.sh i        # 安装 MkDocs 及全部依赖（首次）
mkdocs serve        # 本地预览 → http://127.0.0.1:8000
./build.sh b        # 仅构建
./build.sh r        # 构建 + 清理无用文件
./build.sh o        # 构建 + 压缩 + 清理（生产环境推荐）
./build.sh mr       # mike 部署所有 git tag 版本 + 当前为 latest，输出到 out/
mike list           # 查看已部署版本
```

## 写作约定

### 中英双语

- 中文是默认语言（`xxx.md`），英文翻译放同目录 `xxx.en.md`；新增页面需同步维护翻译（除非明确仅中文）
- 在 `mkdocs.yml` 的 `nav` 新增条目后，**必须同步**在 `plugins.i18n.nav_translations` 中补充中文→英文映射，否则英文站导航缺失

### 内容与格式

- 图片存放于各章节目录的 `images/` 子目录，使用相对路径引用；**优先 .webp 格式**（`mkdocs.yml` 的 `exclude_docs` 会排除 `*.png`）
- 操作引导多用 Material 扩展：`!!! tip/admonition`、`=== "标签页"`（tabbed）、`- [x]` 任务列表、表格化参数说明
- 更新日志不直接手写：`Docs/docs/changelog/dev.md` 通过 snippets 引用 `Changelog/Dev/CHANGELOG_CN.md`（`--8<-- "Changelog/..."` 语法），改版本日志请改 `Changelog/` 下源文件；发版时同步维护 Stable 与 Dev 两份
- 站点细节（版本别名、ICP、构建清理项）以 `Docs/build.sh` 为准，改动前先读它

### 写作规范（重要）

遵循 `.agents/skills/rule/writing-guide.md`：

- 禁止"上图/下图/可以看到/这个是一个/会 填充词"等表述，直接陈述事实
- 操作步骤用祈使句；描述 UI 用名词（菜单栏中的屏幕按键），不用方位词
- 功能说明用"功能 → 效果"结构：先说什么，再说能干什么
- 文档改动完成后，可用 `.agents/skills/doc-review-user` 技能从用户视角审查（前置条件、步骤完整性、歧义、错误处理）

### 提交信息

历史沿用 Conventional Commits，中文描述：

```
docs(network): 新增 Tailscale 加速中继章节
docs(ota): 将固件下载默认源改为 Gitcode
docs(changelog): 更新 v0.1.5 变更日志
```

## 开发流程

1. 在 `dev` 分支上开发，合入 `main` 前先在本地 `mkdocs serve` 验证中英文渲染
2. 发版：打 `v*` 标签（如 `v0.1.5`），CI 自动执行——遍历所有 tag 构建历史版本 + 当前提交部署为 `latest`，双端发布
3. 构建失败/部署异常查 `.github/workflows/deploy.yml`：工作流使用两个隔离克隆分别产出 server 版（含 ICP 备案信息，ssh-deploy 到自有服务器）与 GitHub Pages 版（注入 `site_url` 后部署 `gh-pages`）

## 注意事项

- `Docs/site/`、`Docs/out/` 是构建产物（gitignored），**不要提交或手动修改**
- 改动 `mkdocs.yml`、`build.sh`、`deploy.yml` 属于高风险变更，务必本地完整构建一次再提交
- 删除/重命名页面时，同步清理 `nav`、i18n 翻译、站内链接与 snippets 引用
- 大图不要直接放不进 `exclude_docs` 的格式（`.png` 会被排除出站点），截图请转 `.webp`
- 本仓库的 `.agents/skills` 供各 agent 工具共用，修改写作规范时注意一致性（AGENTS.md 只做指引，细则以 SKILL.md 为准）