---
source_url: "https://www.home-assistant.io/integrations/google_travel_time"
final_url: "https://www.home-assistant.io/integrations/google_travel_time"
canonical_url: "https://www.home-assistant.io/integrations/google_travel_time/"
source_handle: "web:www-home-assistant-io:b25ad83b548b"
source_section: "integrations-google-travel-time"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "270e3cf9de26a586b5d72d5ac534a7a9df961a4b2f8d4f2616f99f6586bd9b52"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Maps Travel Time - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_travel_time
- Final URL: https://www.home-assistant.io/integrations/google_travel_time
- Canonical URL: https://www.home-assistant.io/integrations/google_travel_time/
- Fetched at: 2026-06-28T02:47:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Google Maps travel time to Home Assistant.

## Extracted Text

On this page
Setup
Configuration
List of actions
Dynamic Configuration
Examples
Entity Tracking
Updating sensors on-demand using Automation
Defining a custom polling interval
The Google Maps Travel Time integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides travel time from the Google Maps Routes API .
You need to register for an API key by following the instructions here . You only need to turn on the Routes API.
Google requires billing to be enabled (and a valid credit card loaded) to access Google Maps APIs. The integration consumes the Compute Routes Pro API providing 5,000 free requests per month. The sensor will update the travel time every 10 minutes, making approximately 144 calls per day. Note that at this rate, using more than 1 sensor will exceed the free credit limit. As the update frequency cannot be decreased, if you require more frequent data updates, consider triggering on-demand updates (see the automation example below).
A quota can be set against the API to avoid exceeding the free credit amount. Set the ‘Elements per day’ to a limit of 161 or less. Details on how to configure a quota can be found here .
To add the Google Maps Travel Time service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Maps Travel Time .
Follow the instructions on screen to complete the setup.
Notes:
Origin and Destination can be the address or the GPS coordinates of the location (GPS coordinates have to be separated by a comma). You can also enter an entity ID that provides this information in its state, an entity ID with latitude and longitude attributes, or zone friendly name (case sensitive).
The Google Maps Travel Time integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get transit times ( google_travel_time.get_transit_times )
Retrieves route alternatives and travel times between two locations using public transit.
Get travel times ( google_travel_time.get_travel_times )
Retrieves route alternatives and travel times between two locations.
For an overview of every action across all integrations, see the actions reference .
Tracking can be set up to track entities of type device_tracker , zone , sensor and person . If an entity is placed in the Origin or Destination then every 5 minutes when the platform updates it will use the latest location of that entity.
Tracking entity to entity
Origin: device_tracker.mobile_phone
Destination: zone.home
Tracking entity to zone friendly name (e.g. “Eddies House”)
Origin: zone.home
Destination: Eddies House
device_tracker
If state is a zone then the zone location will be used
If state is not a zone it will look for the longitude and latitude attributes
zone
Uses the longitude and latitude attributes
Can also be referenced by just the zone’s friendly name found in the attributes.
sensor
If state is a zone or zone friendly name then will use the zone location
All other states will be passed directly into the Google API
This includes all valid locations listed in the Configuration Variables
Using automatic polling can lead to calls that exceed your API limit, especially when you are tracking multiple travel times using the same API key. To use more granular polling, disable automated polling.
You can use the homeassistant.update_entity action to update the sensor on-demand. For example, if you want to update sensor.morning_commute every 2 minutes on weekday mornings, you can use the following automation:
- alias : " Commute - Update morning commute sensor" initial_state : " on" triggers : - trigger : time_pattern minutes : " /2" conditions : - condition : time after : " 08:00:00" before : " 11:00:00" - condition : time weekday : - mon - tue - wed - thu - fri actions : - action : homeassistant.update_entity target : entity_id : sensor.morning_commute
For more detailed steps on how to define a custom polling interval, follow the procedure below.
If you want to define a specific interval at which your device is being polled for data, you can disable the default polling interval and create your own polling automation.
To add the automation:
Go to Settings > Devices & services , and select your integration.
On the integration entry, select the .
Then, select System options and toggle the button to disable polling.
To define your custom polling interval, create an automation.
Go to Settings > Automations & scenes and create a new automation.
Define any trigger and condition you like.
Select Add action , then select Other actions .
Select Perform action , and from the list, select the homeassistant.update_entity action .
Add the entities you want to poll to the Entity field. The homeassistant.update_entity action only supports targeting by entity. Selecting an area, device, or label is not supported.
Save your new automation to poll for data.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Maps Travel Time service was introduced in Home Assistant 0.19, and it's used by
1371 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@eifinger
Categories
Transport
Back to top
