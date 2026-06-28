# Goal Zero Yeti - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/goalzero
- Final URL: https://www.home-assistant.io/integrations/goalzero
- Canonical URL: https://www.home-assistant.io/integrations/goalzero/
- Fetched at: 2026-06-28T02:46:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Goal Zero Yeti with Home Assistant

## Extracted Text

On this page
Configuration
Integration entities
This Goal Zero Yeti integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] pulls data from a Wifi-enabled Goal Zero Yeti .
To add the Goal Zero Yeti device to your Home Assistant instance, use this My button:
Goal Zero Yeti can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Goal Zero Yeti .
Follow the instructions on screen to complete the setup.
Each added configuration entry will create the following binary sensors:
Backlight : Indicates if the backlight is currently on.
App Online : Indicates if the mobile app is actively being used.
Charging : Shows when the battery is currently charging.
Input Detected : Shows when the device detects power input.
The following switches will also be created:
12V Port Status : Indicates if the 12V power port is currently on.
USB Port Status : Indicates if the USB power port is currently on.
AC Port Status : Indicates if the AC power port is currently on.
The following sensors will also be created:
Watts In : Shows the watt input.
Amps In : Shows the ampere input. (disabled by default)
Watts Out : Shows the watt output.
Amps Out : Shows the ampere output. (disabled by default)
WH Out : Shows the watt-hour output. (disabled by default)
WH Stored : Shows the current watt-hours stored.
Volts : Shows the voltage of the battery. (disabled by default)
State of Charge Percent : Shows the current battery charge percentage.
Temperature : Shows the battery temperature.
Time to Empty/Full : Shows the time left in minutes to empty or full depending on current usage. Shows -1 when there is no battery activity.
Wi-fi Strength : Shows the Wi-fi strength the device has with the connected access point.
Total Run Time : The total run time of the device. (disabled by default)
Wi-Fi SSID : The W-Fi network the device is connected to. (disabled by default)
IP Address : The IP address of the device. (disabled by default)
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Goal Zero Yeti device was introduced in Home Assistant 0.116, and it's used by
82 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Energy
Back to top
