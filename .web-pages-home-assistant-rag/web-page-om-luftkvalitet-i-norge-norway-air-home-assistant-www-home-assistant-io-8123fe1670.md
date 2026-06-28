# Om Luftkvalitet i Norge (Norway Air) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/norway_air
- Final URL: https://www.home-assistant.io/integrations/norway_air
- Canonical URL: https://www.home-assistant.io/integrations/norway_air/
- Fetched at: 2026-06-28T03:03:48Z
- Content type: text/html; charset=UTF-8

## Description

Display the current status of Norway air quality.

## Extracted Text

On this page
Related topics
The Norway Air integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] queries the Norway air quality data feed provided by the Norwegian Meteorological Institute.
To add the air quality integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry air_quality : - platform : norway_air
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: Air quality )
Additional name for the sensor.
forecast integer ( Optional )
If you want to get forecast data instead of the current data, set this to the number of hours that you want to look into the future.
latitude float ( Optional )
Manually specify latitude.
Default:
Provided by Home Assistant configuration
longitude float ( Optional )
Manually specify longitude.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Om Luftkvalitet i Norge (Norway Air) integration was introduced in Home Assistant 0.88, and it's used by
98 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Health
Back to top
