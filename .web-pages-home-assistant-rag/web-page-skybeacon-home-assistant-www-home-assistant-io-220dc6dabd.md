# Skybeacon - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/skybeacon
- Final URL: https://www.home-assistant.io/integrations/skybeacon
- Canonical URL: https://www.home-assistant.io/integrations/skybeacon/
- Fetched at: 2026-06-28T03:16:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MiFlora BLE plant sensor with Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Skybeacon integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports CR2477 -powered iBeacon /eddystone sensors that come with temperature/sensor module.
To use your Skybeacon integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : skybeacon mac : " xx:xx:xx:xx:xx:xx" monitored_conditions : - temperature - humidity
Configuration Variables
Looking for your configuration file?
mac string Required
The MAC address of your sensor. You can find this be running hcitool lescan from command line.
name string ( Optional , default: Skybeacon )
The name of the Skybeacon sensor.
monitored_conditions list ( Optional )
The parameters that should be monitored.
temperature
Temperature at the sensor’s location.
humidity
Humidity at the sensor’s location.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Skybeacon integration was introduced in Home Assistant 0.37, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
DIY
Back to top
