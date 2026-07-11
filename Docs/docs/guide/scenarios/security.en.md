# Security Hardening

Device exposed to the internet or in a multi-user environment? Work through these items by priority — each takes under 5 minutes, and every one makes you more secure.

---

## P1: Enable 2FA Two-Factor Authentication

This is the best security-for-effort measure. Even if your password is leaked, attackers can't log in without your phone.

### How to enable

Go to Web interface → Settings → Account → click "Enable" in the **2FA Authentication** area:

1. Install an authenticator app on your phone (Google Authenticator / Microsoft Authenticator)
2. Scan the QR code shown on screen → the app adds a FlexKVM entry with a 6-digit code
3. Enter the verification code to complete binding

> **Verify**: Log out and log back in — after entering your password, the system should require a 6-digit code.

> ⚠️ **Save your backup recovery codes.** Your phone can be lost, your authenticator can be deleted — recovery codes are the only way back into your account. Store them in a password manager or print a physical backup.

### Impact on SSH

SSH login does not require 2FA — just username and password. For stricter SSH security, disable the SSH service — see [P3](#p3-harden-ssh).

> Change password, regenerate 2FA, manage backup codes → [Account Security](../security/account/account.md)

---

## P2: Upload HTTPS Certificate

FlexKVM uses a self-signed certificate by default — browsers will show a "Not Secure" warning, but the communication itself is encrypted. Upload your own SSL certificate to remove the warning.

### How to do it

Go to Web interface → Settings → Advanced → HTTPS:

1. Prepare your SSL certificate file (`.crt`) and private key file (`.key`), PEM format
2. Upload both files → switch to "Custom Certificate" mode

> **Verify**: The browser address bar shows a 🔒 icon.
>
> This generally requires a domain name (Let's Encrypt free certificates work great). Without a domain, a self-signed cert provides the same security — the browser warning is just cosmetic.

> Certificate format conversion, upload failure troubleshooting → [HTTPS Certificate](../security/https.md)

---

## P3: Harden SSH

SSH is enabled by default, listening on port 22. If you don't need it, turn it off. If you do, tighten the security policy.

### Don't need SSH → Turn it off

Go to Web interface → Settings → Advanced → SSH → toggle off.

### Need SSH → Tighten

- Failed authentication limit: default is 3 attempts, with auto-disconnect after reaching the limit
- Failure delay: wait time increases after repeated failures — prevents brute force attacks

> Available SSH commands, terminal shortcuts, troubleshooting → [SSH Remote Access](../security/ssh.md)

---

## P4: Export Audit Logs Regularly

Audit logs record who did what and when — logins, config changes, command execution. In multi-user or production environments, export monthly.

Go to Web interface → Settings → Maintenance → Audit → click **Download**.

> Log format, page browsing, download verification → [Audit Logs](../security/audit.md)

---

## Security Checklist

| Check | Default | Recommendation |
|-------|:-------:|----------------|
| Admin password | Created on first access | ≥12 chars, mixed case + numbers + symbols |
| 2FA | Disabled | **Strongly recommended to enable** |
| HTTPS certificate | Self-signed | Upload trusted cert if you have a domain |
| SSH service | Enabled | Turn off if not needed |
| Audit logs | Auto-recorded | Export monthly |
| Firmware version | — | Keep current |
| Public exposure | None | If exposed via port forwarding, definitely enable 2FA |

---

## Next Steps

- Export audit logs regularly → [Daily Operations](daily-ops.md)
- Secure remote access from outside → [Remote Access](remote-access.md)
- Forgot your password? → A factory reset is the only option: [Factory Reset](../maintenance/factory-reset.md)

---

[:octicons-arrow-left-24: Back to Scenarios](index.md)
