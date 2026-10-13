# Factory Reset

Restore FlexKVM to its factory state.

> Where: Settings → Maintenance → Device → **Restore Factory Mode** (card description: this will delete all configuration and restore factory settings)

**Will clear**: Accounts, passwords, 2FA keys, WiFi configuration, network settings such as static IP and certificates, custom settings.

**Will not clear**: Audit logs (preserved in both hardware and software resets), firmware version (not downgraded).

> Need to clear logs too? Use the SSH `reset all` command.

After reset completes, the device **auto-reboots**. During the process, the OLED shows a reset icon, and the 🟢 Status LED and 🔴 Warning LED fast-blink together.

## Before You Start

After a reset the device behaves like a new unit — record this information first:

- [ ] Network settings: static IP / DHCP, WiFi name and password, AP hotspot parameters
- [ ] Login: administrator username; if 2FA is on, make sure your backup codes still work
- [ ] Remote access (if used): Tailscale, HTTPS certificate and domain, SSH port and keys
- [ ] Logs to keep: system log and audit log (`reset all` also wipes audit logs — download them under Settings → Maintenance → Log first)
- [ ] Current firmware version (needed for support tickets and rollback decisions)

> If the device is off-site and reachable only over WiFi, make sure someone on site can plug in an Ethernet cable or enter provisioning mode before you reset.

## After the Reset

1. The device reboots; the OLED shows an IP address or `NO NETWORK !`
2. WiFi configuration is gone: connect via Ethernet, or long-press Button A for 1–3s to enter [Provisioning Mode](../network/provision.md) and set up the network again
3. Open the device IP in a browser and [create the administrator account](../security/account/login.md) again (username 4–32 characters), re-bind 2FA if needed
4. Restore static IP, Tailscale, certificates and other settings from your notes

## Hardware Reset

Use when you can't access the Web interface. Use a SIM ejector pin to hold the **factory reset button**; after about 1s the OLED shows a countdown starting at 14. Keep holding until it reaches zero (about 15s), then release once the OLED shows RESET → device auto-reboots. **Releasing early cancels it** and clears nothing.

![FlexKVM diagram](./images/oled_reset.webp)

> Requires physical access to the device — cannot be done remotely. See [Physical Buttons](../interaction/button.md).

## Software Reset

Click the "Restore Factory Mode" card → enter password to confirm → device auto-reboots.

![Factory reset interface](images/setting_reset.webp)

![Factory reset confirm](./images/setting_reset_comfirm.webp)

## SSH Reset

After SSH login, execute:

| Command | Effect |
|---------|--------|
| `reset` | Factory reset, **preserves** audit logs (recommended) |
| `reset all` | Full reset, **clears everything** (including audit logs) |

The device auto-reboots after confirmation.

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
