---
source_url: "https://www.home-assistant.io/integrations/sonos"
final_url: "https://www.home-assistant.io/integrations/sonos"
canonical_url: "https://www.home-assistant.io/integrations/sonos/"
source_handle: "web:www-home-assistant-io:7312adf0332f"
source_section: "integrations-sonos"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "707f6f32599dd2ae766d6a0f74a57c5e3b13017edb5730e24eb9107ef552fed5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Sonos - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sonos
- Final URL: https://www.home-assistant.io/integrations/sonos
- Canonical URL: https://www.home-assistant.io/integrations/sonos/
- Fetched at: 2026-06-28T03:18:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Sonos devices into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Feature controls and sensors
Controllable features
Sensors
Select
TV Autoplay and Ungroup on Autoplay support notes
Battery support notes
Alarm support notes
Microphone support notes
Sonos Favorites support notes
Playing media
List of actions
Examples
Searching the music library
Example: Search and add all matching tracks to the queue
Example: Search for an album
Network requirements
Advanced use
Removing the integration
To remove an integration instance from Home Assistant
Troubleshooting
403 error when setting up the integration
The Sonos integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Sonos wireless speakers from Home Assistant. It also works with IKEA Symfonisk speakers.
UPnP must be enabled on your Sonos system for this integration to work. In the Sonos app, go to Account > Privacy and Security > UPnP and enable the setting.
To add the Sonos hub to your Home Assistant instance, use this My button:
Sonos can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sonos .
Follow the instructions on screen to complete the setup.
Speaker-level controls are exposed as number , select or switch entities. Additionally, various sensor and binary_sensor entities are provided.
All devices : Alarms, Bass, Treble, Loudness, Crossfade, Status Light, Touch Controls
Home theater devices : Audio Delay (“Lip Sync”), Night Sound, Speech Enhancement, Surround Enabled, Surround Music Full Volume (“Full/Ambient”), Surround Level (“TV Level”), Music Surround Level, TV Autoplay, Ungroup on Autoplay
When paired with a sub : Subwoofer Enabled, Subwoofer Gain, Subwoofer Crossover Frequency (Sonos Amp only)
Each Sonos system : Sonos Favorites
Devices with battery : Battery level, Power state
Home theater devices : Audio Input Format
Voice-enabled devices : Microphone Enabled
The following select entities are created:
Dialog Level
Lets you set the dialog mode on your Sonos Arc Ultra soundbar. You can choose from None, Low, Medium, High, or Max.
Since the Sonos UPnP spec does not emit events for these, both entities rely on polling for state updates from external changes (for example, changes made in the Sonos app). That means those entities will always have some delay before updating, so changes made outside of Home Assistant will be reflected on the next device polling, which defaults to 30 seconds.
Battery sensors are fully supported for the Sonos Roam and Sonos Move devices on S2 firmware. Sonos Move speakers still on S1 firmware are supported but may update infrequently.
For each speaker with a battery, a sensor showing the current battery charge level and a binary_sensor showing the power state of the speaker are created. The binary_sensor reports if the speaker is currently powered by an external source and its power_source attribute shows which specific source is providing the current power. This source attribute can be one of BATTERY , SONOS_CHARGING_RING if using wireless charging, or USB_POWER if charging via USB cable. Note that the Roam will report SONOS_CHARGING_RING even when using a generic Qi charger.
Note
The battery sensors rely on working change events or updates will be delayed. S1 battery sensors require working events to report any data. See more details in Advanced use .
The Sonos integration adds one switch for each alarm set in the Sonos app. The alarm switches are detected, deleted, and assigned automatically and come with several attributes that help you monitor Sonos alarms.
Important note about updating multiple alarms
When enabling, disabling, or updating multiple Sonos alarms in a single automation or script, you may notice that not all alarms update as expected. This is a limitation of how Sonos synchronizes its alarm list across all speakers. If multiple alarm updates are sent rapidly (for example, by toggling several alarm switches at once), some changes may be lost or overwritten before they are fully synchronized between speakers.
To ensure reliable updates, add a wait between each alarm update in your automation. A 1-second wait works well as a starting point, but you may need to increase it based on your setup. For example, add a delay action between each switch.turn_on , switch.turn_off , or sonos.update_alarm action call. This gives Sonos time to synchronize the alarm list before the next change.
Automation Example:
actions : - action : switch.turn_on target : entity_id : switch.sonos_alarm_1 - delay : seconds : 1 - action : switch.turn_on target : entity_id : switch.sonos_alarm_2 - delay : seconds : 1 - action : switch.turn_on target : entity_id : switch.sonos_alarm_3
If you do not add a delay, you may see inconsistent alarm states, or some alarms may not update at all. In rare cases, rapidly updating alarms can cause a speaker to become unavailable. If this happens, power cycle the speaker and reload the integration.
The microphone can only be enabled/disabled from physical buttons on the Sonos device and cannot be controlled from Home Assistant. A binary_sensor reports its current state.
The favorites sensor provides the names and media_content_id values for each of the favorites saved to My Sonos in the native Sonos app. This sensor is intended for users that need to access the favorites in a custom template. For most users, accessing favorites by using the Media Browser functionality and “Play media” script/automation action is recommended.
When calling the media_player.play_media action, the media_content_type must be set to “favorite_item_id” and the media_content_id must be set to just the key portion of the favorite item.
Example action using the item id:
action : media_player.play_media target : entity_id : media_player.sonos_speaker1 data : media_content_type : " favorite_item_id" media_content_id : " FV:2/31"
Example using the Sonos playlist name:
action : media_player.play_media target : entity_id : media_player.sonos_speaker1 data : media_content_type : playlist media_content_id : stevie_wonder
Example templates:
# Get all favorite names as a list (old behavior) {{ state_attr("sensor.sonos_favorites", "items").values() | list }} # Pick a specific favorite name by position {{ (state_attr("sensor.sonos_favorites", "items").values() | list)[3] }} # Pick a random item's `media_content_id` {{ state_attr("sensor.sonos_favorites", "items") | list | random }} # Loop through and grab name & media_content_id {% for media_id, name in state_attr("sensor.sonos_favorites", "items").items() %} {{ name, media_id }} {% endfor %}
Tip
The Sonos favorites sensor ( sensor.sonos_favorites ) is disabled by default. It can be found and enabled from the entities associated with the Sonos integration on your Devices & services page.
Sonos accepts a variety of media_content_id formats in the media_player.play_media action, but most commonly as URIs. For example, both Spotify and Tidal share links can be provided as-is. Playback of music hosted on a Plex server is possible. Direct HTTP/HTTPS links to local or remote media files can also be used if the Sonos device can reach the URI directly, but specific media encoding support may vary.
Music services that require an account, such as Spotify, must first be configured using the Sonos app.
Playing TTS (text-to-speech) or audio files as alerts (e.g., a doorbell or alarm) is possible by setting the announce argument to true . Using announce will play the provided media URL as an overlay, gently lowering the current music volume and automatically restoring to the original level when finished. An optional volume argument can also be provided in the extra dictionary to play the alert at a specific volume level. Note that older Sonos hardware or legacy firmware versions (“S1”) may not fully support these features. Additionally, see Network Requirements for use in restricted networking environments.
An optional enqueue argument can be added to the action. If replace or not provided then the queue will be replaced and the item will be played. If add the item will be appended to the queue. If next the item will be added into the queue to play next. If play , the item will be added into the queue and played immediately.
The Sonos integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Clear a Sonos sleep timer ( sonos.clear_sleep_timer )
Clears the sleep timer on a Sonos speaker.
Get the Sonos queue ( sonos.get_queue )
Returns the contents of a Sonos speaker’s queue.
Play the Sonos queue ( sonos.play_queue )
Starts playing the Sonos queue, optionally from a specific position.
Remove from the Sonos queue ( sonos.remove_from_queue )
Removes an item from a Sonos speaker’s queue.
Restore a Sonos snapshot ( sonos.restore )
Restores a previously taken snapshot on one or more Sonos speakers.
Set a Sonos sleep timer ( sonos.set_sleep_timer )
Sets a sleep timer that gradually fades out a Sonos speaker.
Take a Sonos snapshot ( sonos.snapshot )
Saves what is currently playing on one or more Sonos speakers so you can restore it later.
Update a Sonos alarm ( sonos.update_alarm )
Updates the time, volume, and other settings of an existing Sonos alarm.
For an overview of every action across all integrations, see the actions reference .
In addition to the actions listed above, Sonos speakers support the standard media player actions .
Below is an example action that plays an audio file from a web server on the local network (like the Home Assistant built-in webserver) using the announce feature and its associated (optional) volume parameter:
action : media_player.play_media target : entity_id : media_player.sonos data : announce : true media_content_type : " music" media_content_id : " http://192.168.1.50:8123/local/sound_files/doorbell-front.mp3" extra : volume : 20
The standard tts.<source>_say actions do not accept the volume parameter directly. To set the volume for a TTS announcement, you can use a TTS Media Source URL with the standard media_player.play_media action:
action : media_player.play_media target : entity_id : media_player.sonos data : announce : true media_content_id : > media-source://tts/cloud?message="I am very loud" media_content_type : " music" extra : volume : 80
Sonos can also play music or playlists from Spotify. Both Spotify URIs and URLs can be used directly. The optional title parameter can be used to fill the media_playlist attribute correctly. An example action using a playlist URI:
action : media_player.play_media target : entity_id : media_player.sonos data : media_content_type : " playlist" media_content_id : " spotify:playlist:abcdefghij0123456789XY" enqueue : true extra : title : Example Playlist
An example action using a Spotify URL:
action : media_player.play_media target : entity_id : media_player.sonos data : media_content_type : " music" media_content_id : " https://open.spotify.com/album/abcdefghij0123456789YZ"
Run a Plex Media Server in your home? The Sonos integration can work with that as well. This example plays music directly from your Plex server:
action : media_player.play_media target : entity_id : media_player.sonos data : media_content_type : " music" media_content_id : > plex://{ "library_name": "Music", "artist_name": "M83", "album_name": "Hurry Up, We're Dreaming" }
Sonos Music Library
If you have configured a Sonos music library, you can play music from it.
Play all albums by the Beatles.
action : media_player.play_media target : entity_id : media_player.sonos data : media_content_type : album media_content_id : A:ALBUMARTIST/Beatles
Play a specific album:
action : media_player.play_media target : entity_id : media_player.sonos data : media_content_type : album media_content_id : A:ALBUM/The Wall enqueue : replace
Or add a specific album by a specific artist to the queue. This is useful when you have multiple albums with the same name.
action : media_player.play_media target : entity_id : media_player.sonos data : media_content_type : album media_content_id : A:ALBUMARTIST/Neil Young/Greatest Hits enqueue : add
Play all albums by a composer.
action : media_player.play_media target : entity_id : media_player.porch data : media_content_type : composer media_content_id : A:COMPOSER/Carlos Santana enqueue : play
Play all albums by a genre.
action : media_player.play_media target : entity_id : media_player.porch data : media_content_type : genre media_content_id : " A:GENRE/Classic%20Rock/" enqueue : play
Play an imported playlist by using its title.
action : media_player.play_media target : entity_id : media_player.porch data : media_content_type : playlist media_content_id : S:/MyPlaylist enqueue : play
You can search your local Sonos music library using the media_player.search_media action. This returns a list of matching items that you can then pass to media_player.play_media to play. It also powers the search box in the Home Assistant media picker UI.
The action requires a search_query and accepts an optional media_content_type to narrow results to a specific kind of content. If you omit the type, the search defaults to track .
The following values are supported for media_content_type :
track (default)
album
artist
contributing_artist
composer
genre
playlist
Searching is limited to your local Sonos music library. Streaming services such as Spotify or Tidal are not included in search results.
Because the action returns data, use response_variable to capture the results and then loop through or pick from them in your automation or script.
This example searches for all tracks matching “love”, clears the queue, adds them to the queue, and then plays the queue:
To work optimally, the Sonos devices must be able to connect back to the Home Assistant host on TCP port 1400. This will allow the push-based updates to work properly. If this port is blocked or otherwise unreachable from the Sonos devices, the integration will fall back to a polling mode which is slower to update and much less efficient. The integration will alert the user if this problem is detected.
Playing audio using the announce option or TTS requires TCP port 1443 on each Sonos device to be reachable from the Home Assistant host.
See Advanced use below for additional configuration options which may be needed to address this issue in setups with more complex network topologies.
For advanced uses, there are some manual configuration options available. These are usually only needed if you have a complex network setup where Home Assistant and Sonos are not on the same subnet.
You can disable auto-discovery by specifying the Sonos IP addresses:
# Example configuration.yaml entry with manually specified Sonos IP addresses sonos : media_player : hosts : - 192.0.2.25 - 192.0.2.26 - 192.0.2.27
If your Home Assistant instance has multiple IP addresses, you can select the specific IP address that should be used for Sonos auto-discovery with the Network integration. This should only be necessary if the Sonos speakers are on a network segment not reachable from the default interface.
The Sonos speakers will attempt to connect back to Home Assistant to deliver change events. By default, Home Assistant will listen on port 1400 but will try the next 100 ports above 1400 if it is in use. You can change the IP address that Home Assistant advertises to Sonos speakers. This can help in NAT scenarios such as when not using the Docker option --net=host :
# Example configuration.yaml entry modifying the advertised host address sonos : media_player : advertise_addr : 192.0.2.1
This integration follows the standard integration removal process; no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Symptom
When setting up the integration you see the following error:
requests.exceptions.HTTPError: 403 Client Error: Forbidden for url: http://192.168.1.1:1400/DeviceProperties/Control
Description
This error means UPnP is not properly enabled on your Sonos system. The integration requires UPnP to communicate with your Sonos devices.
Resolution
To fix this issue, enable UPnP on your Sonos system:
Open the Sonos app on your phone or tablet.
Go to Account > Privacy and Security > UPnP .
Enable the UPnP setting.
Try setting up the integration again.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sonos hub was introduced in Home Assistant 0.7.3, and it's used by
16.1% of the active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jjlawren
@peterager
Categories
Media player
Sensor
Back to top
