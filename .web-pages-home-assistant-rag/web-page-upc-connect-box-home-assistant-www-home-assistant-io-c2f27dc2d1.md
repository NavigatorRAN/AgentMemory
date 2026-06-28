# UPC Connect Box - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/upc_connect
- Final URL: https://www.home-assistant.io/integrations/upc_connect
- Canonical URL: https://www.home-assistant.io/integrations/upc_connect/
- Fetched at: 2026-06-28T03:25:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate UPC ConnectBox into Home Assistant.

## Extracted Text

On this page
Related topics
The UPC Connect Box integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at connected devices to a Connect Box from Liberty Global (also known as UPC Cablecom in Switzerland) which is an Internet provider in Switzerland, Austria, the Netherlands (under Ziggo), Hungary (under Vodafone) and Poland (under PLAY).
Important
This integration works by logging into the router with a password. The router can only have one active session at any time, so if you want to access your router settings then stop Home Assistant first.
To use a Connect Box in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : upc_connect password : PASSWORD
Configuration Variables
Looking for your configuration file?
password string Required
The password of your router.
host string ( Optional , default: 192.168.0.1 )
The IP address of your router.
See the device tracker integration page for instructions how to configure the people to be tracked.
Also known to be working with the following devices:
Irish Virgin Media Super Hub 3.0
Unitymedia Connect Box (DE)
Ziggo Connectbox (NL)
Compal CH7465LG ED 3.0 - Connect box (UPC / Vodafone CZ / Vodafone HU)
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The UPC Connect Box integration was introduced in Home Assistant 0.36, and it's used by
12 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pvizeli
@fabaff
Categories
Presence detection
Back to top
