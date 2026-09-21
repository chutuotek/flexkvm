# Factory Reset

Restore FlexKVM to its factory state.

> Where: Settings → Maintenance → Device → Restore Factory Mode

**Will clear**: Accounts, passwords, 2FA keys, WiFi configuration, custom settings.

**Will not clear**: Audit logs (preserved in both hardware and software resets), firmware version (not downgraded).

> Need to clear logs too? Use the SSH `reset all` command.

After reset completes, the device **auto-reboots**. During the process, the OLED shows a reset icon, and the 🟢 Status LED and 🔴 Warning LED fast-blink together.

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
