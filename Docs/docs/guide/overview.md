# 界面总览

登录后进入**主界面**：上方是菜单栏，中间是远程画面，菜单栏图标点开的浮层叫**菜单**。这篇把菜单栏 12 个按钮和设置面板 12 个 tab 一次讲完，后面再看具体功能页就不会迷路。

![主界面](../images/flexkvm_desktop.webp)

> 开始前请确认已完成 [快速开始](../quick_start/index.md) 的接线与网络配置。

---

## 菜单栏

从左到右 12 个按钮，点一下弹出对应**菜单**：

| 按钮 | 作用 | 详见 |
|:---:|------|------|
| **截图** | 把当前远程画面存成图片 | [截图](remote/screenshot.md) |
| **录像** | 把远程画面录成视频 | [录像](remote/recording.md) |
| **音频** | 开关声卡、麦克风输入、扬声器输出 | [音频](remote/audio.md) |
| **画面** | 分辨率、画质、GOP、编码、EDID、全屏、重新连接 | [远程画面](remote/screen.md) |
| **键盘** | 文本输入、快捷键、虚拟键盘、粘贴文本 | [键盘](remote/keyboard.md) |
| **鼠标** | 绝对 / 相对模式、灵敏度、滚轮反转 | [鼠标](remote/mouse.md) |
| **镜像** | TF 卡分区挂载与共享，被控设备看到虚拟 U 盘或虚拟光驱 | [存储管理](peripherals/disk.md) |
| **外设** | ATX 电源控制（开机 / 关机 / 重启），被控设备状态指示灯 | [ATX 电源控制](peripherals/atx.md) |
| **网络唤醒** | 给已关机的被控设备发 Magic Packet 唤醒 | [网络唤醒 (WoL)](network/wol.md) |
| **IO** | 两路 GPIO 与一路 UART 串口，展开后分 GPIO、UART 两块 | [GPIO 引脚控制](peripherals/gpio.md) · [UART 串口终端](peripherals/uart.md) |
| **设置** | 打开设置面板（12 个 tab，见下） | 本页下一节 |
| **全屏** | 远程画面占满整个浏览器窗口 | [远程画面](remote/screen.md) |

> 菜单栏名称与文档页面名称不是一一对应：**镜像**对应「存储管理」，**外设**对应「ATX 电源控制」，**IO** 对应「GPIO 引脚控制」和「UART 串口终端」。

## 操作反馈

操作结果在页面顶部以提示条显示，例如：

| 提示 | 触发 |
|------|------|
| 截图成功 | 点**截图** |
| 录制开始 / 录制成功 | 点**录像**开始与结束 |
| 截图失败 | 远程画面未连接 |

## 设置面板

点菜单栏的**设置**打开设置面板。左侧是 12 个 tab：

| Tab | 管什么 | 详见 |
|:---:|--------|------|
| **关于** | 型号、系统版本、设备序列号、社区与文档入口 | [关于设备](system/about.md) |
| **状态** | 温度 / CPU / 内存 / 网络速率曲线，历史回看与 CSV 导出 | [状态监控](system/status.md) |
| **网络** | mDNS、有线网络、AP网络、WiFi网络 | [配网模式](network/provision.md) · [有线网络](network/eth.md) · [直连模式](network/eth-server.md) · [WiFi](network/wifi.md) · [AP 热点](network/ap.md) · [mDNS](network/mdns.md) |
| **外观** | 语言、主题（浅色 / 深色 / 自动）、强调色 | [外观](system/appearance.md) |
| **应用** | 已装应用更新（如 Tailscale）、下载源 | [Tailscale](network/tailscale.md) · [应用更新](maintenance/upgrade-app.md) |
| **Agent** | 开关 Agent、生成与作废 API Key，供 AI 客户端接入 | [AI Agent 控制](remote/agent.md) |
| **系统** | 时间、OLED设置、LED设置、EDID、USB配置 | [时间与日期](system/time.md) · [OLED 屏幕](interaction/oled.md) · [LED 指示灯](interaction/led.md) · [USB 配置](system/usb.md) |
| **采集** | 截图格式与质量、录像参数 | [截图](remote/screenshot.md) · [录像](remote/recording.md) |
| **安全** | HTTPS 证书、SSH | [HTTPS 证书](security/https.md) · [SSH 远程访问](security/ssh.md) |
| **升级** | 离线升级、在线升级（下载源、检查更新） | [在线升级](maintenance/upgrade-online.md) · [离线升级](maintenance/upgrade-offline.md) |
| **维护** | 审计、系统日志、Web 日志、重启设备、恢复出厂模式 | [操作审计](security/audit.md) · [系统日志](maintenance/log.md) · [重启设备](maintenance/reboot.md) · [恢复出厂设置](maintenance/factory-reset.md) |
| **账号** | 用户名、修改密码、2FA验证、退出登录 | [账号安全](security/account/account.md) · [登录管理](security/account/login.md) |

> 设置面板与远程画面同页共存——切 tab 不会断开视频流、键鼠或主 WebSocket，可以边看画面边改配置。部分设置（改 MAC、切静态 IP）会短暂断网，见对应页面说明。

---

## 下一步

- 按场景上手 → [场景向导](scenarios/index.md)
- 查具体功能 → [用户指南](index.md)
- 遇到问题 → [常见问题与排查](../support/index.md)
