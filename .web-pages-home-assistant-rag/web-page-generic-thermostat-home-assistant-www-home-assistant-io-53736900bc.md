# Generic Thermostat - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/generic_thermostat
- Final URL: https://www.home-assistant.io/integrations/generic_thermostat
- Canonical URL: https://www.home-assistant.io/integrations/generic_thermostat/
- Fetched at: 2026-06-28T02:45:30Z
- Content type: text/html; charset=UTF-8

## Description

Turn Home Assistant into a thermostat

## Extracted Text

On this page
Configuration
YAML configuration
Full YAML configuration example
Related topics
The Generic Thermostat integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is a thermostat implemented in Home Assistant. It uses a sensor and a switch connected to a heater or air conditioning under the hood. When in heater mode, if the measured temperature is cooler than the target temperature, the heater will be turned on and turned off when the required temperature is reached. When in air conditioning mode, if the measured temperature is hotter than the target temperature, the air conditioning will be turned on and turned off when required temperature is reached. One Generic Thermostat entity can only control one switch. If you need to activate two switches, one for a heater and one for an air conditioner, you will need two Generic Thermostat entities.
To add the Generic Thermostat helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Generic Thermostat .
Follow the instructions on screen to complete the setup.
Note
Configuration using our user interface provides a more limited subset of options, making this integration more accessible while covering most use cases.
If you need more specific features for your use case, the manual YAML-configuration section of this integration might provide them.
Alternatively, this integration can be configured and set up manually via YAML
as well. To enable the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you need to add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry climate : - platform : generic_thermostat name : Study heater : switch.study_heater target_sensor : sensor.study_temperature
Configuration Variables
Looking for your configuration file?
name string Required , default: Generic Thermostat
Name of thermostat.
unique_id string ( Optional )
An ID that uniquely identifies this thermostat. Set this to a unique value to allow customization through the UI.
heater string Required
entity_id for heater switch, must be a toggle device. Becomes air conditioning switch when ac_mode is set to true .
target_sensor string Required
entity_id for a temperature sensor, target_sensor.state must be temperature.
min_temp float ( Optional , default: 7 )
Set minimum set point available.
max_temp float ( Optional , default: 35 )
Set maximum set point available.
target_temp float ( Optional )
Set initial target temperature. Failure to set this variable will result in target temperature being set to null on startup. As of version 0.59, it will retain the target temperature set before restart if available.
ac_mode boolean ( Optional , default: false )
Set the switch specified in the heater option to be treated as a cooling device instead of a heating device.
min_cycle_duration time | integer ( Optional )
The minimum amount of time that must elapse before the switch specified in the heater option can be switched off.
max_cycle_duration time | integer ( Optional )
The maximum amount of time that can elapse before the switch specified in the heater option will be switched off.
cycle_cooldown time | integer ( Optional )
The minimum amount of time that must elapse before the switch specified in the heater option can be switched back on after being off.
cold_tolerance float ( Optional , default: 0.3 )
Set a minimum amount of difference between the temperature read by the sensor specified in the target_sensor option and the target temperature that must change before being switched on. For example, if the target temperature is 25 and the tolerance is 0.5, the heater will start when the sensor goes below 24.5.
hot_tolerance float ( Optional , default: 0.3 )
Set a minimum amount of difference between the temperature read by the sensor specified in the target_sensor option and the target temperature that must change before being switched off. For example, if the target temperature is 25 and the tolerance is 0.5 the heater will stop when the sensor equals or goes above 25.5.
keep_alive time | integer ( Optional )
Set a keep-alive interval. If set, the switch specified in the heater option will be triggered every time the interval elapses. Use with heaters and A/C units that shut off if they don’t receive a signal from their remote for a while. Use also with switches that might lose state. The keep-alive call is done with the current valid climate integration state (either on or off).
initial_hvac_mode string ( Optional )
Set the initial HVAC mode. Valid values are off , heat or cool . Value has to be double quoted. If this parameter is not set, it is preferable to set a keep_alive value. This is helpful to align any discrepancies between generic_thermostat and heater state.
away_temp float ( Optional )
Set the temperature used by preset_mode: away .
comfort_temp float ( Optional )
Set the temperature used by preset_mode: comfort .
eco_temp float ( Optional )
Set the temperature used by preset_mode: eco .
home_temp float ( Optional )
Set the temperature used by preset_mode: home .
sleep_temp float ( Optional )
Set the temperature used by preset_mode: sleep .
activity_temp float ( Optional )
Set the temperature used by preset_mode: activity .
precision float ( Optional )
The desired precision for this device. Can be used to match your actual thermostat’s precision. Supported values are 0.1 , 0.5 and 1.0 . This value is also used as the step size for setting the target temperature.
Default:
0.1 for Celsius and 1.0 for Fahrenheit.
target_temp_step float ( Optional )
The desired step size for setting the target temperature. Supported values are 0.1 , 0.5 and 1.0 .
equal to precision .
Time for min_cycle_duration , max_cycle_duration , cycle_cooldown and keep_alive must be set as “hh:mm:ss” or it must contain at least one of the following entries: days: , hours: , minutes: , seconds: or milliseconds: . Alternatively, it can be an integer that represents time in seconds. If both min_cycle_duration and max_cycle_duration are set, the time for max_cycle_duration must be greater than min_cycle_duration .
Currently the generic_thermostat climate platform supports ‘heat’, ‘cool’ and ‘off’ HVAC modes. You can force your generic_thermostat to avoid starting by setting HVAC mode to ‘off’.
When changing the preset mode to away, you will force a target temperature change as well that will get restored once the preset mode is set to none again.
climate : - platform : generic_thermostat name : Study heater : switch.study_heater target_sensor : sensor.study_temperature min_temp : 15 max_temp : 21 ac_mode : false target_temp : 17 cold_tolerance : 0.3 hot_tolerance : 0 min_cycle_duration : minutes : 1 max_cycle_duration : minutes : 10 cycle_cooldown : seconds : 30 keep_alive : minutes : 3 initial_hvac_mode : " off" away_temp : 16 precision : 0.1
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Generic Thermostat helper was introduced in Home Assistant pre 0.7, and it's used by
4.1% of the active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Climate
Helper
Back to top
