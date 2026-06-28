---
source_url: "https://www.home-assistant.io/integrations/baf"
final_url: "https://www.home-assistant.io/integrations/baf"
canonical_url: "https://www.home-assistant.io/integrations/baf/"
source_handle: "web:www-home-assistant-io:2366772d315c"
source_section: "integrations-baf"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2c647cf9b43c632e6ae5fd222af2a79478a5f6097434df305385ae26ab5c1c14"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Big Ass Fans - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/baf
- Final URL: https://www.home-assistant.io/integrations/baf
- Canonical URL: https://www.home-assistant.io/integrations/baf/
- Fetched at: 2026-06-28T02:30:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate BAF devices into Home Assistant.

## Extracted Text

On this page
Supported devices
Platforms
Binary sensor
Climate
Number
Sensor
Switch
Configuration
Integrates Big Ass Fans devices into Home Assistant.
Haiku Fans with 3.0 firmware and later (Legacy SenseME firmware not supported)
Discontinued Haiku Lights with 3.0 firmware and later (Legacy SenseME firmware not supported)
i6 Fans
For devices that support Auto Comfort and are running firmware 3.1 or later, an occupancy sensor entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is available. The sensor has a hold time of about 5 minutes and pushes state updates.
For devices that support Auto Comfort, a climate entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] allows adjusting the target temperature.
Note
Climate and Climate Sensors Become Unavailable: Climate and some sensors like temperature are provided by the remote, not the fan itself on certain models. When the fan loses connection to the remote, these entities may become unavailable while the fan remains available. Consult vendor documentation on how to re-establish connectivity between the fan and remote and reload the integration to restore entities availability.
Adjusting the minimum and maximum speed for devices that support Auto Comfort is available.
Timeouts for returning to auto mode or turning back off after motion use a unit of seconds.
If the device supports it, the integration creates the following sensors, which receive push updates:
Temperature
Humidity
Additional diagnostic sensors are available, which generally do not receive push updates that need to be enabled in the UI if desired.
The integration represents Whoosh mode as a switch for fans. When Whoosh is enabled, the fan will latch to the current speed and vary the speed from the latch point.
To add the Big Ass Fans device to your Home Assistant instance, use this My button:
Big Ass Fans can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Big Ass Fans .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Big Ass Fans device was introduced in Home Assistant 2022.6, and it's used by
992 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@jfroy
Categories
Fan
Light
Back to top
