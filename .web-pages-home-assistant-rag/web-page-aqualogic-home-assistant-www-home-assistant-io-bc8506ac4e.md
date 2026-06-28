# AquaLogic - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aqualogic
- Final URL: https://www.home-assistant.io/integrations/aqualogic
- Canonical URL: https://www.home-assistant.io/integrations/aqualogic/
- Fetched at: 2026-06-28T02:28:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an AquaLogic controller within Home Assistant.

## Extracted Text

On this page
Configuration
Sensor
Switch
Related topics
The AquaLogic integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides connectivity to a Hayward/Goldline AquaLogic/ProLogic pool controller. Note that an RS-485 to Ethernet adapter connected to the pool controller is required.
There is currently support for the following device types within Home Assistant:
To add the AquaLogic integration to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry aqualogic : host : IP_ADDRESS port : PORT
Configuration Variables
Looking for your configuration file?
host string Required
The domain name or IP address of the RS-485 to Ethernet adapter connected to the pool controller, e.g., 192.168.1.1.
port integer Required
The port provided by the RS-485 to Ethernet adapter.
Once you have enabled the AquaLogic integration, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : aqualogic monitored_conditions : - pool_temp
monitored_conditions list ( Optional , default: all )
List of items you want to monitor.
air_temp
The air temperature.
pool_temp
The pool temperature.
spa_temp
The spa temperature.
pool_chlorinator
The pool chlorinator setting.
spa_chlorinator
The spa chlorinator setting.
salt_level
The current salt level.
pump_speed
The current pump speed (Hayward VS pumps only).
pump_power
The current pump power usage (Hayward VS pumps only).
status
The current system status.
# Example configuration.yaml entry switch : - platform : aqualogic monitored_conditions : - lights - filter
List of items you want to monitor/control.
filter
Controls the filter pump.
filter_low_speed
Controls low speed mode on the filter pump (multi-speed pumps only).
lights
Controls the Lights relay.
aux_1
Controls the Aux 1 relay.
aux_2
Controls the Aux 2 relay.
aux_3
Controls the Aux 3 relay.
aux_4
Controls the Aux 4 relay.
aux_5
Controls the Aux 5 relay.
aux_6
Controls the Aux 6 relay.
aux_7
Controls the Aux 7 relay.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AquaLogic integration was introduced in Home Assistant 0.80, and it's used by
31 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
