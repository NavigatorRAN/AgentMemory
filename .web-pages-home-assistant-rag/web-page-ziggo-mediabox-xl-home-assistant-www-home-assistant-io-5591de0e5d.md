# Ziggo Mediabox XL - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ziggo_mediabox_xl
- Final URL: https://www.home-assistant.io/integrations/ziggo_mediabox_xl
- Canonical URL: https://www.home-assistant.io/integrations/ziggo_mediabox_xl/
- Fetched at: 2026-06-28T03:31:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Ziggo Mediabox XL into Home Assistant.

## Extracted Text

On this page
Related topics
The Ziggo Mediabox XL integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Ziggo Mediabox XL from Home Assistant.
To add a Ziggo Mediabox XL to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : ziggo_mediabox_xl host : 192.168.0.123 name : Ziggo Mediabox
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or address of the device.
name string ( Optional )
The name of the device used in the frontend.
The channel information (numbers and names) are downloaded from ziggo.nl on startup.
Preparation of the Mediabox
Makes sure to enable the Home Network (“mijn thuisnetwerk”) service in the settings menu of the media box. Once you have set up the Media Library (“mediabiblotheek”), we can determine whether the device is turned on or off. Without this, the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will fail to start.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ziggo Mediabox XL integration was introduced in Home Assistant 0.60, and it's used by
1 active installations.
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
