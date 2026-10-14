# Troubleshooting

> Step-by-step diagnosis usually pinpoints the issue quickly. If none of the steps below resolve the problem, collect diagnostic information and [submit feedback](../../community/feedback/index.md) — the dev team will help.

Search for symptom keywords in the **search bar** at the top of the page first (e.g., "can't connect", "video lag", "upgrade failed").

---

## Cannot Access Device

### Web page won't load

| Step | Action |
|------|--------|
| 1. Check IP address | Verify the IP on the OLED display, and type `https://IP` in the browser |
| 2. Test connectivity | Run `ping <device-IP>` from your control device |
| 3. Check network | Make sure both devices are on the same local network (same router) |
| 4. Try incognito mode | Open in a private/incognito window to rule out cache or HSTS interference |
| 5. Check device status | Does the OLED display normally? Is the red power LED solid on? |

> If none of the above works, the network configuration may be wrong. Press and hold **Button A** for 1~3 seconds to enter [Provisioning Mode](../../guide/network/provision.md) and reconfigure the network.

### WiFi connected but no IP address

| Possible cause | Solution |
|---------------|----------|
| DHCP not responding | Try using a [static IP](../../guide/network/wifi.md#ipv4-configuration) |
| Weak signal | Move closer to the router or use 5GHz |
| MAC address filter | Check if the router has MAC filtering enabled |
| Wrong password | Re-enter the password, check for uppercase/lowercase and special characters |

### Wired network gets no IP

| Step | Action |
|------|--------|
| 1. Check the port LED | Off → check both ends of the cable, try another cable |
| 2. Check for blinking | Lit but not blinking → try another router port |
| 3. Watch for `Loading` | OLED shows `E Loading...` for more than 20 seconds → confirm the router's DHCP is on and its address pool isn't exhausted |
| 4. Still no IP | Switch to [Provisioning Mode](../../guide/network/provision.md), or assign a [static IP](../../guide/network/eth.md#network-configuration) |

### Direct Mode gets no IP

| Symptom | Possible cause | Solution |
|---------|----------------|----------|
| Laptop gets no IP | Cable not seated, or the laptop's Ethernet port isn't set to DHCP | Check the cable and the laptop's network settings |
| IP isn't in 192.168.x.x | Laptop is still connected to another network | Turn off the laptop's WiFi, keep only Ethernet |
| Ping works but the page won't open | Browser cache or proxy | Clear cache, disable the proxy, use an incognito window |
| Can't connect after changing the subnet | Laptop still holds the old IP | Disable and re-enable Ethernet, or run `ipconfig /release && /renew` |
| Subnet number can't be saved | Conflicts with the AP hotspot subnet | Pick another subnet (the two can't both be `192.168.x.1`) |

> Full configuration and troubleshooting → [Direct Mode](../../guide/network/eth-server.md)

### AP hotspot not found or won't connect

| Symptom | Possible cause | Solution |
|---------|----------------|----------|
| Hotspot not found | WiFi is still on (they share the wireless module) | Turn WiFi off before enabling the hotspot, or switch with Button B |
| Client can't connect | Wrong password, or SSID contains special characters | Verify the password, simplify the SSID |
| Connected but the admin page won't open | Abnormal client IP | Make sure the client uses DHCP (the hotspot assigns addresses automatically) |
| Slow speed | WiFi and the hotspot are on at the same time | Turn WiFi off |
| Not enough client slots | Maximum connections set too low | Increase it in the AP configuration |

> Configuration options and measured wait times → [AP Hotspot](../../guide/network/ap.md)

### mDNS hostname won't open

| Step | Action |
|------|--------|
| 1. Same local network | The control device and FlexKVM must be on the same router (or the direct hotspot) |
| 2. Windows support | Install Apple Bonjour to resolve `.local` (macOS/iOS/Linux/Android support it natively) |
| 3. Proxy interference | Disable VPN/proxy, or set `*.local` to bypass it |
| 4. Cross-subnet | `.local` can't resolve across subnets — use the IP or Tailscale instead |

> How to view the hostname and toggle the service → [mDNS Discovery](../../guide/network/mdns.md)

### Tailscale remote connection failed

| Possible cause | Solution |
|---------------|----------|
| Client device doesn't have Tailscale | Install Tailscale on the control device and log into the same account |
| Device not logged in to Tailscale | Check Tailscale login status under Settings → App |
| Tailscale service not enabled | Ensure the Tailscale toggle is on |
| Toggle greyed out and unavailable | Tailscale isn't correctly preinstalled — contact support |
| Message says the device is already registered | The device is in another Tailnet — remove the old device in the admin console first |

> Login methods and connection info → [Tailscale](../../guide/network/tailscale.md)

---

## Remote Display Issues

### Black screen or "Not Connected"

| Step | Action |
|------|--------|
| 1. Check HDMI cable | Make sure it's firmly connected at both ends — at the target host and at FlexKVM |
| 2. Check target host | Is it powered on and not in sleep mode? |
| 3. Check green status LED | **Solid on** = HDMI OK, **Slow blink** = not connected |
| 4. Try reconnecting | Click "Reconnect" in the display menu |
| 5. Try a different EDID | Switch to a fixed-resolution EDID preset to rule out an EDID negotiation problem |

> Seeing "Negotiating signal…" is a normal transition (HDMI just plugged in, or resolution switching) and recovers automatically. If the resolution or refresh rate isn't supported, the display shows a notice — lower it on the target host. Full details → [Remote Display](../../guide/remote/screen.md)

### Laggy or delayed video

| Possible cause | Solution |
|---------------|----------|
| Insufficient bandwidth | **Lower the video quality** in the display menu |
| Using 2.4GHz WiFi | Switch to 5GHz or wired Ethernet |
| Stream frozen | Click "Reconnect" |
| GOP too high | Set GOP to 1 (default) in the display menu |

> Quality levels and estimated bandwidth → [Remote Display](../../guide/remote/screen.md#quality)

### Distorted image

| Possible cause | Solution |
|---------------|----------|
| EDID mismatch | Try switching EDID presets |
| Video stream error | Click "Reconnect" in the display menu |
| Loose HDMI cable | Re-seat the HDMI cable at both ends |

> Custom EDID and EDID modification → [Remote Display](../../guide/remote/screen.md#edid-configuration)

### Screenshot or recording issues

| Symptom | Possible cause | Solution |
|---------|----------------|----------|
| Screenshot fails | Remote display not connected | Confirm the video stream is running, then take the screenshot |
| Recorded video has no sound | Muted recording enabled / target host has no audio output | Turn off muted recording, check the target host's audio |
| Recording won't play | Codec compatibility | Switch to MKV (H.264) |
| Recording stutters, high CPU | Software encoder in use | Choose an encoder marked (hardware), or lower the video quality |

> Full parameters and descriptions → [Screenshot](../../guide/remote/screenshot.md) · [Recording](../../guide/remote/recording.md)

---

## Keyboard & Mouse Issues

### Keys not working or wrong input

| Possible cause | Solution |
|---------------|----------|
| Wrong target OS setting | In keyboard settings, verify the **target OS** (Windows/Linux/macOS) |
| Focus not on remote screen | Click on the remote display area to get focus |
| ESC intercepted in fullscreen | Exit fullscreen first, or use the mapped ESC key (default: Right Ctrl) |
| Paste does nothing (text contains non-ASCII) | Paste only supports ASCII characters (letters, digits, symbols) — see [Keyboard](../../guide/remote/keyboard.md#paste-text) |

> Shortcuts, virtual keyboard, ESC mapping → [Keyboard](../../guide/remote/keyboard.md)

### Mouse not working properly

| Possible cause | Solution |
|---------------|----------|
| Wrong mode | Try switching between **absolute/relative** mode in mouse settings |
| Can't click in black bars | Black bars sit outside the video area — try fullscreen |
| Sensitivity wrong | Adjust sensitivity in mouse settings |
| Cursor won't come out in relative mode | Press `Esc` to exit control |

> Mode differences, throttling and sensitivity → [Mouse](../../guide/remote/mouse.md)

### High input latency

Same causes as video lag. Try lowering video quality, using wired Ethernet, or 5GHz WiFi.

---

## Audio Issues

### Microphone not working

1. Check browser microphone permission (click the lock icon in the address bar)
2. Make sure both the audio master switch and microphone switch are on
3. Verify your computer's microphone is working
4. Confirm the target host's recording device is set to **FlexKVM Audio**

### Speaker not working

1. Make sure both the audio master switch and speaker switch are on
2. Confirm the target host's playback device is set to **FlexKVM Audio**
3. Check if the target host has audio output

### Audio noise or delay

This is normal for network transmission. Try improving your network environment.

> Two-way audio switches and device selection → [Audio](../../guide/remote/audio.md)

---

## ATX Power Control Issues

### Clicking power does nothing

1. Open the **Peripherals** menu and confirm the switch in the panel is **enabled** (the device name doesn't show `atx` when disabled)
2. Check that the Dupont wires are firmly connected and the motherboard pin positions are correct
3. Verify the ATX controller's power LED is on

### Device turns on immediately after shutdown

Some motherboards have "Restore on AC Power Loss" enabled in BIOS. Enter BIOS and disable this option.

### ATX controller not recognized

Re-plug the ATX controller's USB Type-C data cable, and check that the ATX icon appears on the OLED. If still not recognized, try a different USB data cable (charge-only cables won't work).

> Full wiring (controller ↔ case panel ↔ motherboard) and enabling steps → [ATX Power Control](../../guide/peripherals/atx.md)

---

## Storage Issues

### TF card not detected

Check if the file system is supported. FAT32 / exFAT / ext4 are supported, and exFAT has the best compatibility; convert NTFS cards to exFAT first. Make sure the card is fully inserted (click sound).

### Virtual CD-ROM not detected by target host

Make sure the file is in `.img` or `.iso` format. Other formats cannot be mounted as a virtual drive.

### Upload interrupted midway

Refresh the page and re-upload. Resume is not currently supported.

### System installation failed midway

Check whether you toggled mouse, keyboard, or audio during installation — these actions cause the virtual CD-ROM to briefly disconnect.

> Partition sharing and single-file sharing use different operation orders. Before installing an OS, confirm you mounted/shared the image following the steps in [Storage Management](../../guide/peripherals/disk.md).

### Upload can't be canceled, or reports failure

Canceling and failing are two different outcomes with different messages: cancel is a manual abort, while failure reports a cause. After a failed upload, refresh and re-upload (resume is not supported).

---

## Upgrade Issues

### Online upgrade fails

| Possible cause | Solution |
|---------------|----------|
| Unstable network | Switch download source (default GitCode, or Gitee/GitHub), or use offline upgrade instead |
| Power instability | A power loss during upgrade can brick the device — use a dedicated power adapter |
| Firmware checksum error | Re-download the package and try again |

### Offline upgrade fails

Make sure the uploaded firmware file is complete and not corrupted. If the device fails to boot after a power loss during upgrade, see [Flash Firmware](../../guide/maintenance/flash.md) to recover.

> You must enter your password to confirm before upgrading (plus a verification code if 2FA is on). Full procedure → [Online Upgrade](../../guide/maintenance/upgrade-online.md) · [Offline Upgrade](../../guide/maintenance/upgrade-offline.md)

### App update fails

| Symptom | Possible cause | Solution |
|---------|----------------|----------|
| Check for updates fails | No network, or the download source is unavailable | Switch download source and retry |
| Download fails | Unstable network | Switch download source and re-download |
| Verification fails | Corrupted download | Download again |
| App incompatible | Firmware version too old | Upgrade the firmware first under Settings → Upgrade |

> App updates only support the Gitee / GitHub sources, don't require a reboot, and roll back automatically on failure → [App Update](../../guide/maintenance/upgrade-app.md)

---

## Account & Login Issues

### Can't log in, or wrong password

| Symptom | Possible cause | Solution |
|---------|----------------|----------|
| Wrong username or password | Case, or stray spaces | Re-enter; make sure there are no leading/trailing spaces |
| 2FA codes always rejected | Device clock is off | Calibrate the device time when prompted, or use an 8-digit backup code |
| Message says "a user is already logged in" | An existing session is online | Confirm to preempt it (the other user is kicked off); it auto-cancels after 30 seconds of inactivity |
| Message says "you have been kicked out" | Preempted by another session | Log in again |
| Forgot the password | It can't be recovered | [Factory reset](../../guide/maintenance/factory-reset.md) and create the account again |

> Login flow, 2FA and multi-device preemption → [Login Management](../../guide/security/account/login.md)

---

## SSH Connection Issues

| Symptom | Possible cause | Solution |
|---------|----------------|----------|
| `Connection refused` | SSH service not enabled | Turn on the switch under Settings → Security → SSH |
| `Connection timed out` | Wrong IP, or the network is unreachable | Check the IP shown on the OLED and ping it first |
| `Permission denied` | Wrong username or password | Use the same account and password as the web interface, mind the case |
| Disconnects right after login | Another SSH session is already open | Close the other session or wait for it to time out |
| Kicked out after wrong password | More than 3 failed attempts | Reconnect — the counter resets |

> Available commands, `reset` double confirmation and terminal shortcuts → [SSH Remote Access](../../guide/security/ssh.md)

---

## UART & GPIO Issues

| Symptom | Possible cause | Solution |
|---------|----------------|----------|
| Garbled serial output | Communication parameters don't match the target host | Verify baud rate / data bits / parity / stop bits |
| Serial won't connect | TXD/RXD not crossed, or no common ground | Connect device TXD to target RXD, RXD to TXD, and GND to GND |
| Serial port reports "in use by another window" | A serial port can only be used by one window | Click Disconnect in the window that holds it |
| GPIO output has no voltage | Pin not enabled, or still in input mode | Enable the pin, then switch it to output mode |
| GPIO reads the wrong level | No common ground with the target device | Connect GND for a common ground |
| No UI change after wiring GPIO | The pin is disabled | The pin only starts listening after you turn its switch on |

> Wiring and parameter descriptions → [UART Serial Terminal](../../guide/peripherals/uart.md) · [GPIO Control](../../guide/peripherals/gpio.md)

---

## HTTPS Certificate Issues

| Symptom | Possible cause | Solution |
|---------|----------------|----------|
| Save reports a mismatch | The private key and certificate aren't a pair | Make sure the key matches this certificate |
| Still warns after saving | Still using the self-signed certificate | Manually switch to `custom` in the certificate mode dropdown |
| Still warns after importing the CA | The certificate isn't in the trust store | Import it into the system/browser "Trusted Root Certification Authorities" and restart the browser |
| User sub-CA still warns | The client doesn't trust the deployer root CA | Trust the deployer root CA on the client first |
| Reports a format error | Not PEM format | Convert to PEM with OpenSSL (`.pfx` and `.jks` can't be pasted directly) |
| Uploading an old certificate fails | Weak signature algorithm, or expired | Use SHA-256 or above, and a certificate within its validity period |

> Three certificate modes and import methods per platform → [HTTPS Certificate](../../guide/security/https.md)

---

## AI Agent Issues

### Agent calls fail

| Symptom | Possible cause | Solution |
|---------|----------------|----------|
| Returns 401 | API Key missing, wrong, or revoked | Regenerate it under Settings → Agent and update the client configuration |
| Returns 403 | Agent not enabled, **or accessed over plain `http://`** | Confirm the Agent switch is on; the MCP endpoint enforces HTTPS, so use `https://` |
| Returns 429 | Rate-limited after too many failed authentications | Wait about a minute and retry, and check that the key is correct |
| Skill installed but the AI says it has no such capability | Wrong skill directory, or the client wasn't restarted | Confirm the skill directory contains `SKILL.md` and restart the client; for OpenClaw run `openclaw skills list` |
| MCP tools don't appear after configuration | The client never connected | For Claude Code check status with `claude mcp list`; for DSH check the patch file and the `FlexKVM_TOKEN` environment variable |
| Connection reports a TLS / certificate error | Self-signed certificate | Import and trust the device CA certificate on the client machine |
| AI actions do nothing | Batch timeout, or over the limit | One batch allows up to 32 events and 60 seconds total; text is limited to 512 characters per call |

> Two connection methods, API Key management and capability limits → [AI Agent Control](../../guide/remote/agent.md)

---

## Device Status Abnormalities

### 🟢 Status LED abnormal

| State | Meaning | Solution |
|-------|---------|----------|
| Off | System not started | Check the power connection, try rebooting |
| Slow blink (1/s) | HDMI not connected, or the target host is sleeping | Check the HDMI cable, wake the target host |
| Fast blink (4/s) | USB not connected, or the target host is off | Check the USB cable, make sure the target host is on |
| Solid on | Normal | ✅ No action needed |

> Priority: fast blink > slow blink > solid on. When both USB and HDMI are disconnected, the LED shows fast blink.

### 🔴 Warning LED abnormal

| State | Meaning | Solution |
|-------|---------|----------|
| Slow blink (1/s) | Network not connected, or in provisioning mode | It turns off automatically once the network is configured |
| Fast blink (4/s) | System event (upgrade, factory reset, etc.) | Wait for the operation to finish |
| Solid on | System error | Reboot the device; if it stays on, contact support |

---

## Reboot Fixes Most Problems

If you hit an unclear abnormality, try rebooting FlexKVM first:

- **Software reboot**: Web interface → Settings → Maintenance → Reboot
- **Hardware reset**: Press the reset button on the device

Rebooting doesn't clear any configuration, and logs are preserved.

> But when **reporting a bug**, export the logs before rebooting: web logs live only in browser memory and are lost on refresh or when the page closes. See [Feedback](../../community/feedback/index.md).

If the problem persists after a reboot, work through the categories above.

---

[:octicons-arrow-left-24: Back to Support](../index.md)
