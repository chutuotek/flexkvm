# 用户指南

欢迎使用 FlexKVM 用户指南。确定你的目标，选择对应入口。不确定从哪里找？在顶部**搜索栏**输入关键词直接定位。

> 开始前请确认已完成 [快速上手](../quick_start/index.md) 中的设备接线和网络配置，确保 FlexKVM 可正常访问。

---

## 场景向导

带着具体任务来？从这里开始：

<div class="grid cards" markdown>

- **:material-cloud-download: 远程重装系统**

    ISO 挂载 → ATX 重启 → BIOS → 安装，人在千里之外搞定。

    [:octicons-arrow-right-24: 开始操作](scenarios/reinstall-os.md)

- **:material-earth: 外网远程访问**

    使用 Tailscale 实现外网访问，无需公网 IP。

    [:octicons-arrow-right-24: 开始配置](scenarios/remote-access.md)

- **:material-shield-lock: 安全加固**

    2FA、HTTPS 证书、SSH、审计，把设备安全做到位。

    [:octicons-arrow-right-24: 开始加固](scenarios/security.md)

</div>

---

## 产品信息

FlexKVM 硬件规格与配件参考：

<div class="grid cards" markdown>

- **:material-connection: 接口说明**

    产品接口规格与指示灯状态

    [:octicons-arrow-right-24: 查看](hardware/interface.md)

- **:material-thermometer: 物理与电气特性**

    电源、功耗、尺寸与环境参数

    [:octicons-arrow-right-24: 查看](hardware/characteristics.md)

- **:material-checkerboard: 背板**

    磁吸背板、3.5mm 机柜背板

    [:octicons-arrow-right-24: 查看](hardware/backplate.md)

- **:material-puzzle: 拓展**

    PoE 分离器、外接存储等拓展配件使用指南

    [:octicons-arrow-right-24: 查看](hardware/extensibility.md)

</div>

---

## 菜单栏

远程桌面顶部的操作按钮，用于操控被控主机：

<div class="grid cards" markdown>

- **:material-monitor: 远程画面**

    查看远程画面，调整画质和分辨率

    [:octicons-arrow-right-24: 查看](toolbar/screen.md)

- **:material-mouse: 鼠标**

    切换鼠标模式（绝对/相对），调节灵敏度和滚轮

    [:octicons-arrow-right-24: 查看](toolbar/mouse.md)

- **:material-keyboard: 键盘**

    输入文字、发送快捷键、虚拟键盘

    [:octicons-arrow-right-24: 查看](toolbar/keyboard.md)

- **:material-camera: 截图**

    一键截取当前画面保存为图片

    [:octicons-arrow-right-24: 查看](toolbar/screenshot.md)

- **:material-video: 录像**

    录制远程画面保存为视频

    [:octicons-arrow-right-24: 查看](toolbar/record.md)

- **:material-power: ATX 电源控制**

    远程开关机、强制关机、重启

    [:octicons-arrow-right-24: 查看](toolbar/atx.md)

- **:material-power-standby: 网络唤醒 (WoL)**

    远程唤醒局域网内已关机的设备

    [:octicons-arrow-right-24: 查看](toolbar/wakeonlan.md)

- **:material-harddisk: 硬盘挂载**

    TF 卡文件管理，虚拟光驱/USB 导出

    [:octicons-arrow-right-24: 查看](toolbar/disk.md)

- **:material-microphone: 音频**

    控制麦克风和扬声器，传输声音

    [:octicons-arrow-right-24: 查看](toolbar/audio.md)

- **:material-chip: 外设 IO**

    GPIO 引脚控制和 UART 串口终端

    [:octicons-arrow-right-24: 查看](toolbar/io.md)

</div>

---

## 设置

系统配置与参数调整，对应桌面设置弹窗（齿轮图标）：

### 账号

<div class="grid cards" markdown>

- **:material-login: 登录**

    登录流程、会话管理、自动注销配置

    [:octicons-arrow-right-24: 查看](settings/account/login.md)

- **:material-account-cog: 账号管理**

    密码修改、两步验证 (2FA)

    [:octicons-arrow-right-24: 查看](settings/account/account.md)

</div>

### 网络

<div class="grid cards" markdown>

- **:material-lan: 以太网**

    DHCP/静态 IP、网关 DNS 配置

    [:octicons-arrow-right-24: 查看](settings/network/eth.md)

- **:material-wifi: WiFi**

    WiFi 连接、保存网络管理

    [:octicons-arrow-right-24: 查看](settings/network/wifi.md)

- **:material-access-point: 热点模式**

    将 FlexKVM 作为 WiFi 热点，供其他设备连接

    [:octicons-arrow-right-24: 查看](settings/network/ap.md)

- **:material-cellphone-wireless: 热点配网**

    通过手机/电脑连接 FlexKVM 热点，为设备配置 WiFi 网络

    [:octicons-arrow-right-24: 查看](settings/network/ap_province.md)

</div>

### 系统

<div class="grid cards" markdown>

- **:material-usb: USB 配置**

    模拟 USB 键盘/鼠标/存储设备，自定义设备类型与参数

    [:octicons-arrow-right-24: 查看](settings/system/usb.md)

- **:material-lock: HTTPS 配置**

    SSL 证书管理、自定义证书上传

    [:octicons-arrow-right-24: 查看](settings/system/https.md)

- **:material-console: SSH 远程访问**

    SSH 服务启用与配置

    [:octicons-arrow-right-24: 查看](settings/system/ssh.md)

- **:material-monitor-star: OLED 显示**

    屏幕亮度、息屏时间设置

    [:octicons-arrow-right-24: 查看](settings/system/oled.md)

- **:material-clock: 时间设置**

    时区配置、NTP 同步

    [:octicons-arrow-right-24: 查看](settings/system/time.md)

- **:material-monitor-screenshot: EDID 配置**

    EDID（显示器识别数据）自定义管理，解决分辨率/兼容性问题

    [:octicons-arrow-right-24: 查看](settings/system/edid.md)

</div>

### 主题与语言

<div class="grid cards" markdown>

- **:material-palette: 主题与语言**

    界面主题切换、强调色、显示语言设置

    [:octicons-arrow-right-24: 查看](settings/theme/theme.md)

</div>

### 升级

<div class="grid cards" markdown>

- **:material-file-download: 离线升级**

    下载固件包 → 上传至设备 → 手动升级，适用于无外网环境

    [:octicons-arrow-right-24: 查看](settings/upgrade/ota_offline.md)

- **:material-cloud-download: 在线升级**

    检查更新 → 一键升级，需设备可访问外网

    [:octicons-arrow-right-24: 查看](settings/upgrade/ota_online.md)

</div>

### 维护

<div class="grid cards" markdown>

- **:material-text-box: 日志**

    查看系统运行日志，排查异常行为

    [:octicons-arrow-right-24: 查看](settings/maintenance/log.md)

- **:material-clipboard-check: 审计**

    记录用户操作行为，满足安全审计需求

    [:octicons-arrow-right-24: 查看](settings/maintenance/audit.md)

- **:material-restart: 重启与重置**

    重启设备、恢复出厂设置

    [:octicons-arrow-right-24: 查看](settings/maintenance/power_reset.md)

</div>

### 应用中心

<div class="grid cards" markdown>

- **:material-vpn: Tailscale**

    VPN 远程访问、穿透 NAT

    [:octicons-arrow-right-24: 查看](settings/app/tailscale.md)

</div>

---

[:octicons-bug-24: 问题反馈与建议](scenarios/feedback.md){ .md-button } [:octicons-home-24: 返回首页](../index.md){ .md-button } [:octicons-rocket-24: 快速上手](../quick_start/index.md){ .md-button }
