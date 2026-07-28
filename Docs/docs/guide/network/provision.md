# 配网模式

配网模式是一个**临时** WiFi 热点——设备没联网、配置改错了连不上，长按按键 A 1~3 秒进去，配好网络后保存退出。和[热点模式](./ap.md)不同：配网模式配完自动关，热点模式持续运行。

## 什么时候用

| 场景 | 说明 |
|------|------|
| 首次配网 | 设备没联网，配网模式配置 WiFi |
| 恢复连接 | 改了 IP 或 MAC 后连不上了，进配网模式重新配 |
| 换网络 | 换了路由器或网络环境，原配置失效 |

## 与按键 B 的区别

| 功能 | 按键 A（1~3 秒） | 按键 B（3~5 秒） |
|------|:---:|:---:|
| 触发模式 | 配网模式（临时） | AP 热点（持续） |
| 用途 | 首次配网 / 故障恢复 | 日常开关热点 |
| 退出方式 | 配网页面点保存，或长按按键 A >3 秒 / 按键 B >5 秒强制退出 | 再长按按键 B 3~5 秒 |

## 进入配网模式

1. 确保设备已通电，OLED 亮起
2. 长按**按键 A** 1~3 秒
3. OLED 显示 AP 图标 :material-access-point: 后松开

![配网模式切换](../../quick_start/images/oled_provision_switch.webp)

> 不到 1 秒不触发，超过 3 秒返回主界面。误操作松手重试。

松开后进入等待界面，约 12 秒后 OLED 显示热点名称、随机密码和 IP 地址：

![配网等待界面](../../quick_start/images/oled_provision_start.webp)

![配网界面](../../quick_start/images/oled_provision.webp)

## 连接热点

**手机**：WiFi 设置里找到 FlexKVM 热点 → 输入 OLED 显示的密码 → 系统自动弹出浏览器门户页，点"信任"或"继续"。没弹出来就手动访问 `192.168.10.1`。Android 用户也可在通知栏点"登录网络"。

**电脑**：连上热点 → 浏览器访问 `192.168.10.1`。

![手机连接热点](../../quick_start/images/phone_connect_provision.webp)

> 手机连热点期间会暂时断网，配网完成后自动恢复。

## 配置网络

进入配网页面后，可以看到和正常 Web 界面一致的网络设置：

### 有线网络

DHCP / 静态 IP、自定义 MAC 等。详见 [以太网](./eth.md)。

![以太网设置](./images/eth/setting_eth.webp)

### WiFi 网络

扫描周围的 WiFi，连接或手动添加。

![WiFi 列表](../../quick_start/images/web_list_wifi.webp)

![连接 WiFi](../../quick_start/images/web_connect_wifi.webp)

> **验证**：连接成功 → 卡片显示「已连接」标签。

![连接成功](../../quick_start/images/web_connected_wifi.webp)

点刷新按钮 :material-refresh: 更新网络列表。详见 [WiFi](./wifi.md)。

### AP 网络

配置热点参数（SSID、密码、频段等），**修改后暂存，保存退出时统一生效**。

![AP 配置](./images/ap/setting_ap.webp)

详见 [热点模式](./ap.md)。

## 保存并退出

所有网络配好后，点页面右上角**保存**：

1. AP 配置统一生效
2. 设备退出配网模式，重启网络
3. OLED 显示 IP，🔴 警告灯熄灭

![保存退出](../../quick_start/images/web_save.webp)

---

> 配网模式下可配置**所有网络**（有线、WiFi、AP），不只是 WiFi。配错了可以重新按键再进。长时间不操作会自动超时退出。

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
