# Remote Power Control

Front panel buttons are mapped to FlexKVM's ATX controller, letting you power on/off or reset the host as if you were pressing the case buttons yourself.

> **Only want WoL without opening the case?** Skip to [Step 3](#step-3-configure-wake-on-lan-wol). Prerequisite: the target host has an Ethernet cable plugged in and WoL is enabled in BIOS.

---

## Before You Begin

| You need | Notes |
|----------|-------|
| FlexKVM online with working Web interface | → [Quick Start](../../quick_start/index.md) |
| ATX controller | Included in the package, for physical power control |
| ATX Dupont wires | Included in the package, connects to motherboard headers |
| Phillips-head screwdriver | For opening the case (if the motherboard headers are hard to reach) |

---

## Step 1: Install the ATX Controller

> 💡 This is a simplified guide. For full pin definitions, two wiring methods with diagrams, and expansion → [ATX Power Control](../peripherals/atx.md)

### 1.1 Locate the Motherboard Power Headers

Open the case and find the **front panel header** on the motherboard — the row of pins behind the case's power button and reset button. Usually in the bottom-right corner, labeled `JFP1`, `F_PANEL`, or `PANEL`.

You need two pairs of pins:

| Header | Motherboard label | What it does |
|--------|-------------------|--------------|
| Power switch | `PWR_SW`, `PWRBTN` | Shorting it = pressing the power button |
| Reset switch | `RST_SW`, `RESET` | Shorting it = pressing the reset button |

> Can't find them? Check your motherboard manual's "Front Panel Connector" section, or search your motherboard model + `front panel pinout`.

### 1.2 Connect the Dupont Wires

Use Dupont wires to connect the ATX controller's two channels to the corresponding motherboard headers:

- Channel 1 → Power switch header
- Channel 2 → Reset switch header

Dupont wires are not polarized — orientation doesn't matter, just plug them in securely.

### 1.3 Connect to FlexKVM

Plug the ATX controller's Type-C cable into FlexKVM's **ATX port**.

> **Verify**: The ATX icon appears on the OLED status bar. The ATX controller's power LED lights up.

---

## Step 2: Control Power from the Web Interface

In FlexKVM's top bar, click the **peripherals** icon to expand the ATX panel:

| What you want | Action |
|---------------|--------|
| Power on | Click power button → **Short press** |
| Graceful shutdown | Click power button → **Short press** (handled by the OS) |
| Force shutdown | Click power button → **Long press** (~4 seconds) |
| Reboot | Click reset button |

> ⚠️ Force shutdown and reset may cause data loss. When the system is responsive, always try a short press for normal shutdown first.

The two indicator lights at the top of the panel show the target host's status in real time: 🟢 Power LED (running) / 🟡 HDD LED blinking (read/write activity).

> Long-press duration, indicator meanings, expansion installation → [ATX Power Control](../peripherals/atx.md)

---

## Step 3: Configure Wake-on-LAN (WoL)

ATX handles physical switching, WoL handles network wake — together they cover every scenario:

- Device is off → WoL wakes it
- Device is on → ATX shuts down or reboots
- System is frozen → ATX force-shutdown, then WoL wakes it

### 3.1 Enable WoL in BIOS

Enter the target host's BIOS via FlexKVM's remote display (press Del / F2 during boot). Find and enable these options:

| BIOS option | Set to |
|-------------|:------:|
| Wake on LAN / WOL | Enabled |
| PCIe Wake / Power On By PCI-E | Enabled |
| ErP / EuP Ready | **Disabled** (this must be off, otherwise WoL won't work) |

> Most motherboards: **Advanced → Power Management**. Save, exit, and shut down normally. The Ethernet port light should stay on or blink — that means WoL is active.

### 3.2 Add a WoL Device

In FlexKVM's top bar, click the **Wake-on-LAN** icon:

1. Click **+** to add a device
2. Enter a device name (e.g., `OfficePC`, ASCII and numbers only) and MAC address (e.g., `AA:BB:CC:DD:EE:FF`)
3. Confirm and save

> Where to find the MAC address? Windows: `ipconfig /all` → "Physical Address". Linux: `ip addr`.

### 3.3 Wake It Up

In the WoL device list, click the lightning icon → FlexKVM sends a Magic Packet → device wakes up.

> WoL only works for devices with a **wired Ethernet** port. WiFi-connected devices are not supported.
>
> Add/remove devices, multi-device management → [Wake-on-LAN (WoL)](../network/wol.md)

---

## FAQ

| Issue | Most likely cause | Try this first |
|-------|-------------------|----------------|
| Power button does nothing | Dupont wires loose or wrong position | Check motherboard headers, confirm `atx` shows in peripherals panel |
| WoL won't wake | ErP not disabled in BIOS | Enter BIOS and confirm ErP is Disabled |
| Turns back on after shutdown | "Restore on AC Power Loss" enabled in BIOS | BIOS → Power Management → disable Restore on AC Power Loss |
| ATX controller not detected | Type-C cable loose | Re-plug, confirm ATX icon appears on OLED |

---

## Next Steps

- Control power from outside → [Remote Access](remote-access.md)
- Need to reinstall the OS → [Remote OS Install](reinstall-os.md)

---

[:octicons-arrow-left-24: Back to Scenarios](index.md)
