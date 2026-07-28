# Physical Buttons

FlexKVM has four physical buttons for provisioning, mode switching, and system maintenance.

## Quick Reference

| Button | Action | Function | When to use |
|:------:|--------|----------|-------------|
| Button A | Short press | Cycle through OLED sub-pages | View ETH/WiFi/AP/HDMI/system info |
| Button A | Hold 1–3s, then release | Enter hotspot provisioning mode | First-time setup or recovery after misconfiguration |
| Button A | Hold >3s, then release | Return to home screen (cancel provisioning) | Accidental press — cancel the action |
| Button B | Short press | Return to home screen (from sub-pages) | Exit ETH/WiFi/AP/HDMI/System Info detail pages |
| Button B | Hold 1–3s | Toggle Ethernet Direct Mode | No router available — direct Ethernet to computer |
| Button B | Hold 3–5s | Toggle WiFi ↔ Hotspot mode | Quick hotspot on/off without Web interface |
| Button B | Hold 5s+ | Return to home screen (cancel action) | Accidental press — cancel |
| Reset button | Short press | Force reboot | System unresponsive or abnormal |
| Factory reset button | Hold 15s | Restore factory settings | Transferring device, unrecoverable configuration |

## Button Details

### Button A — Provisioning + Info Viewer

**Short press**: Cycles through OLED sub-pages — Home → ETH Info → WiFi Info → AP Info → HDMI Info → System Info → Home. Use to quickly check network details, video parameters, and system information.

**Hold**: Two stages — after 1s the OLED shows the AP provisioning icon, release to enter provisioning mode; keep holding to 3s and the OLED switches to the HOME preview icon, release to return to the home screen (cancel). See [Provisioning Mode](../network/provision.md).

### Button B — Three-Stage Toggle + Back

**Short press**: Returns to the home screen from any info sub-page (ETH Info / WiFi Info / AP Info / HDMI Info / System Info, etc.).

**Hold**: Hold Button B — the OLED shows mode previews in sequence. Release to trigger the corresponding action:

| Hold duration | Action | OLED preview | Wait |
|:------------:|--------|:----------:|:----:|
| 1–3s | Toggle Ethernet Direct Mode | **ETH SERVER** or **ETH CLIENT** icon | ~5s |
| 3–5s | Toggle WiFi ↔ Hotspot mode | WiFi or AP icon | 3–10s |
| 5s+ | Return to home screen (cancel) | HOME icon | Instant |

**Stage 1 (1–3s)**: Toggle Ethernet [Direct Mode](../network/eth-server.md). Currently Ethernet client → shows ETH Server icon, release to enable Direct Mode. Currently Direct Mode → shows ETH Client icon, release to restore normal Ethernet.

**Stage 2 (3–5s)**: Toggle WiFi and [AP Mode](../network/ap.md). Currently hotspot → shows WiFi icon, release to turn off hotspot and restore WiFi. Currently WiFi or both off → shows AP icon, release to turn off WiFi and enable hotspot.

**Stage 3 (5s+)**: Return to home screen — no action is taken. For canceling an accidental hold.

> The OLED preview updates immediately at each stage. Keep holding to advance to the next stage.

### Reset Button

A short press reboots the system immediately — no configuration is lost. Use when the system is frozen or network misconfiguration prevents access.

### Factory Reset Button

Hold 15s → OLED shows countdown → release after countdown reaches zero. During the clear process, 🟢 Status LED and 🔴 Warning LED fast-blink together; the device auto-reboots when clearing is complete.

**Will be cleared**: network settings, accounts, passwords, certificates, and other configurations. **Will not be cleared**: audit logs, firmware version.

> ⚠️ Requires physical access to the device — cannot be done remotely. See [Factory Reset](../maintenance/factory-reset.md).

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
