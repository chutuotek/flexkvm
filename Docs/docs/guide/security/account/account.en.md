# Account Management

Manage your FlexKVM login account — change password, enable/disable 2FA, manage backup codes.

Go to Settings → Account.

![Account interface](./images/account-ui.webp)

## Account Info

Shows the currently logged-in username (e.g., `admin`).

**Change password**: Click the password card → enter current password, new password, confirm new password → confirm.

![Password change](./images/change-passwd.webp)

> Password must be ≥ 8 characters, can use letters, numbers, and special characters. If 2FA is enabled, you'll also need to enter a 2FA code.

## 2FA Authentication

Two-factor authentication — requires a dynamic verification code in addition to your password, significantly enhancing security.

### Status

Shows current 2FA status: Enabled / Disabled.

### Generate 2FA

![2FA password verification](./images/2fa-none-auth.webp)

Enter password → click "Generate 2FA" → QR code appears:

![2FA QR code](./images/setting_2fa_gen.webp)

1. Scan the QR code with your phone's authenticator app (Google Authenticator / Microsoft Authenticator)
2. The app displays a 6-digit verification code
3. Enter the code → confirm

> ⏱️ The generated key expires after **10 minutes** — if you don't complete the verification code confirmation in time, it fails with "2FA key expired, generate again" and you must regenerate.

After successful verification, 10 eight-digit backup codes are shown:

![2FA generated](./images/2fa-gen.webp)

- Each backup code can be used **only once** — becomes invalid automatically after use
- Unused codes remain valid (using code #1 doesn't invalidate #2–10)
- Once all 10 are used, you need to regenerate

> ⚠️ Backup codes are the **only** emergency login method when your phone is lost or authenticator is unavailable. Store them in a password manager or print a physical backup.

### Enable / Disable 2FA

![2FA password verification](./images/2fa-enable.webp)

Enter password and 2FA code → confirm.

> You must generate a key first (see "Generate 2FA" above) before enabling 2FA — enabling without a generated key fails.

### Regenerate 2FA / Generate Backup Codes

Requires identity verification: enter password and 2FA code. Generating new keys or backup codes immediately invalidates the old ones.

![2FA password verification](./images/setting_verify_2fa.webp)

![2FA generated](./images/2fa-gen.webp)

---

[:octicons-arrow-left-24: Back to User Guide](../../index.md)
