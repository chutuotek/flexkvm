# User Guide

Welcome to the FlexKVM User Guide. Know what you want to do? Pick your entry point below. Not sure where to look? Use the **search bar** at the top — type a keyword and you'll find what you need.

> Before diving in, make sure you've completed the [Quick Start](../quick_start/index.md) — device wiring and network configuration should already be set up.

---

## Product Overview

Specs, interfaces, and accessory information.

<div class="grid cards" markdown>

- **:material-package-variant-closed: Package Contents**

    What's in the box

    [:octicons-arrow-right-24: View](product/packet.md)

- **:material-connection: Interface Reference**

    Port specs and LED indicator states

    [:octicons-arrow-right-24: View](product/interface.md)

- **:material-thermometer: Specifications**

    Power, consumption, dimensions, and environmental specs

    [:octicons-arrow-right-24: View](product/characteristics.md)

- **:material-puzzle: Accessories & Expansion**

    Magnetic backplate / DIN rail clip / PoE splitter / DIY backplate

    [:octicons-arrow-right-24: View](product/extensibility.md)

</div>

## Scenarios

Task-oriented guides. Pick what you're trying to do — each one walks you through it from start to finish.

<div class="grid cards" markdown>

- **:material-wifi-arrow-left-right: Remote Access**

    Device at home, you're at work? Hotspot direct + Tailscale VPN — no public IP needed.

    [:octicons-arrow-right-24: Configure](scenarios/remote-access.md)

- **:material-power: Remote Power Control**

    ATX physical power control + WoL network wake — power on/off/reboot from anywhere.

    [:octicons-arrow-right-24: Wire it up](scenarios/power-control.md)

- **:material-disc: Remote OS Install**

    Full workflow: prepare ISO → boot from BIOS → install OS — all remote.

    [:octicons-arrow-right-24: Start installing](scenarios/reinstall-os.md)

- **:material-folder-move: File Transfer**

    TF card as remote USB drive or virtual CD-ROM — transfer drivers, scripts, logs, ISO images.

    [:octicons-arrow-right-24: View methods](scenarios/file-transfer.md)

- **:material-shield-lock: Security Hardening**

    2FA, HTTPS certificates, SSH hardening, audit logs — prioritized checklist.

    [:octicons-arrow-right-24: Harden security](scenarios/security.md)

- **:material-tools: Daily Operations**

    Firmware upgrades, audit log export, reboot & reset — with monthly checklist.

    [:octicons-arrow-right-24: Ops guide](scenarios/daily-ops.md)

</div>

Not sure where to start? Check the [Scenarios home](scenarios/index.md) for recommended reading paths.

---

## Features

Look up features by category. Each page covers the full set of operations and settings.

### Device Interaction

The OLED screen, LED indicators, and physical buttons on the device itself.

<div class="grid cards" markdown>

- **:material-monitor-screenshot: OLED Screen**

    Display content, status reference, brightness and sleep settings

    [:octicons-arrow-right-24: View](interaction/oled.md)

- **:material-led-on: LED Indicator**

    Status / Warning / Power LED colors and meanings — quick reference

    [:octicons-arrow-right-24: View](interaction/led.md)

- **:material-gesture: Physical Buttons**

    Button A / B / Reset / Factory reset operation guide

    [:octicons-arrow-right-24: View](interaction/button.md)

</div>

### Network

How to get FlexKVM online and access it remotely.

<div class="grid cards" markdown>

- **:material-lan: Ethernet**

    DHCP / Static IP, gateway and DNS settings

    [:octicons-arrow-right-24: View](network/eth.md)

- **:material-server-network: Ethernet Direct Mode**

    Direct cable to computer — device acts as DHCP server, no router needed

    [:octicons-arrow-right-24: View](network/eth-server.md)

- **:material-wifi: WiFi**

    Wireless network connection and management

    [:octicons-arrow-right-24: View](network/wifi.md)

- **:material-access-point: AP Mode**

    Use FlexKVM as a WiFi hotspot for direct connections

    [:octicons-arrow-right-24: View](network/ap.md)

- **:material-vpn: Tailscale VPN**

    No public IP needed — end-to-end encrypted remote access

    [:octicons-arrow-right-24: View](network/tailscale.md)

- **:material-power-standby: Wake-on-LAN (WoL)**

    Remotely wake powered-off devices via magic packet

    [:octicons-arrow-right-24: View](network/wol.md)

</div>

### Remote Interaction

View the target host's display, control keyboard and mouse, stream audio.

<div class="grid cards" markdown>

- **:material-monitor: Remote Display**

    Connect a session, switch resolution & quality, EDID, fullscreen

    [:octicons-arrow-right-24: View](remote/screen.md)

- **:material-camera: Screenshot**

    Capture the current screen — PNG / JPG supported

    [:octicons-arrow-right-24: View](remote/screenshot.md)

- **:material-video: Recording**

    Record the remote display to video with adjustable parameters

    [:octicons-arrow-right-24: View](remote/recording.md)

- **:material-keyboard: Keyboard**

    Text input, shortcut keys, virtual keyboard, paste text

    [:octicons-arrow-right-24: View](remote/keyboard.md)

- **:material-mouse: Mouse**

    Absolute/relative mode, sensitivity, scroll direction

    [:octicons-arrow-right-24: View](remote/mouse.md)

- **:material-headset: Audio**

    Microphone and speaker control, bidirectional audio streaming

    [:octicons-arrow-right-24: View](remote/audio.md)

</div>

### Peripherals & Expansion

TF card storage, ATX power control, UART serial, and GPIO — physical expansion capabilities.

<div class="grid cards" markdown>

- **:material-sd: Storage Management**

    TF card specs, partition mounting, USB sharing, file transfer & remote OS install

    [:octicons-arrow-right-24: View](peripherals/disk.md)

- **:material-power: ATX Power Control**

    Hardware wiring, normal shutdown, force restart, force power-off

    [:octicons-arrow-right-24: View](peripherals/atx.md)

- **:material-console-line: UART Serial Terminal**

    Serial communication settings, command-line interaction with target host

    [:octicons-arrow-right-24: View](peripherals/uart.md)

- **:material-chip: GPIO Control**

    Pin input detection and output control; connect sensors and other peripherals

    [:octicons-arrow-right-24: View](peripherals/gpio.md)

</div>

### Security

Access control and communication encryption to protect your device.

<div class="grid cards" markdown>

- **:material-account-cog: Account Management**

    Login flow, password change, two-factor authentication (2FA), backup codes

    [:octicons-arrow-right-24: View](security/account/login.md)

- **:material-console: SSH Remote Access**

    Out-of-band management via SSH command line

    [:octicons-arrow-right-24: View](security/ssh.md)

- **:material-lock: HTTPS Certificate**

    Self-signed / custom certificates, encrypt the web management interface

    [:octicons-arrow-right-24: View](security/https.md)

- **:material-text-box-search: Audit Logs**

    System and user operation event records for reviewing activity history

    [:octicons-arrow-right-24: View](security/audit.md)

</div>

### System Settings

Device-level parameter adjustments, corresponding to the Settings panel (gear icon) in the web interface.

<div class="grid cards" markdown>

- **:material-information: About Device**

    Device info, firmware version, community resources

    [:octicons-arrow-right-24: View](system/about.md)

- **:material-palette: Appearance**

    UI theme, language, accent color

    [:octicons-arrow-right-24: View](system/appearance.md)

- **:material-clock: Time & Date**

    Timezone settings, NTP auto-sync

    [:octicons-arrow-right-24: View](system/time.md)

- **:material-usb: USB Configuration**

    Emulate USB keyboard/mouse/storage, customize device type

    [:octicons-arrow-right-24: View](system/usb.md)

- **:material-bluetooth: Bluetooth**

    Bluetooth functionality (under development)

    [:octicons-arrow-right-24: View](system/bluetooth.md)

</div>

### System Maintenance

Firmware upgrades, reboot, factory reset, and other system-level operations.

<div class="grid cards" markdown>

- **:material-cloud-download: Firmware Upgrade**

    Online / offline upgrade — choose your update method

    [:octicons-arrow-right-24: View](maintenance/upgrade-online.md)

- **:material-restart: Reboot**

    Software reboot and hardware reset button

    [:octicons-arrow-right-24: View](maintenance/reboot.md)

- **:material-factory: Factory Reset**

    Software reset and hardware factory reset button — clears all data

    [:octicons-arrow-right-24: View](maintenance/factory-reset.md)

- **:material-usb-flash-drive: Flash Firmware**

    Recover a bricked device via USB flashing

    [:octicons-arrow-right-24: View](maintenance/flash.md)

- **:material-text-box: System Logs**

    System logs for troubleshooting anomalies

    [:octicons-arrow-right-24: View](maintenance/log.md)

</div>

---

[:octicons-bug-24: Feedback & Suggestions](../community/feedback/index.md){ .md-button } [:octicons-home-24: Back to Home](../index.md){ .md-button } [:octicons-rocket-24: Quick Start](../quick_start/index.md){ .md-button }
