# voron.local

LDO Voron 2.4 Rev D 350mm

### Repo Structure

- `home/kevin`: Backup of bash profile and git config.
- `OrcaSlicer_profile/`: Backup of OrcaSlicer settings
- `pdf/`: Assembly manual
- `printer_data/config`: Backup of printer config + all macros
- `scripts`: Scripts used to backup and restore `~/printer_data/config`
- `orca-manager.cmd`: Windows utility to backup and restore OrcaSlicer

### My build notes

1. The bed wago connector, nevermore filter, and above deck bed wiring should have been assembled and mounted as soon as the bed rails / panel was in place. Those don't come up in the manual until much later, and you end up having to remove the bed a few times which is a pain.

1. There was plenty of belt to run the AB lines. I should have cut them a little bit longer so they came out of the toolhead mount.

1. I didn't have a metric tape measure, or a direct way of marking 1.2m for the Z belt cuts. I ended up putting tape on the floor and using a yardstick to mark out 500mm/500mm/200mm increments.

1. There wasn't enough space for the center DIN rail as marked in the manual. I ended up just running the wires down the middle anyway.

1. Don't get the display flex cable backwards. It's very easy to get backwards.

1. There was a clearance issue with the blower fans in the nevermore filter. You have to trim both the housing clips and the blower outlet. The plastic was extremely brittle and cracked when using flush cutters.

1. Heated inserts worked best at `650F` in ABS and `850F` into injection molded blower fan bodies.

### GCode

Bed PID Tune
```
PID_CALIBRATE HEATER=heater_bed TARGET=100
SAVE_CONFIG
```

Nozzle PID Tune
```
PID_CALIBRATE HEATER=extruder TARGET=245
SAVE_CONFIG
```

### Software

- Raspbian 64bit
    - You can also use the Lite version.
    - Use the official Rasberry Pie Media Creator
    - Enable SSH and Wifi connection
    - Set hostname (e.g. `voron.local`)
- Klipper Install Update Helper ( aliased as `klipper`)
    1. Klipper
    2. Moonraker
    3. Mainsail
    5. KlipperScreen
    14. Crowsnest

### Extra Parts

- [Camera Mount](https://www.printables.com/model/1041349-ov5640-camera-mount-0-180deg/files)

- [Nozzle Scrubber STL](https://www.printables.com/model/201999-nozzle-scrubber-with-a-little-bucket-for-voron-24)

- [Print Bed Scraper](https://www.printables.com/model/512935-print-bed-scraper)

- [Rail Alignment Tooks](https://www.printables.com/model/450861-mgn9-mgn12-linear-rail-2020-alignment-tools/files)

- [Rockers](https://www.printables.com/model/456448-service-rockers-voron-v2-vtv1/collections)

- [v2 Gantry Install Hooks](https://www.printables.com/model/173635-voron-v24-gantry-installation-hook-new-version/files)

- [Polymaker Dry Box Double Barrel](https://www.printables.com/model/865750-polymaker-polydryer-double-barrel-mod)

- [Panel Quick Latches (v3.5mm x 32)](https://www.printables.com/model/172368-voron-24-filament-latch-or-any-2020-extrusion)

### Links

- [Rotate Klipper Screen](https://docs.ldomotors.com/en/guides/btt_43_rotate_guide)

- [Get USB IDs](https://docs.ldomotors.com/en/guides/klipper_id)

- [LDO Build Notes](https://docs.ldomotors.com/en/voron/voron2/build-faq)

- [LDO Wiring Guide](https://docs.ldomotors.com/en/voron/voron2/wiring_guide_rev_d)

- [Klipper Install and Update Helper](https://github.com/dw-0/kiauh)

- [NiteHawk SB Guide](https://docs.ldomotors.com/en/Toolboard/nitehawk-sb)

- [Default printer.cfg](https://raw.githubusercontent.com/MotorDynamicsLab/LDOVoron2/refs/heads/main/Firmware/leviathan-printer-rev-d.cfg)

- [Initial Startup Guide](https://docs.vorondesign.com/build/startup/)

- [Klicky Probe Guide](https://github.com/jlas1/Klicky-Probe/tree/main/Printers/Voron/v1.8_v2.4_Legacy_Trident)

- [Klicky Video Guide](https://www.youtube.com/watch?v=dWMh_TOIBIo)

- [Auto Z Offset](https://github.com/protoloft/klipper_z_calibration/wiki/How-To-Install-It)

- [Auto Z Offset Video Guide](https://www.youtube.com/watch?v=oQYHFecsTto)

- [Orca Backup Manager](https://ilkos-home.blogspot.com/p/orca-slicer-pm.html)

- [Klipper Adaptive Mesh Purging](https://github.com/kyleisah/Klipper-Adaptive-Meshing-Purging)

- [Klipper Adaptive Mesh Video Guide](https://www.youtube.com/watch?v=HydfV8h4p60)

- [Klipper Webcam Setup](https://www.obico.io/blog/klipper-camera-mainsail/)

### Additional Items

- [Nevermore Carbon Pellets](https://www.amazon.com/dp/B01GN7ZQ70?ref=ppx_yo2ov_dt_b_fed_asin_title)

- [Webcam](https://www.amazon.com/dp/B0CC98XCHH?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1)

### Still to do

- [Ellis Tuning Guide](https://ellis3dp.com/Print-Tuning-Guide/)

- Pressure advance tuning
- Input shaping
- Extruder calibration?
- Outer panels
- Din rail covers
- Double barrel dry box mod
- Check all bolts
- KlipperScreen config?
