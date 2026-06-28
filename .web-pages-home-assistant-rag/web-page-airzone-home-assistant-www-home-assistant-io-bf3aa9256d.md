# Airzone - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airzone
- Final URL: https://www.home-assistant.io/integrations/airzone
- Canonical URL: https://www.home-assistant.io/integrations/airzone/
- Fetched at: 2026-06-28T02:27:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Airzone within Home Assistant.

## Extracted Text

On this page
Configuration
Binary sensors
Climate
Select
Sensors
Switch
Water heater
Removing the integration
To remove an integration instance from Home Assistant
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] interacts with the Local API of Airzone HVAC zoning systems .
A typical Airzone device has a parent zone (Master Thermostat) per HVAC system, which is the only zone where the HVAC mode can be changed. The rest are child zones which can only enable or disable the HVAC and adjust the desired temperature on that specific zone.
Note that multiple HVAC systems can be connected to the same Airzone WebServer. In this case, there will be a parent zone per HVAC system and there may also be child zones for each HVAC system.
To add the Airzone hub to your Home Assistant instance, use this My button:
Airzone can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Airzone .
Follow the instructions on screen to complete the setup.
Host
Network IP address
Port
Network port
ID
Airzone System ID (only needed if System ID 0 is not supported on your device)
For each Airzone system (HVAC machine), the following binary sensors are created:
Condition Description problems System has errors or warnings.
For each Airzone zone (thermostat), the following binary sensors are created:
Condition Description air_demand HVAC is running. battery_low Thermostat battery warning. floor_demand Radiating floor is running. problems Zone has errors or warnings.
For each Airzone zone (thermostat) a climate entity is created.
HVAC mode can only be changed on a parent zone .
Child zones can only enable/disable the current HVAC mode selected on the corresponding parent zone . Attempting to change the HVAC mode on a child zone will result on a Home Assistant error.
For each Airzone system (HVAC machine), the following selects are created:
Condition Description Q-Adapt Airflow control algorithm.
For each Airzone zone (thermostat), the following selects are created:
Condition Description Cold Angle Grille angle for cooling. Heat Angle Grille angle for heating. Sleep Minutes for auto sleep.
For the Airzone DHW, the following sensors are created:
Condition Description temperature Current DHW temperature.
For the Airzone WebServer, the following sensors are created:
Condition Description rssi WiFi RSSI.
For each Airzone zone (thermostat), the following sensors are created:
Condition Description battery Current zone thermostat battery. humidity Current zone relative humidity. temperature Current zone temperature. signal_strength Current zone thermostat signal strength.
For each Airzone zone (thermostat), a switch entity is created.
For each Airzone device a water heater entity is created if supported.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Airzone hub was introduced in Home Assistant 2022.4, and it's used by
419 active installations.
Its IoT class is Local Polling.
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
