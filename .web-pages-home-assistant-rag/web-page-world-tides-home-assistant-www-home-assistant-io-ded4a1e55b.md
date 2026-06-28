# World Tides - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/worldtidesinfo
- Final URL: https://www.home-assistant.io/integrations/worldtidesinfo
- Canonical URL: https://www.home-assistant.io/integrations/worldtidesinfo/
- Fetched at: 2026-06-28T03:29:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Tides information to Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The World Tides integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses details from World Tides to provide information about the prediction for the tides for any location in the world.
Get your API key from your account at https://www.worldtides.info/ .
To use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : worldtidesinfo api_key : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
api_key string Required
Your API key.
name string ( Optional , default: WorldTidesInfo )
Name to use in the frontend.
latitude float ( Optional )
Latitude of the location to display the tides.
Default:
The latitude in your configuration.yaml file.
longitude float ( Optional )
Longitude of the location to display the tides.
The longitude in your configuration.yaml file.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The World Tides integration was introduced in Home Assistant 0.52, and it's used by
56 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Environment
Back to top
