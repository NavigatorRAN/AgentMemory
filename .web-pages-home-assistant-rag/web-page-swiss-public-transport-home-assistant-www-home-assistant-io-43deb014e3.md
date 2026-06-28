---
source_url: "https://www.home-assistant.io/integrations/swiss_public_transport"
final_url: "https://www.home-assistant.io/integrations/swiss_public_transport"
canonical_url: "https://www.home-assistant.io/integrations/swiss_public_transport/"
source_handle: "web:www-home-assistant-io:43deb014e36b"
source_section: "integrations-swiss-public-transport"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "787ad78f62e45db520ed0a82a0d00f1de52322cda833cf931525db6fb627c073"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Swiss public transport - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/swiss_public_transport
- Final URL: https://www.home-assistant.io/integrations/swiss_public_transport
- Canonical URL: https://www.home-assistant.io/integrations/swiss_public_transport/
- Fetched at: 2026-06-28T03:19:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate timetable data for traveling in Switzerland within Home Assistant.

## Extracted Text

On this page
Configuration
Set up a connection
Time mode
Departure versus Arrival
List of actions
Defining a custom polling interval
Removing the integration
To remove an integration instance from Home Assistant
The Swiss public transport integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you the next three departure times from a given location to another one in Switzerland.
The Swiss public transport API only allows 1000 requests per 24 hours. The default polling rate is set to 90s , which is just enough for one connection polling continuously. If more entries are needed, consider defining a custom polling interval to reduce the amount of requests.
Start station
The departure station for the start of the connection (e.g., Zürich HB )
End station
The arrival station for the end of the connection (e.g., Geneva )
Via stations
List of up to 5 via stations (e.g., Bern , Lausanne )
Departure or arrival time
Choose between the departure or arrival time or the connection to be displayed
The time mode of the connections (e.g., now , fixed , offset )
Fixed time of day (only when time mode is set to fixed)
The relevant time for the connection (e.g. 7:12:00 AM every morning).
Offset time from now (only when time mode is set to fixed)
The time offset added to the earliest possible connection (e.g. add +00:05:00 offset, taking into account the time to walk to the station)
Use the Stationboard to find exact station names.
To add the Swiss public transport service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Swiss public transport .
Follow the instructions on screen to complete the setup.
The public timetables are coming from Swiss public transport .
The minimum configuration for a connection requires a start and end station (for example, “Zürich HB”).
Optionally, you can provide up to 5 additional via stations where the connection must go through.
The Time mode allows you to specify the time of the connections.
Now (default): Provide the next connections.
At a fixed time of day: Provide the connections that depart at a fixed time of day (for example, 18:15 in the evening)
At an offset from now: Provide the next possible connections which depart after a specified offset (for example, 15 minutes from now, which helps account for a 15-minute walk to the station)
Use case: Next connection at my local bus stop
Usually, it takes some time to walk to the closest bus station from home, which can be modeled using the offset option in the Time mode dropdown, filtering out connections which are not reachable anymore. This information can then be displayed at the door or on your mobile device.
Use case: Daily train home
For people working business hours, a set-up using the fixed option in the Time mode allows you to identify the same train each day for commuting home. Set up an automation to send a push notification to get informed early.
Usually, one wants to know when a connection departs (default), but in case where the opposite is needed and one wants to know when a connection arrives , select “Show arrival time at end station” in the time reference dropdown.
When configured for arrival time, the sensor will display the arrival time at the destination instead of the departure time from the start station. This is particularly useful for automations that need to trigger based on arrival times.
Use case: Inform family of train arriving late
A popular use case would be to know if your family member is running late and sending out a push notification or displaying their arrival time at home.
The Swiss public transport integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Fetch connections ( swiss_public_transport.fetch_connections )
Fetches a list of upcoming connections from Swiss public transport.
For an overview of every action across all integrations, see the actions reference .
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
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Swiss public transport service was introduced in Home Assistant pre 0.7, and it's used by
446 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
@miaucl
Categories
Transport
Back to top
