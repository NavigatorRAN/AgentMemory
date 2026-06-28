# Sky Hub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sky_hub
- Final URL: https://www.home-assistant.io/integrations/sky_hub
- Canonical URL: https://www.home-assistant.io/integrations/sky_hub/
- Fetched at: 2026-06-28T03:16:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Sky Hub routers into Home Assistant.

## Extracted Text

On this page
Related topics
The Sky Hub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at connected devices to a Sky Hub router based router.
To use your Sky Hub device in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : sky_hub
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: 192.168.1.254 )
The IP address of your router.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sky Hub integration was introduced in Home Assistant 0.37, and it's used by
21 active installations.
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
