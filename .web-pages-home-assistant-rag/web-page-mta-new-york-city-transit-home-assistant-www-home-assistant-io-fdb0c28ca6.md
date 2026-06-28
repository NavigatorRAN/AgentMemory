---
source_url: "https://www.home-assistant.io/integrations/mta"
final_url: "https://www.home-assistant.io/integrations/mta"
canonical_url: "https://www.home-assistant.io/integrations/mta/"
source_handle: "web:www-home-assistant-io:fdb0c28ca6f6"
source_section: "integrations-mta"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "745d1bf8db7acdfda3f10c56b5d95294f2a440ccbc85e528f87f6837d15bd569"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# MTA New York City Transit - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mta
- Final URL: https://www.home-assistant.io/integrations/mta
- Canonical URL: https://www.home-assistant.io/integrations/mta/
- Fetched at: 2026-06-28T03:01:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate real-time NYC subway and bus arrival information within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Adding a subway stop
Adding a bus stop
Supported functionality
Sensors
Defining a custom polling interval
Removing the integration
To remove an integration instance from Home Assistant
The MTA New York City Transit integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides real-time subway and bus arrival predictions for NYC transit lines using GTFS-RT data from the Metropolitan Transportation Authority (MTA) .
Subway tracking : No API key is required.
Bus tracking : An MTA Bus Time API key is required.
To add the MTA New York City Transit service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select MTA New York City Transit .
Follow the instructions on screen to complete the setup.
API key
Your MTA Bus Time API key. Required for bus tracking, optional for subway only.
To add a subway arrival sensor:
Go to Settings > Devices & services and select the MTA New York City Transit integration.
Select Add subway stop .
Select the subway line you want to monitor from the dropdown.
Select the stop and direction (indicated by N/S suffix for northbound/southbound).
To add a bus arrival sensor:
Select Add bus stop .
Enter the bus route (for example, M15 , B46 , Q10 ).
Select the stop from the list. Direction information is included with each stop.
Note
Bus tracking requires an API key. If you did not provide one during initial setup, you will be prompted to enter one when you attempt to add a bus stop.
The integration creates a device per stop with 9 sensors, covering the next 3 upcoming arrivals.
For each of the next 3 arrivals, the following sensors are created:
Arrival : A timestamp sensor showing the predicted arrival time.
Arrival destination : The final destination of the train or bus.
Arrival route : The route identifier of the train or bus.
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
The default polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] interval is 30 seconds.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MTA New York City Transit service was introduced in Home Assistant 2026.3, and it's used by
80 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@OnFreund
Categories
Transport
Back to top
