# Marlin Firmware

This is a repository to store my personal Marlin Firmware configurations with an additional easy to use build environment.

## Hardware

My hardware is quite different from the stock Creality Ender 3 V2. The following changes have been made:
- Replaced the bowden tube setup with the Microswiss Direct Drive Kit.
- Replaced the Hotend with the Microswiss All Metall Hotend.
- Replaced the big extruder motor with a smaller one (42-34 instead of the 42-40).
- Removed the included Microswiss Direct Drive Kit Adapter Cable.
- Moved the an magnetic build plate without any clips.
- Moved all electronics into vertical cases behind the Z-Axis.
- Controlling prints from OctoPrint with additional extensions.
- Use a printed LCD enclosure with a vertical mount on the left side of the printer.
- Replaced all fans. Everythig except for the Part Cooling fan, have been replaced with noctua 12V fans (using buck converters) and the part cooling fans with a blower fan using a hydraulic bearing.
- Replaced the Creality Motherboard v4.2.2 with a newer v4.2.7.
- Replaced the Z endstop with a BLTouch v3.1.

## Config changes

The following configuration changes have been made due to the following reasons:

### `Configuration.h`

- **MOTHERBOARD** changed from `BOARD_CREALITY_V4` to `BOARD_CREALITY_V427` as I've replaced the motherboard.
- **DEFAULT_AXIS_STEPS_PER_UNIT** changed as I've calibrated the new eSteps for the stepper motor.
- **S_CURVE_ACCELERATION** use smoother acceleration.
- **Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN** removed as I use the following option.
- **USE_PROBE_FOR_Z_HOMING** as I used a BLTouch.
- **PROBE_MANUALLY** removed as I use a BLTouch.
- **BLTOUCH** added as I use a BLTouch.
- **NOZZLE_TO_PROBE_OFFSET** changed, as I use a Stansana Hotend mount with the specified offset values.
- **XY_PROBE_FEEDRATE** increased, as I want faster probing as done in the Jyers Configurations.
- **INVERT_E0_DIR** set to true, as I don't use the adapter cable for the direct drive.
- **X_BED_SIZE** increased to 230 to use more of the bed.
- **X_MIN_POS** and **Y_MIN_POS** to use the new offsets for the microswiss direct drive kit.
- **X_MAX_POS** increased to allow the nozzle to move over the heated bed egde for probing.
- **AUTO_BED_LEVELING_BILINEAR** replaced with **AUTO_BED_LEVELING_UBL** to use UBL Leveling.
- **RESTORE_LEVELING_AFTER_G28** to restore leveling settings after homing.
- **UBL_HILBERT_CURVE** for less long movements during probing.
- **Z_SAFE_HOMING** to always home Z in the center of the bed due to the BLTouch.
- **PREHEAT_2** changed to a PETG profile.
- **SOFT_PWM_SCALE** for higher PWM frequency due to the part cooling fan bearing.

### `Configuration_adv.h`

- **BLTOUCH_HS_MODE** as I want faster probing.
- **PROBE_OFFSET_WIZARD** to have a lcd menu for probe offset settings.
- **LCD_SET_PROGRESS_MANUALLY** as I send the progress values through OctoPrint.
- **LCD_SHOW_E_TOTAL**, **SHOW_REMAINING_TIME** more progress information.
- **POWER_LOSS_RECOVERY** removed as I don't need/want this option.
- **BINARY_FILE_TRANSFER**, **CUSTOM_FIRMWARE_UPLOAD** added to test firmware updates through the serial connection.
- **ADVANCED_PAUSE_FEATURE** added to allow filament changes during the print with the slicer options.
- **FILAMENT_CHANGE_UNLOAD_LENGTH** reduced due to the direct drive extruder length.
- **ADVANCED_PAUSE_FANS_PAUSE** added, as no one needs these fans running during filament change.