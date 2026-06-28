# Random - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/random
- Final URL: https://www.home-assistant.io/integrations/random
- Canonical URL: https://www.home-assistant.io/integrations/random/
- Fetched at: 2026-06-28T03:11:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate random numbers into Home Assistant.

## Extracted Text

On this page
Configuration
Binary sensor
YAML configuration
Sensor
The Random integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] simply creates random values or state. This can be useful if you want to test automation rules or run an interactive demo. It generates a new state every time it is polled.
The preferred way to configure random helpers is via the user interface at Settings > Devices & services > Helpers and select the add button; next, select the Random option.
To be able to add Helpers via the user interface, you should have default_config: in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] . It should already be there by default unless you removed it. If you removed default_config: from your configuration, you must add random: to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] first, then you can use the UI.
The random binary sensor creates random states ( true , 1, on or false , 0, off ).
To create the random binary sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : random
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: Random binary sensor )
Name to use in the frontend.
The random sensor creates random sensor values (integers) out of a given range. Returned values form a discrete uniform distribution , meaning that each integer value in the range configured is equally likely to be drawn.
To create the random sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : random
name string ( Optional , default: Random sensor )
minimum string ( Optional , default: 0 )
Lower limit for the values.
maximum integer ( Optional , default: 20 )
Upper limit for the values.
unit_of_measurement string ( Optional )
Defines the units of measurement of the sensor, if any.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Random helper was introduced in Home Assistant 0.32, and it's used by
1680 active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Helper
Utility
Back to top
