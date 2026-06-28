---
source_url: "https://www.home-assistant.io/integrations/uk_transport"
final_url: "https://www.home-assistant.io/integrations/uk_transport"
canonical_url: "https://www.home-assistant.io/integrations/uk_transport/"
source_handle: "web:www-home-assistant-io:f6d52d239803"
source_section: "integrations-uk-transport"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5c997f926a7309ff2dc02b59b60f630edb1db04fabaf282e271a4b3b333273c2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# UK Transport - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/uk_transport
- Final URL: https://www.home-assistant.io/integrations/uk_transport
- Canonical URL: https://www.home-assistant.io/integrations/uk_transport/
- Fetched at: 2026-06-28T03:24:41Z
- Content type: text/html; charset=UTF-8

## Description

Display the current status of UK train and bus departures.

## Extracted Text

On this page
Managing API requests
Related topics
The UK Transport integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will display the time in minutes until the next departure in a specified direction from of a configured train station or bus stop. The sensor uses transportAPI to query live departure data and requires a developer application ID and key which can be obtained here . The free tier allows 30 requests a day, which is sufficient for a single sensor refreshing every 48 minutes.
Note
Additional sensors can be added but at the expense of a reduced refresh rate. 2 sensors can be updated every 2*48 = 96 minutes, and so on. Calculating and setting this rate is automatically handles by the integration.
Queries are entered as a list, with the two transport modes available being bus and train .
Train departure sensors require three character long origin and destination station codes which are searchable on the National Rail enquiries website (e.g., WAT is London Waterloo). The validity of a route can be checked by performing a GET request to /uk/train/station/{station_code}/live.json in the API reference webpage .
To add a single train departure integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry for a single sensor sensor : - platform : uk_transport app_id : YOUR_APP_ID app_key : YOUR_APP_KEY queries : - mode : train origin : MAL destination : WAT
Configuration Variables
Looking for your configuration file?
app_id string Required
Your application ID.
app_key string Required
Your application Key.
queries list Required
At least one entry required.
mode list Required
One of bus or train .
origin string Required
Specify the three character long origin station code.
destination string Required
Specify the three character long destination station code.
A large amount of information about upcoming departures is available within the attributes of the sensor. The example above creates a sensor with ID sensor.next_train_to_wat with the attribute next_trains which is a list of the next 25 departing trains.
These attributes are available for each departing train:
origin_name
destination_name
status
scheduled : (API attribute is aimed_departure_time )
estimated : (API attribute is expected_departure_time )
platform
operator_name
Refer to the API reference webpage for definitions.
Attributes can be accessed using the template sensor as per this example:
# Example configuration.yaml entry for a template sensor to access the attributes of the next departing train. template : - sensor : - name : Next train status state : >- {{state_attr('sensor.next_train_to_wat', 'next_trains')[0].status}} - name : Next train origin state : >- {{state_attr('sensor.next_train_to_wat', 'next_trains')[0].origin_name}} - name : Next train estimated state : >- {{state_attr('sensor.next_train_to_wat', 'next_trains')[0].estimated}} - name : Next train scheduled state : >- {{state_attr('sensor.next_train_to_wat', 'next_trains')[0].scheduled}} - name : Next train platform state : >- {{state_attr('sensor.next_train_to_wat', 'next_trains')[0].platform}}
Bus sensors require as their origin a bus stop ATCO code which can be found by browsing OpenStreetMap data as
follows:
On OpenStreetMap.org zoom right in on a bus stop you’re interested in.
Click the layers picker button on the right hand side.
Tick the ‘map data’ layer, and wait for clickable objects to load.
Click the bus stop node to reveal its tags on the left.
The destination must be a valid location in the “direction” field returned by a GET query to /uk/bus/stop/{atcocode}/live.json as described in the API reference webpage . A bus sensor is added in the following configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file entry:
# Example configuration.yaml entry for multiple sensors sensor : - platform : uk_transport app_id : YOUR_APP_ID app_key : YOUR_APP_KEY queries : - mode : bus origin : 340000368SHE destination : Wantage - mode : train origin : MAL destination : WAT
And the template sensor for viewing the next bus attributes.
# Example configuration.yaml entry for a template sensor to access the attributes of the next departing bus. template : - sensor : - name : Next bus route state : " {{state_attr('sensor.next_bus_to_wantage', 'next_buses')[0].route}}" - name : Next bus direction state : " {{state_attr('sensor.next_bus_to_wantage', 'next_buses')[0].direction}}" - name : Next bus scheduled state : " {{state_attr('sensor.next_bus_to_wantage', 'next_buses')[0].scheduled}}" - name : Next bus estimated state : " {{state_attr('sensor.next_bus_to_wantage', 'next_buses')[0].estimated}}"
If you wish to manage the rate of API requests (e.g., to disable requests when you aren’t interested in travel, so that you can request updates more frequently when you do travel) set a really long scan_interval in the configuration options, and use the homeassistant.update_entity action to request the update of an entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , rather than waiting for the next scheduled update.
Powered by transportAPI
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The UK Transport integration was introduced in Home Assistant 0.50, and it's used by
86 active installations.
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
