# Storage Management

FlexKVM uses a TF card (MicroSD) for local storage expansion, supporting file management, virtual CD-ROM, and USB export. The two most common scenarios: sharing an ISO image as a virtual CD-ROM for remote OS installation, and transferring files between the TF card and the target host.

> Where: **Mirror** in the menu bar

## TF Card Requirements

| Item | Requirement |
|------|-------------|
| Card type | MicroSD (TF) card |
| Capacity | No hard limit |
| Filesystem | FAT32 / exFAT / ext4 / NTFS (exFAT recommended — no 4GB limit) |

## Installation

The TF card slot is on the side of the device, below the power LED. Insert with metal contacts facing the power LED — push until you hear a click.

> **Verify**: After insertion, the OLED storage icon shows connected. No change? Re-insert or check if the card is working.

![OLED showing TF connected](./images/disk/oled_tf_connected.webp)

## Disk Image Menu

![Disk image menu](./images/disk/disk.webp)

| Icon | Meaning |
|------|---------|
| ![](../icon/image/hard-drive.svg) | TF card inserted, idle |
| ![](../icon/image/hard-drive-off.svg) | No TF card |
| ![](../icon/image/upload.svg) | File upload in progress |
| ![](../icon/image/download.svg) | File download in progress |
| ![](../icon/image/server.svg) | Currently shared to host via USB / exporting image |

Five operations:

### Full Disk Sharing

Share the entire TF card as a USB drive — the host can see all partitions.

Select the TF card → click **Share**.

![Full disk sharing](./images/disk/disk_tf_share.webp)

> Enable read-only to prevent the host from writing.

### Partition Sharing

Share only a specific partition — other partitions are invisible to the host.

Select a partition → click **Share**.

![Partition sharing](./images/disk/disk_p_share.webp)

### Partition Mounting

Mount a partition to browse and manage files on FlexKVM.

Select partition → click **Mount** → file list, partition size, upload/unmount buttons appear.

![Partition mount](./images/disk/disk_mount.webp)

> The partition must use a supported filesystem (FAT32 / exFAT / ext4 / NTFS). When mounting fails, handle it by cause: for an NTFS card with a dirty bit or hibernation file, unmount and repair it on a PC first; otherwise try **Check / Repair** first.

**Uploads / downloads can be cancelled anytime**: click **Cancel** during a transfer — uploads stop sending and wait for the device to clean up; downloads discard the incomplete file. Cancellation shows "Cancelled" instead of a failure error; failures are reported with their specific cause.

### Partition Check & Repair

**Check** below the menu runs a filesystem consistency check on the selected partition; **Repair** also attempts to fix the problems found. Both require the partition to be unmounted and not shared, and repair may delete damaged files or directory entries — back up important data first.

| Result | Meaning |
|--------|---------|
| Filesystem is healthy, no problems found | Nothing to do |
| Problems found; click "Repair" to try fixing them | Issues detected, repair recommended |
| Filesystem repaired | Repair complete |
| Problems remain that cannot be fixed automatically; back up and reformat | Manual intervention needed |
| This filesystem type is not supported for checking | No check for this partition (NTFS supports mounting only, not check/repair) |
| Partition not found | The partition is gone; refresh the partition list and retry |
| Check timed out; the filesystem may be badly damaged | Check did not finish in time; the filesystem may be badly damaged |
| Checking tool missing on the device | No checking tool available for this partition |
| Check failed | Other failure reasons |

### Single File Sharing

Mount a partition first → check a `.img` or `.iso` file → click **Share File**. The host will recognize it as a virtual CD-ROM.

![File sharing](./images/disk/disk_file_share.webp)

> Files larger than 4GB are supported, but must be `.img` or `.iso` format.

### Safe Removal

| Current state | What to do |
|---------------|------------|
| Single file sharing | Unshare → Unmount partition → Remove card |
| Full disk / partition sharing | Unshare → Remove card |
| Mounted but not sharing | Unmount partition → Remove card |
| Inserted but no operation | Remove directly |

---

## FAQ

**TF card not detected?** → Check the filesystem. FAT32, exFAT, ext4 and NTFS are supported, with exFAT the most compatible; try **Check / Repair** on a partition that won't open, and only reformat as exFAT on a PC if that fails.

**Shared CD-ROM not recognized by host?** → Make sure the file is `.img` or `.iso`. Other formats can't be shared as a virtual CD-ROM.

**Upload interrupted?** → Refresh the page and re-upload. Resume is not currently supported. Cancellations and failures are reported separately — a cancellation is not an error.

**OS install failed halfway?** → Did you toggle mouse, keyboard, or audio during installation? These actions cause a brief virtual CD-ROM disconnect.

---

[:octicons-arrow-left-24: Back to User Guide](../index.md)
