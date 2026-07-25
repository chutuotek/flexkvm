# CHANGELOG

- language: en-US
- Author: ZEROK

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
