# Tailscale

Tailscale 是一款基于 WireGuard 的零配置 VPN 组网工具，可以将 FlexKVM 设备安全地加入你的 Tailscale 网络（Tailnet），实现安全的远程访问。

进入"设置" → "应用中心"，可以看到 Tailscale 配置区块，如下图所示：

![Tailscale 设置](./images/tailscale/web-tailscale-setting.webp)

## 安装

Tailscale 应用需要手动安装到设备中。将 Tailscale 二进制文件（`tailscale` 和 `tailscaled`）及签名文件放置到 `/userdata/user_app/tailscale/` 目录下。

> 注意：FlexKVM 在启动时会校验应用签名和文件完整性。校验失败将无法使用 Tailscale 功能。

## 启用服务

通过开关启用 Tailscale 服务。启用后系统会自动启动 `tailscaled` 守护进程并执行 `tailscale up` 命令。

| 参数 | 说明 |
|:---:|------|
| 默认状态 | 关闭 |
| 生效方式 | 点击开关后立即生效 |

![Tailscale 开关](./images/tailscale/web-tailscale-enable.webp)

启用后可以在描述文字中看到 Tailscale 版本号。

> 提示：如果 Tailscale 应用未安装，开关将不可用，界面会显示"Tailscale 不可用"的提示。

## 登录

启用 Tailscale 服务后，点击"登录状态"按钮开始登录流程：

![Tailscale 登录](./images/tailscale/web-tailscale-login.webp)

系统会执行 `tailscale login` 命令，界面会显示一条登录链接：

![登录链接](./images/tailscale/web-tailscale-link.webp)

在浏览器中打开该链接，完成 Tailscale 账号的授权认证。登录超时时间为 600 秒。

> 提示：登录过程中可以随时关闭页面，登录操作在后台异步执行。

## 连接信息

登录成功后，界面会显示以下连接信息：

| 信息 | 说明 |
|------|------|
| 设备 ID | Tailscale 网络中该节点的唯一标识 |
| Tailnet 名称 | 当前 Tailscale 网络名称 |
| Tailscale IP | 分配的 Tailscale IP 地址（100.x.x.x） |
| 连接状态 | 在线 / 离线 |
| 密钥到期时间 | Tailscale 节点密钥的到期日期和时间 |

![连接信息](./images/tailscale/web-tailscale-info.webp)

点击右上角的刷新按钮可以更新连接状态。

## 登出

登录成功后，点击"登录状态"按钮会弹出登出选项，点击"登出"即可从当前 Tailscale 网络中移除该设备。

> 注意：登出后设备将从 Tailscale 网络中注销，所有 Tailscale IP 将被释放。如需重新连接，需要重新登录。

## 远程访问

登录 Tailscale 成功后，可以通过以下方式远程访问 FlexKVM：

- **Web 管理界面**：在浏览器中访问 `https://<Tailscale-IP>`
- **SSH 管理**：通过 `ssh <用户名>@<Tailscale-IP>` 远程登录

> 提示：Tailscale 可以穿透 NAT 和防火墙，即使 FlexKVM 和访问端不在同一局域网也能建立连接。非常适合在外网环境下安全访问设备。
