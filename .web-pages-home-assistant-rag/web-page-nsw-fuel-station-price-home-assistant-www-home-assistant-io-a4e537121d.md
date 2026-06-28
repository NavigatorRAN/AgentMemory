---
source_url: "https://www.home-assistant.io/integrations/nsw_fuel_station"
final_url: "https://www.home-assistant.io/integrations/nsw_fuel_station"
canonical_url: "https://www.home-assistant.io/integrations/nsw_fuel_station/"
source_handle: "web:www-home-assistant-io:a4e537121d1d"
source_section: "integrations-nsw-fuel-station"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d72d08d832703a7e33256fc8edab6b50eb224fca9735a211786db6cc8625ae0f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# NSW Fuel Station Price - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nsw_fuel_station
- Final URL: https://www.home-assistant.io/integrations/nsw_fuel_station
- Canonical URL: https://www.home-assistant.io/integrations/nsw_fuel_station/
- Fetched at: 2026-06-28T03:04:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate NSW fuel station prices into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
The NSW Fuel Station Price integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the NSW Fuel Check App data as a source for current fuel price data.
To get the station ID for any NSW fuel station you will need to:
Visit the Fuel Check App .
Open the developer console of your browser (for Chrome, click View -> Developer -> Developer Tools). Click the “Network” tab in the developer console.
In the Fuel Check App, search for your postcode or click “Fuel Near Me”.
In the developer console, you should see a request to /FuelCheckApp/v1/fuel/prices/bylocation . Open this request and preview the response. Find the station you wish to add, and copy down the ServiceStationID field.
Alternatively:
Select a station you wish to find the ID for.
Select “Report this Station”.
In the URL of the new page opened, locate serviceStationId .
To add the NSW fuel station price sensor to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
sensor : - platform : nsw_fuel_station station_id : 291
Configuration Variables
Looking for your configuration file?
station_id string Required
The ID of the station to track
fuel_types list ( Optional )
A list of fuel types to track for the station. Must be one of ["E10", "U91", "E85", "P95", "P98", "DL", "PDL", "B20", "LPG", "CNG", "EV"] . Descriptions of fuel types can be found here .
Default:
['E10', 'U91']
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NSW Fuel Station Price integration was introduced in Home Assistant 0.72, and it's used by
138 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@nickw444
Categories
Car
Back to top
