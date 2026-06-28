# Linksys Smart Wi-Fi - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/linksys_smart
- Final URL: https://www.home-assistant.io/integrations/linksys_smart
- Canonical URL: https://www.home-assistant.io/integrations/linksys_smart/
- Fetched at: 2026-06-28T02:56:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Linksys Smart Wi-Fi Router into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Linksys Smart Wi-Fi integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at connected devices to a Linksys Smart Wi-Fi based router.
Tested routers:
Linksys WRT3200ACM MU-MIMO Gigabit Wi-Fi Wireless Router
Linksys WRT1900ACS Dual-band Wi-Fi Router
Linksys EA6900 AC1900 Dual-Band Wi-Fi Router
Linksys EA8300 Max-Stream AC2200 Tri-Band Wi-Fi Router
For this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to work correctly, it is necessary to disable the “Access via wireless” feature in the Local Management Access section of the router administration page. If “Access via wireless” is not disabled, a connectivity conflict arises because the Home Assistant integration is trying to pass userid and password, but the router is only expecting a password.
To use a Linksys Smart Wi-Fi Router in your Home Assistant installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : linksys_smart host : 192.168.1.1
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or IP address of your router, e.g., 192.168.1.1 .
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Linksys Smart Wi-Fi integration was introduced in Home Assistant 0.48, and it's used by
70 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
