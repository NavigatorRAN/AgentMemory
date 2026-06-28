---
source_url: "https://www.home-assistant.io/integrations/delijn"
final_url: "https://www.home-assistant.io/integrations/delijn"
canonical_url: "https://www.home-assistant.io/integrations/delijn/"
source_handle: "web:www-home-assistant-io:6e1b1c189c7b"
source_section: "integrations-delijn"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "64df4ff15c01c495c6739ab5801af9d31abbb7581cee4ae9c4c8d5ca49678b1e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# De Lijn - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/delijn
- Final URL: https://www.home-assistant.io/integrations/delijn
- Canonical URL: https://www.home-assistant.io/integrations/delijn/
- Fetched at: 2026-06-28T02:36:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate De Lijn (Flemish public transport company) departure times into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Examples
Full configuration
Custom dashboard card
Related topics
The De Lijn integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you the departure time of the next bus, tram or subway at a specific stop of the De Lijn public transport network in Flanders (Belgium).
Create a developer account at De Lijn Open Data portal to get a free API subscription key.
For valid stop IDs check for the 6 digits at the physical stops or visit the stops page of the De Lijn website.
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : delijn api_key : " API_SUBSCRIPTION_KEY" next_departure : - stop_id : ' STOP_ID'
Configuration Variables
Looking for your configuration file?
api_key string Required
API Subscription key needed to access De Lijn APIs.
next_departure list Required
One or multiple departure sensors.
stop_id string Required
ID of the stop, for example, 200552 .
number_of_departures integer ( Optional , default: 5 )
Specify the maximum number of departures/passages at a stop to retrieve
The example below shows a full configuration with two sensors, only the abcdefg needs to be replaced with an actual API subscription key. The first stop_id will return the default next 5 passages, the second stop_id has been forced to return the next 20 passages.
# Example configuration.yaml entry sensor : # De Lijn public transport - platform : delijn api_key : " abcdefg" next_departure : - stop_id : ' 200018' - stop_id : ' 201169' number_of_departures : 20
Works best with the following custom dashboard card: delijn-card
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The De Lijn integration was introduced in Home Assistant 0.97, and it's used by
37 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bollewolle
@Emilv2
Categories
Sensor
Transport
Back to top
