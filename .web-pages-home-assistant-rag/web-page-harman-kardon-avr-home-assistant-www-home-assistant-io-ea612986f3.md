# Harman Kardon AVR - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/harman_kardon_avr
- Final URL: https://www.home-assistant.io/integrations/harman_kardon_avr
- Canonical URL: https://www.home-assistant.io/integrations/harman_kardon_avr/
- Fetched at: 2026-06-28T02:47:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Harman Kardon AVR Network Receivers into Home Assistant.

## Extracted Text

On this page
Related topics
The Harman Kardon AVR integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Harman Kardon Network Receivers from Home Assistant.
Supported devices:
Harman Kardon AVR-151S
Other Harman Kardon AVR receivers (untested)
To add a Harman Kardon Network Receiver to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : harman_kardon_avr host : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
host string Required
IP address of the device, e.g., 192.168.1.32.
name string ( Optional , default: Harman Kardon AVR )
Name of the device. If not set, Harman Kardon AVR is used.
port integer ( Optional , default: 10025 )
The port to talk to the receiver. If not set, 10025 is used.
A few notes:
The newest firmware automatically shuts down the AVR after a certain amount of time. The AVR is then not available on the network anymore, so the ‘on’ command will not work.
The AVR has no endpoints to determine the volume, muted, or playing, so if the remote control is used, HA will not know the new states of the device.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Harman Kardon AVR integration was introduced in Home Assistant 0.85, and it's used by
75 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Media player
Back to top
