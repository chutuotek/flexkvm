# Feedback & Suggestions

Running into issues? Have a feature idea? Follow this flow — you'll get answers faster, and developers can pinpoint problems quicker.

---

## Step 1: Check Existing Resources

Start where answers already are — many issues are resolved right here.

<div class="grid cards" markdown>

- **:material-chat-question: FAQ**

    Common questions and answers

    [:octicons-arrow-right-24: View FAQ](../../support/faq/index.md)

- **:material-wrench: Troubleshooting**

    Symptom-based diagnostics, step by step

    [:octicons-arrow-right-24: Start diagnosing](../../support/troubleshooting/index.md)

</div>

> If you came here from the FAQ or Troubleshooting pages, skip to [Step 2](#step-2-collect-diagnostic-information).

---

## Step 2: Collect Diagnostic Information

Self-diagnosis didn't help? Before submitting feedback, gather this info — it saves several rounds of back-and-forth with developers.

### Required

| Information | Where to find it |
|-------------|------------------|
| FlexKVM firmware version | Web interface → Settings → About, or OLED bottom line |
| Your OS version | Windows / macOS / Linux system info |
| Browser version | Chrome: `chrome://version` in address bar; Edge/Firefox: Settings → About |
| When the issue occurred | Approximate time is fine |
| Reproducibility | Once / Occasional / Always reproducible |
| Issue description | What triggered it, what exactly happened |

### System Logs

Go to Web interface → Settings → Maintenance, export two logs:

- **Backend logs** (Log Management → Download)
- **Web logs** (WEB Log card → auto-download)

> ⚠️ **Export immediately after the issue occurs** — don't reboot first. Rebooting clears critical diagnostic information.
>
> Log retention rules, download verification, file naming → [System Logs](../maintenance/log.md)

### Screenshots or Screen Recording

A screenshot of the problem is worth hundreds of words of description. If the issue involves a sequence of steps, a screen recording is even better.

---

## Step 3: Submit Feedback

### Bug Report Channels

| Channel | Best for | Address |
|---------|----------|---------|
| GitHub Issue | Public tracking | [github.com/chutuotek/flexkvm/issues](https://github.com/chutuotek/flexkvm/issues) |
| Gitee Issue | Faster in China | [gitee.com/chutuotek/flexkvm/issues](https://gitee.com/chutuotek/flexkvm/issues) |
| Email | Privacy-sensitive / enterprise | [feedback@chutuotek.com](mailto:feedback@chutuotek.com) |

When submitting an Issue, pick the right label: **bug** / **documentation** / **enhancement**.

### Bad Feedback vs. Good Feedback

**❌ Bad feedback:**

> Remote display is frozen, rebooting doesn't fix it, fix it ASAP.

What developers see: no version info, no trigger steps, no logs — they can only ask questions, adding days of back-and-forth.

**✅ Good feedback (copy this format):**

```
FlexKVM version: v0.1.2 (Settings → About → System Version)
OS version: Windows 11 23H2
Browser version: Chrome 148.0.7778.178
Time of issue: 2026-05-25 14:30
Frequency: Reproducible every time during remote OS install

Steps to reproduce:
1. Mount Win11 ISO, reboot target host via ATX
2. Enter BIOS, select boot from USB
3. About 10 seconds after installer appears, remote display freezes
4. Refreshing browser restores it, but freezes again 10 seconds later

What I've already tried:
- Rebooted FlexKVM → no effect
- Tried Chrome / Edge / Firefox → all reproduce
- Swapped HDMI cable → no effect
- Lowered video quality to minimum → no effect

Attachments: System logs, screenshot of the freeze
```

**Why this is good:**

| Element | Why it helps |
|---------|--------------|
| Version, OS, browser | Determines if version-specific, or already fixed |
| Exact steps 1→2→3→4 | Developers can follow along and pinpoint |
| "Always reproducible" | Won't be dismissed as a fluke |
| What you already tried | Avoids wasteful "try rebooting / try another browser" replies |
| Logs attached | Log timestamps and error stacks are more precise than any description |

> **How to write reproduction steps**: Imagine you're teaching someone who has never used FlexKVM. "Mount the ISO and reboot" isn't enough — "Open disk image menu → select partition → mount → check ISO → share file → exit → click ATX power → short-press reset button → wait for OLED to show BIOS screen" is.

### Feature Suggestions

Good ideas don't need a full proposal — a single sentence is enough:

- Features you'd like (NFS remote mount, more resolutions, SNMP monitoring…)
- Improvements to existing features (draggable virtual keyboard, shortcut key optimizations…)
- Great experiences you've had on other similar products

---

## Step 4: Real-Time Chat

Don't want to wait for async feedback? Ask in the community:

| Group | How to join |
|-------|-------------|
| QQ Group | [789603489](https://qm.qq.com/q/R5cNG8ARmW) |
| Telegram | [t.me/flexkvm](https://t.me/flexkvm) |

Experienced users and developers are in the groups — quick questions often get answers in minutes.

---

## Note

If your issue involves sensitive enterprise information (public IPs, internal network topology, etc.), **don't post logs or screenshots in public Issues or group chats**. Use email instead.

---

[:octicons-arrow-left-24: Back to Scenarios](index.md)
