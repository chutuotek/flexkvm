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

  atx        ATX control: power/reset/status  [power/reset/status]
  network    Network: show/set                 [show]
  gpio       GPIO control: A/B                 [status/enable/disable/direction/level]
  ping       Send ICMP echo requests
  system     System: info/version              [info/version]
  reset      Factory reset                     [all]
  help       Show available commands
  exit       Exit SSH session

Type '<command>' for subcommand details.
```

### atx

远程 ATX 电源控制命令，需要配合 ATX 外设模块使用。

| 子命令 | 说明 | 用法 |
|------|------|------|
| `atx power` | 电源键控制 | `atx power short\|long\|set <ms>` |
| `atx reset` | 复位键短按 | `atx reset` |
| `atx status` | 查看 ATX 及电源状态 | `atx status` |

**power 子命令参数**：

| 参数 | 说明 |
|------|------|
| `short` | 短按电源键（开机 / 正常关机） |
| `long` | 长按电源键（强制关机） |
| `set <ms>` | 设置长按持续时间（200~5000 ms） |

```
admin@flexkvm-6jzdd# atx power short
Power short press: OK

admin@flexkvm-6jzdd# atx power set 3000
Power long press time set to 3000 ms: OK

admin@flexkvm-6jzdd# atx status
=== ATX Status ===
Device       connected
Power LED    ON
HDD LED      ON
Power SW     released
Reset SW     released
Power long   3000 ms
```

> 注意：电源控制功能需要配合 ATX 外设模块使用，详情请参考 [外设](../../toolbar/atx.md)。

### network

查看网络接口配置信息。

| 子命令 | 说明 | 用法 |
|------|------|------|
| `network show` | 查看网络状态 | `network show [eth\|wifi\|ap]` |

不带参数时显示全部接口，可选参数过滤指定接口：

```
admin@flexkvm-6jzdd# network show
=== Ethernet ===
Interface    eth0
Status       up
MAC          78:16:5D:11:10:01
DHCP         yes
IP           192.168.1.100
Netmask      255.255.255.0
Gateway      192.168.1.1
DNS          192.168.1.1

=== WiFi ===
Interface    wlan0
Status       down
MAC          78:16:5D:11:10:02
DHCP         no

=== AP Hotspot ===
Interface    wlan0
State        disabled
Active       no
SSID         FlexKVM-6jzdd
Band         2.4G
Channel      auto
Clients      0/8
```

### gpio

GPIO 引脚控制命令，支持两路 GPIO（GPIOA / GPIOB）的独立控制。

| 子命令 | 说明 | 用法 |
|------|------|------|
| `gpio status` | 查看 GPIO 状态 | `gpio status [a\|b]` |
| `gpio enable` | 启用 GPIO 引脚 | `gpio enable a\|b` |
| `gpio disable` | 禁用 GPIO 引脚 | `gpio disable a\|b` |
| `gpio direction` | 设置引脚方向 | `gpio direction a\|b <in\|out>` |
| `gpio level` | 设置输出电平 | `gpio level a\|b <0\|1>` |

```
admin@flexkvm-6jzdd# gpio status
=== GPIO Status ===
GPIOA
  Enable       yes
  Direction    output
  Level        low
GPIOB
  Enable       no
  Direction    unknown

admin@flexkvm-6jzdd# gpio enable a
GPIOA: OK

admin@flexkvm-6jzdd# gpio direction a out
GPIOA: OK

admin@flexkvm-6jzdd# gpio level a 1
GPIOA: OK
```

### ping

原生 ICMP ping 命令，用于网络连通性诊断。

| 命令 | 说明 | 用法 |
|------|------|------|
| `ping` | 发送 ICMP 回显请求 | `ping <host> [count]` |

- **host**：目标 IP 地址或域名
- **count**：发送包数（默认 4，范围 1~100）
- 输出为流式，每收到一个回复立即显示，无需等待全部完成
- 命令结束后输出丢包率和 RTT 统计（最小/平均/最大）

```
admin@flexkvm-6jzdd# ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1): 56 data bytes

64 bytes from 192.168.1.1: icmp_seq=0 time=1.23 ms
64 bytes from 192.168.1.1: icmp_seq=1 time=1.45 ms
64 bytes from 192.168.1.1: icmp_seq=2 time=1.34 ms
64 bytes from 192.168.1.1: icmp_seq=3 time=1.56 ms

--- 192.168.1.1 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss
rtt min/avg/max = 1.23/1.40/1.56 ms
```

### system

查看系统版本信息。

| 子命令 | 说明 |
|------|------|
| `system info` | 显示产品名称、固件版本和 SSH OOB 端口 |
| `system version` | 仅显示版本号 |

```
admin@flexkvm-6jzdd# system info
=== System Information ===
Product      FlexKVM IP-KVM
Version      v0.1.2
SSH OOB      1.1 (port 22)
```

```
admin@flexkvm-6jzdd# system version
FlexKVM Version: v0.1.2
```

### reset

恢复出厂设置命令（需二次密码验证）。

| 子命令 | 说明 |
|------|------|
| `reset` | 标准恢复出厂设置，**保留审计日志** |
| `reset all` | 深度恢复，**清除所有数据包括审计日志** |

执行流程分三步：密码验证 → 两步验证（如已开启 2FA）→ 倒计时确认。

```
admin@flexkvm-6jzdd# reset

--- Password Verification ---
Enter password to confirm:
Password verified.

--- 2FA Verification ---
Enter TOTP code:
TOTP verified.

Factory reset in 3 seconds...
Factory reset in 2 seconds...
Factory reset in 1 second...

Factory reset executed. System will reboot.
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
