# CHANGELOG

- language: en-US
- Author: ZEROK

## v0.2.0 (2026-10-15)

### Added

- AI Agent remote control: after generating an API Key under Settings → Agent, AI clients can control keyboard/mouse and take screenshots via Skill (flexkvm-skill) or MCP — supporting OpenClaw / Claude Code / Codex / DSH — with keyboard/mouse input serialized against web users
- Agent operation log: view and download a record of AI client remote operations under Settings → Agent, with credential failures also written to the audit log
- WireGuard VPN: generate keys, configure the interface and peers, and export configs under Settings → App → WireGuard, with live connection status
- ZeroTier and frp tunneling: new configuration panels under Settings → App
- Video codec can be switched between H.264 and H.265 (H.265 saves roughly 30% bitrate at the same quality; the browser must support it)
- System status monitor: view temperature, CPU, memory, network rate and uptime in real time under Settings → Status, with history curves by date and CSV export
- Recording adds the MKV container (alongside WebM), an automatic quality preset, and codec labels (hardware)/(software) detected per browser
- TF card supports mounting NTFS partitions for direct read/write; file system check and repair is available for FAT32 / exFAT / ext4 under menu bar → Mirror (Storage Management)
- EDID modify: override monitor manufacturer, monitor name, serial string and product code, with one-click clearing, without uploading a full EDID; custom EDIDs can also be deleted
- Screen menu adds "Unplug monitor / Plug monitor" to simulate a monitor disconnect so the host re-detects it
- Dual fullscreen modes: toolbar fullscreen (`F11`) and picture fullscreen (`Ctrl+F11`)
- Out-of-range signal is reported separately with actionable advice
- UART terminal can open in a standalone tab (`/terminal`), shows the disconnect reason, and auto-reconnects on transient drops
- HTTPS certificate system upgrade: self-signed mode now generates a CA + leaf certificate, the CA certificate can be downloaded and trusted by browsers, and a deployer-issued user sub-CA can be imported
- File upload and download can both be cancelled, with categorized error messages on failure
- Mouse move throttling: on by default (125 Hz), adjustable from 10–500 Hz
- Built-in Logitech preset identities for USB keyboard/mouse (K120 keyboard / M100 mouse) for better driver-free compatibility
- Keyboard/mouse channel drops are indicated in the menu bar, with status and automatic recovery
- Admin-only control over picture settings: quality, codec, GOP and EDID controls are greyed out for non-admin users
- mDNS discovery: reach the web UI and SSH via the `flexkvm-xxxx.local` hostname on the LAN (toggle under Settings → Network → mDNS)
- App management: check, download, and install app updates (e.g. Tailscale) online under Settings → App, with GitHub / Gitee as download sources (Gitee by default), uninstall support, automatic rollback on failure, and firmware gate checks
- PWA offline support: cached pages still open without a network connection
- WiFi supports OWE encryption
- MTU shown in the Ethernet/Wi-Fi detail panel
- Login sessions auto-renew, reducing frequent re-logins
- Page auto-refreshes after the firmware version changes
- OLED shows a reboot page while the device restarts
- SSH adds mDNS management commands (`mdns status|enable|disable`)

### Improved

- HDMI plug/unplug and signal changes are detected faster, with a new "negotiating" state for more accurate connection status
- Remote display connects and reconnects faster, negotiates the best codec parameters per browser capability, and warns about weak networks sooner; the main channel probes and reconnects after long silence
- USB keyboard/mouse reconnects recover more reliably
- Tailscale status shows the DNS name, the panel refreshes sooner, and connection details move into a dialog
- Audit log cleanup: high-frequency HDMI/WebRTC entries removed, WiFi/AP start-stop now audited
- Mouse sensitivity, scroll rate, and other preferences persist across page refreshes
- Ethernet Direct mode refuses to enable when its subnet collides with the AP hotspot subnet
- Wake-on-LAN targets adapt to the local subnet broadcast for a higher success rate
- Firmware online upgrade keeps all three download sources — GitHub / Gitee / GitCode — with GitCode as the new default
- UI details: memory usage shown as percentage, settings dropdowns adapt to content width, more robust recovery from network failures, faster first load
- Settings reorganized: four new tabs — Status, Agent, Capture and Security; screenshot/recording moved under Capture, HTTPS/SSH under Security, and mDNS under Network
- Settings pages have shareable URLs and survive refresh and back/forward navigation; unknown paths show a localized 404 page
- Switching between settings pages no longer interrupts the remote display or keyboard/mouse connection

### Removed

- Built-in offline documentation (the former `/docs/`) has been removed; documentation now lives on the online documentation site, and the documentation entries on the About, login and provisioning pages point there
- The About page no longer shows the model; it now shows the product name and hostname

### Fixed

- Fixed black screen after first HDMI plug-in, after resolution changes, and after stream recovery
- Fixed stale video peer from page refresh polluting the new connection
- Fixed the UI still showing "connected" when the video link had stalled
- Fixed corrupt custom EDID data causing repeated reboots and a device that would not start
- Fixed USB keyboard/mouse and storage hanging together during early boot
- Fixed the device becoming unresponsive after a forced (preempting) login
- Fixed accounts getting wrongly locked after repeated sign-in attempts
- Fixed WiFi scan getting permanently stuck at "scanning"
- Fixed failure to connect to some WiFi networks
- Fixed an invalid static IP netmask corrupting the configuration and falling back to DHCP after reboot
- Fixed network settings reporting "saved" even when they failed
- Fixed TF card mount state drifting from reality, with the UI stuck on "mounted"
- Fixed TF transfer status hanging, download status display issues, and false delete failures with a stale list
- Fixed upload cancellation not working and failures reported twice
- Fixed the UART session failing silently on a device read error
- Fixed microphone capture not stopping after disconnect, leaving the indicator on
- Fixed web recording not restarting after a failed start
- Fixed iOS fullscreen issues and long-press magnifier interference
- Fixed some shortcut editor labels still showing Chinese in the English interface
- Fixed the Wake-on-LAN device list being hard-capped at 5 entries with no feedback when adding or removing failed
- Fixed USB keyboard/mouse detection issues and jumpy cursors on some hosts
- Fixed factory reset restarting even when cleanup failed
- Multiple security hardenings: old sessions invalidated immediately after a password change, TLS 1.2 restricted to AEAD suites, tighter certificate private key permissions, download path validation, CSRF storage isolation, and more

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
