# Xiaomi TV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/xiaomi_tv
- Final URL: https://www.home-assistant.io/integrations/xiaomi_tv
- Canonical URL: https://www.home-assistant.io/integrations/xiaomi_tv/
- Fetched at: 2026-06-28T03:29:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Xiaomi TV into Home Assistant.

## Extracted Text

On this page
Related topics
The Xiaomi TV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Xiaomi TV .
The Xiaomi TV integration only supports Xiaomi TVs running MIUI.
You need to make sure the TV is connected to the internet, and that your Home Assistant instance is on the same network.
To add a TV to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : xiaomi_tv
Important
When starting or restarting Home Assistant make sure your TV is off. This is a flaw in the TV itself.
Configuration Variables
Looking for your configuration file?
host string ( Optional )
The IP of the Xiaomi TV, e.g., 192.168.0.10 .
name string ( Optional , default: Xiaomi TV )
The name to use on the frontend.
If you do not set a host in the configuration file, local TVs will automatically be discovered.
To manually add a TV you can use the following configuration:
# Example configuration.yaml entry media_player : - platform : xiaomi_tv host : YOUR_TV_IP name : YOUR_TV_NAME
Note
The platform will never turn your TV off. Instead, it will be put to sleep and woken up. This can be useful, because the selected source of the TV will remain the same. It will essentially turn your TV into a dumb TV.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Xiaomi TV integration was introduced in Home Assistant 0.64, and it's used by
227 active installations.
Its IoT class is Assumed State.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@simse
Categories
Media player
Back to top
