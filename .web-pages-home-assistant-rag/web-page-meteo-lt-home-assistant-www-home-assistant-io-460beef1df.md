---
source_url: "https://www.home-assistant.io/integrations/meteo_lt"
final_url: "https://www.home-assistant.io/integrations/meteo_lt"
canonical_url: "https://www.home-assistant.io/integrations/meteo_lt/"
source_handle: "web:www-home-assistant-io:460beef1df51"
source_section: "integrations-meteo-lt"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "26994f396ca5d12d3408ae00cb6220d2298428139ac60c6f11abb60def949c79"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Meteo.lt - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/meteo_lt
- Final URL: https://www.home-assistant.io/integrations/meteo_lt
- Canonical URL: https://www.home-assistant.io/integrations/meteo_lt/
- Fetched at: 2026-06-28T02:59:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Lithuanian Hydrometeorological Service (Meteo.lt) within Home Assistant.

## Extracted Text

On this page
Supported functionality
Prerequisites
Configuration
Weather platform
Current conditions
Forecasts
Data updates
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Meteo.lt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses meteorological data from the Lithuanian Hydrometeorological Service ( LHMT ) to provide weather forecasts for locations in Lithuania. You can set up one or more locations via the user interface.
The integration provides current weather conditions along with hourly and daily forecasts from official weather stations across Lithuania.
Current weather conditions including temperature, humidity, pressure, and wind data
Hourly weather forecast for the next 24 hours
Daily weather forecast for the next 5 days
Weather station selection by coordinates or manual selection
Multiple location support
This integration requires an active internet connection to retrieve weather data from the Meteo.lt API .
To add the Meteo.lt service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Meteo.lt .
Follow the instructions on screen to complete the setup.
The weather platform provides current conditions and forecasts that can be used with the weather dashboard card.
The following current weather data is provided:
Temperature (°C): Current air temperature
Apparent temperature (°C): “Feels like” temperature
Humidity (%): Relative humidity
Pressure (hPa): Atmospheric pressure
Wind speed (m/s): Current wind speed
Wind direction (degrees): Wind direction in degrees
Wind gust speed (m/s): Maximum wind gust speed
Cloud coverage (%): Percentage of cloud cover
Condition : Weather condition (such as clear, cloudy, or rainy)
The integration supports two types of forecasts:
Hourly forecast : Available for the next 24 hours with detailed conditions including temperature, precipitation, wind, and cloud coverage.
Daily forecast : Available for the next 5 days, aggregated from hourly data showing daily high/low temperatures and midday conditions.
Weather data is automatically updated every 30 minutes from the Meteo.lt API .
Weather data is only available for locations within Lithuania
Historical weather data is not provided
Weather warnings and alerts are not currently supported
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Meteo.lt service was introduced in Home Assistant 2025.11, and it's used by
127 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@xE1H
Categories
Weather
Back to top
