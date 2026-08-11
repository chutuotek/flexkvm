# App Update

Apps installed on FlexKVM (such as Tailscale) are updated separately — [Firmware Upgrade](upgrade-online.md) updates the system, App Update updates apps. The two don't affect each other.

Go to Web interface → Settings → **App Center** → App Update.

## Download Source

Choose where to download app packages from:

- **GitCode** — Default source, faster for users in China
- Gitee — Users in China, faster
- GitHub — International users

> Switching the download source clears already-downloaded packages — check for updates again afterwards.

## Check for Updates

Click **Check for Updates** to fetch the latest version info for each app from the current source. The page shows the last check time.

> **Verify**:
>
> - Update available → the app card shows "New version vX.X.X" with changelog
> - No update → shows "Up to date"
> - Not checked yet or check failed → shows "Not checked"

## App Status

| Status | Meaning |
|--------|---------|
| Not installed | The app is not installed on this device |
| New version available | A newer remote version exists, showing version number and changelog |
| Up to date | The installed version is the latest |
| Requires OTA firmware upgrade | The new version needs a newer firmware — [upgrade the firmware](upgrade-online.md) first |
| Not checked | Not checked yet, or the last check failed |

## Download & Install

1. Click **Download** on the app card — progress, speed and remaining time are shown; cancel anytime
2. When the download finishes, the package is automatically verified (shows "Verifying package..."); once verified, the button becomes **Install Now**
3. Click **Install Now** — the app is installed and its service restarts automatically

> **Verify**: after installation the app card shows the new version and the status becomes "Up to date".

App update does **not require a device reboot**; a failed install automatically rolls back to the previous version.

## Update Failed?

| Symptom | Possible cause | Try this |
|---------|----------------|----------|
| Check failed | Network issue or source unavailable | Switch download source, or retry later |
| Download failed | Unstable network | Switch download source and download again |
| Verification failed | Corrupted package | Download again |
| App not compatible | Firmware too old | [Upgrade the firmware](upgrade-online.md) first |

---

[:octicons-arrow-left-24: Back to User Guide](../index.en.md)
