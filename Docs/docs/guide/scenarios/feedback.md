# 问题反馈与建议

遇到问题了？有功能想法？跟着这个流程操作，你得到答案更快，开发者也能更快定位问题。

---

## 第一步：查常见问题

先去 [常见问题与排查](../../support/index.md) 页面看看你的问题是否已经有答案：

<div class="grid cards" markdown>

- **:material-chat-question: 常见问题**

    使用中的常见疑问和解答

    [:octicons-arrow-right-24: 查看 FAQ](../../support/faq/index.md)

- **:material-wrench: 故障排查**

    按症状诊断，逐步定位问题

    [:octicons-arrow-right-24: 开始排查](../../support/troubleshooting/index.md)

</div>

很多问题在这一步就能解决。

---

## 第二步：收集诊断信息

如果自查没解决，提交反馈前准备好以下信息，能帮开发者快速定位：

### 必备信息

| 信息 | 在哪看 |
|------|--------|
| **FlexKVM 固件版本** | Web 界面 → 设置 → 关于，或 OLED 显示 |
| **操作系统版本** | 你操作电脑的系统版本 |
| **浏览器版本** | Chrome/Edge/Firefox 的版本号 |
| **问题发生时间** | 大概什么时间发生的 |
| **复现频率** | 单次 / 偶尔 / 稳定复现 |
| **问题描述** | 什么场景下触发、具体现象是什么 |

### 系统日志

在 Web 界面 → 设置 → 维护，导出：
- 后端日志
- Web 日志

> 在问题发生后**立即导出**日志，不要重启设备后再导出——重启会清掉关键信息。

日志导出说明详见 [系统日志](../maintenance/log.md)。

### 截图或录屏

截一张出问题时的画面，比文字描述更直观。如果问题涉及操作步骤，录一段屏幕视频更好。

---

## 第三步：提交反馈

### Bug 反馈

| 渠道 | 适合 | 地址 |
|------|------|------|
| GitHub Issue | 公开跟踪、有账号即可 | [github.com/chutuotek/flexkvm/issues](https://github.com/chutuotek/flexkvm/issues) |
| Gitee Issue | 国内用户、访问更快 | [gitee.com/chutuotek/flexkvm/issues](https://gitee.com/chutuotek/flexkvm/issues) |
| 邮箱 | 涉及隐私信息 | [feedback@chutuotek.com](mailto:feedback@chutuotek.com) |

提交 Issue 时选择对应的标签：**bug**（Bug 反馈）、**documentation**（文档问题）、**enhancement**（功能建议）。

### 反馈示例

一份好的 Bug 反馈长这样：

```
FlexKVM 版本：v0.1.2
操作系统版本：Windows 10 21H1
浏览器版本：Chrome 148.0.7778.178（64 位）
出现时间：2026-05-25 10:20
出现频率：稳定复现
问题描述：虚拟键盘按下无反应，刷新页面后恢复正常
附件：截图、系统日志
```

### 功能建议

有好想法？可以畅所欲言，不限于下面这些方向：

- 希望支持的功能（如 NFS 远程挂载、更多分辨率、SNMP 监控等）
- 现有功能的改进（如虚拟键盘拖拽、快捷键优化等）
- 你在其他类似产品上用过的体验

> 功能建议不需要完整方案，一句话描述也行。你的需求可能会在后续版本中实现。

---

## 第四步：实时交流

如果不想等异步反馈，可以直接进群问：

| 群组 | 加入方式 |
|------|----------|
| QQ 群 | [789603489](https://qm.qq.com/q/R5cNG8ARmW) |
| Telegram | [t.me/flexkvm](https://t.me/flexkvm) |

群里有很多经验用户和开发者，小问题可能几分钟就有答案。

---

## 注意

如果设备涉及企业敏感信息（公网 IP、内部网络拓扑等），**不要**在公开的 Issue 或群聊中贴日志和截图，请用邮箱反馈。
