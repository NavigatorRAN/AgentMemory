---
source_url: "https://www.home-assistant.io/integrations/citybikes"
final_url: "https://www.home-assistant.io/integrations/citybikes"
canonical_url: "https://www.home-assistant.io/integrations/citybikes/"
source_handle: "web:www-home-assistant-io:be87c177a96d"
source_section: "integrations-citybikes"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4c903821ea5a4eabade0723c0245103bf33d02607cb8626058b31c13c99f0dec"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# CityBikes - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/citybikes
- Final URL: https://www.home-assistant.io/integrations/citybikes
- Canonical URL: https://www.home-assistant.io/integrations/citybikes/
- Fetched at: 2026-06-28T02:33:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate data from the CityBikes API into Home Assistant.

## Extracted Text

On this page
Configuration
Example
Related topics
The CityBikes integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] monitors bike availability at bike sharing stations in a chosen area. The data is provided by CityBikes , which supports bike sharing systems all around the world.
To enable it, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry (using radius) sensor : - platform : citybikes radius : 200
Configuration Variables
Looking for your configuration file?
name string ( Optional )
The base name of this group of monitored stations. The entity ID of every monitored station in this group will be prefixed with this base name, in addition to the network ID.
network string ( Optional )
The name of the bike sharing system to poll.
Default:
Defaults to the system that operates in the monitored location.
latitude string ( Optional )
Latitude of the location, around which bike stations are monitored.
Defaults to the latitude in your configuration.yaml file.
longitude string ( Optional )
Longitude of the location, around which bike stations are monitored.
Defaults to the longitude in your configuration.yaml file.
radius integer ( Optional )
The radius (in meters or feet, depending on the Home Assistant configuration) around the monitored location. Only stations closer than this distance will be monitored. Either radius or stations are required.
stations list ( Optional )
A list of specific stations to monitor. The list should contain station ID s or UID s, which can be obtained from the CityBikes API. Either radius or stations are required.
Additional configuration samples:
# Example configuration.yaml entry (using a list of stations) sensor : - platform : citybikes name : Work Stations stations : - 123 - 145 - 436
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The CityBikes integration was introduced in Home Assistant 0.49, and it's used by
64 active installations.
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
