# ThermoPro - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/thermopro
- Final URL: https://www.home-assistant.io/integrations/thermopro
- Canonical URL: https://www.home-assistant.io/integrations/thermopro/
- Fetched at: 2026-06-28T03:22:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ThermoPro devices into Home Assistant.

## Extracted Text

On this page
Supported devices
Configuration
Buttons
Button Set Date&Time
Integrates ThermoPro devices into Home Assistant.
TP357 Bluetooth Indoor Thermometer Hygrometer
TP358 Bluetooth Indoor Thermometer Hygrometer
TP359 Bluetooth Indoor Thermometer Hygrometer
TP393 Bluetooth Indoor Thermometer Hygrometer
TP960 TempSpike Bluetooth Meat Thermometer
TP962 Twin TempSpike Bluetooth Meat Thermometer
TP970 TempSpike Plus Bluetooth Meat Thermometer
The ThermoPro integration will automatically discover devices once the Bluetooth integration is enabled and functional.
To add the ThermoPro device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ThermoPro .
Follow the instructions on screen to complete the setup.
These actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allow one to set the time on supported devices (TP358, TP393) via Home Assistant.
Sets the date & time on target devices to the system time in 24-hour notation.
The device is capable of showing 12-hour notation (AM/PM) but setting this is currently not implemented.
For example, the following automation sets the datetime of the thermometer each day.
mode : single triggers : - trigger : time at : " 03:03:03" conditions : [] actions : - action : button.press target : entity_id : button.tp_358_xxxx_your_device_set_date_time data : {}
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ThermoPro device was introduced in Home Assistant 2022.9, and it's used by
2758 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@h3ss
Categories
Sensor
Back to top
