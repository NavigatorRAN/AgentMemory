# myStrom - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mystrom
- Final URL: https://www.home-assistant.io/integrations/mystrom
- Canonical URL: https://www.home-assistant.io/integrations/mystrom/
- Fetched at: 2026-06-28T03:02:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate myStrom WiFi Switches, Bulbs and Motion Sensors into Home Assistant.

## Extracted Text

On this page
Lights, switches and motion sensors
Configuration
Binary sensor
Related topics
There is currently support for the following device types within Home Assistant:
The myStrom integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your myStrom Wi-Fi Bulbs, Wi-Fi Switches and Wi-Fi Motion Sensors. Make sure that you have enabled the REST API under Advanced in the web frontend of the switch.
Supported devices are:
Switch CH v1 (101)
Bulb (102)
LED strip (105)
Switch CH v2 (106)
Switch EU (107)
Motion Sensor (110)
Switch Zero (120)
Two sensors are available for switches:
Temperature
Energy consumption
Two HA sensors are available for motion sensors:
Illuminance
To add the myStrom device to your Home Assistant instance, use this My button:
myStrom can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select myStrom .
Follow the instructions on screen to complete the setup.
Check if you can access the light located at IP_ADRRESS . The details about your light is provided as a JSON response.
$ curl http://[IP_ADDRESS]/api/v1/device/[MAC_ADDRESS]
{ "MAC_ADDRESS" : { "type" : "rgblamp" ,
"battery" : false ,
"reachable" : true ,
"meshroot" : false ,
"on" : true ,
"color" : "0;0;100" ,
"mode" : "hsv" ,
"ramp" : 409,
"power" : 5.1,
"fw_version" : "2.25" } }
The mystrom binary sensor platform allows you to use myStrom Wifi Buttons with Home Assistant. The myStrom Wifi Buttons support three and the myStrom WiFi Button + four different push pattern:
single : Short push (approx. 1/2 seconds)
double : 2x sequential short pushes (within 2 seconds)
long : Long push (approx. 2 seconds)
touch : Touch of the button’s surface (only affective for WiFi Button +)
The first usage of the pattern will create the binary sensor for the pattern. If the WiFi Button is pushed one time then a binary sensor for the single pattern will be created. The same applies for the other patterns. With the second usage of the pattern the binary sensors become fully functional.
The buttons will give you feedback with its built-in LED:
white then green: Pattern was submitted successfully
white then red: There is a problem with the communication
To use your myStrom WiFi Button in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry binary_sensor : - platform : mystrom
Important
The firmware version 2.56 doesn’t support TLS/SSL. This means that you are only able to use the WiFi Buttons if you are using plain-text communication between Home Assistant and the clients/entities.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The myStrom device was introduced in Home Assistant 0.43, and it's used by
1565 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Light
Sensor
Switch
Back to top
