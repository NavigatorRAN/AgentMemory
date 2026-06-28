# Guntamatic - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/guntamatic
- Final URL: https://www.home-assistant.io/integrations/guntamatic
- Canonical URL: https://www.home-assistant.io/integrations/guntamatic/
- Fetched at: 2026-06-28T02:47:45Z
- Content type: text/html; charset=UTF-8

## Description

Guntamatic wood/pellet heater integration.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Data updates
Sensors
Removing the integration
To remove an integration instance from Home Assistant
The Guntamatic integration allows you to monitor your Guntamatic wood or pellet heater from Home Assistant.
This integration has been tested with the Guntamatic BMK 20 kW running firmware 32a. It should work with other Guntamatic heaters that support the same web interface. (http:// <ip> /daqdata.cgi)
Your Guntamatic heater must be connected to your local network and accessible via its IP address or hostname.
Check the screen on the Guntamatic: Customer Level, Detailed Display, scroll down to network.
To add the Guntamatic device to your Home Assistant instance, use this My button:
Guntamatic can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Guntamatic .
Follow the instructions on screen to complete the setup.
Host
The IP address or resolvable hostname of your Guntamatic heater. For example, 192.168.1.42 or kessel001.internal
The integration polls the Guntamatic heater every 30 seconds. The heater does not support push updates.
The integration creates a sensor for each data point provided by the heater. The available sensors depend on the heater model and firmware version. Example sensors include boiler temperature, outside temperature, buffer load, and heating circuit programs. Note that sensors with a value of -20.00 °C or -9.00 °C are not returned.
The following sensors are available for a Guntamatic BMK 20 heater:
Boiler temperature :
Description : Current temperature of the hot water in the boiler itself
Example value : 14.09
Unit : °C
Buffer load :
Description : Current load percentage of the thermal buffer tank
Example value : 22
Buffer bottom temperature :
Description : Temperature measured at the bottom of the buffer tank
Example value : 34.01
Buffer center temperature :
Description : Temperature measured in the middle of the buffer tank
Example value : 43.48
Buffer top temperature :
Description : Temperature measured at the top of the buffer tank
Example value : 44.56
Domestic hot water circuit 0 temperature :
Description : Temperature of domestic hot water circuit 0
Example value : 44.50
Outdoor temperature :
Description : Outside ambient temperature measured by the external sensor
Example value : 16.15
Program :
Description : Current global operating program mode
Possible values :
Away mode
Domestic hot water
Domestic hot water boost
Heat
Off
Setback mode
Timer
Unit : None
Room 0 temperature :
Description : Room temperature sensor reading for heating circuit 0
Example value : 60.00
Room 1 temperature :
Description : Room temperature sensor reading for heating circuit 1
Example value : 24.68
Room 2 temperature :
Description : Room temperature sensor reading for heating circuit 2
Example value : 21.77
Status :
Description : Current operating state of the system
Example value : Service Ign.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Guntamatic device was introduced in Home Assistant 2026.6, and it's used by
1 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@JensTimmerman
Categories
Sensor
Back to top
