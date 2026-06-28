---
source_url: "https://www.home-assistant.io/integrations/vasttrafik"
final_url: "https://www.home-assistant.io/integrations/vasttrafik"
canonical_url: "https://www.home-assistant.io/integrations/vasttrafik/"
source_handle: "web:www-home-assistant-io:547455a52ae3"
source_section: "integrations-vasttrafik"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a9b1377951bc5e954321bdc8d830971d30924c635d405669c9ad2dffbd113005"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Västtrafik - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vasttrafik
- Final URL: https://www.home-assistant.io/integrations/vasttrafik
- Canonical URL: https://www.home-assistant.io/integrations/vasttrafik/
- Fetched at: 2026-06-28T03:26:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate timetable data for traveling in Sweden within Home Assistant.

## Extracted Text

On this page
Solving incorrect selected station problems
Related topics
The Västtrafik integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will provide you traveling details for the larger Göteborg area in Sweden from the Västtrafik public transportation service.
You must create an application here to obtain a key and a secret . Make sure to also subscribe to the API by clicking on Prenumerera på nytt API , and selecting the API Planera Resa v4 .
Add the data to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : vasttrafik key : YOUR_API_KEY secret : YOUR_API_SECRET departures : - from : Musikvägen
Configuration Variables
Looking for your configuration file?
key string Required
The API key to access your Västtrafik account.
secret string Required
The API secret to access your Västtrafik account.
departures list Required
List of travel routes.
name string ( Optional )
Name of the route.
from string Required
The start station name or ID.
heading string ( Optional )
The destination station name or ID.
lines list | string ( Optional )
Only consider these lines.
delay string ( Optional , default: 0 )
Delay in minutes.
The data is coming from Västtrafik .
A full configuration example could look like this:
# Example configuration.yaml entry sensor : - platform : vasttrafik key : YOUR_API_KEY secret : YOUR_API_SECRET departures : - name : Mot järntorget from : Musikvägen heading : Järntorget lines : - 7 - GRÖN delay : 10
It is possible to use the full name of the station for the from/heading values, e.g., Musikvägen, Göteborg.
In cases where the wrong station is being selected, it is possible to provide the station ID instead. To do this you first need to retrieve the station ID either via Västtrafik’s API-konsole (using GET /locations/by-text) or with curl .
To retrieve the ID using curl :
Log in to the Västtrafik API and go to “Applikationer”
Click “* Generera accesstoken”, and then “Kopiera”.
Execute the following curl command, replacing “<ACCESS_TOKEN>” and “<STATION_NAME>” as necessary:
curl -H "Authorization: Bearer <ACCESS_TOKEN>" "https://ext-api.vasttrafik.se/pr/v4/locations/by-text?q=<STATION_NAME>"
In the output locate the key called “results”, and under this key, you will find a list of stops. Copy the ID (gid) for your desired stop and use it in your configuration.
# Example configuration.yaml entry using station ID as departure and station name as destination sensor : - platform : vasttrafik key : YOUR_API_KEY secret : YOUR_API_SECRET departures : - name : To the Iron Square \o/ from : 9021014004870000 heading : Järntorget delay : 0
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Västtrafik integration was introduced in Home Assistant 0.30, and it's used by
83 active installations.
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
