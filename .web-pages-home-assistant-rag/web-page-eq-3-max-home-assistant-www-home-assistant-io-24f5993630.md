# eQ-3 MAX! - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/maxcube
- Final URL: https://www.home-assistant.io/integrations/maxcube
- Canonical URL: https://www.home-assistant.io/integrations/maxcube/
- Fetched at: 2026-06-28T02:58:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate eQ-3 MAX! components with Home Assistant via eQ-3 MAX! Cube.

## Extracted Text

On this page
One gateway
Multiple gateways
Problems connecting or setting up
Related topics
The eQ-3 MAX! integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to connect eQ-3 MAX! components via the eQ-3 MAX! Cube. The components connects to the eQ-3 MAX! Cube via TCP and automatically makes all supported integrations available in Home Assistant. The name for each device is created by concatenating the MAX! room and device names.
There is currently support for the following device types within Home Assistant:
Binary sensor
Climate
Limitations:
Configuring weekly schedules is not possible.
Implementation is based on the reverse engineered MAX! protocol .
Supported Devices:
MAX! Radiator Thermostat (tested)
MAX! Radiator Thermostat+
MAX! Window Sensor (tested)
MAX! Wall Thermostat (tested)
A maxcube section must be present in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file and contain the following options as required:
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry maxcube : gateways : - host : 192.168.0.20
# Example configuration.yaml entry maxcube : gateways : - host : 192.168.0.20 port : 62910 - host : 192.168.0.21 port : 62910
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of the eQ-3 MAX! Cube to use.
port integer ( Optional , default: 62910 )
The UDP port number.
scan_interval integer ( Optional , default: 300 )
The update interval in seconds
Due to the connection limits of the eQ-3 MAX! Cube, Home Assistant will not be able to connect to the gateway if another application is still connected. It may result in timeout errors like Error: timed out You will need to restart Home Assistant after fixing. and The following integrations and platforms could not be set up: maxcube Please check your configuration.
To prevent these issues, ensure all other applications connecting to the gateway are closed, e.g., the mobile app or the MAX! desktop app (On Windows machines, close from the status bar, it keeps running when you close the browser window).
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The eQ-3 MAX! integration was introduced in Home Assistant 0.40, and it's used by
228 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Back to top
