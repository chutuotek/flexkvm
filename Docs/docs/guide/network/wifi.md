# WiFi

连上 WiFi，设备就能无线联网。支持 2.4GHz 和 5GHz 双频——2.4G 穿墙好、覆盖广，5G 延迟低、适合传视频。和[有线网口](./eth.md)互为备份——两条链路各有一个 IP，任意一个都能访问管理界面，一条断了另一条照样连。

> 同时用以太网和 WiFi 时，把两者放在不同网段可避免路由冲突。比如以太网用 `192.168.1.x`，WiFi 用 `192.168.2.x`。

## 规格

| 项目 | 说明 |
|:----:|------|
| 无线协议 | 802.11 a/b/g/n/ac/ax |
| 频段 | 双频 2.4GHz / 5GHz |
| 天线接口 | SMA 内针 |
| 默认状态 | 启用 |
| MAC 地址 | 见包装盒贴纸 |

## OLED 显示

WiFi 连上后，OLED 网络图标的"X"消失，第二行显示 IP 地址。IP 前缀为 **W**（如 `W192.168.1.100`），W = Wireless。

![OLED 网络图标](../../quick_start/images/oled_wifi_connected.webp)

获取 IP 时显示 **W Loading...**。超过 10 秒没拿到 IP → 检查 WiFi 连接或路由器 DHCP。

> 没连 WiFi 时，网络图标上一直有"X"。更多 OLED 状态说明 → [OLED 屏幕](../interaction/oled.md)。

## 按键切换

长按**按键 B** 约 3~5 秒，在 WiFi 和[热点模式](./ap.md)之间快速切换：

| 当前模式 | 操作 | 切换结果 | OLED 图标 | 等待时间 |
|:--------:|:----:|:--------:|:--------:|:--------:|
| WiFi 模式 | 长按按键 B 3~5 秒，OLED 显示热点图标后松开 | 关 WiFi，开热点 | ![热点图标](./images/ap/oled_ap_icon.webp){ width="80" } | 约 10 秒 |
| 热点模式 | 长按按键 B 3~5 秒，OLED 显示 WiFi 图标后松开 | 关热点，恢复 WiFi | ![WiFi 图标](./images/wifi/oled_wifi_icon.webp){ width="80" } | 3~4 秒 |

> 按键 B 切换 WiFi/热点，[配网模式](./provision.md)（按键 A）是**临时**热点，用于首次联网或故障恢复。两者不同。

## 软件配置

进 Web 界面 → 设置 → **网络**。

![WiFi 设置](./images/wifi/setting_wifi.webp)

### 扫描网络

点刷新按钮手动扫描，或者等设备每 40 秒自动扫一次。扫描时按钮旋转，完成后列表自动更新。

### 启用与禁用

点卡片右侧开关。关掉后 WiFi 断开，已保存的网络配置保留。

> 同时关掉 WiFi 和以太网就没法访问设备了。至少留一种。

### 网络卡片

扫到的 WiFi 以卡片列表展示。每张卡片显示：SSID、信号强度（四格）、频段（2.4G / 5G / 双频）、加密类型、状态标签。

点击卡片展开操作按钮。不同状态的卡片操作不同：

**已连接**

![WiFi 已连接](./images/wifi/setting_wificard_connected.webp)

- **断开**：断开当前连接
- **设置**：打开网络配置弹窗（IP 模式、DNS、MAC）

**已保存（未连接）**

![WiFi 已保存](./images/wifi/setting_wificard_saved.webp)

- **连接**：连到这个网络
- **忘记**：从已保存列表移除
- **设置**：打开网络配置弹窗

**未保存**

![WiFi 未保存](./images/wifi/setting_wificard_unsaved.webp)

- **连接**：连到这个网络

> 每个已保存的网络可以有独立的 IP 配置，换 WiFi 时自动切换。

### 连接网络

展开目标网络卡片，然后按网络类型操作：

**开放网络**：点卡片展开 → 点连接。无需密码。

**加密网络**：点卡片展开 → 点连接 → 输入密码 → 确认。

![WiFi 连接](../../quick_start/images/web_connect_wifi.webp)

![WiFi 连接中](../../quick_start/images/web_connecting_wifi.webp)

连接中会显示状态：

![WiFi 连接状态](./images/wifi/web_connecting_wifi2.webp)

连接成功：

![WiFi 已连接](./images/wifi/setting_wificard_connected.webp)

> **验证**：连接成功 → 卡片显示「已连接」标签和 IP 地址。密码和配置自动保存，下次开机自动重连。

**手动添加网络**

点列表上方 **+** 按钮，填 SSID、加密类型、密码：

![添加 WiFi](./images/wifi/setting_wifi_add.webp)

| 字段 | 说明 |
|------|------|
| 网络名称 (SSID) | WiFi 名称 |
| 加密类型 | 开放 / WPA / WPA2 / WPA3 |
| 密码 | 加密网络需填写 |

### 网络配置

点已保存网络卡片上的**设置**，打开配置弹窗（三个标签页）：

**详情信息**

![WiFi 详情信息](./images/wifi/setting_wifi_info.webp)

只读展示当前网络参数：IP 地址、MAC 地址、子网掩码、网关、DNS1~3。

### IPv4 配置

![WiFi DHCP](./images/wifi/setting_wifi_static_off.webp)

**DHCP（默认）**：路由器自动分配 IP、网关、DNS。

![WiFi 静态 IP](./images/wifi/setting_wifi_static_on.webp)

**静态 IP**：手动设置固定参数。

| 字段 | 说明 | 必填 |
|------|------|:---:|
| IP 地址 | 如 `192.168.1.100` | 是 |
| 子网掩码 | 如 `255.255.255.0` | 是 |
| 网关 | 如 `192.168.1.1` | 是 |
| DNS1 | 首选 DNS | 否 |
| DNS2 | 备用 DNS | 否 |
| DNS3 | 第二备用 DNS | 否 |

> 切到静态 IP 时，确保参数和当前网络环境兼容，否则会断网。

点保存，立即生效。

### MAC 地址

![WiFi MAC 默认](./images/wifi/setting_wifi_mac_off.webp)

默认使用出厂 MAC 地址（包装盒贴纸上有）。也可以自定义：

![WiFi MAC 自定义](./images/wifi/setting_wifi_mac_on.webp)

格式：`AA:BB:CC:DD:EE:FF`（六组十六进制，冒号分隔）。

> ⚠️ 修改 MAC 后立即生效，可能导致断网。部分路由器会拒绝识别新 MAC。如果改完连不上了，用[配网模式](./provision.md)（长按按键 A 1~3 秒）恢复。

### 配置验证

| 验证项 | 方法 |
|--------|------|
| OLED | 看 IP 是否显示 |
| Web 界面 | WiFi 卡片显示 IP 地址 |
| 网络测试 | 从其他设备 ping 该 IP |

---

## 故障排查

| 现象 | 可能原因 | 先试这个 |
|------|----------|---------|
| 找不到网络 | WiFi 未启用、天线未装 | 检查开关，确认天线已拧上 |
| 密码错误 | 输错了 | 重新输入，注意大小写和特殊字符 |
| 连接超时 | 信号弱、路由器 MAC 过滤 | 靠近路由器，检查路由器设置 |
| 连接后无 IP | DHCP 没响应 | 试试静态 IP，或检查路由器 DHCP |
| 频繁断连 | 信号不稳、干扰大 | 换 5GHz 频段，或改用有线 |

### 信号强度建议

稳定连接至少需要**等级 2（两格）**以上：

- **等级 3-4**：稳定，适合传视频
- **等级 2**：基本可用，偶尔卡
- **等级 1 及以下**：不稳，不建议用

信号弱？试试：调位置、加 WiFi 放大器、或者直接插网线。

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
