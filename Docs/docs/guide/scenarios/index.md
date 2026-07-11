# 场景向导

不用从头啃完所有文档。这里按**你想做的事**组织——选一个场景，跟着走完就行。

> 开始前请确认已完成 [快速上手](../../quick_start/index.md) 中的设备接线和网络配置。

---

## 远程访问与控制

从任何地方访问和控制你的被控设备。

<div class="grid cards" markdown>

- **:material-wifi-arrow-left-right: 外网远程访问**

    人在公司、设备在家？热点直连 + Tailscale 组网，无需公网 IP。

    [:octicons-arrow-right-24: 开始配置](remote-access.md)

- **:material-power: 远程开关机**

    ATX 物理控制电源 + WoL 网络唤醒，人在外面也能开机。

    [:octicons-arrow-right-24: 查看接线](power-control.md)

</div>

## 系统安装与文件传输

给远程设备重装系统，或者在 FlexKVM 和被控设备之间传文件。

<div class="grid cards" markdown>

- **:material-disc: 远程重装系统**

    从准备 ISO 镜像到 BIOS 启动、系统安装完成的全流程。

    [:octicons-arrow-right-24: 开始重装](reinstall-os.md)

- **:material-folder-move: 文件传输**

    TF 卡变远程 U 盘或虚拟光驱，传驱动、脚本、日志、ISO 镜像。

    [:octicons-arrow-right-24: 查看方法](file-transfer.md)

</div>

## 安全与维护

保护设备安全，保持固件更新，出了问题知道怎么反馈。

<div class="grid cards" markdown>

- **:material-shield-lock: 安全加固**

    2FA 双因素认证、HTTPS 证书、SSH 加固、审计日志——按优先级逐项配置。

    [:octicons-arrow-right-24: 加固安全](security.md)

- **:material-tools: 日常运维**

    升级固件、导出审计日志、重启恢复，附月度检查清单。

    [:octicons-arrow-right-24: 运维指南](daily-ops.md)

- **:material-bug: 问题反馈与建议**

    Bug 反馈模板、诊断信息收集、功能建议——让开发者快速定位问题。

    [:octicons-arrow-right-24: 提交反馈](feedback.md)

</div>

---

## 不知道该从哪开始？

| 你的情况 | 推荐阅读顺序 |
|----------|------------|
| 刚完成快速入门，想全面了解能做什么 | 外网远程访问 → 远程重装系统 → 日常运维 |
| 设备要放机房，人不在现场 | 外网远程访问 → 远程开关机 → 安全加固 |
| 准备重装一台远程机器 | 远程重装系统 → 文件传输 |
| 已经稳定运行，想做维护 | 日常运维 → 安全加固 |
| 出问题了 | 问题反馈与建议（先看诊断信息怎么收集） |

---

[:octicons-bug-24: 问题反馈](feedback.md){ .md-button } [:octicons-home-24: 返回首页](../../index.md){ .md-button } [:octicons-book-open-page-variant: 用户指南](../index.md){ .md-button }
