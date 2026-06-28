---
source_url: "https://www.home-assistant.io/integrations/imgw_pib"
final_url: "https://www.home-assistant.io/integrations/imgw_pib"
canonical_url: "https://www.home-assistant.io/integrations/imgw_pib/"
source_handle: "web:www-home-assistant-io:ccd23619653a"
source_section: "integrations-imgw-pib"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5c8b0126ebf84e6de46781ca08dffd4c382b1153ad4ab80a237c172707d00f54"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# IMGW-PIB - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/imgw_pib
- Final URL: https://www.home-assistant.io/integrations/imgw_pib
- Canonical URL: https://www.home-assistant.io/integrations/imgw_pib/
- Fetched at: 2026-06-28T02:51:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate IMGW-PIB (Polish Institute of Meteorology and Water Management - National Research Institute) hydrological service within Home Assistant.

## Extracted Text

On this page
Configuration
Removing the integration
To remove an integration instance from Home Assistant
Supported functionality
Sensors
Data updates
Possible use-cases
Examples
Create a hydrological alert notification
Known limitations
The IMGW-PIB integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses hydrological data from Institute of Meteorology and Water Management - National Research Institute to present information about rivers and water reservoirs in Poland.
To add the IMGW-PIB service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IMGW-PIB .
Follow the instructions on screen to complete the setup.
Hydrological station
Select a hydrological station from the list of available stations.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
The IMGW-PIB integration provides the following entities.
Water level
Description : Water level in the river or reservoir at the measurement point
Water flow
Description : River water flow at the measurement point
Remarks : Not available for all hydrological stations
Water temperature
Description : Water temperature in the river or reservoir at the measurement point
Hydrological alert
Description : Provides information on hydrological alerts for a given river or reservoir
Ice phenomena
Description : Ice phenomena sensor shows how much of the river surface is affected by ice, such as slush, ice floes, or a frozen cover
Emergent vegetation cover
Description : Emergent vegetation cover indicates how much of the river cross-section is occupied by plants that grow above the water surface
Remarks : Not available for all hydrological stations, disabled by default
Floating vegetation cover
Description : Floating vegetation cover indicates how much of the river cross-section is covered by plants floating on the water surface
Submerged vegetation cover
Description : Submerged vegetation cover indicates how much of the river cross-section is occupied by plants growing under the water surface
By default, the integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the IMGW-PIB API every 30 minutes.
Monitor hydrological alerts to protect your family and property from floods.
Monitor river water levels to gain long-term insight into climate change in your area.
This automation will create a persistent notification with the content and probability of a hydrological alert:
automation : - alias : Hydrological alert triggers : - trigger : state entity_id : - sensor.warta_oborniki_hydrological_alert from : no_alert actions : - action : persistent_notification.create data : title : Hydrological alert! message : " {{ trigger.to_state.state }}, probability {{ trigger.to_state.attributes.probability }}%"
The integration provides data for hydrological stations available through the public IMGW-PIB API. Some hydrological stations are not available in this data and therefore the integration does not support them.
Not all hydrological stations provide all data, so the set of entities for individual stations may differ.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IMGW-PIB service was introduced in Home Assistant 2024.6, and it's used by
370 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bieniu
Categories
Environment
Back to top
