---
source_url: "https://www.home-assistant.io/integrations/garages_amsterdam"
final_url: "https://www.home-assistant.io/integrations/garages_amsterdam"
canonical_url: "https://www.home-assistant.io/integrations/garages_amsterdam/"
source_handle: "web:www-home-assistant-io:ed87f5f46524"
source_section: "integrations-garages-amsterdam"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bd36d4a3a0efeb8ba315146fd7a4bd74999fdec3b597a5c1ff38b03b22fc2741"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Garages Amsterdam - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/garages_amsterdam
- Final URL: https://www.home-assistant.io/integrations/garages_amsterdam
- Canonical URL: https://www.home-assistant.io/integrations/garages_amsterdam/
- Fetched at: 2026-06-28T02:45:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Garages Amsterdam within Home Assistant.

## Extracted Text

On this page
Configuration
Data updates
Sensor
Binary sensor
Removing the integration
To remove an integration instance from Home Assistant
The Garages Amsterdam integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses an API provided by the municipality of Amsterdam, to measure the occupancy of Amsterdam parking garages in the Netherlands. You can track multiple garages by adding the integration multiple times.
To add the Garages Amsterdam service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Garages Amsterdam .
Follow the instructions on screen to complete the setup.
Garage name
The name of the parking garage you want to monitor.
The integration will poll the API of Amsterdam every 10 minutes to update the data in Home Assistant.
When you add a parking garage, 4 sensors are created in your configuration by default:
Free space long - Number of free parking spaces for cardholders or reserved spaces
Free space short - Number of free parking spaces for regular paid parking
Long capacity - Total of parking spaces for cardholders or reserved spaces
Short capacity - Total of parking spaces for regular paid parking
Note
Some parking garages don’t have long-term parking spaces, in which case the 2 specific Long sensors will not be created.
Each parking garage also has a binary sensor, which indicates whether there are problems in the data provision from the API. When it indicates ok everything is fine. If the state changes to problem , the upstream data might not be up to date or reliable and will remain in this state until new data is coming in.
You can remove each parking garage instance by following the default removal process.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Garages Amsterdam service was introduced in Home Assistant 2021.6, and it's used by
18 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@klaasnicolaas
Categories
Back to top
