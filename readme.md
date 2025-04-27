# 🛠️ voron.local

> **LDO Voron 2.4 Rev D – 350mm Build**

---

## 📚 Table of Contents

- [📁 Repo Structure](#-repo-structure)
- [📝 Build Notes](#-build-notes)
- [⚙️ GCode Snippets](#-gcode-snippets)
- [💻 Software Stack](#-software-stack)
- [🛒 Extra Parts](#-extra-parts)
- [🔗 Useful Links](#-useful-links)
- [🛒 Additional Items](#-additional-items)
- [🌱 Future Plans](#-future-plans)

---

## 📁 Repo Structure

- `home/kevin/` — Backup of bash profile and Git config
- `OrcaSlicer_profile/` — Backup of OrcaSlicer settings
- `pdf/` — Assembly manual
- `printer_data/config/` — Printer config + macros backup
- `scripts/` — Scripts to backup/restore `~/printer_data/config`
- `orca-manager.cmd` — Windows utility to backup/restore OrcaSlicer

---

## 📝 Build Notes

- Install bed Wago connector, Nevermore filter, and bed wiring immediately after bed rails/panel installation — not later as manual suggests.
- Belt length was sufficient; cutting slightly longer would have improved toolhead routing.
- Without a metric tape, marked 500mm/500mm/200mm increments using tape and a yardstick.
- Manual's center DIN rail position didn’t fit; routed wires down the middle instead.
- Easy to connect display flex cable backward — verify orientation carefully.
- Nevermore blower fan clearance: trim clips and blower outlet carefully; brittle plastic cracks easily.
- Heat inserts worked best at:
  - 650°F for ABS parts
  - 850°F for blower fan injection molded bodies

---

## ⚙️ GCode Snippets

**ABS PID Tuning**
```gcode
PID_CALIBRATE HEATER=heater_bed TARGET=105
PID_CALIBRATE HEATER=extruder TARGET=260
```

**PLA PID Tuning**
```gcode
PID_CALIBRATE HEATER=heater_bed TARGET=60
PID_CALIBRATE HEATER=extruder TARGET=200
```

---

## 💻 Software Stack

- Raspbian 64-bit (Lite version also fine)
- Raspberry Pi Imager for flashing
- Enable SSH and WiFi
- Set hostname (`voron.local`)
- Install via KIAUH (aliased as `klipper`):
  - Klipper
  - Moonraker
  - Mainsail
  - KlipperScreen
  - Crowsnest

---

## 🛒 Extra Parts

- [Camera Mount (OV5640)](https://www.printables.com/model/1041349-ov5640-camera-mount-0-180deg/files)
- [Nozzle Scrubber STL](https://www.printables.com/model/201999-nozzle-scrubber-with-a-little-bucket-for-voron-24)
- [Print Bed Scraper](https://www.printables.com/model/512935-print-bed-scraper)
- [Rail Alignment Tools (MGN9/MGN12)](https://www.printables.com/model/450861-mgn9-mgn12-linear-rail-2020-alignment-tools/files)
- [Service Rockers](https://www.printables.com/model/456448-service-rockers-voron-v2-vtv1/collections)
- [Gantry Install Hooks](https://www.printables.com/model/173635-voron-v24-gantry-installation-hook-new-version/files)
- [Polymaker Double Barrel Dry Box Mod](https://www.printables.com/model/865750-polymaker-polydryer-double-barrel-mod)
- [M2 Panel Quick Latches](https://www.printables.com/model/643837-wide-voron-panel-snap-latch-with-lip-using-m2-scre)
  - PanelDepth adjustments:
    - 5mm for 3mm panel + 3mm foam
    - 3.5mm for 3mm panel + 1mm foam
  - [M2x10mm Hex Head Self Tapping Screws](https://www.amazon.com/gp/product/B0B18QWR3L/ref=ox_sc_act_title_1?smid=ATBOIVAD2XKFJ&psc=1)
    - 4 screws per hinge
    - 6 hinges per side
    - 24 hinges total
    - 96 screws total
- [Magnetic Door Hinges](https://www.printables.com/model/221377-voron-24-magnetic-door-hinges)
- [Door Handles (V0 LDO Version)](https://www.printables.com/model/560582-sturdy-voron-v0-door-handle-with-ldo-version/files) — using `V0DoorHandleLDOThinnerTape.stl`

---

## 🔗 Useful Links

- [🔄 Rotate Klipper Screen](https://docs.ldomotors.com/en/guides/btt_43_rotate_guide)
- [🔍 Get USB IDs](https://docs.ldomotors.com/en/guides/klipper_id)
- [📚 LDO Build Notes](https://docs.ldomotors.com/en/voron/voron2/build-faq)
- [📈 LDO Wiring Guide](https://docs.ldomotors.com/en/voron/voron2/wiring_guide_rev_d)
- [🔧 Klipper Install Helper (KIAUH)](https://github.com/dw-0/kiauh)
- [🛠️ NiteHawk SB Toolboard Guide](https://docs.ldomotors.com/en/Toolboard/nitehawk-sb)
- [📑 Default Printer Config](https://raw.githubusercontent.com/MotorDynamicsLab/LDOVoron2/refs/heads/main/Firmware/leviathan-printer-rev-d.cfg)
- [🚀 Initial Startup Guide](https://docs.vorondesign.com/build/startup/)
- [🎯 Klicky Probe Guide](https://github.com/jlas1/Klicky-Probe/tree/main/Printers/Voron/v1.8_v2.4_Legacy_Trident)
- [📹 Klicky Probe Video Walkthrough](https://www.youtube.com/watch?v=dWMh_TOIBIo)
- [⚙️ Auto Z-Offset Install](https://github.com/protoloft/klipper_z_calibration/wiki/How-To-Install-It)
- [📹 Auto Z-Offset Video Walkthrough](https://www.youtube.com/watch?v=oQYHFecsTto)
- [🛡️ Orca Backup Manager](https://ilkos-home.blogspot.com/p/orca-slicer-pm.html)
- [🔄 Adaptive Mesh Purging](https://github.com/kyleisah/Klipper-Adaptive-Meshing-Purging)
- [📹 Adaptive Mesh Video Walkthrough](https://www.youtube.com/watch?v=HydfV8h4p60)
- [📸 Webcam Setup for Klipper](https://www.obico.io/blog/klipper-camera-mainsail/)

---

## 🛒 Additional Items

- [Nevermore Activated Carbon Pellets](https://www.amazon.com/dp/B01GN7ZQ70?ref=ppx_yo2ov_dt_b_fed_asin_title)
- [Webcam (Recommended Model)](https://www.amazon.com/dp/B0CC98XCHH?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1)

---

## 🌱 Future Plans

- [Ellis Tuning Guide](https://ellis3dp.com/Print-Tuning-Guide/)
- Input Shaping
- DIN Rail Covers
- Double Barrel Dry Box Mod
- KlipperScreen Custom Configs
