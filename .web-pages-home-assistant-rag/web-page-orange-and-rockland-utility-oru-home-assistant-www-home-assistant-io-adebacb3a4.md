# Orange and Rockland Utility (ORU) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/oru
- Final URL: https://www.home-assistant.io/integrations/oru
- Canonical URL: https://www.home-assistant.io/integrations/oru/
- Fetched at: 2026-06-28T03:06:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Orange and Rockland Utility real-time energy usage sensor within Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
Orange and Rockland Utility is an energy provider in NY and NJ, USA.
The ORU integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] fetches your current energy usage from your ORU smart meter.
To add the oru integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your installation, add your meter_number to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : oru meter_number : YOUR_METER_NUMBER
Configuration Variables
Looking for your configuration file?
meter_number string Required
The meter number of your smart meter with Orange and Rockland Utility.
meter_number is the smart meter number. It can be found on your energy bill, on the top left corner, alongside your account number.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Orange and Rockland Utility (ORU) integration was introduced in Home Assistant 0.101, and it's used by
4 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bvlaicu
Categories
Sensor
Back to top
