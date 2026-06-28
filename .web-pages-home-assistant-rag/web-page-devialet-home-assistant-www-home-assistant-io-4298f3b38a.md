---
source_url: "https://www.home-assistant.io/integrations/devialet"
final_url: "https://www.home-assistant.io/integrations/devialet"
canonical_url: "https://www.home-assistant.io/integrations/devialet/"
source_handle: "web:www-home-assistant-io:4298f3b38a64"
source_section: "integrations-devialet"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cf390628a7c0f2d3d4c2ef023e40159b86fd8701c2150c9339cf894d4a0860e4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Devialet - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/devialet
- Final URL: https://www.home-assistant.io/integrations/devialet
- Canonical URL: https://www.home-assistant.io/integrations/devialet/
- Fetched at: 2026-06-28T02:36:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Devialet devices into Home Assistant.

## Extracted Text

On this page
Configuration
Tested models
Turning off the device
The Devialet integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your Devialet wireless speakers from Home Assistant.
Important
For a stereo setup, only one of the speakers need to be configured.
Make sure your Devialet firmware version is 2.16.1 or later. Otherwise, expect functions not to work.
Assigning a fixed IP address to your speakers is highly recommended.
To add the Devialet device to your Home Assistant instance, use this My button:
Devialet can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Devialet .
Follow the instructions on screen to complete the setup.
Known supported devices:
Phantom I
Phantom II
The media player turn off button and the media_player.turn_off action will turn off all the devices of the designated system. Exiting OFF mode is only possible by pressing a physical button on each device.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Devialet device was introduced in Home Assistant 2023.11, and it's used by
414 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fwestenberg
Categories
Media Player
Back to top
