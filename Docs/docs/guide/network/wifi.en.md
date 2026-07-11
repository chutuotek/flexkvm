# WiFi

Connect to WiFi for wireless networking. Supports 2.4GHz and 5GHz dual-band — 2.4G penetrates walls better and covers wider areas; 5G has lower latency, ideal for video. Works as mutual backup with [Ethernet](./eth.md) — each link has its own IP, either one can reach the management interface, and if one drops the other keeps working.

> When using Ethernet and WiFi together, place them on different subnets to avoid routing conflicts. For example, Ethernet on `192.168.1.x`, WiFi on `192.168.2.x`.

## Specifications

| Item | Details |
|:----:|---------|
| Wireless protocol | 802.11 a/b/g/n/ac/ax |
| Band | Dual-band 2.4GHz / 5GHz |
| Antenna | SMA male |
| Default state | Enabled |
| MAC address | See packaging box label |

## OLED Display

After WiFi connects, the "X" on the OLED network icon disappears and the second line shows the IP address. IP prefix is **W** (e.g., `W192.168.1.100`), W = Wireless.

While acquiring IP, the display shows **W Loading...**. If it takes more than 10s → check WiFi connection or router DHCP.

## Software Configuration

Go to Web interface → Settings → **Network**.

![WiFi settings](./images/wifi/setting_wifi.webp)

### Enable / Disable

Click the card's toggle on the right. Turning off WiFi disables the wireless interface. Saved networks and configurations are preserved.

> Turning off both WiFi and Ethernet means you can't access the device. Keep at least one enabled.

### Saved Networks

![Saved networks](./images/wifi/setting_wificard_saved.webp)

Shows saved WiFi networks. Click a network card to expand — shows connection status, signal strength, frequency band, IP address, and security type:

![Network details](./images/wifi/setting_wifi_info.webp)

Click the gear icon to view or modify IP config and MAC address.

Click the trash icon on a network card to forget it.

> Each saved network can have independent IP configuration — settings auto-switch when you change WiFi networks.

### Scan & Connect

If no networks are saved, or to join a new one, click the WiFi card to scan nearby networks:

![Scan nearby networks](./images/wifi/setting_wificard_unsaved.webp)

Each result shows SSID, signal strength, security type, and frequency band. Click a network → enter the password (if required) → connect.

> **Verify**: After connecting → the card shows a "Connected" label and IP address. Password and config are auto-saved for next boot.

### Network Configuration

Click the gear icon on a network card to open the configuration dialog (three tabs):

**Details**

![WiFi details](./images/wifi/setting_wifi_info.webp)

Read-only display of current network parameters: IP address, MAC address, subnet mask, gateway, DNS1–3.

### IPv4 Configuration

![WiFi DHCP](./images/wifi/setting_wifi_static_off.webp)

**DHCP (default)**: Router assigns IP, gateway, and DNS automatically.

![WiFi static IP](./images/wifi/setting_wifi_static_on.webp)

**Static IP**: Manually set fixed parameters.

| Field | Description | Required |
|-------|-------------|:--------:|
| IP address | e.g., `192.168.1.100` | Yes |
| Subnet mask | e.g., `255.255.255.0` | Yes |
| Gateway | e.g., `192.168.1.1` | Yes |
| DNS1 | Primary DNS | No |
| DNS2 | Secondary DNS | No |
| DNS3 | Tertiary DNS | No |

> When switching to static IP, make sure the parameters are compatible with the current network — otherwise you'll lose connectivity.

Click save — takes effect immediately.

### MAC Address

![WiFi MAC default](./images/wifi/setting_wifi_mac_off.webp)

Default uses the factory MAC address (printed on the packaging box). You can also set a custom one:

![WiFi MAC custom](./images/wifi/setting_wifi_mac_on.webp)

Format: `AA:BB:CC:DD:EE:FF` (six groups of hex, colon-separated).

> ⚠️ Changing the MAC takes effect immediately and may cause disconnection. Some routers refuse to recognize a new MAC. If you can't reconnect after changing it, use [Provisioning Mode](./provision.md) (long-press Button A 3–6s) to recover.

### Verification

| Check | How |
|-------|-----|
| OLED | Is the IP displayed? |
| Web interface | WiFi card shows IP address |
| Network test | Ping the IP from another device |

---

## Troubleshooting

| Symptom | Likely cause | Try this first |
|---------|-------------|----------------|
| Can't find WiFi network | Too far from router, hidden SSID | Move closer to the router |
| Connection fails | Wrong password | Re-enter, check case and special characters |
| No IP after connecting | DHCP not responding | Try static IP, or check router DHCP |
| Frequent disconnects | Weak signal, interference | Switch to 5GHz or move closer to router |
| Forgot WiFi password | Password saved on device (can't view) | Forget the network and reconnect with password, or check router admin page |

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
