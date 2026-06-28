---
source_url: "https://www.home-assistant.io/integrations/device_tracker"
final_url: "https://www.home-assistant.io/integrations/device_tracker"
canonical_url: "https://www.home-assistant.io/integrations/device_tracker/"
source_handle: "web:www-home-assistant-io:b04074070e5c"
source_section: "integrations-device-tracker"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ce22443ce4c604beebdcb330332e6b6954bf96931056402a04170b740abd9766"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Device tracker - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/device_tracker
- Final URL: https://www.home-assistant.io/integrations/device_tracker
- Canonical URL: https://www.home-assistant.io/integrations/device_tracker/
- Fetched at: 2026-06-28T02:36:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up device tracking within Home Assistant.

## Extracted Text

On this page
The state of a tracked device
Related topics
The device tracker allows you to track devices in Home Assistant. This can happen by querying your wireless router or by having applications push location info.
Note
Building block integration
This device tracker is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this device tracker building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the device tracker building block offers.
To set up device tracking, add an integration that provides device_tracker entities, like the Home Assistant Companion app for phone-based location tracking or a router-based integration such as Ubiquiti UniFi . You can connect device trackers to person entities and use them with zones for automations that react when people or tracked devices enter or leave a place.
The type of state a device tracker can have depends on whether it uses GPS or a router as the data source.
A device tracker with GPS as a source can have any number of string states. The integration can return one of the following options:
Report GPS coordinates. The coordinates are then matched to a zone (which is set as state). If the home zone is matched, the state will be Home . If no zone was matched the state will be Not home .
Report a location. This could be any string which is set as state.
A device tracker with router as a source can have one of two states: Home , or Not home .
Home : Your tracked device is in the home zone , detected by your network or Bluetooth-based presence detection. If you’re using a presence detection method that includes coordinates: when it’s in a zone, the state equals the name of the zone (case sensitive).
Not home : When a device isn’t at home and isn’t in any zone.
Screenshot showing the state of a device tracker entity in the developer tools.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
Person
Zone
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Device tracker entity was introduced in Home Assistant 0.7.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Presence detection
Back to top
