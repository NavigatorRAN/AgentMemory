---
source_url: "https://www.home-assistant.io/integrations/geo_json_events"
final_url: "https://www.home-assistant.io/integrations/geo_json_events"
canonical_url: "https://www.home-assistant.io/integrations/geo_json_events/"
source_handle: "web:www-home-assistant-io:2b4f9633e0a4"
source_section: "integrations-geo-json-events"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "851094246e0bb4ed9dc665f9ee88600ebb84f468833b862964bf98c4162b369a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# GeoJSON - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/geo_json_events
- Final URL: https://www.home-assistant.io/integrations/geo_json_events
- Canonical URL: https://www.home-assistant.io/integrations/geo_json_events/
- Fetched at: 2026-06-28T02:45:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate GeoJSON feeds into Home Assistant.

## Extracted Text

On this page
Configuration
State attributes
The GeoJSON integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you ingest events from GeoJSON feeds. It retrieves events from a feed and shows information of those events filtered by distance to Home Assistant’s location.
All entries in the GeoJSON feed must define a geometry which typically is a point or polygon with geo coordinates. In addition, this platform will look for a title key in the entry’s properties and use that as the entity’s name.
Entities are generated, updated and removed automatically with each update from the GeoJSON feed. Each entity defines latitude and longitude and will be shown on the map automatically. The distance in kilometers is available as the state of each entity.
The data is updated every 5 minutes.
To add the GeoJSON service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select GeoJSON .
Follow the instructions on screen to complete the setup.
The following state attributes are available for each entity in addition to the standard ones:
Attribute Description latitude Latitude of the event. longitude Longitude of the event. source geo_json_events to be used in conjunction with geo_location automation trigger. external_id The external ID used in the feed to identify the event in the feed.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GeoJSON service was introduced in Home Assistant 0.79, and it's used by
147 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@exxamalte
Categories
Geolocation
Back to top
