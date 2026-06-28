# AEMET OpenData - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aemet
- Final URL: https://www.home-assistant.io/integrations/aemet
- Canonical URL: https://www.home-assistant.io/integrations/aemet/
- Fetched at: 2026-06-28T02:26:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate AEMET OpenData within Home Assistant.

## Extracted Text

On this page
Configuration
Removing the integration
To remove an integration instance from Home Assistant
The AEMET integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses AEMET OpenData as a source for current meteorological data for your location. AEMET stands for “Agencia Estatal de Meteorología”, which is the Spanish Meteorological Agency.
There is currently support for the following entity types within Home Assistant:
Image
Sensor
Weather
You need an API key, which is free but requires a registration .
The AEMET OpenData service is completely free but is limited to the Spanish territory.
To add AEMET OpenData integration go to Settings > Devices & services and find the integration in the list.
API Key
API Key from the website
Name
Name of the integration
Latitude
Latitude for weather forecast and sensor
Longitude
Longitude for weather forecast and sensor
The integration creates one weather entity per forecast mode and also sensors for all available conditions. There are two forecast modes, daily for daily forecast up to 6 days or hourly for an hourly forecast up to 3 days.
For each condition, the following sensors are created:
Condition Description condition Current weather condition code. humidity Relative humidity. pressure Sea-level air pressure in millibars. rain Rain volume. rain_probability Probability of rain. snow Snow volume. snow_probability Probability of snow. station_id Closest AEMET station ID. station_name Closest AEMET station name. station_timestamp Timestamp of AEMET station data. storm_probability Probability of storm. temperature Current temperature. temperature_feeling Relative temperature. town_id Closest AEMET town ID. town_name Closest AEMET town name. town_timestamp Timestamp of AEMET town data. wind_bearing Wind bearing. wind_max_speed Max Wind speed. wind_speed Wind speed.
The integration creates an image entity for the weather radar if the radar option is enabled.
Details about the API are available in the AEMET OpenData documentation .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AEMET OpenData service was introduced in Home Assistant 2021.3, and it's used by
2946 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Noltari
Categories
Back to top
