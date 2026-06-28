---
source_url: "https://www.home-assistant.io/integrations/opensky"
final_url: "https://www.home-assistant.io/integrations/opensky"
canonical_url: "https://www.home-assistant.io/integrations/opensky/"
source_handle: "web:www-home-assistant-io:5183b45b0e07"
source_section: "integrations-opensky"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "528de4a78dcde367937b8916bfd579a84ce49119049ddfb1799497f9635000bf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# OpenSky Network - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/opensky
- Final URL: https://www.home-assistant.io/integrations/opensky
- Canonical URL: https://www.home-assistant.io/integrations/opensky/
- Fetched at: 2026-06-28T03:06:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate OpenSky Network into Home Assistant.

## Extracted Text

On this page
Configuration
Authentication
Events
The OpenSky integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows one to track overhead flights in a given region. It uses crowd-sourced data from the OpenSky Network public API. It will also fire Home Assistant events when flights enter and exit the defined region.
To add the OpenSky Network service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OpenSky Network .
Follow the instructions on screen to complete the setup.
latitude
The latitude of the center of the area to track. Defaulted with the home’s latitude.
longitude
The latitude of the center of the area to track. Defaulted with the home’s longitude.
radius
The radius in meters around the latitude/longitude point to track.
altitude
The maximum altitude in meters in which the planes are tracked. No input (or 0) means all planes in the area are tracked.
By default, polling is done every 15 minutes not to hit the API limit.
More API requests are allowed as authenticated users.
You can add your credentials after setting up the integration.
opensky_entry : Fired when a flight enters the region.
opensky_exit : Fired when a flight exits the region.
Both events have two attributes in common:
sensor : Name of opensky sensor that fired the event.
callsign : Callsign of the flight.
opensky_entry has 4 additional attributes:
altitude : Altitude of the flight in meters.
latitude : Latitude of the flight in decimal.
longitude : Longitude of the flight in decimal.
icao24 : The ICAO 24-bit address of the aircraft’s transponder.
To receive notifications of the entering flights using the Home Assistant Companion App , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
automation : - alias : " Flight entry notification" triggers : - trigger : event event_type : opensky_entry actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " Flight entry of {{ trigger.event.data.callsign }}"
One can also get a direct link to the OpenSky website to see the flight using the icao24 identification:
automation : - alias : " Flight entry notification" triggers : - trigger : event event_type : opensky_entry actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " Flight entry of {{ trigger.event.data.callsign }}" data : actions : - action : URI title : " Track the flight" uri : >- https://opensky-network.org/aircraft-profile?icao24={{ trigger.event.data.icao24 }}
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenSky Network service was introduced in Home Assistant 0.43, and it's used by
685 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Transport
Back to top
