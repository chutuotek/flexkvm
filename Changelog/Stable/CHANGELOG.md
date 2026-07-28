# CHANGELOG

- language: en-US
- Author: ZEROK

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
