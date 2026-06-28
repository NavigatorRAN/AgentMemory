# Swiss Hydrological Data - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/swiss_hydrological_data
- Final URL: https://www.home-assistant.io/integrations/swiss_hydrological_data
- Canonical URL: https://www.home-assistant.io/integrations/swiss_hydrological_data/
- Fetched at: 2026-06-28T03:19:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate hydrological data of Swiss waters within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Swiss Hydrological Data integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will show you details (temperature, level, and discharge) of rivers and lakes in Switzerland.
The station overview contains a list of all available measuring points and will help to determine the ID of station which is needed for the configuration.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : swiss_hydrological_data station : STATION_ID monitored_conditions : - temperature - level - discharge
Configuration Variables
Looking for your configuration file?
station string Required
The ID of the measurement point.
monitored_conditions list ( Optional , default: temperature )
The list of measurements you want to use. Available is temperature , level or discharge .
Sensors are exposing additional values through their attributes for all available conditions:
max-24h : The maximum measurement for the last 24 hours.
mean-24h : The mean measurement for the last 24 hours.
min-24h : The minimum measurement for the last 24 hours.
station_update : There is a time span between the sensor update in Home Assistant and the updates from the stations. Include those information if you are building automations based on the discharge of a water body.
Note
The sensors don’t show the latest measurement, but those from the last hour due to the source of data. Some stations also don’t provide data for certain measurements.
The hydrological measurements are coming from the Swiss Federal Office for the Environment (Bundesamt für Umwelt - Abt. Hydrologie) and are updated every 10 minutes.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Swiss Hydrological Data integration was introduced in Home Assistant 0.22, and it's used by
75 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Environment
Back to top
