# SSH

FlexKVM 内置 SSH 服务器，支持通过 SSH 客户端远程登录设备进行带外管理（OOB Management）。

SSH 采用密码认证（不支持密钥），同一时间只允许一个会话连接。登录失败超过 3 次将自动断开连接，防止暴力破解。

## 前置条件

使用 SSH 登录前，请确保：

1. **已创建账户**：需要在 Web 界面首次访问时创建管理员账户（参见 [登录](../account/login.md)）
2. **SSH 服务已启用**：默认启用，可在设置中关闭
3. **网络已连接**：设备已通过以太网或 WiFi 连接到网络

## 启用 SSH

进入 **设置 → 系统**，可以看到 SSH 设置区块。点击开关即可开启或关闭 SSH 服务。

![SSH 设置](./images/ssh/setting_ssh.webp)

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

1. 输入密码 → 密码正确后，提示输入 TOTP 验证码
2. 输入 6 位 TOTP 验证码（或 8 位备用码）→ 验证通过后进入管理界面

> 未开启 2FA 的账号只需输入密码即可登录。

连接成功后，会进入 FlexKVM 的 SSH 管理界面：

```
flexkvm-6jzdd SSH OOB Management
Version: 1.1
Type 'help' for available commands.

admin@flexkvm-6jzdd#
```

## 可用命令

在 SSH 终端中输入 `help` 可查看当前用户可用的命令列表。

### help

显示可用命令列表及简要说明。

```
admin@flexkvm-6jzdd# help
Available commands:

  power      Power control: on/off/reboot/status
  network    Network management: show
  media      Virtual media: list
  diag       Diagnosis: info/status
  system     System information: version/info
  reset      Factory reset: reset/reset all
  help       Show available commands
  exit       Exit SSH session

Type 'help <command>' for detailed usage.
admin@flexkvm-6jzdd#
```

### system

查看系统版本信息。

| 子命令 | 说明 |
|------|------|
| `system info` | 显示 FlexKVM 系统信息、版本号和 SSH 端口 |
| `system version` | 仅显示版本号 |

```
admin@flexkvm-6jzdd# system info
FlexKVM IP-KVM System
Version: v0.1.2
SSH Module: v1.1 (OOB Management)
Port: 22
```

```
admin@flexkvm-6jzdd# system version
FlexKVM Version: v0.1.2
```

### power

远程电源控制命令，需要配合 ATX 外设模块使用。

| 子命令 | 说明 |
|------|------|
| `power on` | 远程开机（短按电源键） |
| `power off` | 远程关机（长按电源键） |
| `power reboot` | 远程重启（短按复位键） |
| `power status` | 查看电源状态和 ATX 信息 |

```
admin@flexkvm-6jzdd# power status
=== Power Status ===
ATX Device:  connected
Power LED:   ON
HDD LED:     ON
Power SW:    released
Reset SW:    released
Short press: 200 ms
Long press:  1000 ms
```

> 注意：电源控制功能需要配合外设模块使用，详情请参考 [外设](../../toolbar/atx.md)。

### network

查看网络配置信息。

| 子命令 | 说明 |
|------|------|
| `network show` | 查看当前网络配置（WiFi / 以太网状态） |

```
admin@flexkvm-6jzdd# network show
=== WiFi (wlan0) ===
Status:  down
MAC:     78:16:5D:11:10:01
DHCP:    no
```

### media

查看虚拟媒体状态。

| 子命令 | 说明 |
|------|------|
| `media list` | 查看虚拟媒体状态（类型、挂载信息） |

```
admin@flexkvm-6jzdd# media list
=== Virtual Media ===
Status:      enabled
Media type:  Flash
Write mode:  read-write
Mounted:     no
Image path:  (not set)
```

> 提示：虚拟媒体功能需要配合 USB 配置使用，详情请参考 [USB 配置](usb.md)。

### diag

系统诊断命令。

| 子命令 | 说明 |
|------|------|
| `diag info` | 查看系统信息 |
| `diag status` | 查看硬件状态（ATX 电源、以太网连接） |

```
admin@flexkvm-6jzdd# diag info
=== System Information ===
Product:  FlexKVM IP-KVM
Version:  v0.1.2
SSH Port: 22
```

```
admin@flexkvm-6jzdd# diag status
=== Hardware Status ===
ATX Power:  connected
Power LED:  ON
HDD LED:    ON
```

### reset

恢复出厂设置命令（需要密码二次验证）。

| 子命令 | 说明 |
|------|------|
| `reset` | 恢复出厂设置，**保留审计日志** |
| `reset all` | 深度恢复出厂设置，**清除所有数据包括审计日志** |

执行 `reset` 或 `reset all` 后，系统会要求输入当前用户的密码进行二次确认，验证通过后才会执行恢复操作。

```
admin@flexkvm-6jzdd# reset

--- Password Verification ---
Enter password to confirm:
```

> 注意：恢复出厂设置操作不可撤销，执行前请确认。

### exit

退出当前 SSH 会话。

```
admin@flexkvm-6jzdd# exit
Goodbye!
```

> 提示：也可以使用 `Ctrl+D`（在空命令行时）快速退出会话。

## 终端操作

SSH 终端支持以下键盘操作：

| 快捷键 | 功能 |
|:---:|------|
| `Tab` | 命令自动补全 |
| `↑` / `↓` | 浏览命令历史记录（最多 32 条） |
| `Ctrl+A` | 光标移动到行首 |
| `Ctrl+E` | 光标移动到行尾 |
| `Ctrl+K` | 删除光标到行尾的内容 |
| `Ctrl+U` | 删除光标到行首的内容 |
| `Ctrl+C` | 清空当前输入 |
| `Ctrl+D` | 空行时退出会话 |
| `Backspace` | 删除光标前一个字符 |

> 提示：命令历史最多保存 32 条记录，重复命令不会重复添加。

