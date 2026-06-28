---
source_url: "https://www.home-assistant.io/integrations/mpd"
final_url: "https://www.home-assistant.io/integrations/mpd"
canonical_url: "https://www.home-assistant.io/integrations/mpd/"
source_handle: "web:www-home-assistant-io:f9a6adf2a749"
source_section: "integrations-mpd"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "416bbf3523ea105fb6bf6690d0ce931a7d33f841fea0981851c5ef3918393cbf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Music Player Daemon (MPD) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mpd
- Final URL: https://www.home-assistant.io/integrations/mpd
- Canonical URL: https://www.home-assistant.io/integrations/mpd/
- Fetched at: 2026-06-28T03:01:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Music Player Daemon into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Music Player Daemon integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Music Player Daemon from Home Assistant. Unfortunately, it does not allow you to manipulate the playlist (add or delete songs) or add transitions between the songs.
Even though no playlist manipulation is possible, it is possible to use the play_media action to load an existing saved playlist as part of an automation or scene.
To add the Music Player Daemon (MPD) device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Music Player Daemon (MPD) .
Follow the instructions on screen to complete the setup.
Example script to load a saved playlist called “DeckMusic” and set the volume:
relaxdeck : sequence : - action : media_player.play_media target : entity_id : media_player.main data : media_content_type : playlist media_content_id : DeckMusic - action : media_player.volume_set target : entity_id : media_player.main data : volume_level : 0.60
This platform works with Music Player Daemon and mopidy with Mopidy-MPD as used by Pi MusicBox . While all of these rely on the common MPD protocol, not all implementations support all features, especially with regard to album artwork, embedded artwork and volume control. The platform will fall back gracefully if support isn’t detected.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Music Player Daemon (MPD) device was introduced in Home Assistant pre 0.7, and it's used by
1812 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Media player
Back to top
