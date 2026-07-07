# TF 卡与存储

FlexKVM 通过 TF 卡（MicroSD）提供本地存储扩展，支持文件管理、虚拟光驱和 USB 导出功能。

## TF 卡规格

| 项目 | 要求 |
|------|------|
| 卡类型 | MicroSD（TF）卡 |
| 容量 | 最高 512GB |
| 文件系统 | FAT32 / exFAT / ext4 |

> 如果 TF 卡插上没反应，可能是文件系统不支持。NTFS 只能读取不能写入。建议格式化为 FAT32 或 exFAT。

## 物理接口

TF 卡槽位于设备侧面。装入时请确保金属触点朝向正确（通常朝向设备内部），推入听到咔嗒声即可。

> 接口电气规格请参考 [接口说明](../hardware/interface.md#tf-卡槽)。

---

## 相关文档

- [镜像（Web 操作）](../toolbar/disk.md)
- [远程重装系统](../scenarios/reinstall-os.md)
