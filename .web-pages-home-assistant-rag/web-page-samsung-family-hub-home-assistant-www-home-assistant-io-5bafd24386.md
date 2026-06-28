# Samsung Family Hub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/familyhub
- Final URL: https://www.home-assistant.io/integrations/familyhub
- Canonical URL: https://www.home-assistant.io/integrations/familyhub/
- Fetched at: 2026-06-28T02:41:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Samsung Family Hub refrigerator cameras within Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Samsung Family Hub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to get images of the inside of your Samsung Family Hub refrigerator in Home Assistant.
To enable your Family Hub camera in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry camera : - platform : familyhub ip_address : " IP_ADDRESS"
Configuration Variables
Looking for your configuration file?
ip_address string Required
The IP address of your refrigerator.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Samsung Family Hub integration was introduced in Home Assistant 0.70, and it's used by
201 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Camera
Back to top
