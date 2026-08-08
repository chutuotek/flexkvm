# CHANGELOG

- language: en-US
- Author: ZEROK

## v0.1.5 (2026-08-08)

### Added

- OLED main screen adds ETH/WiFi IPv6 info sub-pages (7 sub-pages total)
- OLED sub-page order adjusted: HDMI and System Info moved to the front (pages 2/3)
- Touchscreen gestures: single-finger tap/double-tap, long-press right-click, two-finger scroll, long-press drag
- Tailscale Authkey login and headscale self-hosted server support
- Multi-device login preemption prompt and kicked-out notification
- IPv6 address display in Ethernet/WiFi detail panels
- Logout immediately invalidates other logged-in sessions
- TF menu icon reflects file upload/download transfer state in real time
- Up to 5 NTP time sources can be configured
- On entering provisioning mode or after a successful login, if the client time and FlexKVM time differ by more than 60 seconds, you will be asked whether to sync the time

### Improved

- Better remote display compatibility and quality in browsers like Firefox
- Auto-reconnect after network drop or device reboot
- Provisioning mode switched to HTTP to avoid self-signed certificate warnings
- Provisioning hotspot password changed to 8 random digits for easier entry

### Fixed

- 2FA binding must be completed within 10 minutes of generation, otherwise regenerate
- Fixed multiple stability and security issues
- Fixed Ethernet status always showing as connected on the web interface

## v0.1.4 (2026-07-28)

### New

- OLED home screen: short-press Button A to cycle through 6 info sub-pages (ETH, WiFi, AP, HDMI, System), short-press Button B to return
- OLED now distinguishes DHCP vs Static IP with inverse text display
- OLED System Info sub-page shows product name, hostname, and serial number
- OLED HDMI sub-page shows resolution, refresh rate, quality, and link status
- Web static IP form auto-fills with current configuration

### Improvements

- Button A/B long-press responds faster, now triggers at 1 second
- AP hotspot settings apply immediately after saving, no manual restart needed
- OLED auto-resets sub-page state on sleep, returns to home screen on wake
- OLED page icons and network status indicators are clearer and more consistent

### Fixes

- Fixed AP hotspot settings not applying until service restart
- Fixed stale WiFi configuration left behind after failed connections

## v0.1.3 (2026-07-25)

### New Features

- Added Ethernet Direct mode (DHCP Server) for direct PC-to-device connection
  - New Direct mode configuration page in web interface
  - Direct mode status icon on OLED home screen
  - Physical B button supports three-stage long-press to switch network modes

### Bug Fixes

- Fixed HDMI video capture stability issues in various scenarios
  - Cold boot video signal detection is now more reliable, no need to replug HDMI cable
  - No more frozen or corrupted display during resolution switching (e.g., BIOS to desktop)
  - Faster signal recovery during GPU reset, reducing black screen wait time
  - More responsive hotplug detection, faster display recovery after plug/unplug
- Fixed HDMI driver memory safety issues for improved long-term stability
- Fixed HDMI driver security vulnerability (CVE-2024-35830)
- Fixed video issues caused by HDMI resolution changes
- Fixed LED warning light flickering due to shared phase with system light
- Fixed ATX HDD LED status not reporting to web interface
- Fixed OTA changelog channel selection and URL format issues

### Improvements

- Refactored dnsmasq to PID-based management for more reliable network service control
- Updated documentation

## v0.1.2 (2026-07-17)

- Initial public release
