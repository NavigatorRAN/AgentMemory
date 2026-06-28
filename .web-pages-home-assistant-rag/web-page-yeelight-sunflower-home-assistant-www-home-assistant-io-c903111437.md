# Yeelight Sunflower - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yeelightsunflower
- Final URL: https://www.home-assistant.io/integrations/yeelightsunflower
- Canonical URL: https://www.home-assistant.io/integrations/yeelightsunflower/
- Fetched at: 2026-06-28T03:30:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Yeelight Sunflower hub and bulbs within Home Assistant.

## Extracted Text

On this page
Related topics
The Yeelight Sunflower integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Yeelight Sunflower light bulbs with Home Assistant.
Note
The “Yeelight Sunflower” bulbs are not the same as the “Yeelight WiFi” bulbs.
To enable your lights, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : yeelightsunflower host : 192.168.1.59
Configuration Variables
Looking for your configuration file?
host string Required
IP address of your Yeelight Sunflower hub.
When the hub is loaded, your lights will appear as devices with their Zigbee IDs as part of the entity name.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yeelight Sunflower integration was introduced in Home Assistant 0.39, and it's used by
7 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lindsaymarkward
Categories
Light
Back to top
