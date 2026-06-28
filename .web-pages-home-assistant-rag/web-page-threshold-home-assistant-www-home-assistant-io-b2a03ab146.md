# Threshold - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/threshold
- Final URL: https://www.home-assistant.io/integrations/threshold
- Canonical URL: https://www.home-assistant.io/integrations/threshold/
- Fetched at: 2026-06-28T03:22:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate threshold binary sensors into Home Assistant.

## Extracted Text

On this page
Configuration
YAML configuration
Matrix of state change behavior
Sensor value rising
Sensor value falling
Examples
Is the temperature rising or falling
The Threshold integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] observes the state of another sensor. If the value is below or higher than the given threshold, then the state of the threshold sensor is changed. It also supports a range if both the upper and lower limits are given.
If the sensor is configured with no hysteresis and the sensor value is equal to the threshold, the sensor is turned off since it is not upper or lower with respect to the threshold.
To add the Threshold helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Threshold .
Follow the instructions on screen to complete the setup.
Name
The name the sensor should have. You can change it again later.
Input sensor
The entity providing numeric readings to apply the threshold on.
Hysteresis
The distance the observed value must be from the threshold before the state is changed.
Lower limit
The lower threshold which the observed value is compared against.
Upper limit
The upper threshold which the observed value is compared against.
Alternatively, this integration can be configured and set up manually via YAML
instead. To enable the Integration sensor in your installation, add the
following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : threshold entity_id : sensor.random lower : 20
Configuration Variables
Looking for your configuration file?
entity_id string Required
The entity to monitor. Only sensors are supported.
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
lower float ( Optional )
upper float ( Optional )
hysteresis float ( Optional , default: 0.0 )
name string ( Optional , default: Threshold )
Name of the sensor to use in the frontend.
Set Turns on when Turns off when only upper sensor > (upper + hyst) never only lower never sensor > (lower + hyst) upper & lower sensor > (lower + hyst) sensor > (upper + hyst)
Set Turns on when Turns off when only upper never sensor < (upper - hyst) only lower sensor < (lower - hyst) never upper & lower sensor < (upper - hyst) sensor < (lower - hyst)
The hysteresis parameter can be used in this use-case to avoid frequent state changes around the maximum or the minimum of a temperature curve. We also have to use the derivative sensor for this use-case:
sensor : - platform : derivative # will be positive for rising temperatures and negative for falling temperatures source : sensor.temperature unit_time : min name : temperature derivative time_window : 00:05:00 binary_sensor : - platform : threshold # will switch state not at 0°C/min but # will switch on when value rises above 0.1°C/min # will switch off when value sinks below -0.1°C/min entity_id : sensor.temperature_derivative upper : 0 hysteresis : 0.1 # sensor name : temperature rising
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Threshold helper was introduced in Home Assistant 0.34, and it's used by
3.5% of the active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Binary sensor
Helper
Utility
Back to top
