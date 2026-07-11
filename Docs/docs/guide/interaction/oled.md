# OLED 屏幕

FlexKVM 正面有一块 128×64 单色 OLED 屏，显示设备状态、网络信息和系统版本。

通电后 OLED 依次显示：开机 logo → 设备状态界面 → 无操作 60 秒后自动息屏。按按键 A 或 B 唤醒。配网模式下不自动息屏。

## OLED 设置

进设置 → 系统 → OLED 屏幕设置。

![OLED 设置](./images/oled/setting_oled.webp)

### 亮度

1~10 档滑块，实时生效。

### 休眠时间

无操作后自动息屏的时间。可选：10s / 30s / 60s / 120s / 300s / 600s。

## OLED 界面

### 主界面

![OLED 主界面](../../quick_start/images/oled_wifi_connected.webp)

四行，三个部分：

**状态栏**（第一行）：6 个图标，从左到右——

| 图标 | 含义 |
|:---:|------|
| HDMI | HDMI 是否插入 |
| USB | USB 信号是否正常 |
| TF 卡 | TF 卡是否插入 |
| ATX | ATX 模块是否连接 |
| 有线网络 | 有线连接状态 |
| 无线网络 | WiFi 未连 / 已连 / 热点已开（三种状态） |

图标正常显示 = 已连接，图标上有 X = 未连接。

**IP 地址**（中间两行）：IP 前缀标识接口类型——

| 显示 | 接口 |
|:---|:---:|
| **E**xxx.xxx.xxx.xxx | 以太网 |
| **W**xxx.xxx.xxx.xxx | WiFi |
| **A**xxx.xxx.xxx.xxx | AP 热点 |

获取 IP 中显示 Loading：**E Loading...**（超 10 秒查网线）/ **W Loading...**（超 10 秒查 WiFi）。

**系统版本**（底部一行）：如 `v0.1.2` 或 `v0.1.3-Beta.1`。

### 配网界面

长按按键 A 进入配网模式时，OLED 显示热点名称、随机密码和 IP `192.168.10.1`。详见[配网模式](../network/provision.md)。

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
