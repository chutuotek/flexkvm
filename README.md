# FlexKVM

[![GitHub](https://img.shields.io/badge/GitHub-chutuotek/flexkvm-blue?logo=github)](https://github.com/chutuotek/flexkvm)
[![官方网站](https://img.shields.io/badge/官方网站-flexkvm.com-green?logo=globe)](https://flexkvm.com)

一款高效、灵活的 IP-KVM 解决方案，通过 HDMI+USB 实现完整的远程设备控制。

## 简介

FlexKVM 是一款即插即用的带外管理设备。将它接入目标主机的 HDMI、USB 和电源控制接口，即可通过浏览器或 Tailscale 网络随时随地查看屏幕、控制键鼠、开关电源、挂载 ISO —— 即使目标系统宕机、无显卡驱动、甚至未安装操作系统。

**核心优势：**
- 硬件级 HDMI 捕获，系统崩溃也能远程看屏
- 远程键鼠控制直达 BIOS/UEFI
- 内置 Tailscale 异地组网，无需公网 IP
- 双网络冗余（WiFi 6 + 百兆有线）
- 低功耗静音设计（1.5W ~ 2.4W）

## 文档

| 文档 | 说明 |
|------|------|
| [产品介绍](https://flexkvm.com/latest/product/) | 功能特性、规格参数、适用场景 |
| [快速入门](https://flexkvm.com/latest/quick_start/) | 5 分钟快速上手指南 |
| [用户指南](https://flexkvm.com/latest/guide/) | 完整功能说明和配置教程 |
| [常见问题](https://flexkvm.com/latest/support/) | FAQ + 故障排查 |

## 更新日志

### Stable（稳定版）

- [Changelog (English)](Changelog/Stable/CHANGELOG.md)
- [更新日志 (中文)](Changelog/Stable/CHANGELOG_CN.md)

### Dev（开发版）

- [Changelog (English)](Changelog/Dev/CHANGELOG.md)
- [更新日志 (中文)](Changelog/Dev/CHANGELOG_CN.md)

## 本地构建文档

本项目使用 MkDocs + Material for MkDocs 构建文档：

```bash
# 安装依赖
cd Docs && ./build.sh i

# 本地预览
mkdocs serve

# 构建网站
./build.sh
```

详见 [Docs/README.md](Docs/README.md)。

## 购买

- [淘宝官方店铺](https://item.taobao.com/item.htm?id=1054030596204)

## 社区与支持

- [GitHub Discussions](https://github.com/chutuotek/flexkvm/discussions) - 问题讨论与建议反馈
- [官方网站](https://flexkvm.com) - 更多产品信息

## License

Copyright © 2026 ChuoTuoTEK
