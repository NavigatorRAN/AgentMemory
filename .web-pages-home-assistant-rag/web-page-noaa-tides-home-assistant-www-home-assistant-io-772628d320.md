---
source_url: "https://www.home-assistant.io/integrations/noaa_tides"
final_url: "https://www.home-assistant.io/integrations/noaa_tides"
canonical_url: "https://www.home-assistant.io/integrations/noaa_tides/"
source_handle: "web:www-home-assistant-io:772628d320d4"
source_section: "integrations-noaa-tides"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3dec39f9238d24a0c4c681d679d147474a8857bf9b45be7c78200bc730cba047"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# NOAA Tides - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/noaa_tides
- Final URL: https://www.home-assistant.io/integrations/noaa_tides
- Canonical URL: https://www.home-assistant.io/integrations/noaa_tides/
- Fetched at: 2026-06-28T03:03:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions to add NOAA Tide information to Home Assistant.

## Extracted Text

On this page
Setup
Configuration
The NOAA Tides integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses details from NOAA Tides and Currents to provide information about the prediction for the tides for any location in the United States.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] requires the use of a NOAA station ID. Search NOAA Tide Predictions to find a location. Use the ID from the search results in your configuration. Alternatively, you can determine a station ID from a URL. For example, 8721164 in the following URL: https://tidesandcurrents.noaa.gov/noaatidepredictions.html?id=8721164
To use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : noaa_tides station_id : 8721164
Configuration Variables
Looking for your configuration file?
station_id string Required
ID of the station you’d like to track from https://tidesandcurrents.noaa.gov/tide_predictions.html .
name string ( Optional , default: NOAA Tides. )
User-supplied sensor name.
time_zone list ( Optional )
User-selected timezone.
Default:
Local Standard Time/Local Daylight Time.
gmt
Greenwich Mean Time.
lst
Local Standard Time. The time local to the requested station.
lst_ldt
Local Standard/Local Daylight Time. The time local to the requested station.
unit_system string ( Optional )
Specify the unit system. Use metric (Celsius, meters, cm/s) or english (fahrenheit, feet, knots) units.
Defaults to metric or imperial based on the Home Assistant configuration.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NOAA Tides integration was introduced in Home Assistant 0.75, and it's used by
258 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jdelaney72
Categories
Environment
Back to top
