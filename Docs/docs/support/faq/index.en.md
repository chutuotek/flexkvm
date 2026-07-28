# FAQ

## Product Comparison

### How is FlexKVM different from IPMI/iDRAC/iLO?

Enterprise out-of-band solutions like IPMI require motherboard support, are expensive, and complex to configure. FlexKVM is an **external** solution — any device with HDMI and USB ports can use it. No motherboard support needed, plug and play, lower cost.

### How is it different from remote software like TeamViewer or Sunlogin?

Remote software depends on the operating system to function. When the system is blue-screened, hasn't started, or lacks graphics drivers, remote software cannot work. FlexKVM captures video signals at the **hardware level**, independent of the target system's software state.

---

## Network & Connectivity

### Do I need a public IP address?

No. FlexKVM has Tailscale built-in — as long as the device can access the internet, a secure connection can be established. You can also connect directly via the WiFi 6 hotspot with no internet required at all.

### Can I use WiFi and Ethernet at the same time?

Yes, both can be online simultaneously. If either network fails, control is unaffected. We recommend placing them on different subnets — for example, Ethernet on `192.168.1.x` and WiFi on `192.168.2.x`.

### How do I find FlexKVM's IP address?

Check the OLED screen. Ethernet IP shows as `Exxx.xxx.xxx.xxx`, WiFi IP shows as `Wxxx.xxx.xxx.xxx`, and hotspot IP shows as `Axxx.xxx.xxx.xxx`. See [OLED Screen](../../guide/interaction/oled.md).

### What is provisioning mode and when do I need it?

Provisioning mode creates a temporary WiFi hotspot from FlexKVM for first-time network setup or recovery when network misconfiguration makes the device unreachable. Press and hold **Button A** for 1~3 seconds to enter. See [Provisioning Mode](../../guide/network/provision.md).

### Will my phone lose internet when connected to the FlexKVM hotspot?

Yes. Your phone temporarily disconnects from the internet while connected to the FlexKVM hotspot. It will automatically restore after provisioning is complete.

---

## Remote Display & Control

### Which browsers are supported?

Chrome and Edge are recommended. Other browsers may have compatibility issues (e.g., display problems).

### The remote screen is laggy or delayed. What can I do?

Try lowering the video quality in the display menu, or click "Reconnect". For better performance, use 5GHz WiFi or a wired Ethernet connection. See [Remote Display](../../guide/remote/screen.md).

### Can I access the BIOS/UEFI?

Yes. FlexKVM captures HDMI signals at the hardware level, so BIOS, blue screens, and safe mode are all visible and operable. Make sure the correct **target OS type** is selected in keyboard settings, or BIOS hotkeys may not work.

### Does toggling audio or virtual media disconnect USB?

Opening or closing audio, or switching USB device identification, causes a brief USB disconnect and reconnect. The mouse, keyboard, and disk mount on the target host will momentarily drop out then recover. This is normal. Do not toggle audio during OS installation.

---

## Power & Hardware

### Does the target host need software or drivers?

No. FlexKVM appears to the target host as a standard USB keyboard, mouse, and storage device — plug and play, compatible with all major operating systems.

### Which operating systems does FlexKVM support?

FlexKVM is **completely transparent** to the target device — it emulates standard USB HID and storage devices and works with Windows, Linux, macOS, and any other OS that supports USB input devices.

### Does the package include a power adapter?

**No.** The package includes USB Type-C cables. You need to provide your own 5V/1A (or higher) USB power adapter. A dedicated power adapter is recommended for best stability.

### Can I power FlexKVM from the target device's USB?

Yes. Flip the USB power switch to **I** to draw power from the target device. However, when the target device shuts down, FlexKVM also loses power, making remote power-on impossible. **A dedicated power adapter is required for remote power-on functionality.**

### Does FlexKVM support PoE?

Not natively. You can use an external PoE splitter module. See [Accessories](../../guide/product/extensibility.md).

### Is the ATX controller required?

No. Without the ATX controller, FlexKVM still provides full remote display and keyboard/mouse control. You just won't be able to remotely power on/off or restart the target device. See [ATX Power Control](../../guide/peripherals/atx.md) for setup.

### Can I manage multiple devices at once?

One FlexKVM manages one target host. For multiple hosts, equip each with its own FlexKVM and access them individually through the same Tailscale network.

---

## Storage

### Which file systems does the TF card support?

FAT32, exFAT, ext4, and NTFS. exFAT is recommended (no 4GB single-file limit). See [Storage Management](../../guide/peripherals/disk.md).

### How do I remotely reinstall the OS?

Use FlexKVM's virtual media feature to mount an ISO image as a USB CD-ROM, then boot the target host from it. See [Remote OS Installation](../../guide/scenarios/reinstall-os.md).

---

## Account & Security

### I forgot my login password. What now?

Account information is stored locally on the device and cannot be recovered. You will need to perform a factory reset to create a new account. See [Factory Reset](../../guide/maintenance/factory-reset.md).

### How do I enable two-factor authentication (2FA)?

Go to Settings → Account → 2FA in the web interface, click "Generate 2FA", and scan the QR code with an authenticator app (e.g., Google Authenticator). See [Account Security](../../guide/security/account/account.md).

### What are backup codes for?

When enabling 2FA, 10 one-time backup codes are generated. Each code can be used only once, for emergency login when your phone or authenticator is unavailable. Save them in a password manager or print a physical backup.

### Why does the browser show "Not Secure"?

FlexKVM uses a self-signed SSL certificate. Your browser cannot verify it, which is normal — the connection is still encrypted. Click "Advanced" → "Proceed". To remove the warning, upload a CA-signed certificate. See [HTTPS Certificate](../../guide/security/https.md).

### I can't open `https://<device-IP>`. What should I do?

1. Make sure your control device and FlexKVM are on the **same network**
2. Verify the IP address matches what's shown on the OLED display (don't forget `https://`)
3. Try `ping <device-IP>` from your control device
4. If using hotspot provisioning, make sure your phone/computer is still connected to the FlexKVM hotspot
5. Try a private/incognito browser window

---

Still have questions? Try searching at the top of the page, or go to [Troubleshooting](../troubleshooting/index.md) for symptom-based diagnostics.

To submit a bug or suggestion, see [Feedback & Suggestions](../../guide/scenarios/feedback.md).
