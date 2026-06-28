# Unitymedia Horizon HD Recorder - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/horizon
- Final URL: https://www.home-assistant.io/integrations/horizon
- Canonical URL: https://www.home-assistant.io/integrations/horizon/
- Fetched at: 2026-06-28T02:50:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to integrate the Unitymedia Horizon HD Recorder into Home Assistant.

## Extracted Text

On this page
Related topics
The Unitymedia Horizon HD Recorder integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Unitymedia Horizon HD Recorder from Home Assistant.
To add a Horizon HD Recorder to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : horizon host : 192.168.0.127
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or address of the device.
port integer ( Optional )
The port of the device to connect to.
name string ( Optional )
The name of the device used in the frontend.
Preparation of the Horizon HD Recorder
The Home Networking (“Heimnetzwerk”) service needs to be enabled at the settings menu of the Horizon receiver. Once you have set up the Media Library (“Medienbibliothek”), we can determine whether the device is turned on or off. Without this, the integration will fail to start.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Unitymedia Horizon HD Recorder integration was introduced in Home Assistant 0.72, and it's used by
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
Media player
Back to top
