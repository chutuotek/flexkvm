# Offline Upgrade

You can upgrade firmware even without internet access — download the firmware package on a computer, put it on a TF card, insert it into the device, and upload for upgrade.

Go to Settings → Upgrade.

![Upgrade interface](./images/setting_ota_offline.webp)

## Download Firmware Package

Download the OTA image file (`.tar` format) from either source on your computer:

| Source | URL | Best for |
|--------|-----|----------|
| GitHub | [github.com/chutuotek/flexkvm/releases](https://github.com/chutuotek/flexkvm/releases) | International users |
| Gitee | [gitee.com/chutuotek/flexkvm/releases](https://gitee.com/chutuotek/flexkvm/releases) | Users in China, faster |
| Gitcode | [gitcode.com/chutuotek/flexkvm/releases](https://gitcode.com/chutuotek/flexkvm/releases) | Users in China, faster |

On the releases page, find the target version and download the `.tar` firmware package (e.g., `flexkvm-v0.1.2.tar`).

## Upload Image

Go to Settings → Upgrade → click **Upload** → select the firmware package on the TF card.

![Upload progress](./images/setting_ota_offline_upload.webp)

> **Verify**: After upload, verification passes and the upgrade card becomes active (no longer grayed out).

## Upgrade

Click Upgrade - a dialog shows the image SHA-256 checksum. Confirm it's correct, then click Upgrade - enter password (with 2FA enabled, also enter verification code):

![Upgrade package verification](./images/setting_ota_offline_check.webp)

![User verification](../system/images/setting_verify.webp)

After verification, upgrade begins:

![Upgrade progress](./images/ota_upgrade.webp)

> **Verify**: During upgrade, the OLED shows an upgrade icon and 🔴 Warning LED fast-blinks. When complete, the device auto-reboots and OLED shows the IP again.

Upgrade success:

![Upgrade success](./images/ota_upgrade_success.webp)

> OTA only upgrades to a higher version — downgrades and same-version overwrites are not supported. ⚠️ Keep power stable during upgrade; power loss may cause upgrade failure.

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
