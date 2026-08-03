# Tailscale

Tailscale 是预装在 FlexKVM 里的 VPN 组网工具——把你的设备加入同一个加密虚拟网络，不需要公网 IP、不用配路由器端口转发。免费版支持 100 台设备。

> 使用前先去 [tailscale.com](https://tailscale.com) 注册一个账号。

进 Web 界面 → 设置 → **应用中心**。

![Tailscale 设置](./images/tailscale/setting_tailscale.webp)

## 启用服务

点开关即可启用，立即生效。启用后描述文字会显示 Tailscale 版本号。

## 登录

点**登录状态**按钮开始登录：

![Tailscale 登录按键](./images/tailscale/setting_tailscale_wait.webp)

等待几秒钟获取登录链接：

![Tailscale 登录链接](./images/tailscale/setting_tailscale_login.webp)

点登录链接 → 浏览器打开 Tailscale 认证页 → 选你注册时的登录方式（Google / Microsoft / Apple / 邮箱）：

![Tailscale 登录账号](./images/tailscale/setting_tailscale_login_web.webp)

完成登录后点 **Connect**，允许设备加入你的 Tailscale 网络：

![Tailscale 连接](./images/tailscale/setting_tailscale_connect.webp)

> **验证**：页面自动跳回管理界面，显示设备已加入。登录过程中可以随时关页面，后台异步执行。

![Tailscale 登录成功](./images/tailscale/setting_tailscale_success.webp)

## 连接信息

登录成功后界面显示：

| 信息 | 说明 |
|------|------|
| 设备 ID | Tailscale 网络中该节点的唯一标识 |
| Tailnet 名称 | 当前网络名称 |
| Tailscale IP | 分配的 IP（`100.x.x.x`） |
| 连接状态 | 在线 / 离线 |
| 密钥到期时间 | 节点密钥的到期日期和时间 |

点刷新按钮更新连接状态。

## 登出

登录成功后按钮变为**登出**。点登出 → 设备从当前 Tailscale 网络注销，Tailscale IP 被释放。需要重新连接时再登录即可，不用等。

## 远程访问

Tailscale 登录成功后，**在你要访问 FlexKVM 的设备上也装 Tailscale 并登录同一账号**。然后：

- **Web 界面**：`https://<Tailscale IP>`（如 `https://100.x.x.x`）
- **SSH**：`ssh <用户名>@<Tailscale IP>`

就像在同一个局域网里一样，能穿透 NAT 和防火墙。

> Tailscale 的 ACL 权限控制、设备共享等高级功能见 [Tailscale 官方文档](https://tailscale.com/kb)。

## Peer Relay:用 VPS 搭建加速中继

直连失败时,Tailscale 默认会回退到官方 DERP 中继服务器。官方服务器大多在海外,国内访问延迟很高。**Peer Relay** 是 Tailscale 的节点中继功能——让 tailnet 中任意一台设备(比如你的 VPS)充当高性能中继:走 UDP 转发、速度接近直连,比 DERP 快得多。

Tailscale 的连接优先级:**直连 → Peer Relay → DERP**。FlexKVM 预装的 Tailscale 已支持该功能(v1.86 以上即可),中继节点会被自动发现,无需在 FlexKVM 上做任何配置。

### 前置条件

| 条件 | 说明 |
|------|------|
| 一台 VPS | 有公网 IP,建议选择离你较近的机房;Linux 系统 |
| 管理权限 | Tailscale 账号需为 Owner / Admin / Network admin(需要改 ACL) |
| 同一 tailnet | VPS 与 FlexKVM 登录同一 Tailscale 账号 |
| UDP 端口 | VPS 需开放 UDP 40000(中继端口)和 41641(Tailscale 默认端口),见下文 |

> Peer Relay 对所有套餐可用,免费版同样支持。中继流量仍是 WireGuard 端到端加密,数据不会在 VPS 上被看到。

### 使用方法

#### 1. 在管理控制台创建中继设备 tag

打开 [Tailscale 管理控制台](https://login.tailscale.com/admin/acls/file)的 Access Controls(JSON),在现有文件的 `tagOwners` 字段中追加(没有该字段就新建):

```json
"tagOwners": {
	"tag:relay": ["you@example.com"]
}
```

- `tag:relay`:自定义的 tag 名称,用于标记中继设备,后面的步骤会用到
- `you@example.com`:换成你的 Tailscale 登录账号,必须是 Owner / Admin / Network admin

> 必须先在这里把 tag 授权给你自己,否则下一步 VPS 用 `--advertise-tags=tag:relay` 登录时会报错 `requested tags not permitted`。

### 2. 在 VPS 上安装 Tailscale 并登录

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --hostname=relay-01 --advertise-tags=tag:relay
```

- `--hostname`:自定义中继设备名称(如 `relay-01`)
- `--advertise-tags`:声明该设备为中继设备,必须填第 1 步创建的 tag

终端会打印登录链接,浏览器打开并登录,确认 VPS 与 FlexKVM 在同一个 tailnet。

### 3. 开放 UDP 端口

需要放行两个 UDP 端口(中继端口以 40000 为例,可自行修改):

- **40000**:Peer Relay 中继端口,必须与第 4 步设置的值一致
- **41641**:Tailscale 默认的 WireGuard 端口,其他设备需要靠它连上 VPS

```bash
sudo ufw allow 40000/udp && sudo ufw allow 41641/udp    # ufw(Ubuntu)
sudo firewall-cmd --permanent --add-port=40000/udp && sudo firewall-cmd --permanent --add-port=41641/udp && sudo firewall-cmd --reload    # firewalld(CentOS)
```

阿里云、腾讯云等云厂商还需在**安全组**中添加入方向 UDP 40000 和 UDP 41641 的规则。

### 4. 开启中继模式

```bash
sudo tailscale set --relay-server-port=40000
```

端口可以换成任意可达的 UDP 端口。关闭中继:

```bash
sudo tailscale set --relay-server-port=""
```

> 如果 VPS 处于端口转发、负载均衡(NLB)等无法自动发现端口的网络环境,可以用 `--relay-server-static-endpoints` 手动声明公网端点:
>
> ```bash
> sudo tailscale set --relay-server-port=40000 --relay-server-static-endpoints="[公网IP]:40000"
> ```

### 5. 在管理控制台授权

打开 [Tailscale 管理控制台](https://login.tailscale.com/admin/acls/file)的 Access Controls(JSON),在现有 `grants` 数组**末尾追加**以下条目(原来已有的规则全部保留,不要动):

```json
{
	"src": ["100.x.x.x", "100.y.y.y"],
	"dst": ["tag:relay"],
	"app": {"tailscale.com/cap/relay": []}
}
```

- `src`:允许使用中继的设备,**逐个填入**这些设备的 Tailscale IP(如 FlexKVM 和你的电脑),多个 IP 用逗号分隔
- `dst`:中继设备,填第 1 步创建的 `tag:relay`(不想用 tag 的话,也可以直接填 VPS 的 Tailscale IP)

> 只把真正需要加速的设备加进 `src`,不要用 `"src": ["*"]`——本来不需要中继的设备也会被路由到中继,白白多一跳,增加延迟。
> 如果你的 tailnet 之前没配置过 ACL(设备默认互通),只需追加这一条,不需要再加其他规则。

### 6. 验证

在**访问端设备**(如你的电脑)上执行:

```bash
tailscale status
tailscale ping <FlexKVM 的 Tailscale IP>
```

当直连不可用时,连接类型显示 `peer-relay`,ping 输出 `via peer-relay:<ip>:<udp-port>`,说明中继已生效。如果显示 `direct`,说明走了直连,这也是最优路径。

```
# tailscale ping 100.118.167.14
pong from flexkvm-6jzde-1 (100.118.167.14) via DERP(sfo) in 335ms
pong from flexkvm-6jzde-1 (100.118.167.14) via peer-relay(公网ip:40000:vni:39) in 36ms
pong from flexkvm-6jzde-1 (100.118.167.14) via peer-relay(公网ip:40000:vni:39) in 35ms
```

> 配置后中继未生效的话,重启 VPS 上的 Tailscale 服务再试:`sudo systemctl restart tailscaled`

---

## 故障排查

| 现象 | 可能原因 | 先试这个 |
|------|----------|---------|
| 开关灰色不可用 | Tailscale 未正确预装 | 联系技术支持 |
| 登录页打不开 | 网络异常 | 检查 FlexKVM 是否联网 |
| 登录提示设备已注册 | 设备已在其他 Tailnet | 在 Tailscale 管理后台移除旧设备后重试 |
| 远程连不上 | 访问端没装 Tailscale 或没登同一账号 | 在访问端装 Tailscale 并登录同一账号 |

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
