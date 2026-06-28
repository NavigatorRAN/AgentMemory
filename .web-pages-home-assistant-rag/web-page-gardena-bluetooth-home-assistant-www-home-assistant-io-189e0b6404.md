# Gardena Bluetooth - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/gardena_bluetooth
- Final URL: https://www.home-assistant.io/integrations/gardena_bluetooth
- Canonical URL: https://www.home-assistant.io/integrations/gardena_bluetooth/
- Fetched at: 2026-06-28T02:45:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Gardena Bluetooth devices within Home Assistant.

## Extracted Text

On this page
Configuration
Pairing
Water control
Limitations
Factory reset
Irrigation valves
Lawn mowers
Gard Pumps
Aqua Contours
The Gardena Bluetooth integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows users to integrate their Gardena Bluetooth devices into Home Assistant.
See device section for support information: water control , irrigation valves , lawn mowers , garden pumps , aqua contours .
To add the Gardena Bluetooth device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Gardena Bluetooth .
Follow the instructions on screen to complete the setup.
Gardena devices remember previously paired Bluetooth adapters, up to 10, and only allow connections from those adapters. If you replace your adapter or use multiple Bluetooth proxies, the device must be paired with that proxy or adapter before it will connect. Otherwise, the device silently ignores the connection attempt. In Home Assistant, this usually appears as timeout errors.
If you have connection issues, put the device back into pairing mode so it can learn the new proxy or Bluetooth adapter. For some devices, such as the water control, a factory reset is required first.
Water Control Bluetooth ( 01889-20 )
Soil Moisture Sensors ( 1867-20 )
The paring of the device may require a factory reset before it allows a connection.
Control of offline scheduling settings is not supported.
Use of the official Android application, sometimes locks out access to device until factory reset is performed or Bluetooth is disabled in the Android device.
Remove the battery.
Push and hold Man. button and reinsert the battery.
Hold the button for approx. 10 seconds.
Irrigation Valve 9 V Bluetooth ( 1285-20 )
Irrigation valves are currently untested, but expected to work.
Irrigation Valve 9 V Bluetooth requires firmware version 1.7.23.29 or newer (update via Gardena Bluetooth App).
Gardena Bluetooth lawn mowers are currently not supported due to custom protocol on top of Bluetooth.
Garden Pump ( 9058-61 )
Garden Pump ( 9059-61 )
Aqua Precise Overground ( 16000-20 )
Aqua Precise Underground ( 16001-20 )
Configuration of contours is not supported and must be set up using the official application.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Gardena Bluetooth device was introduced in Home Assistant 2023.8, and it's used by
473 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@elupus
Categories
Binary sensor
Button
Number
Select
Sensor
Switch
Text
Valve
Back to top
