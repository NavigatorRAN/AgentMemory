---
source_url: "https://www.home-assistant.io/integrations/pegel_online"
final_url: "https://www.home-assistant.io/integrations/pegel_online"
canonical_url: "https://www.home-assistant.io/integrations/pegel_online/"
source_handle: "web:www-home-assistant-io:ae9cb53fd098"
source_section: "integrations-pegel-online"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0893028d6eb8b3ac0718dcad89c456253c998f52be70ce23d2b984b9574751c1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# PEGELONLINE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pegel_online
- Final URL: https://www.home-assistant.io/integrations/pegel_online
- Canonical URL: https://www.home-assistant.io/integrations/pegel_online/
- Fetched at: 2026-06-28T03:07:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate PEGELONLINE measurements into Home Assistant.

## Extracted Text

On this page
Data fetching and limitations
Configuration
Step 1 - Location selection
Step 2 - Station selection
Sensors
Usage example
Flood alert level notification
Troubleshooting
Remove the integration
To remove an integration instance from Home Assistant
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the data from the German Federal Waterways and Shipping Administration ( Wasserstraßen- und Schifffahrtsverwaltung des Bundes ) PEGELONLINE to provide different sensors , based on the available data of the selected measurement station.
The data are polled every 5 minutes. You can add as many measurement stations as want, there is no authentication needed nor any official usage limitation, but keep the “fair use” in mind.
To add the PEGELONLINE service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select PEGELONLINE .
Follow the instructions on screen to complete the setup.
Select the area, where you want to search for available water measuring stations
Latitude
The latitude of the center of the search area ( automatically filled by the location picker ).
Longitude
The longitude of the center of the search area ( automatically filled by the location picker ).
Radius
Search radius ( in km )
Station
Select the measurement station you want to add.
The following sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] are created, based on the capabilities of the selected measurement station:
Sensor name Common unit of measurement Air temperature °C Clearance height ( only for bridges ) cm Oxygen level mg/l pH None Water flow speed m/s Water level cm Water temperature °C Water volume flow m³/s
Create an automation to get notified, when your local river reaches a specific flood alert level.
mode : single triggers : - trigger : numeric_state entity_id : - sensor.dresden_elbe_water_level above : 500 actions : - action : notify.persistent_notification metadata : {} data : message : Flood alert level 2 reached!
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs stop the debug logging again ( download of debug log file will start automatically ). Further if still possible , please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The PEGELONLINE service was introduced in Home Assistant 2023.8, and it's used by
496 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mib1185
Categories
Environment
Sensor
Back to top
