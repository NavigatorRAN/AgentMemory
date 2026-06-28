# Digital Ocean - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/digital_ocean
- Final URL: https://www.home-assistant.io/integrations/digital_ocean
- Canonical URL: https://www.home-assistant.io/integrations/digital_ocean/
- Fetched at: 2026-06-28T02:37:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Digital Ocean within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Binary sensor
Switch
Related topics
The Digital Ocean integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to access the information about your Digital Ocean droplets from Home Assistant.
There is currently support for the following device types within Home Assistant:
Obtain your API key from your Digital Ocean dashboard .
To integrate your Digital Ocean droplets with Home Assistant, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry digital_ocean : access_token : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
access_token string Required
Your Digital Ocean API access token.
The digital_ocean binary sensor platform allows you to monitor your Digital Ocean droplets.
To use your Digital Ocean droplets, you first have to set up your Digital Ocean hub and then add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : digital_ocean droplets : - ' fedora-512mb-nyc3-01' - ' coreos-512mb-nyc3-01'
droplets list Required
List of droplets you want to monitor.
The digital_ocean switch platform allows you to control (start/stop) your Digital Ocean droplets.
# Example configuration.yaml entry switch : - platform : digital_ocean droplets : - ' fedora-512mb-nyc3-01' - ' coreos-512mb-nyc3-01'
List of droplets you want to control.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Digital Ocean integration was introduced in Home Assistant 0.30, and it's used by
38 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
System monitor
Back to top
