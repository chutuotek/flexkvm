# Recording

Record the remote display as a video file — useful for documenting operations or keeping evidence.

## How to Record

Use the recording icon in the top bar:

| Icon | State |
|------|-------|
| ![](../icon/recorder/video.svg) | Idle, click to start |
| ![](../icon/recorder/square.svg) | Recording, click to stop |

**Start**: Click the record button → "Recording started" toast appears. The button turns into a timer (e.g., `05:23`).

**Stop**: Click the timer → "Recording saved" toast → video auto-saves to your browser's download directory.

> Recording doesn't stop automatically — you must click Stop manually. Closing the browser or refreshing the page also stops it. If the video stream disconnects unexpectedly, recording stops automatically (no notification).

## File Naming

`flexkvm-recording-YYYY-MM-DDTHH-MM-SS.{extension}`

e.g., `flexkvm-recording-2026-05-12T21-44-20.webm`

## Recording Settings

Adjust in Settings → Capture → **Recording**.

![Recording settings](./images/record/setting_record.webp)

| Setting | Options | Description |
|---------|---------|-------------|
| Mute Recording | On/Off | When enabled, the video contains no audio |
| Container | WebM / MKV | Listed according to browser support; WebM is the browser-native format |
| Video Codec | Listed per container | Auto-detects codecs available on this machine, labeled (hardware)/(software); hardware encoding uses less CPU |
| Video Quality | Low / Medium / High / Ultra (1 / 2 / 4 / 8 Mbps) | Higher is sharper and larger |

> The container format matches the video file extension (.webm / .mkv). The codec is how the picture gets compressed: hardware-labeled codecs use dedicated hardware and save the most CPU. Recording is based on WebCodecs: codecs unsupported by this machine never appear in the list, and a saved format that is no longer supported falls back to an available one.

---

**No audio in recording?** → Check if mute recording is enabled, and whether the host has audio output.

**File won't play?** → Switch to MKV (H.264) for best compatibility.

**Stuttering or high CPU during recording?** → Pick a codec labeled (hardware), or lower the video quality.

**Laggy or dropped frames?** → Lower the resolution or quality in [Remote Display](screen.md) to reduce encoding load.

> Do not switch quality or EDID during recording — the recorded video may glitch or become corrupted. Recording doesn't stop when the host sleeps or HDMI disconnects — the display shows the corresponding message instead.

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
