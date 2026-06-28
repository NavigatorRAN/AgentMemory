# Edimax - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/edimax
- Final URL: https://www.home-assistant.io/integrations/edimax
- Canonical URL: https://www.home-assistant.io/integrations/edimax/
- Fetched at: 2026-06-28T02:39:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Edimax switches into Home Assistant.

## Extracted Text

On this page
Related topics
This Edimax integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the state of your Edimax switches.
To use your Edimax switch in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : - platform : edimax host : 192.168.1.32
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your Edimax switch, e.g., 192.168.1.32 .
username string ( Optional , default: admin )
Your username for the Edimax switch.
password string ( Optional , default: 1234 )
Your password for the Edimax switch.
name string ( Optional , default: Edimax Smart Plug )
The name to use when displaying this switch.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Edimax integration was introduced in Home Assistant pre 0.7, and it's used by
6 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Switch
Back to top
