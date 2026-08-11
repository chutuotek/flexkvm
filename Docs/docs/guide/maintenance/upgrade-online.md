# 在线升级

设备能上网就能在线升级固件。新版本带来安全修复和新功能——每月检查一次，5 分钟搞定。

---

## 升级前准备

| 准备项 | 要求 |
|--------|------|
| 电源稳定 | ⚠️ **用独立电源适配器供电**。升级中断电可能变砖，修复很麻烦 |
| 网络畅通 | 下载中断只会失败，不会损坏设备 |
| 设备空闲 | 升级期间会重启，别做其他操作 |

---

进 Web 界面 → 设置 → **升级**。

![升级界面](./images/setting_ota_online.webp)

## 测试版

想提前体验新功能？开启测试版选项后会收到测试版更新。

> 测试版可能不稳定，别在生产环境用。

## 下载源

选固件下载地址：

- [Gitcode](https://gitcode.com/chutuotek/flexkvm/releases) — 默认源，国内用户速度快
- [Gitee](https://gitee.com/chutuotek/flexkvm/releases) — 国内用户，速度快
- [GitHub](https://github.com/chutuotek/flexkvm/releases) — 海外用户

## 当前版本

显示当前固件版本号（如 `v0.1.0`）。

稳定版：`v0.x.x`
测试版：`v0.x.x-Beta.x`

## 检查更新

点**检查更新**。系统不会自动检查——建议每月手动点一次。

> **验证**：有新版本 → 新增「新版本」卡片和「下载安装包」按钮。没有 → 当前已是最新。

![升级界面-new](./images/ota_online_new.webp)

## 新版本

显示新版本号（如 `v0.1.1`）。点进去看更新日志：

![新版本日志](./images/ota_online_log.webp)

网络不好时更新日志显示为链接，点开在浏览器里看。

## 下载 & 升级

点**下载安装包**，等待进度条跑完：

![下载进度条](./images/ota_online_progress.webp)

下载完成后自动校验固件。校验通过 → 按钮变成**立即升级**：

![立即升级](./images/ota_online_upgrade.webp)

点**立即升级** → 输入密码确认（开了 2FA 还要验证码）：

![用户验证框](../system/images/setting_verify.webp)

验证通过后开始升级：

![正在升级](./images/ota_upgrade.webp)

> **验证**：升级过程中 OLED 显示升级图标，🔴 警告灯快速闪烁。完成后设备自动重启，OLED 重新显示 IP。

升级成功：

![升级成功](./images/ota_upgrade_success.webp)

---

## 升级失败了？

| 现象 | 可能原因 | 先试这个 |
|------|----------|---------|
| 下载失败 | 网络不稳 | 切下载源（Gitcode ↔ Gitee），或用[离线升级](upgrade-offline.md) |
| 校验失败 | 下载包损坏 | 删掉重新下载 |
| 升级中卡住 | — | 耐心等，别断电。超过 10 分钟没反应再排查 |
| 升级后起不来 | 升级中断电了 | 见[线刷镜像](flash.md)恢复 |

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
