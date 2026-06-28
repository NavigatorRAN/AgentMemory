---
source_url: "https://www.home-assistant.io/integrations/rejseplanen"
final_url: "https://www.home-assistant.io/integrations/rejseplanen"
canonical_url: "https://www.home-assistant.io/integrations/rejseplanen/"
source_handle: "web:www-home-assistant-io:329c2bc49d09"
source_section: "integrations-rejseplanen"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6d186a0817736bd840b1a7352b77b75c3ca4e8eef2e254e43f835e55aaef8499"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Rejseplanen - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rejseplanen
- Final URL: https://www.home-assistant.io/integrations/rejseplanen
- Canonical URL: https://www.home-assistant.io/integrations/rejseplanen/
- Fetched at: 2026-06-28T03:11:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate timetable data for Danish Rejseplanen within Home Assistant.

## Extracted Text

On this page
Configuration
stop_id
Direction
Route
Examples
Attributes
next_departures
Related topics
The Rejseplanen integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will provide you with travel details for Danish public transport, using timetable data from Rejseplanen .
Add a sensor to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : rejseplanen stop_id : " YOUR_STOP_ID"
Configuration Variables
Looking for your configuration file?
stop_id string Required
The ID of the public transport stop.
name string ( Optional , default: Next departure )
The name of the sensor. Entity ID for the sensor will be created based on this name. E.g., Glostrup St becomes sensor.glostrup_st . It’s optional but recommended if you define more than one sensor.
route string | list ( Optional )
List of route names.
direction string | list ( Optional )
List of directions to filter by.
departure_type string | list ( Optional )
List of departure types to filter by.
The stop_id can be obtained through the following steps:
Go to https://www.openstreetmap.org
Make a search and fill in the location you want to find for.
The URL will look like this https://www.openstreetmap.org/#map=18/56.15756/10.20674
Now insert the coordinates for the location in the URL, in this example it will be: http://xmlopen.rejseplanen.dk/bin/rest.exe/stopsNearby?coordX=56.15756&coordY=10.20674&
You will now see the 30 stops closest to your location.
You will see an output like this:
"StopLocation":[{
"name":"Engdalsvej/Århusvej (Favrskov Kom)",
"x":"10078598",
"y":"56243456",
"id":"713000702"
Find the name of your stop in the list and the “id” is the one you are looking for to us as value for stop_id: .
If you use the direction filter it’s important to put correct final destination(s) or else the sensor will not work at all.
The direction has to be the scheduled final destination (direction) for the Departure type - NOT the stop where you want to get off .
Replace YOUR_STOP_ID with the id for your stop and go to http://xmlopen.rejseplanen.dk/bin/rest.exe/departureBoard?id=YOUR_STOP_ID
The values under direction is the ones you need to put under direction . Make sure you use the exact name, and add all that apply.
<Departure name="Bus 200" type="BUS" stop="Engdalsvej/Århusvej (Favrskov Kom)" time="10:15" date="06.05.20" id="713000701" line="200" messages="0" finalStop="Bjergegårdsvej/Rylevej (Favrskov Kom)" direction="Hinnerup">
<JourneyDetailRef ref="http://xmlopen.rejseplanen.dk/bin/rest.exe/journeyDetail?ref=248868%2F117643%2F641354%2F237721%2F86%3Fdate%3D06.05.20" />
</Departure>
<Departure name="Bus 200" type="BUS" stop="Engdalsvej/Århusvej (Favrskov Kom)" time="10:25" date="06.05.20" id="713000702" line="200" messages="0" finalStop="Skanderborg Busterminal (Skanderborg Kom)" direction="Skanderborg Busterminal (Skanderborg Kom)">
<JourneyDetailRef ref="http://xmlopen.rejseplanen.dk/bin/rest.exe/journeyDetail?ref=512592%2F205637%2F693742%2F176008%2F86%3Fdate%3D06.05.20" />
A working example on how to use this sensor with direction:
# Example configuration.yaml entry with the correct use of direction. sensor : - platform : rejseplanen stop_id : " 713000702" direction : - ' Bjergegårdsvej/Rylevej (Favrskov Kom)' - ' Skanderborg Busterminal (Skanderborg Kom)'
If you use the route filter it’s important to put correct route name(s) or else the sensor will not work at all.
The values under Departure name is the ones you need to put under route . Make sure you use the exact name.
<Departure name="Bus 1A" type="BUS" stop="Elmegade (Nørrebrogade)" time="10:19" date="06.05.20" id="45739" line="1A" messages="0" rtTime="10:21" rtDate="06.05.20" finalStop="Avedøre St." direction="Avedøre St.">
<JourneyDetailRef ref="http://xmlopen.rejseplanen.dk/bin/rest.exe/journeyDetail?ref=138234%2F58362%2F751742%2F329795%2F86%3Fdate%3D06.05.20" />
<Departure name="Bus 5C" type="BUS" stop="Elmegade (Nørrebrogade)" time="10:22" date="06.05.20" id="45739" line="5C" messages="0" rtTime="10:23" rtDate="06.05.20" finalStop="Husum Torv, Sløjfen (Sløjfen)" direction="Husum Torv">
<JourneyDetailRef ref="http://xmlopen.rejseplanen.dk/bin/rest.exe/journeyDetail?ref=899547%2F321443%2F654384%2F27343%2F86%3Fdate%3D06.05.20" />
A more extensive example on how to use this sensor:
# Example configuration.yaml entry sensor : - platform : rejseplanen name : " Elmegade 350S" stop_id : " 000045740" route : " Bus 350S" direction : - ' Herlev St.' - ' Ballerup St.'
The sensor can filter the timetables by one or more routes, directions and types. The known types are listed in the table below.
Departure type Description BUS Normal bus EXB Express bus TB Harbour bus LET Letbanen M Metro S S-train REG Regional train IC Intercity train LYN Intercity express train TOG Other trains
Attribute Description due_in Minutes until departure due_at Departure date and time scheduled_at Scheduled departure date and time real_time_at Real time departure date and time (in cases where it’s different from scheduled) type Transport type route Route code direction Destination stop final_stop Final stop (if departure doesn’t go all the way to the destination stop) stop Departure stop stop_id ID of departure stop track Departure track (if available) attribution Attribution (required by data source) next_departures List of further departures
Attribute Description due_in Minutes until departure due_at Departure date and time scheduled_at Scheduled departure date and time real_time_at Real time departure date and time (in cases where it’s different from scheduled) type Transport type route Route code direction Destination stop final_stop Final stop (if departure doesn’t go all the way to the destination stop) stop Departure stop track Departure track (if available)
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rejseplanen integration was introduced in Home Assistant 0.88, and it's used by
66 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Transport
Back to top
