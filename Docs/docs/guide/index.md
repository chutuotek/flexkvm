# 用户指南

欢迎使用 FlexKVM 用户指南。确定你的目标，选择对应入口。不确定从哪里找？在顶部**搜索栏**输入关键词直接定位。

> 开始前请确认已完成 [快速上手](../quick_start/index.md) 中的设备接线和网络配置，确保 FlexKVM 可正常访问。

---

## 产品概览

产品规格、接口定义与配件信息。

<div class="grid cards" markdown>

- **:material-package-variant-closed: 包装清单**

    开箱配件一览，确认收货内容

    [:octicons-arrow-right-24: 查看](product/packet.md)

- **:material-connection: 接口说明**

    产品接口规格与指示灯状态

    [:octicons-arrow-right-24: 查看](product/interface.md)

- **:material-thermometer: 物理与电气特性**

    电源、功耗、尺寸与环境参数

    [:octicons-arrow-right-24: 查看](product/characteristics.md)

- **:material-puzzle: 拓展配件**

    磁吸背板 / 导轨卡扣 / PoE 供电 / DIY 背板

    [:octicons-arrow-right-24: 查看](product/extensibility.md)

</div>

## 场景向导

场景向导内容补充中，敬请期待。

[:octicons-arrow-right-24: 查看](scenarios/index.md)

---

## 功能导航

按功能分类查阅，了解每个功能的完整操作和配置方法。

### 设备交互

了解设备上的 OLED 屏幕、LED 指示灯和物理按键。

<div class="grid cards" markdown>

- **:material-monitor-screenshot: OLED 屏幕**

    显示内容、状态参考、亮度与休眠设置

    [:octicons-arrow-right-24: 查看](interaction/oled.md)

- **:material-led-on: LED 指示灯**

    状态灯 / 警告灯 / 电源灯颜色与含义速查

    [:octicons-arrow-right-24: 查看](interaction/led.md)

- **:material-gesture: 物理按键**

    按键 A / B / 复位 / 恢复出厂操作说明

    [:octicons-arrow-right-24: 查看](interaction/button.md)

</div>

### 网络

如何让 FlexKVM 接入网络，以及如何从远程访问它。

<div class="grid cards" markdown>

- **:material-lan: 以太网**

    DHCP / 静态 IP 配置，网关与 DNS 设置

    [:octicons-arrow-right-24: 查看](network/eth.md)

- **:material-wifi: WiFi**

    无线网络连接与管理

    [:octicons-arrow-right-24: 查看](network/wifi.md)

- **:material-access-point: 热点模式**

    FlexKVM 作为 WiFi 热点，供其他设备直连

    [:octicons-arrow-right-24: 查看](network/ap.md)

- **:material-vpn: Tailscale 异地组网**

    无需公网 IP，端到端加密远程访问

    [:octicons-arrow-right-24: 查看](network/tailscale.md)

- **:material-power-standby: 网络唤醒 (WoL)**

    通过网络魔术包远程唤醒已关机的设备

    [:octicons-arrow-right-24: 查看](network/wol.md)

</div>

### 远程交互

查看被控主机画面，控制键鼠，传输音频。

<div class="grid cards" markdown>

- **:material-monitor: 远程画面**

    连接会话、切换分辨率与画质、EDID 配置、全屏显示

    [:octicons-arrow-right-24: 查看](remote/screen.md)

- **:material-camera: 截图**

    一键截取当前画面，支持 PNG / JPG 格式

    [:octicons-arrow-right-24: 查看](remote/screenshot.md)

- **:material-video: 录像**

    录制远程画面为视频文件，多项参数可调

    [:octicons-arrow-right-24: 查看](remote/recording.md)

- **:material-keyboard: 键盘**

    文字输入、快捷键发送、虚拟键盘、粘贴文本

    [:octicons-arrow-right-24: 查看](remote/keyboard.md)

- **:material-mouse: 鼠标**

    绝对/相对模式切换、灵敏度调节、滚轮方向

    [:octicons-arrow-right-24: 查看](remote/mouse.md)

- **:material-headset: 音频**

    麦克风与扬声器控制，双向音频传输

    [:octicons-arrow-right-24: 查看详情](remote/audio.md)

</div>

### 外设与扩展

TF 卡存储、ATX 电源控制、UART 串口、GPIO 引脚——物理外接的扩展能力。

<div class="grid cards" markdown>

- **:material-sd: 存储管理**

    TF 卡规格、分区挂载、USB 共享、文件传输与远程重装系统

    [:octicons-arrow-right-24: 查看](peripherals/disk.md)

- **:material-power: ATX 电源控制**

    硬件接线、正常开关机、强制重启、强制断电

    [:octicons-arrow-right-24: 查看](peripherals/atx.md)

- **:material-console-line: UART 串口终端**

    串口通信参数配置，与被控设备命令行交互

    [:octicons-arrow-right-24: 查看](peripherals/uart.md)

- **:material-chip: GPIO 引脚控制**

    引脚电平输入检测与输出控制，连接传感器等外设

    [:octicons-arrow-right-24: 查看](peripherals/gpio.md)

</div>

### 安全设置

访问控制与通信加密，保护设备安全。

<div class="grid cards" markdown>

- **:material-account-cog: 账号管理**

    登录流程、密码修改、两步验证 (2FA)、备用码

    [:octicons-arrow-right-24: 查看](security/account/login.md)

- **:material-console: SSH 远程访问**

    通过 SSH 命令行进行带外管理（OOB）

    [:octicons-arrow-right-24: 查看](security/ssh.md)

- **:material-lock: HTTPS 证书**

    自签名 / 自定义证书，加密 Web 管理页面

    [:octicons-arrow-right-24: 查看](security/https.md)

- **:material-text-box-search: 操作审计**

    系统与用户操作事件记录，追溯操作历史

    [:octicons-arrow-right-24: 查看](security/audit.md)


</div>

### 系统配置

设备本身的参数调整。对应桌面中的设置面板（齿轮图标）。

<div class="grid cards" markdown>

- **:material-information: 关于设备**

    设备信息、固件版本、社区资源

    [:octicons-arrow-right-24: 查看](system/about.md)

- **:material-palette: 外观**

    界面主题、语言、强调色

    [:octicons-arrow-right-24: 查看](system/appearance.md)

- **:material-clock: 时间与日期**

    时区设置、NTP 自动同步

    [:octicons-arrow-right-24: 查看](system/time.md)

- **:material-usb: USB 配置**

    模拟 USB 键盘/鼠标/存储设备，自定义设备类型

    [:octicons-arrow-right-24: 查看](system/usb.md)

- **:material-bluetooth: 蓝牙**

    蓝牙功能（开发中）

    [:octicons-arrow-right-24: 查看](system/bluetooth.md)


</div>

### 系统维护

设备固件升级、重启与恢复出厂设置等系统级维护操作。

<div class="grid cards" markdown>

- **:material-cloud-download: 固件升级**

    在线升级 / 离线升级，版本更新方式选择

    [:octicons-arrow-right-24: 查看](maintenance/upgrade-online.md)

- **:material-restart: 重启设备**

    软件重启与硬件复位按键操作

    [:octicons-arrow-right-24: 查看](maintenance/reboot.md)

- **:material-factory: 恢复出厂设置**

    软件重置与硬件恢复出厂按键，清除所有数据

    [:octicons-arrow-right-24: 查看](maintenance/factory-reset.md)

- **:material-usb-flash-drive: 线刷镜像**

    设备变砖时通过线刷方式恢复

    [:octicons-arrow-right-24: 查看](maintenance/flash.md)

- **:material-text-box: 系统日志**

    系统日志，用于排查系统异常

    [:octicons-arrow-right-24: 查看](maintenance/log.md)

</div>

---

[:octicons-bug-24: 问题反馈与建议](../community/feedback/index.md){ .md-button } [:octicons-home-24: 返回首页](../index.md){ .md-button } [:octicons-rocket-24: 快速上手](../quick_start/index.md){ .md-button }
