---
source_url: "https://www.home-assistant.io/integrations/sense"
final_url: "https://www.home-assistant.io/integrations/sense"
canonical_url: "https://www.home-assistant.io/integrations/sense/"
source_handle: "web:www-home-assistant-io:203b8a27d9a1"
source_section: "integrations-sense"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8527d7651a60ff4109e16501212967a78fa363856e3db904162d1826cf4a8d86"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Sense - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sense
- Final URL: https://www.home-assistant.io/integrations/sense
- Canonical URL: https://www.home-assistant.io/integrations/sense/
- Fetched at: 2026-06-28T03:14:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Sense within Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Integrate your Sense meter information into Home Assistant.
There is currently support for the following device types within Home Assistant:
Binary sensor
Sensor
To add the Sense hub to your Home Assistant instance, use this My button:
Sense can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sense .
Follow the instructions on screen to complete the setup.
Sensors are added for both usage and production:
Active sensors: Updated every 60 seconds.
Usage: Current active power usage in Watts.
Production: Current active power production in Watts.
Trend sensors: Data provided for daily, weekly, monthly and yearly scales. Updated every 5 minutes.
Usage: Energy usage in kWh.
Production: Energy production in kWh.
To Grid: Energy exported to the grid in kWh.
From Grid: Energy imported from the grid in kWh.
Net Production: Measures total solar production against usage.
Net Production Percentage: Net production as a percentage value.
Solar Powered Percentage: Percentage of power used directly from solar.
Binary sensors are created for each of the devices detected by your Sense monitor to show their power state.
Sensors are created for each of the devices detected by your Sense monitor to show their power usage in Watts.
Note
The Emulated Kasa integration can be used to expose devices in Home Assistant to the Sense Monitor by emulating TP-Link Kasa Smart Plugs.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sense hub was introduced in Home Assistant 0.82, and it's used by
2248 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kbickar
Categories
Energy
Back to top
