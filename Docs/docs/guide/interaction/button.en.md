# Physical Buttons

FlexKVM has four physical buttons for provisioning, mode switching, and system maintenance.

## Quick Reference

| Button | Action | Function | When to use |
|:------:|--------|----------|-------------|
| Button A | Hold 3–6s | Enter hotspot provisioning mode | First-time setup or recovery after misconfiguration |
| Button A | Hold >6s | Return to home screen (cancel provisioning) | Accidental press — cancel the action |
| Button B | Hold 3–6s | Toggle Ethernet Direct Mode | No router available — direct Ethernet to computer |
| Button B | Hold 6–9s | Toggle WiFi ↔ Hotspot mode | Quick hotspot on/off without Web interface |
| Button B | Hold 9s+ | Return to home screen (cancel action) | Accidental press — cancel |
| Reset button | Short press | Force reboot | System unresponsive or abnormal |
| Factory reset button | Hold 15s | Restore factory settings | Transferring device, unrecoverable configuration |

## Button Details

### Button A — Provisioning

Hold 3–6s to enter provisioning mode. Release when the OLED shows the AP icon → the device creates a temporary WiFi hotspot. Holding less than 3s won't trigger the action; holding more than 6s returns to the home screen. See [Provisioning Mode](../network/provision.md).

### Button B — Three-Stage Toggle

Hold Button B — the OLED shows mode previews in sequence. Release to trigger the corresponding action:

| Hold duration | Action | OLED preview | Wait |
|:------------:|--------|:----------:|:----:|
| 3–6s | Toggle Ethernet Direct Mode | **ETH SERVER** or **ETH CLIENT** | ~5s |
| 6–9s | Toggle WiFi ↔ Hotspot mode | WiFi or AP full-screen icon | 3–10s |
| 9s+ | Return to home screen (cancel) | HOME full-screen icon | Instant |

**Stage 1 (3–6s)**: Toggle Ethernet [Direct Mode](../network/eth-server.md). Currently Ethernet client → shows "ETH SERVER", release to enable Direct Mode. Currently Direct Mode → shows "ETH CLIENT", release to restore normal Ethernet.

**Stage 2 (6–9s)**: Toggle WiFi and [AP Mode](../network/ap.md). Currently WiFi → shows AP icon, release to turn off WiFi and enable hotspot. Currently hotspot → shows WiFi icon, release to turn off hotspot and restore WiFi.

**Stage 3 (9s+)**: Return to home screen — no action is taken. For canceling an accidental hold.

> The OLED preview updates immediately at each stage. Keep holding to advance to the next stage.

### Reset Button

A short press reboots the system immediately — no configuration is lost. Use when the system is frozen or network misconfiguration prevents access.

### Factory Reset Button

Hold 15s → OLED shows countdown → release after countdown reaches zero. During the clear process, 🟢 Status LED and 🔴 Warning LED fast-blink together; the device auto-reboots when clearing is complete.

**Will be cleared**: network settings, accounts, passwords, certificates, and other configurations. **Will not be cleared**: audit logs, firmware version.

> ⚠️ Requires physical access to the device — cannot be done remotely. See [Factory Reset](../maintenance/factory-reset.md).

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
