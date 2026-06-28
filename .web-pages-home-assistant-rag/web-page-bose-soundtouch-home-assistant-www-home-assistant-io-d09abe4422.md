---
source_url: "https://www.home-assistant.io/integrations/soundtouch"
final_url: "https://www.home-assistant.io/integrations/soundtouch"
canonical_url: "https://www.home-assistant.io/integrations/soundtouch/"
source_handle: "web:www-home-assistant-io:d09abe44225a"
source_section: "integrations-soundtouch"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e772775ce71944473a08d6514657feba5f990a388668ba5bcdc70a8ab88fe4e1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Bose SoundTouch - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/soundtouch
- Final URL: https://www.home-assistant.io/integrations/soundtouch
- Canonical URL: https://www.home-assistant.io/integrations/soundtouch/
- Fetched at: 2026-06-28T03:18:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Bose SoundTouch devices into Home Assistant.

## Extracted Text

On this page
Configuration
Playing media
Text-to-speech services
List of actions
The Bose SoundTouch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Bose SoundTouch speakers from Home Assistant.
To add the Bose SoundTouch device to your Home Assistant instance, use this My button:
Bose SoundTouch can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Bose SoundTouch .
Follow the instructions on screen to complete the setup.
You can switch between one of your 6 pre-configured presets using media_player.play_media
# Play media preset - action : media_player.play_media target : entity_id : media_player.soundtouch_living_room data : media_content_id : 1..6 media_content_type : PLAYLIST
You can also play HTTP (not HTTPS) URLs:
# Play media URL - action : media_player.play_media target : entity_id : media_player.soundtouch_living_room data : media_content_id : http://example.com/music.mp3 media_content_type : MUSIC
You can use TTS services like Google text-to-speech or Amazon Polly only if your Home Assistant is configured in HTTP and not HTTPS (current device limitation, a firmware upgrade is planned).
A workaround if you want to publish your Home Assistant installation on Internet in SSL is to configure an HTTPS Web Server as a reverse proxy ( NGINX for example) and let your Home Assistant configuration in HTTP on your local network. The SoundTouch devices will be available to access the TTS files in HTTP in local and your configuration will be in HTTPS on the Internet.
The Bose SoundTouch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add zone follower ( soundtouch.add_zone_slave )
Adds media players to an existing Bose SoundTouch zone.
Create zone ( soundtouch.create_zone )
Creates a Bose SoundTouch multi-room zone.
Play everywhere ( soundtouch.play_everywhere )
Plays the same content on all Bose SoundTouch devices.
Remove zone follower ( soundtouch.remove_zone_slave )
Removes media players from an existing Bose SoundTouch zone.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bose SoundTouch device was introduced in Home Assistant 0.34, and it's used by
4606 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kroimon
Categories
Media player
Back to top
