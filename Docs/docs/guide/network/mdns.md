# mDNS 服务发现

mDNS（多播 DNS）让局域网内的设备**通过主机名自动发现 FlexKVM**，无需记忆 IP 地址。在浏览器或终端中输入 `<主机名>.local` 即可访问，IP 地址变了也不影响。

FlexKVM 默认开启 mDNS，目前开放三种服务：

| 服务 | mDNS 类型 | 端口 |
|------|-----------|:---:|
| SSH | `_ssh._tcp` | 22 |
| HTTP | `_http._tcp` | 80 |
| HTTPS | `_https._tcp` | 443 |

> 普通模式下访问 `http://` 会自动重定向到 `https://` 加密访问，因此直接使用 HTTPS 地址即可（配网模式除外）。

## 查看主机名

每台 FlexKVM 的主机名由设备序列号生成，格式为 `flexkvm-xxxx`（例如 `flexkvm-abc123`），每台设备唯一。

在 OLED 主界面**短按两次按键 A** 进入系统信息界面，界面上显示的 `flexkvm-xxxx` 就是主机名：

```
 SYSTEM
 FlexKVM
 flexkvm-abc123
 FS10251810001CN5
```

## 使用 mDNS 访问

电脑 / 手机与 FlexKVM 连接**同一个网络**（有线或 WiFi）后，把 `flexkvm-xxxx` 替换为设备实际主机名，通过 `.local` 域名访问：

| 服务 | 访问方式 |
|------|----------|
| Web 页面 | 浏览器打开 `flexkvm-xxxx.local`，自动跳转到 `https://` 加密访问 |
| SSH | 终端执行 `ssh root@flexkvm-xxxx.local` |

以主机名 `flexkvm-abc123` 为例：

- 浏览器访问 `flexkvm-abc123.local`，或直接输入 `https://flexkvm-abc123.local`
- 终端执行 `ssh root@flexkvm-abc123.local`

## 系统要求

- 访问设备与 FlexKVM 必须在**同一局域网**内（连接同一路由器，或直连 FlexKVM 热点）
- **Windows**：需安装 [Apple Bonjour](https://support.apple.com/downloads/bonjour-for-windows)（安装 iTunes 会自带）才能解析 `.local` 域名
- **macOS / iOS / Linux / Android**：系统原生支持，无需额外配置
- `.local` 是 mDNS 的保留域名，公网 DNS 无法解析；跨网段访问请使用 IP 地址或 [Tailscale](tailscale.md)

## 启用 / 关闭

进 **设置 → 系统 → mDNS**，开关"启用 mDNS 发现"：

- **开启**（默认）：局域网设备可通过主机名自动发现 FlexKVM
- **关闭**：通过主机名访问失效，只能使用 IP 地址访问

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
