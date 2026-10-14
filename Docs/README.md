# FlexKVM

**即插即用的硬件级带外管理设备。** 将它接入目标主机的 HDMI 和 USB，即可通过浏览器或 Tailscale 网络，随时随地查看屏幕、控制键鼠、开关电源、挂载 ISO —— 即使目标系统宕机、无显卡驱动、甚至未安装操作系统。

> 无需在被控主机上安装任何软件，无需公网 IP。

## 核心能力

- **远程桌面控制**：硬件级捕获 HDMI 信号，最高 1920×1200@60Hz，BIOS/蓝屏/安全模式都能看见
- **远程开关机**：ATX 控制接口实现电源远程管理，支持正常开关机、强制重启
- **虚拟 U 盘**：TF 卡 ISO 镜像远程挂载为虚拟光驱，远程重装系统
- **异地组网**：内置 Tailscale，端到端加密，无需公网 IP
- **双网络冗余**：WiFi 6（2.4G/5G）+ 百兆有线，自动切换
- **串口与 GPIO**：UART 串口通信与 GPIO 控制，满足嵌入式调试
- **极致小巧**：65 × 46 × 22 mm，约 100 g，铝合金被动散热，7×24 小时静音运行

## 文档站点

项目文档使用 MkDocs + Material for MkDocs 构建，支持中英双语和版本管理。

在线文档：[https://docs.chutuotek.com](https://docs.chutuotek.com)

## 环境要求

- Python 3.x
- pip / pip3

## 快速开始

### 1. 安装依赖

```bash
./build.sh deps
```

这将自动安装以下依赖：
- MkDocs
- Material for MkDocs 主题
- 必需的插件（i18n、mike、minify 等）

### 2. 本地预览

```bash
./build.sh serve
```

访问 http://127.0.0.1:8000 查看文档

### 3. 构建网站

```bash
./build.sh build
```

构建结果输出到 `out/` 目录。

> `./build.sh` 不带参数只显示帮助信息，不会构建。

## 构建命令

| 命令 | 说明 |
|------|------|
| `./build.sh deps` | 安装 MkDocs 和所有依赖（首次） |
| `./build.sh serve` | 本地预览 → http://127.0.0.1:8000 |
| `./build.sh build` | 构建网站到 `out/`（默认清理无用文件） |
| `./build.sh build --gzip` | 构建 + gzip 压缩静态资源（生产环境推荐） |
| `./build.sh build --keep` | 构建但保留 source map 与多余的 lunr 文件 |
| `./build.sh clean` | 仅删除 `site/` 和 `out/` |
| `./build.sh deploy github` | mike 部署到 GitHub Pages（`gh-pages` 分支） |
| `./build.sh deploy server` | mike 部署到自建站（`gh-pages-server` 分支，含 ICP 备案号） |
| `./build.sh help` | 显示帮助信息（不带参数同样是帮助） |

环境变量：

| 变量 | 说明 |
|------|------|
| `MIKE_BLACKLIST` | `deploy` 时要跳过的 tag（空格分隔），如 `"v0.0.5 v0.0.6"` |
| `SITE_URL` | 非空时临时注入 `mkdocs.yml` 的 `site_url`，部署结束自动还原。GitHub Pages 需要，如 `https://chutuotek.github.io/flexkvm` |

> CI（`.github/workflows/deploy.yml`）直接调用本脚本：自建站走 `deploy server`，GitHub Pages 走 `SITE_URL=... deploy github`。

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

## 图片规范

文档配图**统一使用无损 WebP**。

### 为什么

WebP 同时满足三个需求：无损（截图文字、UI 边缘零损失）、体积远小于 PNG（同批图约省 45%）、不需要像有损格式那样在画质与体积间取舍。

仓库内的历史 PNG 已全部转换为无损 WebP 并删除源文件，**不再保留 PNG**。

### 转换方法

单张：

```bash
cwebp -lossless -m 6 -metadata none 原图.png -o 输出.webp
```

- `-lossless`：必加，无损编码
- `-m 6`：压缩档位 0~6，`6` 已是最高档且速度可接受。不建议 `-z 9`——只再小约 1.8%，但耗时是数倍
- `-metadata none`：丢弃 EXIF 等元数据

批量（多核并行，`cwebp` 单进程无法并行）：

```bash
find . -iname "*.png" -print0 | xargs -0 -P "$(nproc)" -I{} \
  sh -c 'cwebp -quiet -lossless -m 6 -metadata none "{}" -o "${1%.png}.webp"' _ {}
```

### 校验

转换后必须确认是无损格式：

```bash
webpinfo 图片.webp | grep Format
# 应输出：Format: Lossless (2)      （有损会显示 Lossy (1)，不合格）
```

批量校验，列出所有非无损的图：

```bash
for f in $(find docs -iname "*.webp"); do
  webpinfo "$f" 2>/dev/null | grep -q "Lossless" || echo "非无损: $f"
done
```

> 输出里会有若干"历史遗留"的无损前图片（没有原始 PNG 母版的那批，见下表），属已知例外，不是转换失败。

### 以下几种情况例外

| 情况 | 做法 |
|------|------|
| 图标、线框图 | 用 **SVG**（矢量、可缩放、体积极小），不转 WebP |
| 拿不到原始 PNG 的图 | 保持原样。有损痕迹已烙进像素，转无损画质不会提升，只会让体积数倍膨胀 |
| 照片等连续色调大图 | 若体积实在过大，可用有损 WebP（`-q 90`），但要确认文字细节仍可辨认 |

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
