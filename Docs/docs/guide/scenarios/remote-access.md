# 外网远程访问

人在公司、设备在家？出差在外要管理机房的服务器？FlexKVM 内置 Tailscale，无需公网 IP、无需配置路由器，几分钟就能实现外网安全访问。

---

## 为什么选择 Tailscale

Tailscale 基于 WireGuard 构建，把你所有的设备组成一个加密的虚拟局域网：

- 免费版支持最多 100 台设备
- 无需公网 IP、无需配置路由器端口转发
- 端到端加密，数据不经过 Tailscale 服务器
- 穿透多层 NAT，几乎任何网络环境都能通

> Tailscale 依赖协调服务器建立连接（数据不经过它）。国内部分网络环境下连接速度可能受影响，但对绝大多数用户已经足够好。

---

## 步骤 1：准备工作

- 注册一个 Tailscale 账号（[tailscale.com](https://tailscale.com)），支持 Google / GitHub / 微软账号登录
- 在你的操作端电脑或手机上安装 Tailscale 客户端

---

## 步骤 2：在 FlexKVM 上启用 Tailscale

进入 Web 界面 → 设置 → **应用中心**，找到 Tailscale 区块：

1. 打开 Tailscale 开关，服务启动
2. 点击**登录状态**按钮，界面会显示一条登录链接
3. 在浏览器打开链接，完成 Tailscale 账号授权

登录成功后，界面会显示 Tailscale IP（通常是 `100.x.x.x`）和连接状态。

详细配置参见 [Tailscale](../settings/app/tailscale.md)。

---

## 步骤 3：在外网访问 FlexKVM

在你的操作端电脑或手机上也安装并登录同一个 Tailscale 账号。

之后在任何有互联网的地方：

- **Web 界面**：浏览器打开 `https://<Tailscale-IP>`
- **SSH**：`ssh <用户名>@<Tailscale-IP>`

就像在同一个局域网里一样。

---

## 验证外网访问

1. 断开手机的 WiFi（用 4G/5G 流量）
2. 用手机浏览器访问 FlexKVM 的 Tailscale IP
3. 能看到登录页面 → 成功

---

## 常见问题

**Q: 为什么连不上？**

检查两端设备是否都登录了同一个 Tailscale 账号，以及 FlexKVM 是否有互联网连接。

**Q: 有没有其他方案？**

如果你有公网 IP 且熟悉路由器配置，也可以使用端口转发 + DDNS。但 Tailscale 对绝大多数用户是最简单、最安全的选择。

---

## 下一步

- 外网访问开启了，建议加固安全 → [安全加固](security.md)
- 需要从外网重装系统？→ [远程重装系统](reinstall-os.md)
- Tailscale 使用遇到问题？→ [Tailscale 文档](../settings/app/tailscale.md)
