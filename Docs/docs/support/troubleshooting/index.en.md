# Troubleshooting

> Can't find the issue below? Try searching with a keyword at the top of the page, or collect diagnostic information and [submit feedback](../faq/index.md).

---

## Cannot Access Device

### Web page won't load

| Step | Action |
|------|--------|
| 1. Check IP address | Verify the IP on the OLED display, and type `https://IP` in the browser |
| 2. Test connectivity | Run `ping <device-IP>` from your control device |
| 3. Check network | Make sure both devices are on the same local network |
| 4. Try incognito mode | Open in a private/incognito window to rule out cache issues |
| 5. Check device power | Is the OLED display working? Is the red power LED on? |

> If none of the above works, press and hold **Button A** for 3~6 seconds to enter [Provisioning Mode](../../guide/network/provision.md) and reconfigure the network.

### WiFi connected but no IP address

| Possible cause | Solution |
|---------------|----------|
| DHCP not responding | Try using a [static IP](../../guide/network/wifi.en.md#ipv4-configuration) |
| Weak signal | Move closer to the router or use 5GHz |
| MAC address filter | Check if the router has MAC filtering enabled |
| Wrong password | Re-enter the password, check for uppercase/lowercase and special characters |

---

## Remote Display Issues

### Black screen or "Not Connected"

| Step | Action |
|------|--------|
| 1. Check HDMI cable | Make sure it's firmly connected at both ends |
| 2. Check target host | Is it powered on and not in sleep mode? |
| 3. Check green status LED | **Solid** = HDMI OK, **Slow blink** = no signal |
| 4. Try reconnecting | Click "Reconnect" in the display menu |
| 5. Try a different EDID | Switch to a fixed-resolution EDID preset |

### Laggy or delayed video

| Possible cause | Solution |
|---------------|----------|
| Insufficient bandwidth | **Lower the video quality** in the display menu |
| Using 2.4GHz WiFi | Switch to 5GHz or wired Ethernet |
| Stream frozen | Click "Reconnect" |
| GOP too high | Set GOP to 1 (default) in the display menu |

### Distorted image

| Possible cause | Solution |
|---------------|----------|
| EDID mismatch | Try switching EDID presets |
| Video stream error | Click "Reconnect" in the display menu |
| Loose HDMI cable | Re-seat the HDMI cable at both ends |

---

## Keyboard & Mouse Issues

### Keys not working or wrong input

| Possible cause | Solution |
|---------------|----------|
| Wrong target OS setting | In keyboard settings, verify the **target OS** (Windows/Linux/macOS) |
| Focus not on remote screen | Click on the remote display area to get focus |
| ESC intercepted in fullscreen | Exit fullscreen first, or use the mapped ESC key (default: Right Ctrl) |

### Mouse not working properly

| Possible cause | Solution |
|---------------|----------|
| Wrong mode | Try switching between **absolute/relative** mode in mouse settings |
| Can't click in black bars | Black bars are outside the video area — try fullscreen mode |
| Sensitivity wrong | Adjust sensitivity in mouse settings |

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

---

## ATX Power Control Issues

### Clicking power does nothing

1. Check the Dupont wires and motherboard pin positions
2. In the peripherals menu, check if the device name shows `atx`
3. Verify the ATX controller's power LED is on

### Device turns on immediately after shutdown

Some motherboards have "Restore on AC Power Loss" enabled in BIOS. Enter BIOS and disable this option.

---

## Storage Issues

### TF card not detected

Check if the file system is supported. FAT32 and exFAT have the best compatibility. Make sure the card is fully inserted (click sound).

### Virtual CD-ROM not detected by target host

Make sure the file is in `.img` or `.iso` format. Other formats cannot be mounted as a virtual drive.

---

## Upgrade Issues

### Online upgrade fails

| Possible cause | Solution |
|---------------|----------|
| Unstable network | Switch download source (GitHub/Gitee), or try offline upgrade |
| Power instability | Use a dedicated power adapter during upgrade |
| Firmware checksum error | Re-download the package and try again |

### Offline upgrade fails

Make sure the uploaded firmware file is complete and not corrupted. If the device fails to boot after a power loss during upgrade, see [Flash Firmware](../../guide/maintenance/flash.md).

---

## Device Status LEDs

### Green status LED

| State | Meaning | Action |
|-------|---------|--------|
| Off | System not started | Check power, try rebooting |
| Slow blink (1/s) | HDMI not connected or host sleeping | Check HDMI cable, wake target host |
| Fast blink (4/s) | USB not connected or host off | Check USB cable, ensure target host is on |
| Solid on | Normal | ✅ No action needed |

### Red warning LED

| State | Meaning | Action |
|-------|---------|--------|
| Slow blink (1/s) | Network not connected or provisioning mode | Configure network |
| Fast blink (4/s) | System event (upgrade, factory reset, etc.) | Wait for it to complete |
| Solid on | System error | Reboot device; if persists, contact support |

---

## Reboot First

When in doubt, try rebooting FlexKVM first:

- **Software reboot**: Web interface → Settings → Maintenance → Reboot
- **Hardware reset**: Press the reset button on the device

Rebooting does not clear any configuration.

---

[:octicons-arrow-left-24: Back to Support](../index.md)
