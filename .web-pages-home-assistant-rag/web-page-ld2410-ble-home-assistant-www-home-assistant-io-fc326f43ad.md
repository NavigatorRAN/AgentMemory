# LD2410 BLE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ld2410_ble
- Final URL: https://www.home-assistant.io/integrations/ld2410_ble
- Canonical URL: https://www.home-assistant.io/integrations/ld2410_ble/
- Fetched at: 2026-06-28T02:55:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate LD2410 BLE devices into Home Assistant.

## Extracted Text

On this page
Configuration
Sensors provided
Purchasing
Integrates LD2410 BLE sensors from Hi-Link into Home Assistant.
To add the LD2410 BLE device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LD2410 BLE .
Follow the instructions on screen to complete the setup.
You can currently configure the settings for motion/static triggers by USB with either the desktop software via Bluetooth. Download HLKRadarTool on Google Play or the App Store .
(This integration may not work if you reconfigure the default password or the number of gates.)
The following sensors are provided:
Motion detected
Occupancy detected
Moving target distance & energy*
Static target distance & energy*
Detection distance*
Number of moving/static gates
Moving energy at gates 0-8*
Static energy at gates 0-8*
* Denotes entity is hidden by default, but can be enabled in the UI.
Note
There are multiple similar versions of the board. Make sure to buy the LD2410B or LD2410C versions as these are the ones with Bluetooth and have been tested. The C variant has 2.54mm pitch pins which is the one used by Arduino type devices, whereas the B variant has half pitch pins.
You can buy this module bareboard or in a devkit from AliExpress .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LD2410 BLE device was introduced in Home Assistant 2023.2, and it's used by
1732 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@930913
Categories
Presence detection
Sensor
Back to top
