# USB 配置

FlexKVM 通过 USB 模拟键盘、鼠标和存储设备。可以自定义设备标识——控制在被控主机设备管理器中显示的名称和厂商信息。

进设置 → 系统 → USB 配置。

![USB 配置](./images/usb/setting_usb.webp)

## 切换设备标识

下拉列表显示内置标识和自定义标识（如果有）。选完后 USB 自动重启应用新配置。

![设备标识切换](./images/usb/select.webp)

> 主机 BIOS 或系统对特定 USB 设备有兼容问题？试着切换到其他预设标识。

## 自定义设备标识

点"自定义设备标识"：

![自定义设备标识](./images/usb/setting_usb_add.webp)

| 字段 | 格式 | 说明 |
|------|------|------|
| Vendor ID | 4 位十六进制（`0x046d`） | USB 厂商 ID |
| Product ID | 4 位十六进制（`0xc52b`） | USB 产品 ID |
| Manufacturer | 纯英文，最长 64 位 | 厂商名称 |
| Product | 纯英文，最长 64 位 | 产品名称 |

> 全部必填。VID/PID 必须以 `0x` 开头。提交后列表出现 **custom** 选项，选择即应用。

## USB 设备功能

FlexKVM 的 USB 连接包含：

| 功能 | 协议 |
|------|------|
| 键盘 | HID 键盘 |
| 鼠标（绝对模式） | HID 绝对坐标 |
| 鼠标（相对模式） | HID 相对坐标 |
| 音频 | UAC（USB Audio Class） |
| 大容量存储 | USB Mass Storage |

> 修改设备标识会影响以上全部功能。

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
