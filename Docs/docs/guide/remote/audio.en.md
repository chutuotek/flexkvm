# Audio

FlexKVM transmits audio bidirectionally between the target host and your browser via a USB virtual sound card (UAC) — the host's system audio streams back to your computer, and your microphone goes to the host. When enabled, an audio device called **FlexKVM Audio** appears on the target host.

> Toggling audio causes a brief USB disconnect/reconnect — mouse, keyboard, and disk mount will briefly drop and recover. This is normal.

## Audio Status

The audio icon in the top bar reflects state:

| Icon | Meaning |
|------|---------|
| ![](../icon/audio/audio-lines.svg) | Both microphone and speaker enabled |
| ![](../icon/audio/mic.svg) | Microphone only |
| ![](../icon/audio/volume2.svg) | Speaker only |
| ![](../icon/audio/audio-lines-off.svg) | Disabled or not connected |

## Audio Menu

Click the audio icon to open the menu.

### Status

| Status | Description |
|--------|-------------|
| Connected | Normal |
| Not connected | Refresh the page or reconnect the remote display to restore |
| Disabled | Audio function is turned off |

### Audio Switch

Master toggle. When enabled, a FlexKVM Audio device appears on the target host. When disabled, the sound card is removed — both microphone and speaker stop.

### Microphone

When enabled, your computer's microphone audio is sent to the target host.

> On first use, the browser will request microphone permission — click "Allow".

### Speaker

When enabled, you can hear the target host's audio.

## Target Host Settings

After enabling audio, go to the target host's system sound settings:

| Purpose | Select device |
|---------|---------------|
| Playback (hear host audio) | **FlexKVM Audio** as default playback device |
| Recording (speak to host) | **FlexKVM Audio** as default recording device |

- **Windows**: Right-click speaker in system tray → Sound settings → select output/input
- **macOS**: System Settings → Sound → Output/Input
- **Linux**: System Settings → Sound → Output/Input

---

## FAQ

**Microphone not working?** → ① Does the browser have microphone permission? ② Are both the master switch and microphone switch on? ③ Is the host recording device set to FlexKVM Audio?

**Speaker not working?** → ① Are both the master switch and speaker switch on? ② Is the host playback device set to FlexKVM Audio? ③ Is the host actually outputting audio?

**Static or delay?** → Normal for network transmission. Try improving your network environment.

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
