---
source_url: "https://www.home-assistant.io/integrations/rmvtransport"
final_url: "https://www.home-assistant.io/integrations/rmvtransport"
canonical_url: "https://www.home-assistant.io/integrations/rmvtransport/"
source_handle: "web:www-home-assistant-io:6a488d7e369e"
source_section: "integrations-rmvtransport"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "07874deb43ad2c45c52b9b53d3ec05e361584702da8fc23cf2052f3e6adcbe70"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# RMV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rmvtransport
- Final URL: https://www.home-assistant.io/integrations/rmvtransport
- Canonical URL: https://www.home-assistant.io/integrations/rmvtransport/
- Fetched at: 2026-06-28T03:12:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Rhein-Main public transport departure times into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Examples
Full configuration
Related topics
The RMV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you the departure time of the next bus, tram, subway or train at the next station or stop in the Rhein-Main area public transport network. Additional details such as the line number and destination are present in the attributes.
Visit the RMV OpenData website to find a list of valid station IDs. You will need to use the “HAFAS_ID”.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : rmvtransport next_departure : - station : STATION_OR_STOP_ID
Configuration Variables
Looking for your configuration file?
timeout integer ( Optional , default: 10 )
Specify the timeout for the API calls.
next_departure list Required
One or multiple departure sensors.
name string ( Optional )
Name to use in the frontend.
Default:
The default is the station name.
station string Required
ID of the stop or station, e.g., 3000010 .
destinations string ( Optional )
One or multiple final stop names, e.g., ‘Frankfurt (Main) Hauptbahnhof’ or [‘Frankfurt (Main) Hauptbahnhof’,‘Frankfurt (Main) Stadion’]. This can be used to only consider a particular direction of travel.
direction string ( Optional )
ID of a stop or station, e.g., 3000912 . This can be used to only consider a particular direction of travel.
lines string | integer ( Optional )
One or more line numbers, e.g., 'S8' or ['S8', 'RB33', '41']
products string ( Optional )
One or more modes of transport ['U-Bahn', 'Tram', 'Bus', 'S', 'RB', 'RE', 'EC', 'IC', 'ICE'] .
[“U-Bahn”, “Tram”, “Bus”, “S”, “RB”, “RE”, “EC”, “IC”, “ICE”]
time_offset integer ( Optional , default: 0 )
Do not display departures leaving sooner than this number of minutes. Useful if you are a couple of minutes away from the stop.
max_journeys integer ( Optional , default: 5 )
Specify the maximal number of journeys.
The example below shows a full configuration with three sensors that showcase the various configuration options.
# Example configuration.yaml entry sensor : - platform : rmvtransport scan_interval : 120 timeout : 10 next_departure : - station : 3000010 time_offset : 5 destinations : - ' Frankfurt (Main) Flughafen Regionalbahnhof' - ' Frankfurt (Main) Stadion' products : - ' RB' - ' RE' - ' Bus' - ' S' - station : 3006907 products : " Bus" destinations : [ ' Wiesbaden Dernsches Gelände' , ' Mainz Hauptbahnhof' ] name : Destination - station : 3006904 lines : " S8" max_journeys : 5 products : " S" - station : 3001830 time_offset : 15 direction : 3000010
The first sensor will return S-Bahn, bus, RB and RE trains departures from Frankfurt Hauptbahnhof to Frankfurt Airport or Stadium that are at least 5 minutes away.
The second sensor returns bus departures from Wiesbaden Hauptbahnhof going to Dernsches Gelände and Mainz Hauptbahnhof. To retrieve the time of the second departure, you would use the state_attr function: state_attr('sensor.ENTITY_NAME', 'departures')[1].time .
The third sensor returns all S-Bahn trains from Mainz Hauptbahnhof for line S8.
The 4th sensor returns all connections from Niederrad Bahnhof going to or over Frankfurt Hauptbahnhof.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RMV integration was introduced in Home Assistant 0.76, and it's used by
129 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@cgtobi
Categories
Transport
Back to top
