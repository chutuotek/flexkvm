# Tailscale

Tailscale 是一款基于 WireGuard 的零配置 VPN 组网工具，可以将 FlexKVM 设备安全地加入你的 Tailscale 网络（Tailnet），实现安全的远程访问。Tailscale 已预装在系统中，无需额外安装。

> **前置条件**：使用前请先在 [Tailscale 官网](https://tailscale.com) 注册账号。

进入"设置" → "应用中心"，可以看到 Tailscale 配置区块，如下图所示：

![Tailscale 设置](./images/tailscale/setting_tailscale.webp)

## 启用服务

通过开关启用 Tailscale 服务，启用后立即生效。


|   参数   | 说明               |
| :--------: | -------------------- |
| 默认状态 | 关闭               |
| 生效方式 | 点击开关后立即生效 |

启用后可以在描述文字中看到 Tailscale 版本号。

## 登录

启用 Tailscale 服务后，点击"登录状态"按钮开始登录流程：

![Tailscale 登录按键](./images/tailscale/setting_tailscale_wait.webp)

点击登录按键，正在获取登录链接，需要等待几秒钟。

![Tailscale 登录链接](./images/tailscale/setting_tailscale_login.webp)

点击登录链接，浏览器会打开 Tailscale 认证页面。根据你注册 Tailscale 时使用的账号类型，选择对应的登录方式（Google / Microsoft / Apple / 邮箱等）：

![Tailscale 登录账号](./images/tailscale/setting_tailscale_login_web.webp)

完成账号登录后，点击"Connect"按钮，允许设备加入你的 Tailscale 网络：

![Tailscale 连接](./images/tailscale/setting_tailscale_connect.webp)

组网成功后会自动跳转回 Tailscale 管理界面，显示当前设备已加入 Tailscale 网络。

这时设备已经成功登录，可以正常使用 Tailscale 提供的远程访问功能。

![Tailscale 登录成功](./images/tailscale/setting_tailscale_scuess.webp)

> 提示：登录过程中可以随时关闭页面，登录操作在后台异步执行。

## 连接信息

登录成功后，界面会显示以下连接信息：


| 信息         | 说明                                  |
| -------------- | --------------------------------------- |
| 设备 ID      | Tailscale 网络中该节点的唯一标识      |
| Tailnet 名称 | 当前 Tailscale 网络名称               |
| Tailscale IP | 分配的 Tailscale IP 地址（100.x.x.x） |
| 连接状态     | 在线 / 离线                           |
| 密钥到期时间 | Tailscale 节点密钥的到期日期和时间    |

点击右上角的刷新按钮可以更新连接状态。

## 登出

登录成功后，原来的「登录状态」按钮会变为「登出」选项。点击该按钮，选择「登出」即可从当前 Tailscale 网络中移除该设备。

> 注意：登出后设备将从 Tailscale 网络中注销，所有 Tailscale IP 将被释放。如需重新连接，需要重新登录。登出后可以立即重新登录，无需等待。

## 远程访问

登录 Tailscale 成功后，**在需要访问 FlexKVM 的设备上也安装 Tailscale 并登录同一账号**，即可通过以下方式远程访问：

- **Web 管理界面**：在浏览器中访问 `https://<Tailscale-IP>`（例如 `https://100.x.x.x`，该 IP 可在「连接信息」中查看）
- **SSH 管理**：通过 `ssh <用户名>@<Tailscale-IP>` 远程登录

> 提示：Tailscale 可以穿透 NAT 和防火墙，即使 FlexKVM 和访问端不在同一局域网也能建立连接。非常适合在外网环境下安全访问设备。
>
> 如需了解 Tailscale 更多功能（如 ACL 权限控制、共享设备等），请参阅 [Tailscale 官方文档](https://tailscale.com/kb)。

## 故障排查

| 现象 | 可能原因 | 解决方法 |
|------|----------|----------|
| 开关不可用（灰色） | Tailscale 未正确预装 | 联系技术支持 |
| 点击登录后页面无法打开 | 网络异常 | 检查网络连接后重试 |
| 登录提示设备已注册 | 设备已在其他 Tailnet 中 | 在 Tailscale 管理后台移除旧设备后重试 |
| 远程访问时无法连接 | 访问端未安装 Tailscale 或未登录同一账号 | 在访问端安装 Tailscale 并登录同一账号 |

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
