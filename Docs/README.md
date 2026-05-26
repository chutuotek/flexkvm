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
│   ├── quick_start/  # 快速入门
│   ├── guide/        # 用户指南（设备、网络、远程、场景等）
│   ├── support/      # 常见问题与排查
│   ├── community/    # 社区与联系
│   ├── changelog/    # 更新日志
│   └── ...
├── Changelog/        # 更新日志源文件（使用 snippets 引用）
└── site/             # 构建输出目录
```
