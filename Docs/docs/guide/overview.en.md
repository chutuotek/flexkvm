# UI Overview

After logging in you land on the **main interface**: the menu bar on top, the remote display in the middle, and the floating layer each menu bar icon opens is a **menu**. This page covers all 12 menu bar buttons and all 12 settings tabs in one pass, so the feature pages that follow are easy to place.

![Main interface](../images/flexkvm_desktop.webp)

> Before you start, make sure the wiring and network setup in [Quick Start](../quick_start/index.md) are done.

---

## Menu Bar

Twelve buttons from left to right. Click one to open its **menu**:

| Button | What it does | Details |
|:---:|------|------|
| **Screenshot** | Save the current remote display as an image | [Screenshot](remote/screenshot.md) |
| **Recording** | Record the remote display to a video file | [Recording](remote/recording.md) |
| **Audio** | Toggle sound card, mic input, speaker output | [Audio](remote/audio.md) |
| **Video** | Resolution, quality, GOP, codec, EDID, fullscreen, reconnect | [Remote Display](remote/screen.md) |
| **Keyboard** | Text input, shortcuts, virtual keyboard, paste text | [Keyboard](remote/keyboard.md) |
| **Mouse** | Absolute / relative mode, sensitivity, scroll reverse | [Mouse](remote/mouse.md) |
| **Mirror** | Mount and share TF card partitions; the target sees a virtual USB drive or virtual CD-ROM | [Storage Management](peripherals/disk.md) |
| **Interface** | ATX power control (power on / off / reset) and target status LEDs | [ATX Power Control](peripherals/atx.md) |
| **Wake on LAN** | Send a magic packet to wake a powered-off target | [Wake-on-LAN (WoL)](network/wol.md) |
| **IO** | Two GPIO channels and one UART serial port; expands into GPIO and UART sections | [GPIO Control](peripherals/gpio.md) · [UART Serial Terminal](peripherals/uart.md) |
| **Settings** | Open the settings panel (12 tabs, see below) | Next section |
| **Fullscreen** | Expand the remote display to the whole browser window | [Remote Display](remote/screen.md) |

> Menu bar names do not map one-to-one onto page names: **Mirror** is documented under "Storage Management", **Interface** under "ATX Power Control", and **IO** covers both "GPIO Control" and "UART Serial Terminal".

## Operation Feedback

Results appear as a toast at the top of the page, for example:

| Toast | Triggered by |
|------|------|
| Screenshot saved | Clicking **Screenshot** |
| Recording started / Recording saved | Starting and stopping **Recording** |
| Screenshot failed | The remote display is not connected |

## Settings Panel

Click **Settings** in the menu bar to open the settings panel. Twelve tabs on the left:

| Tab | What it covers | Details |
|:---:|--------|------|
| **About** | Model, system version, serial number, community and doc links | [About Device](system/about.md) |
| **Status** | Temperature / CPU / memory / network rate curves, history and CSV export | [Status Monitor](system/status.md) |
| **Network** | mDNS, wired network, AP network, WiFi network | [Provisioning Mode](network/provision.md) · [Wired Network](network/eth.md) · [Direct Mode](network/eth-server.md) · [WiFi](network/wifi.md) · [AP Hotspot](network/ap.md) · [mDNS](network/mdns.md) |
| **Appearance** | Language, theme (Light / Dark / Auto), accent color | [Appearance](system/appearance.md) |
| **App** | Updates for installed apps (e.g. Tailscale) and download source | [Tailscale](network/tailscale.md) · [App Update](maintenance/upgrade-app.md) |
| **Agent** | Enable Agent, generate and revoke the API Key for AI clients | [AI Agent Control](remote/agent.md) |
| **System** | Time, OLED settings, LED settings, EDID, USB config | [Time & Date](system/time.md) · [OLED Screen](interaction/oled.md) · [LED Indicator](interaction/led.md) · [USB Configuration](system/usb.md) |
| **Capture** | Screenshot format and quality, recording parameters | [Screenshot](remote/screenshot.md) · [Recording](remote/recording.md) |
| **Security** | HTTPS certificate, SSH | [HTTPS Certificate](security/https.md) · [SSH Remote Access](security/ssh.md) |
| **Upgrade** | Offline upgrade, online upgrade (download source, check for updates) | [Online Upgrade](maintenance/upgrade-online.md) · [Offline Upgrade](maintenance/upgrade-offline.md) |
| **Maintenance** | Audit, system log, Web log, reboot, restore factory mode | [Audit Logs](security/audit.md) · [System Logs](maintenance/log.md) · [Reboot](maintenance/reboot.md) · [Factory Reset](maintenance/factory-reset.md) |
| **Account** | Username, change password, 2FA verification, logout | [Account Security](security/account/account.md) · [Login Management](security/account/login.md) |

> The settings panel shares the page with the remote display — switching tabs does not tear down the video stream, keyboard/mouse, or the main WebSocket, so you can watch the screen while changing settings. A few settings (changing the MAC address, switching to a static IP) briefly drop the network; see the relevant pages.

---

## Next Steps

- Learn by scenario → [Scenarios](scenarios/index.md)
- Look up a feature → [User Guide](index.md)
- Troubleshooting → [Help & Diagnostics](../support/index.md)
