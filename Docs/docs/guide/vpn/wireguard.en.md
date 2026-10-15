# WireGuard

WireGuard is a point-to-point encrypted tunnel: it links FlexKVM to a peer you own (your own server, a VPS, another device) so you can reach the device as if it were on the same LAN. There is no third-party control plane involved — the two ends only need each other's public key.

> Where: Settings → App → WireGuard

> **Different from Tailscale / ZeroTier**: WireGuard is implemented **in the kernel** and baked into the firmware. There is no daemon and no app package to install — it shows no version number, the card has no "app update" entry row, and there is no such thing as whether the service is installed. The FlexKVM panel only orchestrates configuration: it hands the config to the kernel over netlink and reads the runtime state back. It never calls the `wg` / `ip` commands and never forks a subprocess.

![WireGuard settings](./images/wireguard/setting_wireguard.webp)

The card holds just five rows: the enable switch (its subtitle is the interface and private-key state), Public Key, Interface Settings, Peers, and Export Config. **The recommended order is: generate a keypair → configure the interface → add a peer → flip the switch last** — the switch is greyed out until both a key and at least one peer exist.

## Generate a Keypair

Open **Interface Settings** → click **Regenerate Keypair** → click **Confirm** in the dialog.

- The keypair is generated on the device and **the private key never leaves it** (stored at `/userdata/network/wireguard/secrets`, mode 0600; it is **never sent back to the browser**). The panel only shows the public key plus the private-key state in the switch subtitle. The preshared key is write-only in the same way.
- **Regenerating invalidates every peer**: the peer list is kept, but each peer must switch to the new public key or it can no longer handshake. The confirmation dialog spells this out.
- While the tunnel is up, the new private key is pushed to the kernel **immediately** and the interface is rebuilt; while it is down, the key is only written to disk and takes effect on the next enable.
- The **Public Key** row shows "Not generated" until a key exists. Afterwards it shows an abbreviated key — **click the row to copy the full public key** and hand it to the peer.

> **Verify**: the "Keypair regenerated" toast appears, the Public Key row changes from "Not generated" to something like `xTIBA5rb…p8Dg`, and the subtitle reports the private key as "configured".

## Interface Settings

Click the **Interface Settings** row to open the dialog. Besides the public key display and **Regenerate Keypair**, there are exactly four submittable fields:

| Field | Description |
|-------|-------------|
| Addresses | This device's address inside the tunnel, in CIDR, comma or space separated, **1 to 8 entries**. A prefix of 0 is rejected (`10.0.0.1/0` and friends). Until the device has been configured, the dialog suggests `10.7.0.2/24` as a starting point — change it to your own subnet |
| Listen Port | `0`–`65535`. **Empty means 0**: do not listen, let the kernel pick a random port (recommended for a pure client). To let a peer connect in (this device acting as the server), you must pin a port |
| MTU | `576`–`1500`, default `1420` |
| Route Mode | Off / Split / Full — see below |

![WireGuard interface settings](./images/wireguard/setting_wireguard_interface.webp)

Keep the interface addresses away from the Tailscale ranges `100.64.0.0/10`, `fd7a:115c:a1e0::/48` and `fd64:8184::/32` — WebRTC filters them out as ICE candidates.

### Route Modes

| Mode | Behaviour |
|------|-----------|
| Off | Take over no routes at all; just create the interface and set the address |
| Split | Add per-subnet routes from each peer's Allowed IPs (the default; `0.0.0.0/0` and `::/0` are skipped) |
| Full | Put the default route into the tunnel (IPv4 traffic; IPv6 still uses the main table) |

> **Full mode has a hard precondition**: at least one peer's Allowed IPs must cover `0.0.0.0/0`, otherwise the dialog warns "Full mode requires at least one peer whose Allowed IPs include 0.0.0.0/0; otherwise all outbound traffic outside the tunnel subnet is dropped". The kernel uses each peer's Allowed IPs to decide who may encrypt a packet — with no peer covering the default route, every outbound packet outside the tunnel subnet is dropped, **including the replies to your browser**, which freezes the current management session with no local way to recover on the device. The backend treats this as an invariant: any change that would break a working Full setup is rejected and rolled back as a whole.
>
> Full mode uses policy routing: the physical default route is left completely untouched, so neither a process exit nor a device reboot loses the device's normal internet route.

Click **Apply Interface** to submit.

- **Submitting while the tunnel is disabled still saves** (the dialog notes "Not enabled yet — Apply only saves the configuration"). So you can set addresses, port, MTU and route mode first and then flip the switch, applying everything in one go and rebuilding the interface only once.
- The backend does **not** rebuild the interface when none of the kernel-related fields changed — clicking Apply twice, or editing only a peer comment, will not interrupt the tunnel. It rebuilds only when a value really changed, and the tunnel blips briefly while it does.

> **Verify**: the "Interface settings applied" toast appears and the Interface Settings row summary changes from "Not Configured · MTU 1420" to your addresses and MTU (e.g. `10.7.0.2/24 · MTU 1420`), with the current route mode on the right (e.g. "Split").

## Peers

Click the **Peers** row to open the list. Each peer shows its comment (or "Unnamed peer"), the abbreviated public key, Online / Offline, its Allowed IPs, the handshake (how long ago it happened, `-` if never) and traffic (rx / tx). The pencil and trash buttons sit at the right of each row, and **Add Peer** is at the bottom. **Up to 32 peers**; once full, the add entry tells you the limit has been reached.

![WireGuard peer list](./images/wireguard/setting_wireguard_peers.webp)

### Add a Peer

You need three things from the peer side:

| What | Description |
|------|-------------|
| Peer public key | The peer's own public key, 44-character base64 ending in `=` — required. **It identifies the peer**; paste the wrong one and nothing connects |
| Endpoint | The peer's `host:port`, e.g. `vpn.example.com:51820`; IPv6 is written `[::1]:51820`. **Leave it empty to not pin the peer's address** — the peer connects in to you (this device acts as the server, the peer as the client) |
| Allowed IPs | The peer subnets you want to reach through this tunnel (CIDR, 1–16 entries). They decide both routing and inbound filtering: **in Split mode, a subnet that is not listed here gets no route** |

The rest of the form:

- **Preshared Key**: optional; leaving it empty means no PSK for this peer (empty while editing keeps the current key). If the peer side has one configured, enter the same value here.
- **Persistent Keepalive**: `25` seconds by default; empty means `0` (off). **Keep it at 25 when the peer is behind NAT** — WireGuard drops the first packet before the handshake completes (protocol behaviour, no queueing), and keepalive mitigates this noticeably.
- **Comment**: local only, never sent to the kernel; limited to 63 bytes (about 21 CJK characters).

![WireGuard add peer](./images/wireguard/setting_wireguard_peer_form.webp)

Click **Add** to submit; the "Peer added" toast appears.

> **Verify**: the Peers row changes from "No peers" to "1 peers · 0 online", and the list shows the new peer with a handshake of `-` (it has not handshaken yet).

### Edit a Peer

Click the pencil button on a peer row. The dialog is titled **Edit Peer** and its button is **Save**.

- **The public key cannot be changed**: it identifies the peer, so the field is read-only while editing (with the note "The public key identifies the peer and cannot be changed"). To change a peer's public key, remove the peer and add it again.
- **Leaving the Preshared Key empty keeps the current key**; to delete a configured one, tick **Clear preshared key**.
- After a peer roams, the live address the kernel sees may differ from the configured Endpoint; the form then shows "Live address from the kernel: … (the peer roamed; display only, never written back to the config)". It is informational — writing it back would break after a reboot.

Editing only the comment does not rebuild the interface, so the tunnel is not interrupted.

> **Verify**: the "Peer updated" toast appears and the row reflects the new comment or Allowed IPs.

### Remove a Peer

Click the trash button on a peer row → click **Confirm**. The tunnel **immediately** loses that peer, its preshared key is cleared with it, and there is no undo — a mistake means reconfiguring it by hand.

> In Full route mode, removing the last peer whose Allowed IPs cover `0.0.0.0/0` is rejected (same reason as above). An already-broken configuration is the exception and is always allowed through.

> **Verify**: the "Peer removed" toast appears, and both the list and the card summary drop the peer.

## Enable / Disable

Flip the switch on the card to enable. Enabling **rebuilds the interface from scratch**: delete the old interface → create `wg0` → push the device config → set addresses and MTU → bring it up → add routes per the route mode. It takes longer than other actions and the tunnel blips while it runs. Disabling tears the interface down.

The switch subtitle is the current state:

| Subtitle | Meaning |
|----------|---------|
| Generate a keypair and add at least one peer first | No keypair or no peer yet; the switch is greyed out |
| Please wait... | An enable/disable is in flight; the switch is temporarily locked too |
| Up · private key configured | The interface inside the kernel is up |
| Down · private key configured | Configuration is ready, but the interface is not up |

- A failed enable **rolls the switch back** and shows the backend's reason directly (missing keypair/peer, Full mode without a default-route peer, invalid configuration, and kernel-side failure are all distinct).
- Nothing is rebuilt when the switch and the real kernel state already agree, and **an interface that is already up is always allowed to be turned off** — you can never end up with a switch you cannot flip.
- While the tunnel is up the panel reads the kernel runtime state every 5 seconds (paused while the tab is in the background). That is where the peers' Online / Handshake / Traffic come from. You can also click the refresh button at the top right of the card to read it immediately.
- "Online" means **the last handshake was less than 180 seconds ago**, so a freshly added peer stays Offline until its first handshake.

> **Verify**: the "Setting saved successfully" toast appears and the subtitle becomes "Up · private key configured". If it still says Down, give it a second or two — the switch reply carries runtime state from the previous kernel read, and the device pushes a fresh state right after. Once the first handshake happens, the peer list shows Online and a handshake time.

## Export Config (for the peer)

Click **Export Config** on the card. The dialog shows a **configuration template meant for the peer (client)**, containing `[Interface]` / `[Peer]` sections, this device's public key, the tunnel subnet and `PersistentKeepalive`. Click **Copy**, save it as a `.conf` on the client and import it.

![WireGuard export config](./images/wireguard/setting_wireguard_export.webp)

- **This is not a backup of the local configuration**: the local config contains the private key, and exporting it to the browser would hand that key off the device. The template leaves the client private key and address as placeholders, with a comment on the first line explaining how to generate the client keypair — do that, then fill the values in. (The placeholders and comments in the exported text are emitted by the firmware in Chinese, e.g. `PrivateKey = <在此填入客户端私钥>` and `Address = <在此填入本隧道内的客户端地址，如 10.7.0.3/24>`, regardless of the interface language.)
- The `Endpoint` line comes in two flavours. With a pinned listen port it reads `<本机可达地址>:<your listen port>` — replace the Chinese `<本机可达地址>` placeholder with the local address the peer can reach. **When the port is 0 (kernel-picked) it refuses to emit `:0`**, and instead prints a placeholder plus a comment telling you to pin a port on the device first — this is mandatory if you want the peer to connect in.
- Exporting fails before a keypair exists (the "Export failed" toast).

> **Verify**: the dialog shows the complete `.conf` text, including the public key you just copied and your listen port; clicking Copy reports "Copied to clipboard".

> Mixing up keys, endpoints and Allowed IPs on the peer side is the most common reason nothing connects: **put the `Endpoint` from this device's exported template into the peer's `Peer.Endpoint`, and this device's public key into the peer's `Peer.PublicKey`**, while on this device the Peers list takes the peer's public key and address.

---

## Troubleshooting

| Symptom | Likely Cause | Try This First |
|---------|--------------|----------------|
| The card shows "WireGuard unavailable: Kernel has no WireGuard support" | The firmware kernel was built without WireGuard support | Contact support to confirm the firmware version |
| The switch is greyed out and the subtitle reads "Generate a keypair and add at least one peer first" | No keypair generated yet, or the peer list is empty | Generate a keypair in Interface Settings and add at least one peer |
| Enabling pops up `Generate a keypair and add at least one peer first` | Missing private key or peer (the backend rejects before touching the kernel; nothing is modified) | Check whether the Public Key row says "Not generated" and whether the peer list is empty |
| Enabling pops up `Global mode needs at least one peer whose AllowedIPs include 0.0.0.0/0` | Route mode is Full but no peer's Allowed IPs cover `0.0.0.0/0` | Add `0.0.0.0/0` to one peer's Allowed IPs, or switch the route mode back to Split |
| The subtitle stays on "Down" | The interface did not come up (invalid configuration or kernel-side failure) | Wait a second for a fresh state push; otherwise read the backend message shown by the panel and check the key, endpoints and Allowed IPs |
| A peer stays "Offline" | It has never handshaken ("Online" = handshake less than 180 s ago), the peer has not been given this device's public key, or the address is unreachable | Configure this device's public key on the peer, then set Persistent Keepalive; make sure the endpoint is reachable |
| The subtitle shows Up but a peer subnet is unreachable | Route mode is Off, or that subnet is missing from Allowed IPs | Add the subnet to the peer's Allowed IPs, or switch the route mode to Split |
| The exported config has a placeholder `Endpoint` plus a comment about pinning a port | The listen port is 0 (kernel-picked, so the peer cannot know it) | Pin a listen port in Interface Settings and export again |
| Clicking "Export Config" reports "Export failed" | No keypair yet, so there is no public key to export | Generate a keypair first |
| Clicking the Public Key row reports "Copy failed" | The page is not a secure context (browsers expose no clipboard API over plain HTTP) | Access the management interface over HTTPS and retry |

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
