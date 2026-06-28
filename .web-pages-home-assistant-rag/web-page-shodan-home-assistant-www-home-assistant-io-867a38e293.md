# Shodan - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/shodan
- Final URL: https://www.home-assistant.io/integrations/shodan
- Canonical URL: https://www.home-assistant.io/integrations/shodan/
- Fetched at: 2026-06-28T03:15:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Shodan sensors into Home Assistant.

## Extracted Text

On this page
Related topics
The Shodan integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is displaying the total of result of a
Shodan query.
Use “Show API Key” in the upper right corner when you are logged in or got to
your “My Account” page to retrieve your API key.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
file:
# Example configuration.yaml entry sensor : - platform : shodan api_key : SHODAN_API_KEY query : " home-assistant"
Configuration Variables
Looking for your configuration file?
api_key string Required
The API key for Shodan.io.
query string Required
The search string.
name string ( Optional )
Name of the Shodan sensor.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Shodan integration was introduced in Home Assistant 0.51, and it's used by
42 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Sensor
Back to top
