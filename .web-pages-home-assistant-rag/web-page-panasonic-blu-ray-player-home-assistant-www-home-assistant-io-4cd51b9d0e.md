---
source_url: "https://www.home-assistant.io/integrations/panasonic_bluray"
final_url: "https://www.home-assistant.io/integrations/panasonic_bluray"
canonical_url: "https://www.home-assistant.io/integrations/panasonic_bluray/"
source_handle: "web:www-home-assistant-io:4cd51b9d0e11"
source_section: "integrations-panasonic-bluray"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8d23771b2ffd3c15c22fb669128e0f0b2d860023e6ff3f40398b835f23f66875"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Panasonic Blu-Ray Player - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/panasonic_bluray
- Final URL: https://www.home-assistant.io/integrations/panasonic_bluray
- Canonical URL: https://www.home-assistant.io/integrations/panasonic_bluray/
- Fetched at: 2026-06-28T03:07:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Panasonic Blu-Ray player into Home Assistant.

## Extracted Text

On this page
Supported operations
The Panasonic Blu-Ray Player integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Panasonic Blu-Ray player. Note that the device must be on the same subnet as Home Assistant; connections from a different subnet will return an error.
Currently known supported models:
DMP-BDT120
DMP-BDT220
DMP-BDT221
DMP-BDT320
DMP-BDT500
DMP-BBT01
The following newer models currently support a limited set of status commands:
DP-UB420
DP-UB820
DP-UB9000
If your model is not on the list, then give it a try, if everything works correctly then add it to the list on GitHub .
Example configuration:
media_player : - platform : panasonic_bluray host : 192.168.0.10
Configuration Variables
Looking for your configuration file?
host string Required
The IP of the Panasonic Blu-Ray device, e.g., 192.168.0.10 .
name string ( Optional , default: Panasonic Blu-Ray )
The name you would like to give to the Panasonic Blu-Ray device.
These devices support play, pause, stop and power on/off operations. They will also report the current status, title duration and current playing position.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Panasonic Blu-Ray Player integration was introduced in Home Assistant 0.83, and it's used by
231 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Media player
Back to top
