# Physical Buttons

FlexKVM has four physical buttons for provisioning, mode switching, and system maintenance.

## Quick Reference

| Button | Action | Function | When to use |
|:------:|--------|----------|-------------|
| Button A | Hold 3–6s | Enter hotspot provisioning mode | First-time setup or recovery after misconfiguration |
| Button A | Hold >6s | Return to home screen (cancel provisioning) | Accidental press — cancel the action |
| Button B | Hold 3s | Toggle WiFi ↔ Hotspot mode | Quick hotspot on/off without Web interface |
| Reset button | Short press | Force reboot | System unresponsive or abnormal |
| Factory reset button | Hold 15s | Restore factory settings | Transferring device, unrecoverable configuration |

## Button Details

### Button A — Provisioning

Hold 3–6s to enter provisioning mode. Release when the OLED shows the AP icon → the device creates a temporary WiFi hotspot. Holding less than 3s won't trigger the action; holding more than 6s returns to the home screen. See [Provisioning Mode](../network/provision.md).

### Button B — WiFi / Hotspot Toggle

Hold 3s to toggle between WiFi and hotspot mode:

| Current mode | Result | Wait |
|:------------:|--------|:----:|
| WiFi | WiFi off, hotspot on | ~10s |
| Hotspot | Hotspot off, WiFi restored | 3–4s |

See [AP Mode](../network/ap.md) and [WiFi](../network/wifi.md).

### Reset Button

A short press reboots the system immediately — no configuration is lost. Use when the system is frozen or network misconfiguration prevents access.

### Factory Reset Button

Hold 15s → OLED shows countdown → release after countdown reaches zero. During the clear process, 🟢 Status LED and 🔴 Warning LED fast-blink together; the device auto-reboots when clearing is complete.

**Will be cleared**: network settings, accounts, passwords, certificates, and other configurations. **Will not be cleared**: audit logs, firmware version.

> ⚠️ Requires physical access to the device — cannot be done remotely. See [Factory Reset](../maintenance/factory-reset.md).

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
