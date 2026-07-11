# Scenarios

Don't read every page from start to finish. This section is organized by **what you're trying to do** — pick a scenario and follow it through.

> Before you begin, make sure you've completed [Quick Start](../../quick_start/index.md) — device wiring and network configuration should be done first.

---

## Remote Access & Control

Access and control your target host from anywhere.

<div class="grid cards" markdown>

- **:material-wifi-arrow-left-right: Remote Access**

    Device at home, you're at work? Hotspot direct + Tailscale VPN — no public IP needed.

    [:octicons-arrow-right-24: Configure](remote-access.md)

- **:material-power: Remote Power Control**

    ATX physical power control + WoL network wake — power on from anywhere.

    [:octicons-arrow-right-24: Wire it up](power-control.md)

</div>

## System Installation & File Transfer

Reinstall the OS on a remote machine, or transfer files between FlexKVM and the target host.

<div class="grid cards" markdown>

- **:material-disc: Remote OS Install**

    Full workflow: prepare ISO → boot from BIOS → install OS — all remote.

    [:octicons-arrow-right-24: Start installing](reinstall-os.md)

- **:material-folder-move: File Transfer**

    TF card as remote USB drive or virtual CD-ROM — transfer drivers, scripts, logs, ISO images.

    [:octicons-arrow-right-24: View methods](file-transfer.md)

</div>

## Security & Maintenance

Secure your device, keep firmware current, and know how to report issues.

<div class="grid cards" markdown>

- **:material-shield-lock: Security Hardening**

    2FA, HTTPS certificates, SSH hardening, audit logs — prioritized checklist.

    [:octicons-arrow-right-24: Harden security](security.md)

- **:material-tools: Daily Operations**

    Firmware upgrades, audit log export, reboot & reset — with monthly checklist.

    [:octicons-arrow-right-24: Ops guide](daily-ops.md)

- **:material-bug: Feedback & Suggestions**

    Bug report template, diagnostic info collection, feature requests — help devs identify issues fast.

    [:octicons-arrow-right-24: Submit feedback](feedback.md)

</div>

---

## Not sure where to start?

| Your situation | Recommended reading order |
|----------------|--------------------------|
| Just finished Quick Start, want to see everything | Remote Access → Remote OS Install → Daily Operations |
| Device going to a colo, you won't be on-site | Remote Access → Remote Power Control → Security Hardening |
| About to reinstall a remote machine | Remote OS Install → File Transfer |
| Already stable, want maintenance | Daily Operations → Security Hardening |
| Something's wrong | Feedback & Suggestions (start with how to collect diagnostics) |

---

[:octicons-bug-24: Feedback](feedback.md){ .md-button } [:octicons-home-24: Back to Home](../../index.md){ .md-button } [:material-book-open-page-variant: User Guide](../index.md){ .md-button }
