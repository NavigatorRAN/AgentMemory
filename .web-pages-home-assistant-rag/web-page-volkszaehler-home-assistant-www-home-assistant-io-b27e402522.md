# Volkszaehler - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/volkszaehler
- Final URL: https://www.home-assistant.io/integrations/volkszaehler
- Canonical URL: https://www.home-assistant.io/integrations/volkszaehler/
- Fetched at: 2026-06-28T03:27:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Volkszaehler sensors into Home Assistant.

## Extracted Text

On this page
Configuration
Full examples
Related topics
The Volkszaehler integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is consuming the system information provided by the Volkszaehler API.
To enable the Volkszaehler integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : volkszaehler uuid : DEVICE_UUID
Configuration Variables
Looking for your configuration file?
uuid string Required
The UUID of the device to track.
host string ( Optional , default: localhost )
The IP address of the host where Volkszaehler is running.
port integer ( Optional , default: 80 )
The port where Volkszaehler is listening.
name string ( Optional , default: Volkszaehler )
The prefix for the sensors.
monitored_conditions list ( Optional , default: average )
Entries to monitor.
average
The average power.
consumption
The power consumption.
max
The maximum power.
min
The minimum power.
# Example configuration.yaml entry sensor : - platform : volkszaehler host : demo.volkszaehler.org uuid : " 57acbef0-88a9-11e4-934f-6b0f9ecd95a8" monitored_conditions : - average - consumption - min - max
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Volkszaehler integration was introduced in Home Assistant 0.78, and it's used by
5 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
