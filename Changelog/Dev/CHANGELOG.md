# CHANGELOG

- language: en-US
- Author: chutuotek

## v0.1.6-Beta (2026-09-09)

### Added

- AI Agent remote control: after generating an API Key under Settings → Agent, AI clients can control keyboard/mouse and take screenshots via Skill (flexkvm-skill) or MCP — supporting OpenClaw / Claude Code / Codex / DSH — with event batches that can be cancelled mid-run
- System status monitor: view temperature, CPU, memory, network rate and uptime in real time under Settings → Status, with history curves by date and CSV export
- Recording switched to WebCodecs: MKV container added (alongside WebM), video codecs auto-detected per browser with hardware/software labels
- EDID modify: override monitor manufacturer, monitor name, serial string and product code without uploading a full EDID
- Screen menu adds "Unplug monitor / Plug monitor" to simulate a monitor disconnect so the host re-detects it
- Custom EDID can now be deleted
- Dual fullscreen modes: toolbar fullscreen (`F11`) and picture fullscreen (`Ctrl+F11`), switchable at any time
- UART terminal can open in a standalone tab (`/terminal`), shows the disconnect reason, and auto-reconnects on transient drops
- HTTPS certificate system upgrade: self-signed mode now generates a CA + leaf certificate, the CA certificate can be downloaded and trusted by browsers, and a deployer-issued user sub-CA can be imported
- File upload can be cancelled, with categorized error messages on failure
- Mouse move throttling: on by default (125 Hz), adjustable from 10–500 Hz, to reduce load from high-report-rate mice
- MTU shown in the Ethernet/Wi-Fi detail panel
- mDNS discovery: reach the web UI and SSH via the `flexkvm-xxxx.local` hostname on the LAN — no need to remember IPs (toggle under Settings → Network → mDNS)
- App update: check, download, and install app updates (e.g. Tailscale) online under Settings → App → App Updates, with automatic rollback on failure
- PWA offline support: cached pages still open without a network connection
- Login sessions auto-renew, reducing frequent re-logins
- Page auto-refreshes after the firmware version changes
- SSH adds mDNS management commands (`mdns status|enable|disable`)

### Improved

- HDMI hotplug detection is now event-driven, with a new "negotiating" state and debounce for unplug/link flapping, giving more accurate connection status
- WebRTC negotiation flipped to browser-offered, H264 parameters negotiated precisely per browser capability, keyframe requests answered, weak-network alerts more responsive
- HDMI reconnect keeps the negotiated H264 profile for faster recovery
- USB keyboard/mouse self-healing upgraded to a three-stage recovery state machine
- Built-in Logitech preset identities for USB keyboard/mouse (K120 keyboard / M100 mouse) for better driver-free compatibility
- Tailscale status shows the DNS name (DNSName)
- Audit log cleanup: high-frequency HDMI/WebRTC entries removed, WiFi/AP start-stop now audited
- Mouse sensitivity, scroll rate, and other preferences persist across page refreshes
- Ethernet Direct mode refuses to enable when its subnet collides with the AP hotspot subnet
- Keyboard/mouse input from the AI Agent and web users is serialized to avoid interleaved commands
- App update: compatibility fallback and firmware gate checks added; versions blocked by the firmware requirement are clearly flagged
- OLED shows a reboot page while the device restarts
- UI details: memory usage shown as percentage, settings dropdowns adapt to content width, more robust recovery from network failures

### Fixed

- Fixed black screen after first HDMI plug-in, after resolution changes, and after stream recovery
- Fixed stale video peer from page refresh polluting the new connection
- Fixed TF transfer status hanging and download status display issues
- Fixed iOS fullscreen issues and long-press magnifier interference
- Fixed a memory safety issue when shutting down the UART
- Multiple security hardenings: TLS 1.2 restricted to AEAD suites, tighter certificate private key permissions, download path validation, CSRF storage isolation, and more

## v0.1.2-Beta.8 (2026-07-11)

- Initial Beta Version