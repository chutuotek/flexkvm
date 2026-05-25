# 外网远程访问

人在公司、设备在家？出差在外要管理机房的服务器？这个流程帮你选择最适合的外网访问方案。

## 先搞清楚你的场景

外网访问的核心问题：FlexKVM 在你的局域网里，而你在外面。要怎么找到它？

| 你的情况 | 推荐方案 | 难度 |
|----------|----------|------|
| FlexKVM 能上网，你也能上网，不需要公网 IP | **Tailscale** | ⭐ 简单 |
| 有公网 IP，会配置路由器端口转发 | 端口转发 + DDNS | ⭐⭐ 中等 |
| 完全没有公网 IP，也不想用第三方服务 | 自建 VPN（WireGuard/FRP） | ⭐⭐⭐ 复杂 |

**绝大多数用户用 Tailscale 就够了**，免费、零配置、安全。

---

## 方案一：Tailscale（推荐）

Tailscale 基于 WireGuard 构建，把你所有的设备组成一个加密的虚拟局域网。FlexKVM 内置 Tailscale 客户端，开箱即用。

### 1. 准备工作

- 注册一个 Tailscale 账号（[tailscale.com](https://tailscale.com)），支持 Google/GitHub/微软账号登录
- 在你的操作端电脑/手机上安装 Tailscale 客户端

### 2. 在 FlexKVM 上启用 Tailscale

进入 Web 界面 → 设置 → **应用中心**，找到 Tailscale 区块：

1. 打开 Tailscale 开关，服务启动
2. 点击**登录状态**按钮，界面会显示一条登录链接
3. 在浏览器打开链接，完成 Tailscale 账号授权

登录成功后，界面会显示 Tailscale IP（通常是 `100.x.x.x`）和连接状态。

详细配置参见 [Tailscale](../app/tailscale.md)。

### 3. 在外网访问 FlexKVM

在你的操作端电脑/手机上也安装并登录同一个 Tailscale 账号。

之后在任何有互联网的地方，浏览器打开 `https://<Tailscale-IP>` 就能访问 FlexKVM，就像在同一个局域网里一样。

> SSH 也可以用：`ssh <用户名>@<Tailscale-IP>`

### Tailscale 的优点

- 免费版支持最多 100 台设备
- 无需公网 IP、无需配置路由器
- 端到端加密，数据不经过 Tailscale 服务器
- 穿透多层 NAT，几乎任何网络环境都能通

### Tailscale 的限制

- 依赖 Tailscale 的协调服务器（虽然数据不经过它，但连接建立需要它）
- 国内部分网络环境下连接速度可能受影响

---

## 方案二：端口转发 + DDNS

如果你有公网 IP，可以通过路由器端口转发让外网直接访问 FlexKVM。

### 2.1 确认公网 IP

在连 FlexKVM 的路由器下，打开 [ip.sb](https://ip.sb) 查看外网 IP。如果这个 IP 和你路由器 WAN 口显示的 IP 一致，说明有公网 IP。

> 运营商给你的可能是假公网 IP（NAT444），这种情况端口转发无效，建议直接用 Tailscale。

### 2.2 设置端口转发

在路由器管理页面，添加端口转发规则：

| 参数 | 值 |
|------|-----|
| 外部端口 | 443（或自定义，如 8443） |
| 内部 IP | FlexKVM 的局域网 IP |
| 内部端口 | 443 |
| 协议 | TCP |

### 2.3 设置静态 IP

先给 FlexKVM 配置静态 IP，防止路由器重启后 IP 变化导致转发失效。在 Web 界面 → 设置 → 网络 → 以太网（或 WiFi），切换到静态 IP 模式。配置方法详见 [以太网配置](../network/eth.md#ipv4-配置)。

### 2.4 DDNS（可选但推荐）

公网 IP 可能会变（运营商定时更换），建议设置 DDNS 用域名访问。在路由器上配置 DDNS 服务（如花生壳、Cloudflare DDNS），把域名绑到动态 IP 上。

> **安全提醒**：公网直接暴露端口有安全风险。务必开启 2FA 双因素认证，详见 [安全加固](security.md)。

---

## 方案选择决策树

```
你能接受使用 Tailscale 吗？
├── 是 → Tailscale，几分钟搞定
└── 否 → 你有公网 IP 吗？
    ├── 有 → 端口转发 + DDNS
    └── 没有 → 自建 FRP/ZeroTier/WireGuard 中转
```

---

## 验证外网访问

不管你用哪种方案，验证方法一样：

1. 断开手机的 WiFi（用 4G/5G 流量）
2. 用手机浏览器访问你配置的外网地址
3. 能看到 FlexKVM 登录页面 → 成功

---

## 下一步

- 外网访问开启了，建议加固安全 → [安全加固](security.md)
- 需要从外网重装系统？→ [远程重装系统](reinstall-os.md)
- Tailscale 使用遇到问题？→ [Tailscale 文档](../app/tailscale.md)
