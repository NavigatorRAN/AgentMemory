# Atag - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/atag
- Final URL: https://www.home-assistant.io/integrations/atag
- Canonical URL: https://www.home-assistant.io/integrations/atag/
- Fetched at: 2026-06-28T02:29:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Atag integration.

## Extracted Text

On this page
Configuration
Climate
Integration actions
Water heater
Sensor
Sensors enabled by default
The Atag integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows Home Assistant to connect to Atag One thermostats, reporting and setting its status.
The integration implements the following platforms:
To add the Atag device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Atag .
Follow the instructions on screen to complete the setup.
Configuration Variables
Looking for your configuration file?
host string Required
Atag hostname or IP address.
port integer ( Optional )
API Port. Only change if you are connecting indirectly (e.g. through reverse proxy)
The Atag climate platform provides current and target temperature information for the heating system, boiler status and HVAC mode.
This integration supports the following actions (see Climate ).
set_temperature
set_hvac_mode
heat for thermostat mode
auto for weather-based mode
set_preset_mode
Manual enable manual operation
Auto enable schedule based operation
Extend delay the next scheduled temperature update by the default extend period
away enable the vacation mode for 1 day or until another preset is activated
boost enable fireplace mode
Note
HVAC mode Auto (Weather based) should not be confused with Preset mode Auto (Scheduled, thermostat mode).
Currently selection of custom timeframes in Extend, Away and boost modes is not supported. The default settings can be changed on the device.
The water heater reports current and target temperature for Domestic Hot Water demand, as well as boiler status (heating or idle). This can be used to detect hot water demand, such as a running shower or tap water.
Setting target values is currently not supported.
Not all metrics reported by the One are part of either the Water-Heater or Climate platform. Additional sensors are added to Home Assistant to monitor these metrics, which can be disabled in the UI if preferred. Navigate to Configuration , Entities and select the entity you wish to disable.
The following sensors will be added to Home Assistant:
average_outside_temperature
burning_hours
ch_return_temperature
ch_water_pressure
ch_water_temperature
flame
outside_temperature
weather_status
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Atag device was introduced in Home Assistant 0.109, and it's used by
101 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@MatsNL
Categories
Back to top
