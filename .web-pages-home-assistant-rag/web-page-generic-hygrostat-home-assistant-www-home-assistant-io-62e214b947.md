# Generic hygrostat - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/generic_hygrostat
- Final URL: https://www.home-assistant.io/integrations/generic_hygrostat
- Canonical URL: https://www.home-assistant.io/integrations/generic_hygrostat/
- Fetched at: 2026-06-28T02:45:27Z
- Content type: text/html; charset=UTF-8

## Description

Virtual hygrostat device

## Extracted Text

On this page
Configuration
YAML configuration
Full YAML configuration example
Related topics
The Generic hygrostat integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is a virtual hygrostat implemented in Home Assistant. It uses a sensor and a switch connected to a humidifier or dehumidifier under the hood. When in humidifier mode, if the measured humidity is less than the target humidity, the humidifier will be turned on and turned off when the required humidity is reached. When in dehumidifier mode, if the measured humidity is greater than the target humidity, the dehumidifier will be turned on and turned off when required humidity is reached. One Generic Hygrostat entity can only control one switch. If you need to activate two switches, one for a humidifier and one for a dehumidifier, you will need two Generic Hygrostat entities.
To add the Generic hygrostat helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Generic hygrostat .
Follow the instructions on screen to complete the setup.
Note
Configuration using our user interface provides a more limited subset of options, making this integration more accessible while covering most use cases.
If you need more specific features for your use case, the manual YAML-configuration section of this integration might provide them.
Alternatively, this integration can be configured and set up manually via YAML
as well. To enable the generic hygrostat in your installation, add the
following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry generic_hygrostat : - name : Bedroom humidifier : switch.humidifier_plug target_sensor : sensor.outside_humidity
Configuration Variables
Looking for your configuration file?
name string Required , default: Generic Hygrostat
Name of hygrostat.
unique_id string ( Optional )
An ID that uniquely identifies this humidifier. Set this to a unique value to allow customization through the UI.
humidifier string Required
entity_id for humidifier or dehumidifier switch, must be a toggle device.
target_sensor string Required
entity_id for a humidity sensor, target_sensor.state must be humidity.
min_humidity float ( Optional , default: 0 )
Set minimum set point available.
max_humidity float ( Optional , default: 100 )
Set maximum set point available.
target_humidity float ( Optional )
Set initial target humidity. This value will be used as a fallback when the previous setpoint is not available.
device_class string ( Optional , default: humidifier )
Whether the switch specified in the humidifier option to be treated as a humidifier or a dehumidifier device. Must be either “humidifier” or “dehumidifier”
min_cycle_duration time | integer ( Optional )
Set a minimum amount of time that the switch specified in the humidifier option must be in its current state before being switched either off or on.
dry_tolerance float ( Optional , default: 3 )
Set a minimum amount of difference between the humidity read by the sensor specified in the target_sensor option and the target humidity that must change before being switched on. For example, if the target humidity is 45 and the tolerance is 3 the humidifier will start when the sensor equals or goes below 42. It is advised to set this parameter equal or above your sensor precision. This parameter is only used on target_sensor changes and is ignored on initialization, on manual operation or humidifier.turn_on action.
wet_tolerance float ( Optional , default: 3 )
Set a minimum amount of difference between the humidity read by the sensor specified in the target_sensor option and the target humidity that must change before being switched off. For example, if the target humidity is 45 and the tolerance is 3 the humidifier will stop when the sensor equals or goes above 48. It is advised to set this parameter equal or above your sensor precision. This parameter is only used on target_sensor changes and is ignored on initialization, on manual operation or humidifier.turn_on action.
keep_alive time | integer ( Optional )
Set a keep-alive interval. If set, the switch specified in the humidifier option will be triggered every time the interval elapses. Use with humidifiers and dehumidifiers that shut off if they don’t receive a signal from their remote for a while. Use also with switches that might lose state. The keep-alive call is done with the current valid humidifier integration state (either on or off).
initial_state boolean ( Optional , default: false )
Set the initial state. This value is used as a fallback when a previous state is not available.
away_humidity integer ( Optional )
Set the humidity used by away mode. If this is not specified, the mode feature will not be available.
away_fixed boolean ( Optional , default: false )
If this parameter is set to True , the target humidity for the away mode is fixed at away_humidity level and cannot be changed. An attempt to set the target humidity will effectively set the humidity for the normal mode. This can be used to independently control mode and target humidity.
sensor_stale_duration time | integer ( Optional )
If the target_sensor does not update its value within this period, it is considered unavailable until the next update. When the sensor is unavailable, the humidifier is turned off for safety reasons.
Time for min_cycle_duration and keep_alive must be set as “hh:mm:ss” or it must contain at least one of the following entries: days: , hours: , minutes: , seconds: or milliseconds: . Alternatively, it can be an integer that represents time in seconds.
To be added to the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
generic_hygrostat : - name : Bedroom humidifier : switch.humidifier_plug target_sensor : sensor.outside_humidity min_humidity : 30 max_humidity : 70 target_humidity : 50 dry_tolerance : 3 wet_tolerance : 0 device_class : " humidifier" min_cycle_duration : seconds : 5 keep_alive : minutes : 3 initial_state : true away_humidity : 35 away_fixed : true sensor_stale_duration : 00:15:00
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Generic hygrostat helper was introduced in Home Assistant 2021.8, and it's used by
2902 active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Shulyaka
Categories
Helper
Humidifier
Back to top
