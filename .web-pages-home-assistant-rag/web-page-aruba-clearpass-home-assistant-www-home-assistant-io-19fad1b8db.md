# Aruba ClearPass - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cppm_tracker
- Final URL: https://www.home-assistant.io/integrations/cppm_tracker
- Canonical URL: https://www.home-assistant.io/integrations/cppm_tracker/
- Fetched at: 2026-06-28T02:35:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Aruba ClearPass into Home Assistant.

## Extracted Text

On this page
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence by looking at connected devices to Aruba Clearpass .
Supported platforms (tested):
Aruba ClearPass 6.7.5
Important
You must first create an API client here .
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : cppm_tracker host : clearpass.server.org client_id : clearpassapi api_key : 00000004qyO513hTdCfjIO2ZWWnmex8QZ5000000000
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or hostname of the ClearPass server, for example, clearpass.server.com .
client_id string Required
The client ID from the API Clients page.
api_key string Required
The secret from the API Clients page.
See the device tracker integration page for instructions on how to configure the people to be tracked.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Aruba ClearPass integration was introduced in Home Assistant 0.90, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence Detection
Back to top
