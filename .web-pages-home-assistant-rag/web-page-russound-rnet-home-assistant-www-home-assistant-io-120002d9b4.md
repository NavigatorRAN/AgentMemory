# Russound RNET - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/russound_rnet
- Final URL: https://www.home-assistant.io/integrations/russound_rnet
- Canonical URL: https://www.home-assistant.io/integrations/russound_rnet/
- Fetched at: 2026-06-28T03:13:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Russound RNET devices into Home Assistant.

## Extracted Text

On this page
Supported devices
Related topics
The Russound RNET integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Russound devices that use the RNET protocol.
This has initially been tested against a Russound CAV6.6 unit with six zones and six sources. It will also work with a Russound CAA66, but be sure to use a null-modem cable. If you have mutiple controllers connected via the RNET link ports, every increment of 6 zones maps to the corresponding controller ID.
Connecting to the Russound device is only possible by TCP, you can use a TCP to Serial gateway such as tcp_serial_redirect
This integration allows you to connect the following controllers:
Russound CAS44
Russound CAA66
Russound CAM6.6
Russound CAV6.6
To add an integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : russound_rnet host : 192.168.1.10 port : 1337 name : Russound zones : 1 : name : Main Bedroom 2 : name : Living Room 3 : name : Kitchen 4 : name : Bathroom 5 : name : Dining Room 6 : name : Guest Bedroom # controller 2 - zone 1 (connected via RNET link ports) 7 : name : Basement Recroom sources : - name : Sonos - name : Sky+
Configuration Variables
Looking for your configuration file?
host string Required
The IP of the TCP gateway.
port integer Required
The port of the TCP gateway.
name string Required
The name of the device.
zones integer Required
This is the list of zones available.
sources list Required
The list of sources available, these must be in order as they are connected to the device.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Russound RNET integration was introduced in Home Assistant 0.25, and it's used by
29 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@noahhusby
Categories
Media player
Back to top
