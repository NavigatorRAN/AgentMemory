---
source_url: "https://www.home-assistant.io/integrations/trafikverket_camera"
final_url: "https://www.home-assistant.io/integrations/trafikverket_camera"
canonical_url: "https://www.home-assistant.io/integrations/trafikverket_camera/"
source_handle: "web:www-home-assistant-io:44ff1cf3addb"
source_section: "integrations-trafikverket-camera"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d7c9d56d99e538ca5b72bb7d7f4f0809aace499caf274f8670ef6fd8a79ab8a0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Trafikverket Camera - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/trafikverket_camera
- Final URL: https://www.home-assistant.io/integrations/trafikverket_camera
- Canonical URL: https://www.home-assistant.io/integrations/trafikverket_camera/
- Fetched at: 2026-06-28T03:23:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to integrate Trafikverket Camera within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Binary sensor
Sensors
Additional attributes available on camera
Retrieve camera feed from Trafikverket .
The input provided will be used to search for both the name and the location of the camera. See examples and look for your camera here .
When more than one camera has the same name, use the more precise location in your search. Example: If searching for “Hisingsleden” , then use the more detailed location in your search, for example “Hisingsleden norrut”.
Please click here and register to obtain the API key.
To add the Trafikverket Camera service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Trafikverket Camera .
Follow the instructions on screen to complete the setup.
Active
Direction (degree of angle the camera is pointing towards)
Modified (date and time when the record last changed)
Photo time
Photo URL
Status
Camera type
Location (placement of camera)
Description (free text description)
Type (Type of camera)
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Trafikverket Camera service was introduced in Home Assistant 2023.9, and it's used by
175 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Camera
Sensor
Back to top
