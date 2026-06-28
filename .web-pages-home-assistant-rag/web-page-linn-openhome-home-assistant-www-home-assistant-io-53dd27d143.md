---
source_url: "https://www.home-assistant.io/integrations/openhome"
final_url: "https://www.home-assistant.io/integrations/openhome"
canonical_url: "https://www.home-assistant.io/integrations/openhome/"
source_handle: "web:www-home-assistant-io:53dd27d1437c"
source_section: "integrations-openhome"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b8b75446aa4ce2889e79384f3e966ae890b59349857fd0fc6f1e80e0230637fc"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Linn / OpenHome - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/openhome
- Final URL: https://www.home-assistant.io/integrations/openhome
- Canonical URL: https://www.home-assistant.io/integrations/openhome/
- Fetched at: 2026-06-28T03:06:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Linn Ds and Openhome renderers into Home Assistant.

## Extracted Text

On this page
Configuration
Example local audio playback action
Example web stream playback action
List of actions
The Linn / OpenHome integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect an Openhome Compliant Renderer to Home Assistant such as a Linn Products Ltd HiFi streamer. It will allow you to control media playback, volume, source and see the current playing item.
To add the Linn / OpenHome device to your Home Assistant instance, use this My button:
Linn / OpenHome can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Linn / OpenHome .
Follow the instructions on screen to complete the setup.
actions : - action : media_player.play_media target : entity_id : media_player.linn_bedroom data : media_content_id : " http://172.24.32.13/Doorbell.mp3" media_content_type : music
- action : media_player.play_media target : entity_id : media_player.linn_bedroom data : media_content_id : " http://media-ice.musicradio.com:80/ClassicFMMP3" media_content_type : music
The Linn / OpenHome integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Play pin ( openhome.invoke_pin )
Starts playing content pinned on a Linn or OpenHome device.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Linn / OpenHome device was introduced in Home Assistant 0.39, and it's used by
985 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bazwilliams
Categories
Media player
Update
Back to top
