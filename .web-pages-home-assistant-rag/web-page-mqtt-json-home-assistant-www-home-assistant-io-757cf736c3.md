# MQTT JSON - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mqtt_json
- Final URL: https://www.home-assistant.io/integrations/mqtt_json
- Canonical URL: https://www.home-assistant.io/integrations/mqtt_json/
- Fetched at: 2026-06-28T03:01:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use MQTT JSON to track devices in Home Assistant.

## Extracted Text

On this page
Configuration
Usage
Related topics
The MQTT JSON integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence by monitoring an MQTT topic for new locations. To use this platform, you specify a unique topic for each device.
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : mqtt_json devices : paulus_oneplus : location/paulus annetherese_n4 : location/annetherese
Configuration Variables
Looking for your configuration file?
devices list Required
List of devices with their topic.
qos string ( Optional )
The QoS level of the topic.
This platform receives JSON formatted payloads containing GPS information, for example:
{ "longitude" : 1.0 , "gps_accuracy" : 60 , "latitude" : 2.0 , "battery_level" : 99.9 }
Where longitude is the longitude, latitude is the latitude, gps_accuracy is the accuracy in meters, battery_level is the current battery level of the device sending the update.
longitude and latitude are required keys, gps_accuracy and battery_level are optional.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT JSON integration was introduced in Home Assistant 0.44, and it's used by
178 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
