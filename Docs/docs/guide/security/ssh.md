# SSH

FlexKVM 内置 SSH 服务器，可以通过命令行远程管理设备——带外管理（OOB）。用密码认证，同一时间只允许一个会话。

> 失败超过 3 次自动断开，短暂延迟后才能重试——防暴力破解。

## 开始之前

- 已在 Web 界面创建了管理员账户（→ [登录](./account/login.md)）
- SSH 服务已启用（默认开启）
- 设备已联网

## 启用与关闭

进设置 → 系统 → SSH 设置。

![SSH 设置](./images/ssh/setting_ssh.webp)

点开关即可。默认监听 22 端口。关掉后所有已连接会话断开。

## 连接设备

```bash
ssh <用户名>@<设备IP>
```

端口 22（默认）。Windows 自带 OpenSSH，PowerShell 或 CMD 直接能用。

- **用户名**：FlexKVM 账户名
- **密码**：FlexKVM 账户密码
- **不支持密钥登录**

**开了 2FA？** 登录分两步：先输入密码 → 密码正确后提示输入 6 位 TOTP 验证码（或 8 位备用码）→ 验证通过后进入。没开 2FA 只需密码。

连接成功后进入管理界面：

```
flexkvm-6jzdd SSH OOB Management
Version: 1.1
Type 'help' for available commands.

admin@flexkvm-6jzdd#
```

## 可用命令

输入 `help` 看完整列表。常用命令速查：

### ATX 电源控制

| 命令 | 说明 |
|------|------|
| `atx power short\|long` | 短按/长按电源键 |
| `atx reset` | 短按复位键 |
| `atx status` | 查看 ATX 及电源状态 |

### GPIO 控制

| 命令 | 说明 |
|------|------|
| `gpio status` | 查看引脚状态 |
| `gpio enable\|disable` | 启用/禁用 |
| `gpio direction` | 设置方向（in/out） |
| `gpio level` | 设置输出电平（0/1） |

### 网络工具

| 命令 | 说明 |
|------|------|
| `network show` | 查看网络接口信息 |
| `ping` | 连通性测试 |

### 系统管理

| 命令 | 说明 |
|------|------|
| `system info` | 查看固件版本 |
| `reset` | 恢复出厂（保留日志） |
| `reset all` | 深度恢复（清除全部） |
| `exit` | 退出会话 |

## 终端操作

| 快捷键 | 功能 |
|:---:|------|
| `Tab` | 命令补全 |
| `↑` / `↓` | 命令历史（最多 32 条） |
| `Ctrl+A` / `Ctrl+E` | 行首/行尾 |
| `Ctrl+K` / `Ctrl+U` | 删到行尾/行首 |
| `Ctrl+C` | 清空当前输入 |
| `Ctrl+D` | 空行时退出 |

---

## 故障排查

| 现象 | 可能原因 | 先试这个 |
|------|----------|---------|
| `Connection refused` | SSH 服务没开 | 进设置 → 系统检查 SSH 开关 |
| `Connection timed out` | IP 不对或网络不通 | 确认 IP 和 OLED 一致，ping 一下 |
| `Permission denied` | 用户名或密码错 | 确认用 Web 界面的账号密码，注意大小写 |
| 登录后立刻断开 | 已有其他 SSH 会话 | 关掉原会话或等超时 |
| 输错密码被踢 | 失败超过 3 次 | 重新连接即可 |

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
