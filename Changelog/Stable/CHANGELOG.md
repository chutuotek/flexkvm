# CHANGELOG

- language: en-US
- Author: ZEROK

## v0.1.1(2026-05-16)

- Added: Continuous mouse button reporting while held, simulating real USB mouse behavior
- Added: Mouse relative mode sensitivity adjustment and scroll reversal
- Added: Keyboard shortcuts panel for one-click combo key input
- Added: Virtual keyboard single-key mode auto-release
- Added: Real-time keyboard/mouse enable/disable status sync
- Added: Distinguish HDMI physical disconnect from host sleep
- Added: Auto-stop video encoding when no users online, reducing idle power consumption
- Added: TOTP verification code countdown display
- Added: Show recovery code count after enabling two-factor authentication
- Added: Browser console log capture and export for remote troubleshooting
- Added: LED indicators for network, HDMI, and USB connection status
- Fixed: Remote desktop occasional disconnect or freeze
- Fixed: LED not blinking on boot
- Fixed: Offline OTA upgrade directory creation failure
- Fixed: Keyboard/mouse enable/disable status judgment error
- Fixed: UART terminal and GPIO config occasional anomalies
- Fixed: Log download path error
- Fixed: Audit modal text readability issue
- Fixed: Remote keyboard/mouse operation occasional lag
- Fixed: Multiple memory safety vulnerabilities (UAF, race conditions, overflow)
- Fixed: Login endpoint missing parameter validation
- Fixed: User session lifecycle management defects
- Improved: USB device identified as Logitech mouse by target machine
- Improved: Screenshot/recording filenames use local time format
- Improved: Settings page reorganized for easier navigation
- Improved: OTA upgrade and password change entry more intuitive
- Improved: File transfer stability
- Improved: Time display no longer depends on browser timezone
- Improved: Connection stability (heartbeat mechanism refactored)
- Improved: Build security hardening (stack protector + fortify)

## v0.1.0(2026-04-07)

- Initial public release
