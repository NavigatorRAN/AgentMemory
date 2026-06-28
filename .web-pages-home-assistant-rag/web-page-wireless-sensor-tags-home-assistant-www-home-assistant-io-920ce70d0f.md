# Wireless Sensor Tags - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/wirelesstag
- Final URL: https://www.home-assistant.io/integrations/wirelesstag
- Canonical URL: https://www.home-assistant.io/integrations/wirelesstag/
- Fetched at: 2026-06-28T03:28:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Wireless Tags sensors within Home Assistant.

## Extracted Text

On this page
Configuration
Binary sensor
Sensor
Switch
Related topics
The Wireless Sensor Tags integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your wirelesstag.net sensors tags in Home Assistant.
There is currently support for the following device types within Home Assistant:
To enable tags set up with your wirelesstag.net account, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry wirelesstag : username : [email protected] password : secret
Configuration Variables
Looking for your configuration file?
username string Required
Username for your wirelesstag.net account.
password string Required
Password for your wirelesstag.net account.
To enable the binary sensor platform for your tags, set up with your wirelesstag.net account. Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : wirelesstag monitored_conditions : - presence - door - battery
monitored_conditions list Required
The conditions types to monitor.
presence
On means in range, Off means out of range.
motion
On when a movement was detected, Off when clear.
door
On when a door is open, Off when the door is closed.
cold
On means temperature become too cold, Off means normal.
heat
On means hot, Off means normal.
dry
On means too dry (humidity), Off means normal.
wet
On means too wet (humidity), Off means normal.
light
On means light detected, Off means no light.
moisture
On means moisture detected (wet), Off means no moisture (dry).
battery
On means tag battery is low, Off means normal.
To enable the sensor platform for your tags, set up with your wirelesstag.net account. Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : wirelesstag monitored_conditions : - temperature - humidity
The metrics types to monitor.
temperature
Value is in Celsius or Fahrenheit (according to your settings at Tag Manager).
humidity
Humidity level in %.
Water level/soil moisture in % (applicable for Water Tag only).
Brightness in lux (if supported by tag).
ambient_temperature
If your device is Outdoor Probe with ambient temperature - use this sensor.
To enable the switch platform for your tags, set up with your wirelesstag.net account. Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : wirelesstag monitored_conditions : - motion - humidity
The metrics types to control.
Control arm/disarm temperature monitoring.
Control arm/disarm humidity monitoring.
Control arm/disarm motion and door open/close events monitoring.
Control monitoring of light changes.
Control monitoring of water level/soil moisture for water sensor.
Arm/Disarm of motion switch is required to receive motion and door binary sensors events.
Others are only needed if you want to receive push notifications from tags on a specific range of changes in temperature, humidity, light or moisture.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Wireless Sensor Tags integration was introduced in Home Assistant 0.68, and it's used by
119 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@sergeymaysak
Categories
Hub
Back to top
