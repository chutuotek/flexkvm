# Remote OS Install

System crashed? Want to switch OS? Setting up a new machine? No need to haul a monitor and keyboard over there. This workflow covers the full process from start to finish — each step tells you what to expect, with known pitfalls flagged.

> The whole process takes about 30–60 minutes, depending on ISO size and install speed.

---

## Before You Begin

| You need | Notes |
|----------|-------|
| FlexKVM online with working remote display | Not set up yet? → [Quick Start](../../quick_start/index.md) |
| TF card (MicroSD), recommend ≥ 16GB | For storing the system ISO image |
| Card reader | To copy the ISO from your computer to the TF card |
| ATX controller connected | For remotely rebooting the target host into BIOS. If not connected — manually press the target host's power button instead, rest of the steps are the same |
| System ISO image | The OS installer image you want to install |

---

## Step 1: Put the ISO Image on the TF Card

> 💡 This is a simplified guide. For full TF card management, partition mounting, and file upload details → [Storage Management](../peripherals/disk.md)

### 1.1 Format the TF Card

Insert the TF card into your computer's card reader and format it as **exFAT**.

| Filesystem | When to use |
|------------|-------------|
| exFAT | **Recommended**. Required if ISO is over 4GB |
| FAT32 | Only if ISO is under 4GB |

### 1.2 Copy the ISO File

Drag your downloaded system ISO image onto the TF card.

### 1.3 Insert into FlexKVM

Insert the TF card into FlexKVM's side slot (metal contacts facing up toward the power LED, push until you feel a click).

> **Verify**: In the Web interface, click the disk image icon in the top bar — the popup menu should show the TF card's partition info. Don't see it? → Make sure the TF card is formatted as exFAT or FAT32 (NTFS is read-only).

---

## Step 2: Mount the ISO as a Virtual CD-ROM

> 💡 This is a simplified guide. For full disk sharing, partition sharing, and safe TF card removal → [Storage Management](../peripherals/disk.md)

### 2.1 Mount the Partition

In the disk image menu, select the TF card partition → click **Mount**.

> **Verify**: A file list appears on the right, with total and used capacity shown at the top. You should see the ISO file you just placed there.

### 2.2 Share as CD-ROM

Check the ISO file → click **Share File**.

> **Verify**: The target host will recognize it as a USB CD-ROM. In the BIOS boot menu, you should see a USB CD-ROM device.

> If there are leftover entries in the share list, cancel them first, then re-share.

---

## Step 3: Reboot and Enter BIOS

### 3.1 Reboot the Target Host

In FlexKVM's top bar, click the power icon → short-press the reset button. The target host begins rebooting.

### 3.2 Press the BIOS Hotkey

**The remote display has a 1–2 second delay — don't wait for the screen to update.** Start pressing the BIOS hotkey immediately after clicking reset, and keep pressing until you see the BIOS screen:

| Brand | Hotkey |
|-------|:------:|
| Dell | F2 |
| HP | F10 or Esc |
| Lenovo | F1 or F2 |
| ASUS / Gigabyte / MSI (DIY boards) | Delete |
| Servers (Supermicro, etc.) | Delete or F2 |

> **Hotkey not working?** Check two things:
> 1. Is the **target OS** set correctly in keyboard settings (Windows / Linux / macOS)?
> 2. In fullscreen mode, Esc gets intercepted by the browser — exit fullscreen first, or use the mapped Esc key (default: Right Ctrl)
>
> **Missed the BIOS prompt (black screen)?** Short-press the reset button again, and start pressing the hotkey before the display lights up this time.

---

## Step 4: Set Boot from CD-ROM

Once in BIOS:

1. Find the **Boot** tab
2. Move USB CD-ROM or USB Device to the first boot entry
3. Save and exit (usually F10)

Different motherboards have different BIOS layouts, but the goal is the same: **make the system boot from the virtual CD-ROM, not the hard drive.**

---

## Step 5: Install the System

After saving BIOS settings, the target host boots from the virtual CD-ROM and enters the OS installer. From here:

- Operate directly in your browser — mouse and keyboard work throughout
- When you need to enter a username or password, use **Paste Text** in the keyboard menu (ASCII and numbers only)

The system will auto-reboot several times during installation:
- If it boots back into the installer → normal, the BIOS boot order hasn't changed, continue installing
- After installation finishes → **go back into BIOS and set boot back to the hard drive** (yes, you need to enter BIOS again), otherwise every reboot goes back to the installer. Then, in the disk image menu, **unshare** the ISO file.

---

## FAQ

**Don't see the virtual CD-ROM in BIOS?**

→ The ISO file wasn't shared successfully. Go to the disk image menu, confirm the file status is `Shared`, and confirm the TF card format is compatible.

**Network dropped mid-install?**

→ The installation happens between FlexKVM and the target host — **FlexKVM doesn't need internet access** during install. As long as FlexKVM stays powered and the USB and HDMI cables stay connected, the install continues. Reconnect to the Web interface once the network is back.

> ⚠️ **Do not toggle mouse, keyboard, or audio during installation.** These actions cause a brief USB disconnect — the virtual CD-ROM drops with it, and the install will fail.

---

## Next Steps

- After installing, harden security → [Security Hardening](security.md)
- For future firmware upgrades → [Daily Operations](daily-ops.md)
- To do the entire install from outside → [Remote Access](remote-access.md)

---

[:octicons-arrow-left-24: Back to Scenarios](index.md)
