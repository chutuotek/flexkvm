# OLED Screen

FlexKVM has a 128×64 monochrome OLED display on the front that shows device status, network info, and system version.

After powering on, the OLED cycles through: boot logo → device status screen → auto-sleep (after 60 seconds of inactivity).

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
| Ethernet | Wired connection status |
| WiFi | WiFi disconnected / connected / hotspot active (three states) |

Icon normal = connected. Icon with X overlaid = not connected.

**IP address** (middle two lines): IP prefix indicates interface type —

| Display | Interface |
|---------|:---------:|
| **E**xxx.xxx.xxx.xxx | Ethernet |
| **W**xxx.xxx.xxx.xxx | WiFi |
| **A**xxx.xxx.xxx.xxx | AP hotspot |

While acquiring an IP address, the display shows **E Loading...** (if it takes longer than 10s, check Ethernet cable) or **W Loading...** (if it takes longer than 10s, check WiFi).

**System version** (bottom line): e.g., `v0.1.2` or `v0.1.3-Beta.1`.

### Provisioning Screen

When entering provisioning mode (long-press Button A), the OLED shows the hotspot name, random password, and IP `192.168.10.1`. See [Provisioning Mode](../network/provision.md) for details.

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
