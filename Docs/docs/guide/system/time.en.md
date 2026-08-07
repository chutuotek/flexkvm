# Time & Date

Set your timezone — the system time auto-syncs via NTP. When the device clock deviates significantly from the current time, a calibration prompt appears after connecting.

Go to Settings → System → Time Settings.

![Time settings](./images/time/setting_time.webp)

## Set Timezone

Use the dropdown to select your timezone. Supports all whole-hour timezones from UTC-12 to UTC+14. Default: UTC+8 (Beijing time). Takes effect immediately.

The current device time is displayed below, refreshing every second:

```
2026/07/01 14:30:00 (UTC+8)
```

## Calibrate Device Time

The device RTC can drift or lose time after power loss or prolonged offline use, which breaks 2FA verification. When the device clock deviates over 60 seconds from the current time, a calibration prompt shows the device's current time after connecting:

- **Confirm**: sets the device time to the current time and refreshes the login credential automatically — no need to log in again
- **Cancel**: dismisses the prompt for this connection

## NTP Time Sources

The system auto-syncs time with the built-in NTP server by default. Custom time sources can be added in Time Settings:

- Enter a hostname or IP, e.g. `ntp.aliyun.com`
- Up to 5 sources; duplicates are flagged
- Mark a source as **Preferred** to prioritize it
- Changes take effect immediately

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
