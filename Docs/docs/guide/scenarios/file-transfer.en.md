# Remote File Transfer

The target host needs drivers, scripts, or logs — and you're not there. FlexKVM turns the TF card into a "remote USB drive" or "virtual CD-ROM" for the target host — bidirectional file transfer.

---

## Before You Begin

| You need | Notes |
|----------|-------|
| FlexKVM online with working remote display | → [Quick Start](../../quick_start/index.md) |
| TF card (MicroSD) | For storing files to transfer |
| Card reader | To copy files from your computer to the TF card (or upload directly via browser) |

---

## Pick Your Mode

| Mode | Target host sees | Best for |
|------|------------------|----------|
| **Partition sharing** | A USB drive | Any file: driver packages, scripts, firmware, logs |
| **File sharing** | A CD-ROM | System ISO images, driver disc images |

> The two modes are mutually exclusive — only one can be active at a time.

---

## Option 1: Partition Sharing (Transfer Any File)

Export an entire TF card partition as a USB storage device. The target host can read all files on it and write to it.

### 1. Prepare Files

**Method A: Pre-load from computer (for lots of files or large files)**

TF card into computer → format as exFAT → drag files onto it → eject.

**Method B: Upload via browser (for a few small files on the fly)**

TF card into FlexKVM → mount partition → in the file list, click **Upload** → select files from your computer.

### 2. Share to the Target Host

FlexKVM top bar → click **disk image** icon → select TF card partition → click **Share**.

> **Verify**: The target host's file explorer (Windows) or desktop (macOS) shows a new USB storage device.

> If the partition is currently mounted (you can see file list), you need to **unmount** first, then share.

### 3. Use on the Target Host

- **Windows**: Automatically assigned a drive letter, appears in File Explorer
- **Linux**: Auto-mounted to `/media/` or `/mnt/`
- **macOS**: External disk icon appears on the desktop

Use it like a normal USB drive — copy, paste, open, write.

### 4. When You're Done

1. First, **on the target host**, eject the USB device (right-click → Eject)
2. Then go back to FlexKVM's disk image interface and click **Unshare**

> Don't skip step 1. Unsharing without ejecting first may corrupt files.
>
> Full disk sharing, partition mounting, read-only protection, safe removal → [Storage Management](../peripherals/disk.md)

---

## Option 2: File Sharing (Transfer ISO Images)

Turn a single `.iso` or `.img` file into a virtual CD-ROM — the target host sees it as a CD-ROM drive. Use this for installing OS or transferring driver disc images.

### 1. Prepare the Image File

Put the `.iso` / `.img` file on the TF card (computer pre-load or browser upload — both work).

### 2. Mount and Share

1. TF card into FlexKVM → top bar click **disk image** icon
2. Select partition → click **Mount** → file list appears
3. Check the `.iso` / `.img` file to share → click **Share File**

> **Verify**: The target host shows a CD-ROM device. Windows auto-plays, and BIOS can boot from it.
>
> File format requirements, mount failure troubleshooting → [Storage Management](../peripherals/disk.md)

---

## Quick Reference

| What you want | Use | What to send |
|---------------|:---:|--------------|
| Install drivers | Partition sharing | Driver installers |
| Send diagnostic scripts | Partition sharing | `.bat` / `.sh` / `.ps1` |
| Retrieve logs from target host | Partition sharing | Target host writes → FlexKVM downloads |
| Remote OS install | File sharing | ISO system image |
| Driver CD transfer | File sharing | `.iso` driver disc image |

---

## Next Steps

- Install an OS from ISO → [Remote OS Install](reinstall-os.md)
- Combine with remote power control → [Remote Power Control](power-control.md)

---

[:octicons-arrow-left-24: Back to Scenarios](index.md)
