---
source_url: "https://www.home-assistant.io/integrations/samsung_infrared"
final_url: "https://www.home-assistant.io/integrations/samsung_infrared"
canonical_url: "https://www.home-assistant.io/integrations/samsung_infrared/"
source_handle: "web:www-home-assistant-io:e227eb365496"
source_section: "integrations-samsung-infrared"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "01fe80c81cc9dec9a69740e99a581a9ecdcd7a3ebd1375f540fb5def1748613d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Samsung Infrared - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/samsung_infrared
- Final URL: https://www.home-assistant.io/integrations/samsung_infrared
- Canonical URL: https://www.home-assistant.io/integrations/samsung_infrared/
- Fetched at: 2026-06-28T03:13:35Z
- Content type: text/html; charset=UTF-8

## Description

Integration to control Samsung TVs using an infrared transmitter.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
Supported functionality
Entities
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Samsung Infrared integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control a Samsung TV using any infrared transmitter previously configured in Home Assistant.
Because the integration communicates over infrared, it operates in a one-way, fire-and-forget fashion: commands are sent to the TV but there is no feedback channel to confirm the current state of the TV. The integration therefore uses assumed states.
Before setting up the Samsung Infrared integration, you need a working infrared transmitter set up in Home Assistant that exposes an Infrared entity. For example, you can use an ESPHome device with an IR LED pointed at your Samsung TV.
To add the Samsung Infrared device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Samsung Infrared .
Follow the instructions on screen to complete the setup.
Device type
The type of Samsung device to control. Currently, only TV is supported.
Infrared transmitter
The infrared transmitter entity to use for sending commands. This must be an entity provided by a hardware integration (such as ESPHome) that has already been set up with an IR transmitter.
The integration supports Samsung TVs that can be controlled via the standard Samsung infrared protocol.
The Samsung Infrared integration provides the following entities.
Media player
Samsung TV
Description : Represents the Samsung TV and allows you to control it via IR commands.
Supported features : Turn on, turn off, volume up, volume down, mute, channel up, channel down, play, pause, and stop.
The integration uses assumed state, meaning Home Assistant cannot read the actual state of the TV (for example, whether it is on or off, or what the current volume is).
Volume control is step-based only; there is no way to set an absolute volume level.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Samsung Infrared device was introduced in Home Assistant 2026.6, and it's used by
156 active installations.
Its IoT class is Assumed State.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lmaertin
Categories
Back to top
