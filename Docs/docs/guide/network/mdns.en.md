# mDNS Discovery

mDNS (Multicast DNS) lets devices on your LAN **discover FlexKVM by hostname** instead of memorizing an IP address. Just enter `<hostname>.local` in your browser or terminal — it keeps working even when the IP address changes.

mDNS is enabled by default on FlexKVM. Three services are advertised:

| Service | mDNS Type | Port |
|---------|-----------|:----:|
| SSH | `_ssh._tcp` | 22 |
| HTTP | `_http._tcp` | 80 |
| HTTPS | `_https._tcp` | 443 |

> In normal mode, visiting `http://` automatically redirects to `https://` for encrypted access, so just use the HTTPS address (provisioning mode is the exception).

## Find Your Hostname

Each FlexKVM's hostname is generated from its serial number, in the format `flexkvm-xxxx` (e.g. `flexkvm-abc123`) — unique to every device.

On the OLED home screen, **press button A twice** to enter the system info screen. The `flexkvm-xxxx` shown there is your hostname:

```
 SYSTEM
 FlexKVM
 flexkvm-abc123
 FS10251810001CN5
```

## Access via mDNS

Connect your computer / phone to the **same network** as FlexKVM (wired or Wi-Fi), then replace `flexkvm-xxxx` with the device's actual hostname and use the `.local` domain:

| Service | How to access |
|---------|---------------|
| Web UI | Open `flexkvm-xxxx.local` in your browser — it automatically redirects to `https://` |
| SSH | Run `ssh root@flexkvm-xxxx.local` in your terminal |

With hostname `flexkvm-abc123`, for example:

- Browser: `flexkvm-abc123.local`, or directly `https://flexkvm-abc123.local`
- Terminal: `ssh root@flexkvm-abc123.local`

## Requirements

- The accessing device and FlexKVM must be on the **same LAN** (same router, or directly connected to the FlexKVM hotspot)
- **Windows**: install [Apple Bonjour](https://support.apple.com/downloads/bonjour-for-windows) (bundled with iTunes) to resolve `.local` domains
- **macOS / iOS / Linux / Android**: supported natively, no extra setup needed
- `.local` is a reserved domain for mDNS and cannot be resolved by public DNS; for cross-subnet access, use the IP address or [Tailscale](tailscale.md)

## Enable / Disable

Go to **Settings → System → mDNS** and toggle "Enable mDNS Discovery":

- **On** (default): LAN devices can discover FlexKVM by hostname
- **Off**: hostname access stops working; use the IP address instead

---

[:octicons-arrow-left-24: Back to User Guide](../index.en.md)
