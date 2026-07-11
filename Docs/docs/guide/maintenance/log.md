# 系统日志

系统日志用于厂商排查系统异常，日常不用管——除非系统出问题了。

进设置 → 维护。

![维护界面](./images/setting_log.webp)

## 日志管理

点"日志管理"卡片：

![日志管理界面](./images/maintenance_log.webp)

日志列表显示每条日志的开始时间、结束时间、状态和下载按钮。每次系统启动（重启、断电、崩溃等）产生一条新日志，最多保留 20 条。

状态分三种：

- **录制中**（蓝色）：正在录制
- **正常**（绿色）：录制完成，无异常
- **异常**（红色）：录制完成，系统崩溃过

点下载 → 选目录 → 等进度条 100% 且校验通过。文件名：`log-YYYY-MM-DDTHH-MM-SS.tar.gz`，如 `log-2026-05-19T09-22-08.tar.gz`。校验失败就重新下载。

![下载界面](./images/maintenance_log_filesave.webp)

![文件下载进度条](./images/maintenance_log_progress.webp)

## WEB 日志

点"WEB 日志"卡片 → 当前浏览器日志自动下载到浏览器下载目录。文件名：`flexkvm-web-xxxxxxxxx.log`（`xxxxxxxxx` 为时间戳）。给厂商调试用。

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
