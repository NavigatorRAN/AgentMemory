---
source_url: "https://www.home-assistant.io/integrations/irish_rail_transport"
final_url: "https://www.home-assistant.io/integrations/irish_rail_transport"
canonical_url: "https://www.home-assistant.io/integrations/irish_rail_transport/"
source_handle: "web:www-home-assistant-io:1711067d9d11"
source_section: "integrations-irish-rail-transport"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ac417ad8f7cf820b7a4fd7d976630aa9c975deadc7af1a1331c329097e916da5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Irish Rail Transport - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/irish_rail_transport
- Final URL: https://www.home-assistant.io/integrations/irish_rail_transport
- Canonical URL: https://www.home-assistant.io/integrations/irish_rail_transport/
- Fetched at: 2026-06-28T02:53:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate timetable data for traveling on Irish Rail within Home Assistant.

## Extracted Text

On this page
Related topics
The Irish Rail Transport integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you the time until the next two departures (within 90 minutes) from an Irish Rail station using the RTPI information.
A station name is the full station name as specified on the Irish Rail search site, for example, Tara Street or Dublin Connolly .
To activate the sensor add the data to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file as shown in the example:
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : irish_rail_transport station : " Tara Street" name : " To Greystones"
Configuration Variables
Looking for your configuration file?
station string Required
The name of the station.
direction string ( Optional )
The direction of the train. Typically either Northbound or Southbound .
destination string ( Optional )
The name of the destination station to filter by.
stops_at string ( Optional )
An optional filter based on the name of a station that the train stops at.
name string ( Optional , default: Next Train )
A friendly name for this sensor.
Using the stops_at option will cause an extra request per train found. Therefore, if you are looking at a busy station, it is recommended that you also use at least one other filter. For example:
# Example full configuration.yaml entry sensor : - platform : irish_rail_transport station : " Tara Street" direction : Southbound destination : Greystones stops_at : " Dun Laoghaire" name : " To Greystones"
The above example will show the next 2 Southbound trains that leave Tara Street station, going to Greystones via Dun Laoghaire :
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Irish Rail Transport integration was introduced in Home Assistant 0.57, and it's used by
22 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ttroy50
Categories
Transport
Back to top
