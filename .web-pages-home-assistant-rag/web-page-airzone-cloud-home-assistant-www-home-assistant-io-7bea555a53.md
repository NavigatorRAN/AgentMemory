# Airzone Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airzone_cloud
- Final URL: https://www.home-assistant.io/integrations/airzone_cloud
- Canonical URL: https://www.home-assistant.io/integrations/airzone_cloud/
- Fetched at: 2026-06-28T02:27:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Airzone Cloud within Home Assistant.

## Extracted Text

On this page
Aidoo / Aidoo Pro
Easyzone (US) / Flexa (EU)
Configuration
Binary sensors
Climate
Select
Sensors
Switch
Water heater
Removing the integration
To remove an integration instance from Home Assistant
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] interacts with the Cloud API of Airzone devices .
There are two main types of Airzone devices:
These devices are Wi-Fi controllers that are normally connected to a single air conditioner split system.
These devices are connected to ducted air conditioners, motorized grilles, and individual thermostats for every room (zone). Therefore, with a single ducted air conditioning system, the user can turn on and off the air conditioner and set different desired temperatures in each room.
A typical Airzone HVAC system consists of a parent device and child devices. The HVAC mode can only be changed on the parent device. On child devices, you can only enable or disable the HVAC and adjust the desired temperature for that specific device.
Note that multiple HVAC systems can be connected to the same Airzone web server. In this case, there will be one parent zone per HVAC system and there may also be child zones for each HVAC system.
To add the Airzone Cloud hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Airzone Cloud .
Follow the instructions on screen to complete the setup.
Username
Cloud API username
Password
Cloud API password
For each Airzone system (HVAC machine), the following binary sensors are created:
Condition Description problems Indicates that the current system has errors or warnings.
For each Airzone zone (thermostat), the following binary sensors are created:
Condition Description air_quality_active Indicates that the air quality control is running. problems Indicates that the current zone has errors or warnings.
For each Airzone Aidoo (HVAC Wi-Fi controller), a climate entity is created.
For each Airzone zone (thermostat), a climate entity is created.
HVAC mode can only be changed on a parent zone .
Child zones can only enable/disable the current HVAC mode selected on the corresponding parent zone . Attempting to change the HVAC mode on a child zone will result in a Home Assistant error.
For each Airzone zone (thermostat), the following selects are created:
Condition Description air_quality Selects the desired Air Quality working mode.
For each Airzone Aidoo (HVAC Wi-Fi controller), the following sensors are created:
Condition Description temperature Measures the temperature from the HVAC thermostat.
For each Airzone zone (thermostat), the following sensors are created:
Condition Description air_quality_index Indicates the Air Quality Index in the current zone. humidity Measures the relative humidity in the current zone. pm1 Concentration of particles with a diameter of less than 1 µm. pm2_5 Concentration of particles with a diameter of less than 2.5 µm. pm10 Concentration of particles with a diameter of less than 10 µm. temperature Measures the temperature in the current zone.
For each Airzone WebServer (HVAC Wi-Fi controller), the following sensors are created:
Condition Description rssi Wi-Fi RSSI.
For each Airzone zone (thermostat), a switch entity is created to turn the thermostat on or off (without changing the HVAC mode).
For each Airzone device, a water heater entity is created if supported.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Airzone Cloud hub was introduced in Home Assistant 2023.6, and it's used by
790 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Noltari
Categories
Binary sensor
Sensor
Back to top
