---
source_url: "https://www.home-assistant.io/integrations/starline"
final_url: "https://www.home-assistant.io/integrations/starline"
canonical_url: "https://www.home-assistant.io/integrations/starline/"
source_handle: "web:www-home-assistant-io:dc95a5418f42"
source_section: "integrations-starline"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2af671c3fe847b78bbf05257aa1c0364673e5c8264fb649921882ab598e25031"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# StarLine - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/starline
- Final URL: https://www.home-assistant.io/integrations/starline
- Canonical URL: https://www.home-assistant.io/integrations/starline/
- Fetched at: 2026-06-28T03:18:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up your StarLine account with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
List of actions
Disclaimer
The StarLine integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you retrieve data of your StarLine security system from the StarLine portal . You will need a working StarLine account.
This integration provides the following platforms:
Binary sensors: Hand brake, hood, trunk, alarm status, doors lock state, handsfree, neutral, moving ban status, ignition state, and autostart state.
Device tracker: The location of your car.
Lock: Control the lock of your car.
Sensors: Battery level, SIM card balance, GSM signal level, GPS satellites count, fuel volume, mileage, OBD errors, interior temperature and engine temperature.
Switches: Start/stop engine, heater (webasto), additional channel, and service mode.
Buttons: Sound the horn, flex logic, and panic mode.
Actions: Update the state, set update frequency. More details can be found here .
Create a new application in the StarLine developer profile .
Note
The integration makes API calls to StarLine servers to retrieve data. It gets only the latest set of values that are valid for the moment of the API call. This means that the integration does not retrieve or store values, StarLine events, or parameters between the API calls.
You can make up to 1000 API calls per day, which means you could make one approximately every 86 seconds.
By default, the state of integration will be updated every 3 minutes and OBD information will be updated every 3 hours, making 488 calls per day.
It is not recommended to set an update interval of less than 90 seconds.
To add the StarLine hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select StarLine .
Follow the instructions on screen to complete the setup.
The StarLine integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set scan interval ( starline.set_scan_interval )
Sets how often Home Assistant fetches StarLine entity updates.
Set scan OBD interval ( starline.set_scan_obd_interval )
Sets how often Home Assistant fetches StarLine OBD updates.
Update state ( starline.update_state )
Fetches the latest state of your StarLine devices from the StarLine server.
For an overview of every action across all integrations, see the actions reference .
This software is not affiliated with or endorsed by ScPA StarLine Ltd.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The StarLine hub was introduced in Home Assistant 0.103, and it's used by
477 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@anonym-tsk
Categories
Binary sensor
Button
Car
Lock
Presence detection
Sensor
Switch
Back to top
