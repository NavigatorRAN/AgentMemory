---
source_url: "https://www.home-assistant.io/integrations/poolsense"
final_url: "https://www.home-assistant.io/integrations/poolsense"
canonical_url: "https://www.home-assistant.io/integrations/poolsense/"
source_handle: "web:www-home-assistant-io:597777a0ec6a"
source_section: "integrations-poolsense"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "43a02d4a4a4cf46f43056e87a9b398bdd2a6e8a41f8c59effc3745831b8b6edb"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# PoolSense - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/poolsense
- Final URL: https://www.home-assistant.io/integrations/poolsense
- Canonical URL: https://www.home-assistant.io/integrations/poolsense/
- Fetched at: 2026-06-28T03:08:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your PoolSense device within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Tips
PoolSense is a smart pool monitor that publishes data to the cloud via SigFox. PoolSense eliminates the time and effort spent fixing what’s wrong with your pool water. Accurate sensors, in the PoolSense smart pool monitor, send data to a cloud server in timed intervals.
There is currently support for the following information within Home Assistant:
Chlorine Level
pH
Water Temperature
Battery
pH Status Indicator
Chlorine Status Indicator
You will need to use the associated standalone app for this device to register a username and password.
Google
Apple
To add the PoolSense device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select PoolSense .
Follow the instructions on screen to complete the setup.
It is recommended that you create your own card with the following sensors:
sensor.poolsense_chlorine
sensor.poolsense_ph
sensor.poolsense_battery
sensor.poolsense_temperature
sensor.poolsense_last_seen
Leave sensor.poolsense_ph_status and sensor.poolsense_chlorine_status as badges.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The PoolSense device was introduced in Home Assistant 0.113, and it's used by
17 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@haemishkyd
Categories
Sensor
Back to top
