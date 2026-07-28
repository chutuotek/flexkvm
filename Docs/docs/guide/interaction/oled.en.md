# OLED Screen

FlexKVM has a 128×64 monochrome OLED display on the front that shows device status, network info, and system version.

After powering on, the OLED cycles through: boot logo → device status screen → auto-sleep (after 60 seconds of inactivity). Press Button A or B to wake. Auto-sleep is disabled in provisioning mode.

## OLED Settings

Go to Settings → System → OLED Display Settings.

![OLED Settings](./images/oled/setting_oled.webp)

### Brightness

Brightness slider (range 1–10), changes take effect instantly.

### Sleep Timeout

Time before auto-sleep after inactivity. Options: 10s / 30s / 60s / 120s / 300s / 600s.

## OLED Display

### Main Screen

![OLED main screen](../../quick_start/images/oled_wifi_connected.webp)

Four lines, three sections:

**Status bar** (first line): 6 icons, left to right —

| Icon | Meaning |
|:----:|---------|
| HDMI | HDMI connected? |
| USB | USB signal normal? |
| TF card | TF card inserted? |
| ATX | ATX module connected? |
| Ethernet | Wired connection status (normal / Direct Mode — two icons) |
| WiFi | WiFi disconnected / connected / hotspot active (three states) |

Icon normal = connected. Icon with X overlaid = not connected.

**IP address** (middle two lines): IP prefix indicates interface type and IP assignment method —

| Display | Interface | IP method |
|---------|:---------:|:---------:|
| **E**xxx.xxx.xxx.xxx | Ethernet | DHCP |
| <strong><u>E</u></strong>xxx.xxx.xxx.xxx | Ethernet | Static IP (inverse) |
| **S**xxx.xxx.xxx.xxx | Ethernet | Direct Mode (DHCP Server) |
| **W**xxx.xxx.xxx.xxx | WiFi | DHCP |
| <strong><u>W</u></strong>xxx.xxx.xxx.xxx | WiFi | Static IP (inverse) |
| **A**xxx.xxx.xxx.xxx | AP hotspot | — |

While acquiring an IP address, the display shows **E Loading...** or **W Loading...**.

> **E** = DHCP, normal display; <strong><u>E</u></strong> = Static IP, inverse display (white on black). Direct Mode shows **S**.

If the IP hasn't been acquired after 10 seconds, check whether your current network supports dynamic IP assignment.

**System version** (bottom line): e.g., `v0.1.2` or `v0.1.3-Beta.1`.

### Info Sub-pages

On the main screen, **short-press Button A** to cycle through 6 sub-pages showing detailed device information. **Short-press Button B** to return to the main screen at any time. The screen automatically resets to the main page after sleep.

> Line 1 of each sub-page displays the page title (e.g. `ETH INFO`, `WiFi INFO`, etc.). Lines 2–4 show the detailed content.

#### ETH Info

Ethernet interface details:

| Line | Content |
|:-----|---------|
| Line 2 | `ETH` + mode label (DHCP / STATIC / DIRECT) |
| Line 3 | IP address (or DISABLE / NOT CONNECT / Loading) |
| Line 4 | MAC address |

Mode labels: DHCP (dynamic), STATIC (manual configuration), DIRECT (DHCP Server mode).

#### WiFi Info

WiFi interface details:

| Line | Content |
|:-----|---------|
| Line 2 | `WiFi` + signal strength (e.g. `WiFi -45`) + mode label |
| Line 3 | IP address (or DISABLE / NOT CONNECT / Loading) |
| Line 4 | MAC address |

#### AP Info

Hotspot configuration:

| Line | Content |
|:-----|---------|
| Line 2 | Band (2.4G / 5G) + WiFi6 indicator |
| Line 3 | SSID (hotspot name) |
| Line 4 | Password |

#### HDMI Info

Video input parameters:

| Line | Content |
|:-----|---------|
| Line 2 | `HDMI` + quality level (LOW / MED / HIGH / ULTRA) |
| Line 3 | Resolution@refresh rate (e.g. `1920x1080@60Hz`, `--x--` when no signal) |
| Line 4 | Link status (LINK / No Signal / NOT LINK) |

#### System Info

Device identification:

| Line | Content |
|:-----|---------|
| Line 2 | Product name |
| Line 3 | Hostname |
| Line 4 | Serial number (SN) |

### Provisioning Screen

![Provisioning screen](../../quick_start/images/oled_provision.webp)

When entering provisioning mode (long-press Button A), the OLED shows the hotspot name, random password, and IP `192.168.10.1`. See [Provisioning Mode](../network/provision.md) for details.

### Factory Reset Screen

![Factory reset screen](../maintenance/images/oled_reset.webp)

After holding the factory reset button for 1 second, the OLED displays a factory reset countdown. Release the button when the countdown reaches 0 to restore factory settings. See [Factory Reset](../maintenance/factory-reset.md).

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
