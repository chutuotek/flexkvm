# Remote Access

Device at home, you're at the office? Need to manage a server in a colo from a business trip? FlexKVM doesn't need a public IP or router configuration — **hotspot direct** and **Tailscale VPN** are two ways to connect securely from outside, both set up in minutes.

---

## Pick your method

| Your situation | Method | Summary |
|----------------|--------|---------|
| Near the device, but no network available | **Hotspot direct** | FlexKVM creates its own WiFi 6 hotspot — connect your phone and manage |
| Away from the device, it's in a remote location | **Tailscale VPN** | Free VPN, end-to-end encrypted — works anywhere with internet |

> Try hotspot direct first (zero config, instant), set up Tailscale later if needed.

---

## Option 1: WiFi 6 Hotspot Direct

No network on-site, customer won't let you on their LAN, rack isn't wired yet — FlexKVM becomes a WiFi 6 hotspot. Your phone or laptop connects directly and you're in control.

### Steps

1. Power on FlexKVM (USB Type-C, 5V/1A)
2. Long-press **Button B** on the device for ~3 seconds — release when the OLED shows the hotspot icon
3. On your phone or computer, search for WiFi networks and find `FlexKVM-AP`
4. Enter password `12345678` to connect
5. Open browser and go to `https://192.168.4.1` (fixed management address in hotspot mode)
6. Log in → remote display appears

> **Verify**: OLED status bar shows the hotspot icon, IP prefix is `A` (e.g., `A192.168.4.1`).

### When you're done

Go to **Settings → Network → AP Mode** and turn off the hotspot, or long-press Button B for 3 seconds again to switch back to WiFi. If left on, the hotspot stays active — draws power and occupies the channel.

> SSID, password, band, channel, max clients, and all other settings → [AP Mode](../network/ap.md)

---

## Option 2: Tailscale VPN

Tailscale connects all your devices into an encrypted virtual LAN — no public IP, no port forwarding, free tier supports 100 devices.

> Data is transferred via peer-to-peer encryption — it doesn't go through Tailscale servers. Initial connection may be slightly slower on some domestic networks, but stable once established.

### Step 1: Sign up for Tailscale

Go to [tailscale.com](https://tailscale.com) and create an account (supports Google / GitHub / Microsoft sign-in).

Install the Tailscale client on your control computer or phone too, and log in with the same account.

### Step 2: Enable on FlexKVM

Go to Web interface → Settings → **App Center**, find the Tailscale section:

1. Toggle the Tailscale switch on → service starts
2. Click **Login Status** → a login link appears
3. Open the link in your browser → authorize the device to join your Tailscale network

> **Verify**: The interface shows a Tailscale IP (typically `100.x.x.x`) and **Online** status.
>
> Login/logout, connection info, troubleshooting → [Tailscale](../network/tailscale.md)

### Step 3: Access from outside

On your remote computer or phone, make sure the Tailscale client is running and logged into the same account.

Then:

- **Web interface**: Open `https://<FlexKVM's Tailscale IP>` in your browser
- **SSH**: `ssh <username>@<FlexKVM's Tailscale IP>`

It's just like being on the same LAN.

### Verify

Turn off WiFi on your phone and use 4G/5G. Then open a browser to FlexKVM's Tailscale IP — if you see the login page, it's working.

---

## FAQ

**Hotspot direct won't connect?**

→ Make sure Button B was held for 3 seconds (OLED must show the hotspot icon). If you can't find it scanning, try adding the WiFi manually — SSID is `FlexKVM-AP`.

**Tailscale won't connect?**

→ Verify FlexKVM has internet access (Ethernet or WiFi connected). Verify both ends are logged into the **same** Tailscale account. Check FlexKVM's Tailscale page — status should be **Online**.

**I have a public IP — can I use port forwarding?**

→ Yes, port forwarding + DDNS works too. But Tailscale is simpler and safer — no ports exposed to the internet.

---

## Next Steps

- Remote access is open — now harden security → [Security Hardening](security.md)
- Reinstall a system remotely → [Remote OS Install](reinstall-os.md)

---

[:octicons-arrow-left-24: Back to Scenarios](index.md)
