# LED Indicators

FlexKVM has three indicator LEDs showing power, connection, and network status. The 🟢 Status LED and 🔴 Warning LED can be turned off in settings (to reduce light pollution).

## 🔴 Power LED — Power Status

| State | Meaning |
|:-----:|---------|
| Solid on | Powered |
| Off | Not powered |

## 🟢 Status LED — Connection Status

Reflects HDMI and USB connection state:

| State | Frequency | Meaning |
|:-----:|:---------:|---------|
| Solid on | — | Normal, HDMI locked |
| Slow blink | 1 Hz | HDMI signal lost |
| Fast blink | 4 Hz | USB not connected |
| Off | — | System not started |

> Priority: fast blink > slow blink > solid on. When both USB and HDMI are disconnected, the LED shows fast blink.

## 🔴 Warning LED — Network & System Status

| State | Frequency | Meaning |
|:-----:|:---------:|---------|
| Off | — | Network connected, normal |
| Slow blink | 1 Hz | Network disconnected, or in hotspot provisioning mode |
| Fast blink | 4 Hz | OTA upgrade in progress — do not power off |
| Solid on | — | Critical system error — reboot or contact support |

## Combined States

| Pattern | Meaning |
|---------|---------|
| 🟢 Status LED + 🔴 Warning LED **both fast-blinking** | Factory reset in progress |

## Turn Off LEDs

Go to Settings → System → LED Settings.

![LED Settings](./images/led/setting_led.webp)

Turning this setting off turns off all LEDs — useful for nighttime use or reducing light pollution. Does not affect device operation.

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
