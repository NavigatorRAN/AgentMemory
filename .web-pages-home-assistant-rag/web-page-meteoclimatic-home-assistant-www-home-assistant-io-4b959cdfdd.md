---
source_url: "https://www.home-assistant.io/integrations/meteoclimatic"
final_url: "https://www.home-assistant.io/integrations/meteoclimatic"
canonical_url: "https://www.home-assistant.io/integrations/meteoclimatic/"
source_handle: "web:www-home-assistant-io:4b959cdfdd9c"
source_section: "integrations-meteoclimatic"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5f8be640fc282030b085dd06baacd6e29aa1e34abe1491113e5e25ca7ac84cd7"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Meteoclimatic - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/meteoclimatic
- Final URL: https://www.home-assistant.io/integrations/meteoclimatic
- Canonical URL: https://www.home-assistant.io/integrations/meteoclimatic/
- Fetched at: 2026-06-28T02:59:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Meteoclimatic within Home Assistant.

## Extracted Text

On this page
Configuration
Sensor
The Meteoclimatic integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the Meteoclimatic web service as a source for meteorological data for your location. The location is based on the Meteoclimatic station code (e.g., ESCAT4300000043206B ) and the weather data reported is based on the capabilities of each station.
There is currently support for the following platforms within Home Assistant:
Weather
It displays the current weather along with individual sensors that include daily maximum and minimum values.
To add the Meteoclimatic service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Meteoclimatic .
Follow the instructions on screen to complete the setup.
This integration provides the following sensors:
Name Description Daily Max Humidity Maximum humidity for the past 24 hours in % Daily Max Pressure Maximum pressure for the past 24 hours in hPa Daily Max Temperature Maximum temperature for the past 24 hours in °C Daily Max Wind Speed Maximum wind speed for the past 24 hours in km/h Daily Min Humidity Minimum humidity for the past 24 hours in % Daily Min Pressure Minimum pressure for the past 24 hours in hPa Daily Min Temperature Minimum temperature for the past 24 hours in °C Daily Precipitation Precipitation cumulation for past 24 hours in mm Humidity The current humidity in % Pressure The current pressure in hPa Temperature The current temperature in °C Wind Bearing The current wind bearing in ° Wind Speed The current wind speed in km/h
Warning: As not all weather stations have the same capabilities, some sensors might not be available for certain weather stations. Sensors are only added if data is available and provided by Meteoclimatic.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Meteoclimatic service was introduced in Home Assistant 2021.6, and it's used by
261 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@adrianmo
Categories
Back to top
