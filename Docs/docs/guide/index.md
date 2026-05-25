# 用户指南

欢迎使用 FlexKVM 用户指南。你可以按**场景任务**快速找到操作路径，也可以按**功能分类**查阅具体配置。

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

- **:material-refresh: 日常运维**

    升级固件、查看日志、重启恢复，日常该做的事。

    [:octicons-arrow-right-24: 查看清单](scenarios/daily-ops.md)

- **:material-shield-lock: 安全加固**

    2FA、HTTPS 证书、SSH、审计，把设备安全做到位。

    [:octicons-arrow-right-24: 开始加固](scenarios/security.md)

- **:material-bug: 问题反馈与建议**

    问题自查 → 收集诊断信息 → 提 Bug / 提建议。

    [:octicons-arrow-right-24: 提交反馈](scenarios/feedback.md)

</div>

---

## 功能参考

按需查阅具体配置项：

### 设备

<div class="grid cards" markdown>

- **:material-package-variant: 包装清单**

    开箱物品清单

    [:octicons-arrow-right-24: 查看](device/packet.md)

- **:material-connection: 接口说明**

    产品接口规格与指示灯状态

    [:octicons-arrow-right-24: 查看](device/interface.md)

- **:material-thermometer: 物理与电气特性**

    电源、功耗、尺寸与环境参数

    [:octicons-arrow-right-24: 查看](device/characteristics.md)

- **:material-checkerboard: 背板**

    磁吸背板、3.5mm 机柜背板

    [:octicons-arrow-right-24: 查看](device/backplate.md)

- **:material-puzzle: 拓展**

    POE 分离器等拓展配件

    [:octicons-arrow-right-24: 查看](device/extensibility.md)

</div>

### 远程控制

<div class="grid cards" markdown>

- **:material-monitor: 屏幕显示**

    WebRTC 视频流、画质调节、HDMI 状态

    [:octicons-arrow-right-24: 查看](remote/screen.md)

- **:material-mouse: 鼠标**

    鼠标模式切换、指针锁定、灵敏度设置

    [:octicons-arrow-right-24: 查看](remote/mouse.md)

- **:material-keyboard: 键盘**

    键盘启用/禁用、虚拟键盘、文本粘贴

    [:octicons-arrow-right-24: 查看](remote/keyboard.md)

- **:material-camera: 截图**

    截取画面

    [:octicons-arrow-right-24: 查看](remote/screenshot.md)

- **:material-video: 录像**

    录制视频

    [:octicons-arrow-right-24: 查看](remote/record.md)

</div>

### 账号

<div class="grid cards" markdown>

- **:material-login: 登录**

    用户登录

    [:octicons-arrow-right-24: 查看](account/login.md)

- **:material-account-cog: 账号管理**

    密码修改、两步验证 (2FA)

    [:octicons-arrow-right-24: 查看](account/account.md)

</div>

### 网络

<div class="grid cards" markdown>

- **:material-lan: 以太网**

    DHCP/静态 IP、网关 DNS 配置

    [:octicons-arrow-right-24: 查看](network/eth.md)

- **:material-wifi: WiFi**

    WiFi 连接、保存网络管理

    [:octicons-arrow-right-24: 查看](network/wifi.md)

- **:material-access-point: 热点模式**

    创建 WiFi 热点、频段与加密设置

    [:octicons-arrow-right-24: 查看](network/ap.md)

- **:material-cellphone-wireless: 热点配网**

    热点配网功能

    [:octicons-arrow-right-24: 查看](network/ap_province.md)

</div>

### 系统

<div class="grid cards" markdown>

- **:material-usb: USB 配置**

    自定义 USB 设备

    [:octicons-arrow-right-24: 查看](system/usb.md)

- **:material-lock: HTTPS 配置**

    SSL 证书管理、自定义证书上传

    [:octicons-arrow-right-24: 查看](system/https.md)

- **:material-console: SSH 远程访问**

    SSH 服务启用与配置

    [:octicons-arrow-right-24: 查看](system/ssh.md)

- **:material-monitor-star: OLED 显示**

    屏幕亮度、息屏时间设置

    [:octicons-arrow-right-24: 查看](system/oled.md)

- **:material-clock: 时间设置**

    时区配置、NTP 同步

    [:octicons-arrow-right-24: 查看](system/time.md)

- **:material-monitor-screenshot: EDID 配置**

    自定义 EDID 文件管理

    [:octicons-arrow-right-24: 查看](system/edid.md)

</div>

### 高级功能

<div class="grid cards" markdown>

- **:material-harddisk: 硬盘挂载**

    TF 卡管理、USB Mass Storage 导出

    [:octicons-arrow-right-24: 查看](advanced/disk.md)

- **:material-power: ATX 电源控制**

    远程开关机、电源状态监控

    [:octicons-arrow-right-24: 查看](advanced/atx.md)

- **:material-power-standby: 网络唤醒 (WoL)**

    远程唤醒目标主机

    [:octicons-arrow-right-24: 查看](advanced/wakeonlan.md)

</div>

### 主题与语言

<div class="grid cards" markdown>

- **:material-palette: 主题**

    界面主题切换

    [:octicons-arrow-right-24: 查看](theme/theme.md)

- **:material-translate: 语言**

    界面语言切换

    [:octicons-arrow-right-24: 查看](theme/language.md)

</div>

### 升级

<div class="grid cards" markdown>

- **:material-file-download: 离线升级**

    离线升级

    [:octicons-arrow-right-24: 查看](upgrade/ota_offline.md)

- **:material-cloud-download: 在线升级**

    在线升级

    [:octicons-arrow-right-24: 查看](upgrade/ota_online.md)

</div>

### 维护

<div class="grid cards" markdown>

- **:material-text-box: 日志**

    系统日志

    [:octicons-arrow-right-24: 查看](maintenance/log.md)

- **:material-clipboard-check: 审计**

    审计日志

    [:octicons-arrow-right-24: 查看](maintenance/audit.md)

- **:material-restart: 重启与重置**

    重启设备、恢复出厂设置

    [:octicons-arrow-right-24: 查看](maintenance/power_reset.md)

</div>

### 应用中心

<div class="grid cards" markdown>

- **:material-vpn: Tailscale**

    VPN 远程访问、穿透 NAT

    [:octicons-arrow-right-24: 查看](app/tailscale.md)

</div>
