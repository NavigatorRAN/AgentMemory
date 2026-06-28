# AirGradient - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airgradient
- Final URL: https://www.home-assistant.io/integrations/airgradient
- Canonical URL: https://www.home-assistant.io/integrations/airgradient/
- Fetched at: 2026-06-28T02:26:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up AirGradient devices in Home Assistant.

## Extracted Text

On this page
Use cases
Supported devices
Configuration
Supported functionality
Available sensors
Available configuration entities
Updates
Data updates
Actions
Examples
Notify when the CO2 level is too high
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The AirGradient integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will fetch data from your AirGradient devices .
AirGradient creates indoor and outdoor air quality monitors that enable you to know if the air quality is healthy or not. They measure metrics such as PM2.5, CO2, TVOCs, and NOx. Both the software and hardware are open-source, allowing you to customize or extend the device functionality.
Monitor indoor and outdoor air quality.
Warn to open windows when CO2 levels are too high.
Control ventilation systems based on air quality.
AirGradient Indoor Air Quality Monitor
AirGradient Outdoor Air Quality Monitor
Important
In order for the device to be set up or discovered by Home Assistant, the firmware version should be at least 3.1.1.
To add the AirGradient device to your Home Assistant instance, use this My button:
AirGradient can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AirGradient .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname for your AirGradient device.
Below is a complete overview of the entities this integration provides.
The integration will fetch data from each device. The following sensors are supported:
Carbon dioxide
Humidity
Nitrogen index
PM0.3 count
PM1 density
PM2.5 density
PM10 density
Raw nitrogen
Raw total volatile organic compounds
Raw PM2.5
Signal strength
Temperature
Total volatile organic compounds index
Several configuration entities are available as sensors to automate with if you control the device via the AirGradient dashboard instead of set it to control locally.
CO2 automatic baseline calibration days
NOx learning offset
Total volatile organic compounds learning offset
Data used for the LED bar
LED bar brightness
Display temperature unit
Display brightness
The integration provides a few configuration entities to customize the device experience.
The settings are only available when the configuration source is set to local.
The following entities are supported:
Requesting CO2 calibration
Requesting LED bar test
Toggling sharing metrics with AirGradient
Configuration source
Display PM standard
The AirGradient integration provides an update entity that checks for firmware updates for your AirGradient device.
To install the update, the device needs to be rebooted.
This integration uses local polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] , meaning it checks for changes to all entities by regularly communicating with the AirGradient device.
The integration will retrieve data from the device every minute.
The updates for the device are checked once every hour.
This integration does not provide additional actions. All actions available
for this integration are provided by their respective entities.
The following examples show how to use the AirGradient integration in Home
Assistant automations. These examples are just a starting point, and you can
use them as inspiration to create your own automations.
The following example sends a notification to your mobile device when the CO2 level exceeds 1000 ppm.
automation : - alias : " Notify when CO2 level is too high" triggers : - trigger : numeric_state entity_id : sensor.airgradient_carbon_dioxide above : 1000 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " High CO2 Level Alert" message : > The CO2 level is too high at {{ states('sensor.airgradient_carbon_dioxide') }} ppm. Please consider ventilating the room.
The AirGradient integration currently has the following limitations:
The update entity is not able to install updates automatically. You will need to reboot the device manually after installing the update.
If you’re experiencing issues with your AirGradient integration, try these general troubleshooting steps:
Make sure your AirGradient is powered on and properly connected to your home network.
If the integration shows as unavailable, try restarting both your AirGradient and Home Assistant.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AirGradient device was introduced in Home Assistant 2024.6, and it's used by
2316 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@airgradienthq
@joostlek
Categories
Health
Sensor
Update
Back to top
