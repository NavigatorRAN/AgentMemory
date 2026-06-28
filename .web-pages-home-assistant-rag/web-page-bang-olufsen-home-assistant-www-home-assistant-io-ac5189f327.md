# Bang & Olufsen - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bang_olufsen
- Final URL: https://www.home-assistant.io/integrations/bang_olufsen
- Canonical URL: https://www.home-assistant.io/integrations/bang_olufsen/
- Fetched at: 2026-06-28T02:30:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Bang & Olufsen devices into Home Assistant.

## Extracted Text

On this page
Compatible devices
Configuration
Data updates
Supported features
Media player
Events
Sensor
Binary sensor
Limitations
Beoremote One
List of actions
Playing media
Playback examples
Beolink multiroom
Automations
Getting Deezer URIs
Getting Tidal URIs
Getting B&O Radio station IDs
Beolink
Diagnostics and troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Bang & Olufsen integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables control of some of the features of certain Bang & Olufsen devices through Home Assistant.
Devices that have been tested and should work without any trouble are:
Beoconnect Core
Beolab 8
Beolab 28
Beosound 2 3rd gen
Beosound A5
Beosound A9 5th gen
Beosound Balance
Beosound Emerge
Beosound Level
Beosound Premiere
Beosound Theatre
Beoremote One through paired devices
and any other Mozart based products. This means all Connected Speakers that have been launched after 2020.
To add the Bang & Olufsen device to your Home Assistant instance, use this My button:
Bang & Olufsen can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Bang & Olufsen .
Follow the instructions on screen to complete the setup.
IP Address
The IP address of your device. Can be found by navigating to the device on the Bang & Olufsen app and selecting Settings → About → IP address .
Device model
The model name of your Bang & Olufsen device. This is used to determine some capabilities of the device. If the device is not in the list yet, choose a product similar to yours.
The Bang & Olufsen integration uses the Mozart API , which is a local REST API with a WebSocket notification channel for immediate state information such as media metadata, playback progress, and volume. The only exception is that the repeat and shuffle controls are polled every 30 seconds.
Currently, for each added physical device, a single device is created that includes a media_player entity and, if available, event entities.
Several features are available through the media player entity:
See current metadata, progress, volume, and more.
Control next/previous, play/pause, shuffle/repeat settings, volume, sound mode, audio and video sources, and more.
Play various media through the media player play media action .
Control multiroom audio through Beolink :
Control with Home Assistant media_player grouping.
Monitor current Beolink state through media player properties.
Dedicated Beolink actions have been defined to provide further control:
Connect or expand to ASE products not available in Home Assistant.
Expand sessions to all discovered devices.
Connect to, expand to or unexpand devices.
Set all connected Beolink devices to standby.
Mozart device controls
Event entities are created for each of the available physical controls on your device. These controls usually have their own behaviors, so using them for automations is not always ideal.
Available event entities:
Bluetooth (Not available on Beosound Premiere)
Microphone
Next
Play / Pause
Favourite 1
Favourite 2
Favourite 3
Favourite 4
Previous
Volume
All of these event entities support the following event types:
Release of short press
Long press
Release of long press
Very long press
Release of very long press
Button variations
Many devices have the same button layout, but not all of them. These are the differences:
The Beoconnect Core does not support device controls.
The Beosound A9 5th gen and the Beosound Premiere do not have Bluetooth or Microphone buttons
The Beosound A5 does not have a Microphone button
A Home Assistant device is created for each paired Beoremote One via their paired Mozart device. Event entities are created for each of the compatible keys on the remote. These event entities are disabled by default.
Beoremote One devices are automatically added as they are detected.
Triggering events
There are 4 different types of key events:
Control functions
Control keys
Light functions
Light keys
Functions can be accessed by pressing the Right key while either Control or Light are highlighted and can be triggered by pressing Select .
Keys can be triggered by pressing the Select key while either Control or Light are highlighted, and then pressing one of the compatible keys. The Select press can also be skipped, by simply pressing one of the compatible keys while the desired submenu is highlighted.
Each of these triggers have two different event states:
key_press
key_release
In total, this amounts to 90 different remote key Event entities per remote.
Configuring light and control functions
Several functions are available on the Beoremote One. These are available as function 1-17 for the Light submenu and 1-27 for the Control submenu.
Only a subset of these functions are enabled by default. Change settings for the Control and Light submenus following these steps:
Press up and select the name of the currently selected paired device. This will show a list of the paired devices.
Select Beovision
Navigate to Settings > Advanced > Light menu / Control menu .
Use the Show setting to change which functions are visible.
Use the Rename setting to rename the visible functions.
Use the Move setting to reorder the visible functions.
The function names are not available to the Mozart device, so enable debug logging and trigger functions to see what function IDs are associated with which functions on the remote.
Mozart battery level
Mozart devices that have a built-in battery, such as the Beosound A5 and Beosound Level , will have a battery level sensor.
Beoremote One battery level
Any paired Beoremote One remotes will have an associated battery level sensor. Battery level reporting from the remote is currently not very accurate, but can still be useful.
Mozart battery charging
Mozart devices that have a built-in battery, such as the Beosound A5 and Beosound Level , have a battery charging binary sensor.
Currently, some features of the Mozart platform are not available through the public API . Some may become available at a later point, but until then the Bang & Olufsen App can be used to configure these settings and features:
Creating timers and alarms
Retrieving detailed alarm and timer information
And more app-centric features such as:
Creating presets
Creating listening positions
Creating sound modes
Creating stereo pairs
Adjusting specific sound settings
Pairing remotes
Several remote controls can be paired to the same Mozart device and are still created as Home Assistant devices and Event entities. These remote controls will trigger the same WebSocket notification, meaning that a press on remote A will also trigger Remote B’s associated Event entity.
This has the benefit of being able to trigger automations mapped to remote A with remote B, but also means that each Mozart device only supports the 90 Event entities that a single remote provides.
The Bang & Olufsen integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Beolink all standby ( bang_olufsen.beolink_allstandby )
Sets all connected Beolink devices to standby.
Beolink expand ( bang_olufsen.beolink_expand )
Adds devices to the current Beolink experience.
Beolink join ( bang_olufsen.beolink_join )
Joins a Beolink experience.
Beolink leave ( bang_olufsen.beolink_leave )
Leaves a Beolink experience.
Beolink unexpand ( bang_olufsen.beolink_unexpand )
Removes devices from the current Beolink experience.
For an overview of every action across all integrations, see the actions reference .
The Bang & Olufsen integration supports different playback types in the media_player.play_media action: playback from URL, activating a favorite, playback from a local file, playing a radio station, activating a Deezer flow and Deezer playlists, albums, tracks, and playing files and text-to-speech (TTS) as an overlay.
Playing DR P1 from a URL:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : url media_content_id : http://live-icy.dr.dk/A/A03H.mp3
Activating the first favourite:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : favourite media_content_id : 1
Playing a local file:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_id : media-source://media_source/local/example.mp3 media_content_type : music
Playing a radio station:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_id : 1234567890123456 media_content_type : radio
Playing a Deezer flow. Optionally define a Deezer user ID:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : deezer media_content_id : flow extra : id : 1234567890
Playing a Deezer playlist. Optionally define starting position for the playlist:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : deezer media_content_id : playlist:1234567890 extra : start_from : 123
Playing a Deezer album. Optionally define starting position for the album:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : deezer media_content_id : album:1234567890 extra : start_from : 123
Playing a Deezer track:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : deezer media_content_id : 1234567890
Playing a Tidal playlist. Optionally define starting position for the playlist:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : tidal media_content_id : playlist:01234567-89ab-cdfe-0123-456789abcdef extra : start_from : 123
Playing a Tidal album. Optionally define starting position for the album:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : tidal media_content_id : album:123456789 extra : start_from : 123
Playing a Tidal track:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : tidal media_content_id : 123456789
Overlay
Interrupts currently playing media to play an audio message.
To use the Bang & Olufsen Cloud TTS, use overlay_tts as the media_content_type and enter a message into the media_content_id field.
Bang & Olufsen Cloud TTS messages are limited to 100 unique messages a day and are cached for 24 hours.
Extra keys available:
overlay_absolute_volume : Specify an absolute volume for the overlay.
overlay_offset_volume : Specify a volume offset to be added to the current volume level.
overlay_tts_language : Specify the language used for text-to-speech. Uses the BCP 47 standard. The default is en-us .
Examples
Playing a local file with an absolute volume as an overlay:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : music media_content_id : media-source://media_source/local/doorbell.mp3 announce : true extra : overlay_absolute_volume : 60
Playing a Bang & Olufsen Cloud TTS message with an offset volume (as TTS messages can be quiet):
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : overlay_tts media_content_id : This is a test announce : true extra : overlay_offset_volume : 10
Playing a Bang & Olufsen Cloud TTS message with a local language:
action : media_player.play_media target : entity_id : media_player.beosound_balance_12345678 data : media_content_type : overlay_tts media_content_id : Dette er en test announce : true extra : overlay_tts_language : da-dk
Beolink is Bang & Olufsen’s multiroom audio solution. This integration supports Home Assistant’s media_player grouping, but to fully benefit from Beolink, such as joining legacy devices that are not added to Home Assistant, the integration provides dedicated actions.
Attempting to run an invalid Beolink action results in either a Home Assistant error or an audible error indication from your device.
WebSocket notifications received from the device are fired as events in Home Assistant. These can be received by listening to bang_olufsen_websocket_event event types, where device_id or serial_number can be used to differentiate devices.
To find Deezer playlist, album URIs, and user IDs for Deezer flows, the Deezer website has to be accessed. When navigating to an album, the URL will look something like: https://www.deezer.com/en/album/ALBUM_ID , and this needs to be converted to: album:ALBUM_ID and the same applies to playlists, which have the format: playlist:PLAYLIST_ID .
Deezer user IDs can be found at https://www.deezer.com/en/profile/USER_ID by selecting the active user in a web browser.
Additionally, Deezer IDs for currently playing tracks can be found in the media_content_id attribute in the media_player entity.
Tidal playlists, album URIs and track IDs are available via the Tidal website. When navigating to an album, the URL will look something like https://listen.tidal.com/album/ALBUM_ID/ , and this needs to be converted to album:ALBUM_ID . The same applies to playlists, which have the format playlist:PLAYLIST_ID . Individual tracks can be found by sharing the track and selecting the Copy track link method, which should yield a link of the format https://tidal.com/browse/track/TRACK_ID?u , this can be played by extracting the track id TRACK_ID .
Additionally, Tidal IDs for currently playing tracks can be found in the media_content_id attribute in the media_player entity.
Radio station IDs for currently playing stations can be found in the media_content_id attribute in the media_player entity.
Discovered devices and devices in an active Beolink experience are available in the properties of the media_player entity. A device is represented by its friendly name and JID, used for connecting devices.
beolink : self : The current device leader : Beolink leader (if available) listeners : Beolink listeners (if available) peers : Beolink peers (if available)
The Bang & Olufsen integration supports Home Assistant debug logs and diagnostics .
Where all received WebSocket events are provided through debug logs and the following is provided in the diagnostics:
Config entry
Mozart device
WebSocket connection state
Media player state
Button Event states (if available)
Battery level sensor (if available)
Battery charging binary sensor (if available)
Beoremote One remotes (if available)
Key Event states (if available)
Overall status
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bang & Olufsen device was introduced in Home Assistant 2024.2, and it's used by
269 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mj23000
Categories
Event
Media Player
Multimedia
Back to top
