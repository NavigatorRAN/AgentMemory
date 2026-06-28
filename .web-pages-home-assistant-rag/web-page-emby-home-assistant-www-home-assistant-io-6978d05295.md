# Emby - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/emby
- Final URL: https://www.home-assistant.io/integrations/emby
- Canonical URL: https://www.home-assistant.io/integrations/emby/
- Fetched at: 2026-06-28T02:39:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Emby into Home Assistant.

## Extracted Text

On this page
Related topics
The Emby integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Emby multimedia system from Home Assistant.
To add Emby to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : emby host : YOUR_IP_ADDRESS api_key : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: localhost )
The host name or IP address of the device that is running Emby.
api_key string Required
The API key to use to authenticate.
ssl boolean ( Optional , default: false )
Connect with HTTPS/WSS. Your SSL certificate must be valid.
port integer ( Optional )
The port number of the device that is running Emby.
Default:
8096 (No SSL), 8920 (SSL)
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Emby integration was introduced in Home Assistant 0.32, and it's used by
850 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mezz64
Categories
Media player
Back to top
