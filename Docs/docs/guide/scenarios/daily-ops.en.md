# Daily Operations

Your device is up and running. This page covers the few things you'll do repeatedly — about 5 minutes a month is all it takes.

---

## Firmware Upgrade

Firmware updates bring new features and security fixes. Check monthly.

| Method | When to use | What you need |
|--------|-------------|---------------|
| Online upgrade | Device has internet | Network connection |
| Offline upgrade | Device has no internet | TF card + computer to download firmware package |

### Online Upgrade

Go to Web interface → Settings → Upgrade:

1. Select a **download source** (default Gitcode, Gitee also for China, GitHub for international)
2. Click **Check for Updates**
3. If a new version is available → click **Download Package** → wait for download and verification
4. Click **Upgrade Now** → enter password to confirm

> **Verify**: During upgrade, the OLED shows an upgrade icon and 🔴 Warning LED fast-blinks. When complete, the device auto-reboots and the OLED shows the IP again.
>
> ⚠️ **Always use a dedicated power adapter before upgrading.** Power loss during upgrade can brick the device.
>
> Beta firmware, download source switching, changelog viewing → [Online Upgrade](../maintenance/upgrade-online.md)

### Offline Upgrade

Device has no internet: download the firmware package (`.tar`) from the [Gitcode Releases page](https://gitcode.com/chutuotek/flexkvm/releases) (Gitee/GitHub also available) on a computer → copy to TF card → insert into FlexKVM → Upgrade interface → select Offline Upgrade → upload → start.

> SHA-256 verification, firmware package format → [Offline Upgrade](../maintenance/upgrade-offline.md)

---

## Audit Logs

Web interface → Settings → Maintenance → Audit. Records all key operations: who logged in, what commands were run, what config was changed.

> In multi-user or production environments, export once a month for your records. See [Audit Logs](../security/audit.md) for details.

---

## Reboot

Device feels slow or the display is laggy? Try a reboot first — it fixes most transient issues.

- **Web interface**: Settings → Maintenance → Reboot → confirm. After ~20–30 seconds, the OLED shows the IP again — you can reconnect.
- **Hardware**: Short-press the **reset button** on the device for an instant reboot — no config is lost.

> Rebooting does not clear any data, settings, or accounts. Use it freely.
>
> Hardware button location and operation details → [Reboot](../maintenance/reboot.md)

---

## Factory Reset

Forgot your password, transferring the device, or want a clean start — restore to factory state.

**How**: Use a SIM ejector pin to hold the **factory reset button** (RST hole) on FlexKVM. The OLED shows a countdown — release after about 15 seconds when it reaches zero.

> ⚠️ **Clears all data**: accounts, passwords, WiFi config, 2FA keys, custom settings. Firmware version is not downgraded.
>
> You can also reset from the Web interface or SSH (SSH supports two levels: keep or clear logs) → [Factory Reset](../maintenance/factory-reset.md)

---

## Monthly Checklist

Once the device is stable, spend 5 minutes each month:

| Task | Why |
|------|-----|
| Check for firmware update | Security fixes and new features |
| Export audit logs | Keep records for reference |
| Verify remote access works | Avoid surprises when you really need it |

> When something goes wrong, **export system logs first, then reboot** — logs help developers identify the root cause. See [Feedback & Suggestions](feedback.md) for how. For daily operations, you only need audit logs — you can ignore system logs until something breaks.

---

## Next Steps

- Worried about unauthorized access → [Security Hardening](security.md)
- Need to reinstall a remote host → [Remote OS Install](remote-access.md)
- Manage devices from outside → [Remote Access](remote-access.md)

---

[:octicons-arrow-left-24: Back to Scenarios](index.md)
