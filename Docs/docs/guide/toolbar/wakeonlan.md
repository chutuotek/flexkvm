# 网络唤醒 (WoL)

网络唤醒（Wake-on-LAN，简称 WoL）允许通过 FlexKVM 远程唤醒局域网内已关机的设备。该功能通过发送 Magic Packet 到目标设备的 MAC 地址实现。

进入菜单栏，点击网络唤醒图标打开 WoL 菜单：

![WoL 菜单](./images/wakeonlan/web-wol-menu.webp)

## 工作原理

WoL 通过 UDP 协议向局域网广播地址（`255.255.255.255`）的 9 号端口发送 Magic Packet。Magic Packet 包含 6 字节的 `FF` 前缀，后跟目标设备 MAC 地址重复 16 次。

> 注意：目标设备需要满足以下条件才能被唤醒：
> - 主板和 BIOS 支持并已开启 Wake-on-LAN 功能
> - 设备通过有线网络连接（WiFi 通常不支持 WoL）
> - 设备处于关机（S5）、休眠（S4）或睡眠（S3）状态

## 添加设备

点击"添加设备"按钮，填写设备信息：

![添加设备](./images/wakeonlan/web-wol-add.webp)

| 字段 | 说明 | 示例 |
|------|------|------|
| 设备名称 | 自定义设备名称，仅支持英文字母和数字 | `My-PC` |
| MAC 地址 | 目标设备的 MAC 地址 | `AA:BB:CC:DD:EE:FF` |

> 注意：设备名称不能重复，最多添加 5 台设备。

## 管理设备

设备列表会显示已添加的设备名称和 MAC 地址：

![设备列表](./images/wakeonlan/web-wol-list.webp)

| 操作 | 说明 |
|------|------|
| 唤醒 | 向目标设备发送 Magic Packet 唤醒设备 |
| 删除 | 从列表中移除该设备 |

> 提示：在 Linux 系统上可以使用 `ip addr` 或 `ifconfig` 命令查看 MAC 地址。在 Windows 上可以使用 `ipconfig /all` 命令查看。
