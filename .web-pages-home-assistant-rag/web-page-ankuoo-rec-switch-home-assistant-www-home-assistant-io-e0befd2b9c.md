# Ankuoo REC Switch - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/recswitch
- Final URL: https://www.home-assistant.io/integrations/recswitch
- Canonical URL: https://www.home-assistant.io/integrations/recswitch/
- Fetched at: 2026-06-28T03:11:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Ankuoo REC Switch into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Ankuoo REC Switch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the Ankuoo REC Switch devices.
Supported devices (tested):
Ankuoo RecSwitch MS6126
Lumitek CSW201 NEO WiFi
MALMBERGS CSW201
To enable this switch, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : - platform : recswitch host : " IP_ADDRESS" mac : " MAC_ADDRESS"
Configuration Variables
Looking for your configuration file?
host string Required
IP address or hostname of the device.
mac string Required
MAC address of the device.
name string ( Optional )
Name to use in the frontend.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ankuoo REC Switch integration was introduced in Home Assistant 0.81, and it's used by
27 active installations.
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
