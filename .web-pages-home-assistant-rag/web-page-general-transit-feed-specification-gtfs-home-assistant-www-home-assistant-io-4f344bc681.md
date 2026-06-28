---
source_url: "https://www.home-assistant.io/integrations/gtfs"
final_url: "https://www.home-assistant.io/integrations/gtfs"
canonical_url: "https://www.home-assistant.io/integrations/gtfs/"
source_handle: "web:www-home-assistant-io:4f344bc681ba"
source_section: "integrations-gtfs"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "963125ddceef6738995ae1da7c6e6932dbf2c6503d745c901422e6973a271d8f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# General Transit Feed Specification (GTFS) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/gtfs
- Final URL: https://www.home-assistant.io/integrations/gtfs
- Canonical URL: https://www.home-assistant.io/integrations/gtfs/
- Fetched at: 2026-06-28T02:47:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use public transit open data in Home Assistant.

## Extracted Text

On this page
Related topics
The GTFS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you the next departure time and associated data from your public transit station/stop. The data comes from your chosen public transit authority and is formatted as General Transit Feed Specification data, commonly known as GTFS.
You need to find a valid GTFS data set, which you can usually find just by searching the internet. Most public transit authorities have GTFS available somewhere, as Google requires public transit authorities to provide the data if they wish to appear on Google Maps. You may also be able to find data at Mobility Database .
Here are some examples:
Bay Area Rapid Transit (BART) - The rapid transit system for the San Francisco Bay Area.
Metropolitan Transit Authority of New York City (MTA) - Provides separate data feeds for subway, bus, LIRR and Metro-North of the greater New York City metropolitan region.
Official Timetable Switzerland - The official timetable data for Switzerland in 2019.
You need to download a GTFS ZIP file and put it into a folder named gtfs in your configuration directory. For ease of use, it is suggested that you rename the file to just the agency/data source name (for example, bart.zip instead of google_transit_20160328_v1.zip ). You can also unzip and place a folder in the gtfs folder.
The data will be converted into a queryable format and saved as a SQLite3 database alongside the source data. The sensor will check for the existence of this SQLite3 data at every startup and will re-import the ZIP/Folder if none is found.
To update the data, delete the SQLite3 file and restart Home Assistant.
To find your stop ID, open the stops.txt file inside the ZIP file/unzipped folder. The format of the ID is different for every transit agency but will be the first “column” (meaning the string before the first comma) in a row.
The sensor attributes will contain all related information for the specific trip, such as agency information, origin and destination stop information, origin and destination stop time and the route information.
Your mileage may vary depending on the transit agency used. Most agencies respect the GTFS format but some will do weird things like adding extra columns or using different data formatting. If you have any data specific issues, please report them to the PyGTFS project, which is what the GTFS sensor uses to parse data.
Please note : This is a static data source. Currently, there is no GTFS Realtime support in this sensor due to issues surrounding parsing the protocol buffer format in Python 3. Once those issues have been fixed Realtime support will be added. Once added, the sensor will check for any delays and advisories and report them in the sensor as needed.
To enable the GTFS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you need to add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : gtfs origin : STOP_ID destination : STOP_ID data : DATA_SOURCE
Configuration Variables
Looking for your configuration file?
origin string Required
The stop ID of your origin station.
destination string Required
The stop ID of your destination station.
data string Required
The name of the ZIP file or folder containing the GTFS data. It must be located inside the gtfs folder of your configuration directory.
name string ( Optional , default: GTFS Sensor )
Name to use in the frontend.
offset integer | time ( Optional , default: 0 )
A minimum delay to look for. If a departure is in less time than offset , it will be ignored. Set the value either in seconds ( integer ), or using one of these time formats: offset: 'HH:MM:SS' , offset: 'HH:MM' .
include_tomorrow boolean ( Optional , default: false )
Also search through tomorrow’s schedule if no more departures are set for today.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The General Transit Feed Specification (GTFS) integration was introduced in Home Assistant 0.17, and it's used by
68 active installations.
Its IoT class is Local Polling.
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
