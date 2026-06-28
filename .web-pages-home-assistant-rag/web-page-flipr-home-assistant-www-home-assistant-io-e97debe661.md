# Flipr - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/flipr
- Final URL: https://www.home-assistant.io/integrations/flipr
- Canonical URL: https://www.home-assistant.io/integrations/flipr/
- Fetched at: 2026-06-28T02:43:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Flipr device within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Flipr
Entities
Sensors
Binary sensors
Hub
Actions
Tips
Go flipr company sells smart pool monitor and management devices. The Flipr and Flipr Hub devices publish data to the cloud via Wi-Fi and SigFox.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] gives you access on Home Assistant to the information measured by your Flipr with the same data as the vendor’s smartphone application.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] gives you also access to the Flipr Hub to control your pool equipments like pump, heater, and light.
There is currently support for the following device types within Home Assistant:
You will need to use the standalone app for this device to register a username and password.
Google
Apple
To add the Flipr hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Flipr .
Follow the instructions on screen to complete the setup.
Flipr sends data like pH, chlorine or temperature to a cloud server on a regular basis to monitor your pool.
There is currently support for the following information within Home Assistant via sensors and binary_sensors :
Chlorine : the chlorine level
pH : the pH level of the water
Water temperature : the temperature of the water
Red OX : the redox level of the water in mV
Last measure date : the date of the last measure taken by the flipr
Battery level : the battery level of the flipr in percentage
pH Status : an indicator if the pH level is normal, too low, or too high
Chlorine status : an indicator if the chlorine level is normal, too low, or too high
The Hub lets you handle your equipment (such as pump, heater, and light) from Home Assistant and all of the automation you can imagine.
Turn on/off the switch inside the Hub and automatically set the Hub in manual mode.
Choose the mode of the Hub between auto, planning and manual.
The cloud data is polled every 15 minutes. If you want to force a refresh of the data, you can use the homeassistant.update_entity action.
It is recommended that you create your own card with the following sensors where [fliprid] is the id of your flipr:
sensor.flipr_[fliprid]_chlorine
sensor.flipr_[fliprid]_ph
sensor.flipr_[fliprid]_red_ox
sensor.flipr_[fliprid]_water_temp
sensor.flipr_[fliprid]_last_measured
sensor.flipr_[fliprid]_battery_level
Leave binary_sensor.flipr_[fliprid]_ph_status and binary_sensor.flipr_[fliprid]_chlorine_status as badges.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Flipr hub was introduced in Home Assistant 2021.8, and it's used by
84 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@cnico
Categories
Sensor
Back to top
