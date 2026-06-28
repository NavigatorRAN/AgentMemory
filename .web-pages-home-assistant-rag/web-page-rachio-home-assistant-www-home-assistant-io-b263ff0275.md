---
source_url: "https://www.home-assistant.io/integrations/rachio"
final_url: "https://www.home-assistant.io/integrations/rachio"
canonical_url: "https://www.home-assistant.io/integrations/rachio/"
source_handle: "web:www-home-assistant-io:b263ff02757e"
source_section: "integrations-rachio"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5ec761af3e745392fadffcf57e1e52d790f3638a96a09dcdc01dc559037899e0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Rachio - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rachio
- Final URL: https://www.home-assistant.io/integrations/rachio
- Canonical URL: https://www.home-assistant.io/integrations/rachio/
- Fetched at: 2026-06-28T03:10:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Rachio with Home Assistant.

## Extracted Text

On this page
Getting your Rachio API Key
Configuration
Smart hose timers
Switch
Calendar
List of actions
Examples
groups.yaml example
The Rachio integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Rachio irrigation system .
There is currently support for the following device types within Home Assistant:
Binary sensor - Allows you to view the status of your Rachio irrigation system .
They will be automatically added if the Rachio integration is loaded.
Log in at https://app.rach.io/ .
Go to Settings .
Click Get API Key .
Copy the API key from the dialog that opens.
Important
In order for Rachio switches and sensors to update, your Home Assistant instance must be accessible from the internet, either via Home Assistant Cloud or another method. See the Remote Access documentation for more information. The smart hose timers use polling and don’t require external access to be set up.
To add the Rachio hub to your Home Assistant instance, use this My button:
Rachio can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Rachio .
Follow the instructions on screen to complete the setup.
Water-saving suggestion:
After setting up the integration, change the options to set the duration in minutes to run when activating a zone switch to a maximum failsafe value when using scripts to control zones. If something goes wrong with your script, Home Assistant, or you hit the Rachio API rate limit of 1700 calls per day, the controller will still turn off the zone after this amount of time.
The Rachio smart hose timers are not currently capable of receiving real-time updates. Instead, they rely on polling. Because of this, the current state of valves started from a schedule or the physical button will not show up immediately. Polling occurs every 2 minutes when one base station is used, with an additional minute added for every additional base station to remain with the API rate limit. Up to 4 valves can be paired to a single base station.
The rachio switch platform allows you to toggle zones, valves, and schedules connected to your Rachio irrigation system on and off.
Once configured, a switch will be added for every zone that is enabled on every controller in the account provided, as well as a switch for each smart hose timer valve and a switch to start or stop every schedule on a controller. There will also be a switch to toggle each controller’s standby mode, as well as to activate a 24-hour rain delay on the device.
A calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] entity will be added for each smart hose timer base station on the account, which will show past and future events for all enabled schedules. An upcoming event can be deleted from the calendar, which will trigger a skip of that event.
The Rachio integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Pause watering ( rachio.pause_watering )
Pauses any currently running zones or schedules.
Resume watering ( rachio.resume_watering )
Resumes any paused zone runs or schedules.
Set zone moisture percent ( rachio.set_zone_moisture_percent )
Sets the moisture percentage of one or more sprinkler zones.
Start multiple zones ( rachio.start_multiple_zone_schedule )
Creates a custom schedule from a list of zones and run times.
Start watering ( rachio.start_watering )
Starts a single zone, a schedule, or any number of smart hose timer valves.
Stop watering ( rachio.stop_watering )
Stops any currently running zones or schedules.
For an overview of every action across all integrations, see the actions reference .
In this section, you find some real-life examples of how to use this switch.
irrigation : name : Irrigation icon : mdi:water-pump view : true entities : - group.zones_front - group.zones_back - switch.side_yard - switch.every_day_6am zones_front : name : Front Yard view : false entities : - switch.front_bushes - switch.front_yard zones_back : name : Back Yard view : false entities : - switch.back_garden - switch.back_porch
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rachio hub was introduced in Home Assistant 0.73, and it's used by
1.3% of the active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@rfverbruggen
Categories
Binary sensor
Irrigation
Back to top
