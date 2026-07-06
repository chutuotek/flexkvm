# SSH

FlexKVM 内置 SSH 服务器，支持通过 SSH 客户端远程登录设备进行带外管理（OOB Management）。

## 前置条件

使用 SSH 登录前，请确保：

1. **已创建账户**：需要在 Web 界面首次访问时创建管理员账户（参见 [登录](../account/login.md)）
2. **SSH 服务已启用**：默认启用，可在设置中关闭
3. **网络已连接**：设备已通过以太网或 WiFi 连接到网络

![SSH 设置](./images/ssh/web-ssh-setting.webp)

## 启用 SSH

进入 **设置 → 系统**，可以看到 SSH 设置区块。点击开关即可开启或关闭 SSH 服务。

> 注意：SSH 服务默认启用，监听端口为 **22**。关闭后所有已连接的 SSH 会话将被断开。

## 连接设备

使用任意 SSH 客户端连接 FlexKVM 设备：

```bash
ssh <用户名>@<设备IP地址>
```

- **用户名**：FlexKVM 的账号名称
- **密码**：FlexKVM 的账号密码
- **端口**：22（默认）

> SSH 仅支持密码登录，不支持密钥登录。

**两步验证**：如果账号开启了 2FA，登录时会分两步：

1. 输入密码 → 密码正确后，提示输入验证码
2. 输入 6 位 TOTP 验证码（或 8 位备用码）→ 验证通过后进入管理界面

> 未开启 2FA 的账号只需输入密码即可登录。

连接成功后，会进入 FlexKVM 的 SSH 管理界面：

![SSH 终端](./images/ssh/web-ssh-terminal.webp)

```
FlexKVM SSH OOB Management
Version: 1.0
Type 'help' for available commands.

flexkvm>
```

## 权限系统

SSH 命令分为两个权限等级：

| 权限等级 | 说明 |
|:---:|------|
| 查看权限 | 可执行查看类命令，如 `system`、`diag`、`help` |
| 控制权限 | 可执行所有命令，包括电源控制、网络配置等 |

用户角色与权限的对应关系：

| 角色 | 权限范围 |
|:---:|------|
| 管理员 | 拥有查看权限和控制权限，可执行所有命令 |
| 普通用户 | 仅拥有查看权限，无法执行控制类命令 |

> 注意：普通用户执行 `help` 时只会显示有权限的命令，控制类命令会被隐藏。

## 可用命令

在 SSH 终端中输入 `help` 可查看当前用户可用的命令列表。

### help

显示可用命令列表及简要说明。

```
flexkvm> help
Available commands:

  power      Power control: on/off/reboot/status
  network    Network management: show/config
  media      Virtual media: mount/unmount/list
  diag       Diagnosis: logs/status/info
  system     System information: version/info
  help       Show available commands
  exit       Exit SSH session

Type 'help <command>' for detailed usage.
```

### system

查看系统版本信息。

| 子命令 | 说明 |
|------|------|
| `system info` | 显示 FlexKVM 系统信息、版本号和 SSH 端口 |
| `system version` | 仅显示版本号 |

```
flexkvm> system info
FlexKVM IP-KVM System
Version: v0.1.0
SSH Module: v1.0 (OOB Management)
Port: 22
```

### power

远程电源控制命令。

| 子命令 | 说明 |
|------|------|
| `power on` | 远程开机 |
| `power off` | 远程关机 |
| `power reboot` | 远程重启 |
| `power status` | 查看电源状态 |

```
flexkvm> power status
Power status: on
```

> 注意：电源控制功能需要配合 ATX 电源控制模块使用，详情请参考 [ATX 电源控制](../../toolbar/atx.md)。

### network

网络配置管理命令。

| 子命令 | 说明 |
|------|------|
| `network show` | 查看当前网络配置 |

```
flexkvm> network show
Network config:
  Interface: eth0
  Mode: dhcp
  IP: 192.168.1.100
  Netmask: 255.255.255.0
  Gateway: 192.168.1.1
```

### media

虚拟媒体管理命令。

| 子命令 | 说明 |
|------|------|
| `media list` | 列出已挂载的虚拟媒体 |
| `media mount` | 挂载虚拟媒体 |
| `media unmount` | 卸载虚拟媒体 |

> 提示：虚拟媒体功能需要配合 USB 配置使用，详情请参考 [USB 配置](usb.md)。

### diag

系统诊断命令。

| 子命令 | 说明 |
|------|------|
| `diag info` | 查看系统信息 |
| `diag status` | 查看硬件状态 |
| `diag logs` | 查看系统日志 |

### exit

退出当前 SSH 会话。

```
flexkvm> exit
Goodbye!
```

> 提示：也可以使用 `Ctrl+D`（在空命令行时）快速退出会话。

## 终端操作

SSH 终端支持以下键盘操作：

| 快捷键 | 功能 |
|:---:|------|
| `Tab` | 命令自动补全 |
| `↑` / `↓` | 浏览命令历史记录 |
| `Ctrl+A` | 光标移动到行首 |
| `Ctrl+E` | 光标移动到行尾 |
| `Ctrl+K` | 删除光标到行尾的内容 |
| `Ctrl+U` | 删除光标到行首的内容 |
| `Ctrl+C` | 清空当前输入 |
| `Ctrl+D` | 空行时退出会话 |
| `Backspace` | 删除光标前一个字符 |

> 提示：命令历史最多保存 32 条记录，重复命令不会重复添加。

## 安全机制

SSH 服务内置了多层安全保护：

### 认证保护

- **密码哈希验证**：使用 SHA256 加盐哈希验证密码，不存储明文密码
- **认证尝试限制**：默认最多允许 3 次认证尝试（可配置范围 1~10 次）
- **指数退避延迟**：认证失败后自动增加等待时间，防止暴力破解
- **认证超时**：认证阶段最长等待 60 秒，超时后自动断开连接

### 会话保护

- **单会话限制**：同一时间只允许一个 SSH 会话，新连接会被拒绝
- **会话锁定**：使用互斥锁保护会话状态，防止竞态条件

### 主机密钥

首次连接时系统自动生成主机密钥，用于验证设备身份，无需手动配置。

### 审计记录

所有 SSH 登录尝试和操作都会记录到审计日志中，包括：

- 认证成功/失败事件
- SSH 服务的启用和禁用操作
- 命令执行记录

详情请参考 [审计日志](../maintenance/audit.md)。
