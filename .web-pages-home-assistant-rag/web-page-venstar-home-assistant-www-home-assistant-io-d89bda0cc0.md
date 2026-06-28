# Venstar - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/venstar
- Final URL: https://www.home-assistant.io/integrations/venstar
- Canonical URL: https://www.home-assistant.io/integrations/venstar/
- Fetched at: 2026-06-28T03:26:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for how to integrate Venstar WiFi thermostats within Home Assistant.

## Extracted Text

On this page
Enabling local API
Configuration
The Venstar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Venstar thermostats from Home Assistant.
Venstar thermostats feature a local API that allows for automation without the need for their Skyport cloud service.
Currently supported and tested thermostats:
ColorTouch T7900
ColorTouch T7850 (No Humidity control)
Explorer Mini T2000
Explorer IAQ T3950
Currently supported functionality:
Setting heat/cool temperature when the thermostat is in the appropriate mode.
Changing the operation mode of the thermostat (heat/cool/off/auto)
Turning the fan on/off
Reading and setting the humidity level and limits (T7900 only)
Turning on away preset
Turning on hold mode preset
Remote temperature sensors
Thermostat alerts (Filter replacement/etc)
Reading IAQ and CO2 levels (on supported devices, e.g. T3950, only)
Reading the current schedule state (morning/day/evening/night/inactive)
The following values are supported for the preset_mode state attribute:
none : Enables the scheduling functionality.
temperature : Disables the schedule and holds the set temperature indefinitely.
away : Places the thermostat in away mode
Note - Please ensure that you update your thermostat to the latest firmware. Initially tested on firmware 5.10 and currently VH6.79.
Local API mode needs to be enabled on the thermostat itself. It cannot be enabled using the Venstar mobile apps or Skyport cloud service. Exact steps vary across different series of thermostats:
ColorTouch
Menu > WiFi > Local API Option > Local API - ON .
EXPLORER / EXPLORER IAQ
Press SETUP .
Press MODE repeatedly until you see LOCAL API .
Press WARMER to toggle “ON”.
Press SETUP to exit.
EXPLORER Mini
Press and hold MODE + FAN together for 5 seconds.
Press MODE repeatedly until you see “API”.
Press MODE + FAN together to exit.
If the local API is successfully enabled on the thermostat, you should see some basic API info when you navigate to its IP address in a web browser:
{ "api_ver" : 7 , "type" : "commercial" , "model" : "VYG-4800" , "firmware" : "2.22.19" }
To add the Venstar device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Venstar .
Follow the instructions on screen to complete the setup.
Host
The IP address of your thermostat, for example, 192.168.1.32 .
Username
Username for the thermostat. Only supported on ColorTouch models.
Password
Password for the thermostat. Only supported on ColorTouch models.
PIN
The lock screen PIN, if you have enabled the lock screen on the thermostat.
SSL
Whether to use HTTPS when communicating with the thermostat. Only supported on ColorTouch models.
Note
HTTPS, username, and password authentication are only available on ColorTouch thermostats. Other models, such as the Explorer Mini and Explorer IAQ, only support unencrypted HTTP connections with no authentication.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Venstar device was introduced in Home Assistant 0.62, and it's used by
359 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@garbled1
@jhollowe
Categories
Binary sensor
Climate
Sensor
Back to top
