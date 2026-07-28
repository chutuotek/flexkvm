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
| 有线网络 | 有线连接状态（普通模式 / 直连模式两种图标） |
| 无线网络 | WiFi 未连 / 已连 / 热点已开（三种状态） |

图标正常显示 = 已连接，图标上有 X = 未连接。

**IP 地址**（中间两行）：IP 前缀标识接口类型和 IP 获取方式——

| 显示 | 接口 | IP 方式 |
|:---|:---:|:---:|
| **E**xxx.xxx.xxx.xxx | 以太网 | DHCP |
| <strong><u>E</u></strong>xxx.xxx.xxx.xxx | 以太网 | 静态 IP（反色） |
| **S**xxx.xxx.xxx.xxx | 以太网 | 直连模式（DHCP Server） |
| **W**xxx.xxx.xxx.xxx | WiFi | DHCP |
| <strong><u>W</u></strong>xxx.xxx.xxx.xxx | WiFi | 静态 IP（反色） |
| **A**xxx.xxx.xxx.xxx | AP 热点 | — |

获取 IP 中显示 Loading：**E Loading...** / **W Loading...**。

> **E** = DHCP 模式，正常显示；<strong><u>E</u></strong> = 静态 IP 模式，反色显示（黑底白字）。直连模式下显示 **S**。

如果获取ip超过 10 秒依然显示 Loading，需要检查一下当前的网络支不支持动态获取 IP。

**系统版本**（底部一行）：如 `v0.1.2` 或 `v0.1.3-Beta.1`。

### 信息子页面

在主界面**短按按键 A** 可循环切换 6 个子页面，查看详细设备信息：`主页 → ETH 信息 → WiFi 信息 → AP 信息 → HDMI 信息 → 系统信息 → 主页`。**短按按键 B** 随时返回主界面。息屏后自动复位到主界面。

子页面采用全屏 4 行布局（不使用图标栏），内容从第 1 行开始。

#### ETH 信息

显示以太网接口详情：

| 行 | 内容 |
|:---|------|
| 第 1 行 | `ETH`（左）+ 模式标签（右：DHCP / STATIC / DIRECT） |
| 第 2 行 | IP 地址（或 DISABLE / NOT CONNECT / Loading） |
| 第 3 行 | MAC 地址 |
| 第 4 行 | Gateway（前缀 `G`，如 `G192.168.1.1`） |

模式标签：DHCP 自动获取、STATIC 静态配置、DIRECT 直连模式（DHCP Server）。

```
 ETH              DHCP
 192.168.1.100
 AA:BB:CC:DD:EE:FF
 G192.168.1.1
```

#### WiFi 信息

显示 WiFi 接口详情：

| 行 | 内容 |
|:---|------|
| 第 1 行 | `WiFi` + 信号强度（如 `WiFi -45`）+ 模式标签（右） |
| 第 2 行 | IP 地址（或 DISABLE / NOT CONNECT / Loading） |
| 第 3 行 | SSID（前缀 `S:`，如 `S:MyWiFi`） |
| 第 4 行 | MAC 地址 |

```
 WiFi -55        STATIC
 10.0.0.55
 S:MyOfficeWiFi
 AA:BB:CC:DD:EE:FF
```

#### AP 信息

显示热点配置：

| 行 | 内容 |
|:---|------|
| 第 1 行 | `AP` + WiFi6 标识 + 频段（2.4G / 5G） |
| 第 2 行 | SSID（前缀 `S:`，如 `S:FlexKVM-AP`） |
| 第 3 行 | 密码（前缀 `P:`） |
| 第 4 行 | IP 地址（或 DISABLE） |

```
 AP  WIFI6      5G
 S:FlexKVM-AP
 P:12345678
 192.168.10.1
```

#### HDMI 信息

显示视频输入参数：

| 行 | 内容 |
|:---|------|
| 第 1 行 | `HDMI`（左）+ 画质等级（右对齐：LOW / MED / HIGH / ULTRA） |
| 第 2 行 | 分辨率@帧率（如 `1920x1080@60Hz`，无信号时 `--x--`） |
| 第 3 行 | 流状态（Streaming / IDLE / OFFLINE） |
| 第 4 行 | 链路状态（LINK / No Signal / NOT LINK） |

流状态说明：**Streaming** — 用户在线 + HDMI 已链接，编码器正在推流；**IDLE** — HDMI 已链接但无用户连接，编码器待机；**OFFLINE** — HDMI 未检测到或链路未建立。

```
 HDMI          HIGH
 1920x1080@60Hz
 Streaming
 LINK
```

#### 系统信息

显示设备标识：

| 行 | 内容 |
|:---|------|
| 第 1 行 | `SYSTEM` 标题 |
| 第 2 行 | 产品名称（如 `FlexKVM`） |
| 第 3 行 | 主机名 |
| 第 4 行 | 序列号（SN） |

```
 SYSTEM
 FlexKVM
 flexkvm
 FS10251810001CN5
```

### 配网界面

![配网界面](../../quick_start/images/oled_provision.webp)

长按按键 A 进入配网模式时，OLED 显示热点名称、随机密码和 IP `192.168.10.1`。详见[配网模式](../network/provision.md)。

### 恢复出厂设置界面

![恢复出厂设置界面](../maintenance/images/oled_reset.webp)

长按恢复出厂按键 1s 后，oled上会显示恢复出厂设置倒计时，倒计时到0之后释放按键，设备会恢复出厂。详见[恢复出厂设置](../maintenance/factory-reset.md)。

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
