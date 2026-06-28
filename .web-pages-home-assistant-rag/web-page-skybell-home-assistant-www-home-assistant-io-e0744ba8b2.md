---
source_url: "https://www.home-assistant.io/integrations/skybell"
final_url: "https://www.home-assistant.io/integrations/skybell"
canonical_url: "https://www.home-assistant.io/integrations/skybell/"
source_handle: "web:www-home-assistant-io:e0744ba8b2dd"
source_section: "integrations-skybell"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b1c847343b698a7d9ffecbc9cd5f231ff7f85ff0052c515d048b9f38c6e239ce"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SkyBell - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/skybell
- Final URL: https://www.home-assistant.io/integrations/skybell
- Canonical URL: https://www.home-assistant.io/integrations/skybell/
- Fetched at: 2026-06-28T03:16:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Skybell HD devices within Home Assistant.

## Extracted Text

On this page
Configuration
Integration entities
Binary sensor
Camera
Light
Sensor
Switch
The SkyBell integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Skybell.com doorbells in Home Assistant.
There is currently support for the following device types within Home Assistant:
Currently only the SkyBell HD is supported by this platform.
To add the SkyBell hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SkyBell .
Follow the instructions on screen to complete the setup.
Each added configuration entry will create the following binary sensors:
Button : When the doorbell button has been pushed.
Motion : When motion has been detected.
There are two available camera types “Avatar”, which is the default, displays the SkyBell avatar image.
It is periodically updated with a fresh image. The other type is “Activity”, which displays a snapshot from
the latest event (motion, bell, or on demand) captured by the camera.
The light supports switching and RGB color.
Chime Level : The volume level for the outside ringer. (0 equals off)
Do Not Disturb : Disable the indoor ringer.
Motion Sensor : Turn on/off motion sensing. (Enabling this will reset in-app notifications to on)
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SkyBell hub was introduced in Home Assistant 0.56, and it's used by
27 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Doorbell
Back to top
