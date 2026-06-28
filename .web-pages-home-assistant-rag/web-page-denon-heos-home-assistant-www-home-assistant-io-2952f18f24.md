---
source_url: "https://www.home-assistant.io/integrations/heos"
final_url: "https://www.home-assistant.io/integrations/heos"
canonical_url: "https://www.home-assistant.io/integrations/heos/"
source_handle: "web:www-home-assistant-io:2952f18f248e"
source_section: "integrations-heos"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "40be43a91a62da50a9be815c06ab7fb527535c31ba221213e47b1689b35ddefa"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Denon HEOS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/heos
- Final URL: https://www.home-assistant.io/integrations/heos
- Canonical URL: https://www.home-assistant.io/integrations/heos/
- Fetched at: 2026-06-28T02:48:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Denon HEOS into Home Assistant.

## Extracted Text

On this page
Supported functionality
Prerequisites
Configuration
Configuration options
Reconfiguration
Removal
List of actions
Examples
Playing media
Grouping players
Supported devices
Unsupported devices
Data updates
Known limitations
Logging and diagnostics
Troubleshooting
Missing favorites
Error attempting to submit configuration options
The Denon HEOS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to connect a HEOS System to Home Assistant. HEOS is a wireless audio ecosystem
that allows you to stream music to HEOS Built-in products from Denon and Marantz .
Add this integration to automate playback and group configuration of HEOS-capable products. For example, when a scene is activated, set the volume and play a specific Playlist on your receiver.
Media Player entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] for each HEOS-capable product, including speakers, amps, and receivers (Denon and Marantz)
Viewing the currently playing media
Controlling play mode (e.g., play/pause), volume, mute, and shuffle
Playing HEOS favorites, playlists, quick selects, URLs
Setting the source to physical inputs (e.g., AUX1 )
Browsing HEOS music services (for example, Tidal ) and sources (such as Favorites )
Grouping and ungrouping HEOS devices
Clearing playlists
One or more HEOS-capable products .
Optionally, a HEOS Account to access music services, playlists, and favorites.
To add the Denon HEOS hub to your Home Assistant instance, use this My button:
Denon HEOS can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Denon HEOS .
Follow the instructions on screen to complete the setup.
Note
A single instance of the integration adds all devices in the HEOS system to Home Assistant. When set up through discovery, it will automatically select the best host A device that participates in your network. If asked for the host, enter either the device’s IP address or host name. If you don’t know those, check the list of hosts in your router. [Learn more] . The integration will automatically reconnect and fail over to other hosts in the HEOS system if the configured host goes offline.
Host
The host name or IP address (e.g., “192.168.1.2”) of your HEOS-capable product. If you have more than one device, enter a host that is connected to the LAN via wire and is always powered on.
The integration provides the following configuration options. By entering your HEOS Account login information, the integration will be able to access streaming services, playlists, favorites, and other features. The integration will validate and sign in to your HEOS Account when credentials are entered or updated, and will ensure the HEOS System remains logged in while the credentials remain valid. Clearing the credentials will sign the HEOS System out of your account.
Select Denon HEOS . Select Configure .
Enter or clear your HEOS Account credentials.
Select Submit to save the options.
Username
The username or email address of your HEOS Account.
Password
The password to your HEOS Account.
Once set up, the host name or IP address used to access the HEOS System can be changed by reconfiguring the integration.
Select Denon HEOS . Click the three dots menu and then select Reconfigure .
Enter a new host name or IP address .
Click Submit to complete the reconfiguration.
This integration follows standard integration removal. No extra steps are required.
Select Denon HEOS . Click the three dots menu and then select Delete .
In addition to the standard media player actions , the HEOS integration provides actions to control group volume and to manage a player’s queue.
The Denon HEOS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get queue ( heos.get_queue )
Retrieves the play queue of a HEOS media player.
Turn down group volume ( heos.group_volume_down )
Turns down the volume of a HEOS group a step.
Set group volume ( heos.group_volume_set )
Sets the volume of a HEOS group while preserving member volume ratios.
Turn up group volume ( heos.group_volume_up )
Turns up the volume of a HEOS group a step.
Move queue item ( heos.move_queue_item )
Reorders one or more items within a HEOS media player’s play queue.
Remove from queue ( heos.remove_from_queue )
Removes one or more items from a HEOS media player’s play queue.
For an overview of every action across all integrations, see the actions reference .
Play a favorite
You can play a HEOS favorite by number or name with the media_player.play_media action. Example action data payload:
action : media_player.play_media data : entity_id : media_player.office media_content_type : " favorite" media_content_id : " 1"
Data attribute Optional Description entity_id yes entity_id of the player(s) media_content_type no Set to the value favorite media_content_id no (e.g., 1 ) or name (e.g., Thumbprint Radio ) of the HEOS favorite Play a playlist
You can play a HEOS playlist with the media_player.play_media action. Example action data payload:
action : media_player.play_media data : entity_id : media_player.office media_content_type : " playlist" media_content_id : " Awesome Music"
Data attribute Optional Description entity_id yes entity_id of the player(s) media_content_type no Set to the value playlist media_content_id no The name of the HEOS playlist Play a Quick Select
You can play a HEOS Quick Select by number or name with the media_player.play_media action. Example action data payload:
action : media_player.play_media data : entity_id : media_player.office media_content_type : " quick_select" media_content_id" : " 1"
Data attribute Optional Description entity_id yes entity_id of the player(s) media_content_type no Set to the value quick_select media_content_id no The quick select number (e.g., 1 ) or name (e.g., Quick Select 1 ) Play a URL
You can play a URL through a HEOS media player using the media_player.play_media action. The HEOS player must be able to reach the URL.
The URL ( media_content_type ) must be 255 characters or fewer due to a limitation in the HEOS firmware.
Example action data payload:
action : media_player.play_media data : entity_id : media_player.office media_content_type : " url" media_content_id : " http://path.to/stream.mp3"
Data attribute Optional Description entity_id yes entity_id of the player(s) to play the URL media_content_type no Set to the value url media_content_id no The full URL to the stream (max 255 characters) Play a queue item
You can play/move to an item within the player’s queue by using the media_player.play_media action. Set media_content_type to queue and media_content_id to the index (starting from 1) of an item in the play queue. The play queue can be enumerated by using the heos.get_queue action. Example action data payload:
action : media_player.play_media data : entity_id : media_player.office media_content_type : " queue" media_content_id : " 1"
Data attribute Optional Description entity_id yes entity_id of the player(s) media_content_type no Set to the value queue media_content_id no The queue index (e.g. 1 )
Join
To group HEOS media players together for synchronous playback, use the media_player.join action.
All group_members need to be HEOS media players.
The example action data payload below will expand playback of media_player.office to the media_player.kitchen and media_player.bathroom players:
action : media_player.join data : entity_id : media_player.office group_members : - media_player.kitchen - media_player.bathroom
Data attribute Optional Description entity_id yes The media player entity whose playback will be expanded to the players specified in group_members . group_members no The player entities which will be synced with the playback from entity_id . Unjoin
For removing a HEOS player from a group, use the media_player.unjoin action.
action : media_player.unjoin data : entity_id : media_player.office
Data attribute Optional Description entity_id yes Remove this media player from any player groups.
Actions may fail if they cannot be processed by the HEOS device. For example, attempting to call media_player.clear_playlist when the queue is empty will result in an error. To prevent this from halting a script or automation, set continue_on_error: true in the action call.
Denon and Marantz do not currently publish an inventory of HEOS-enabled devices, however, many receiver and hi-fi products began including HEOS since 2013. Consult your product model to confirm support:
Denon online manuals and product archive
Marantz online manuals and product archive
Denon and Marantz products before 2013 and non-network connected products (e.g., turntables and some CD players) do not support HEOS.
HEOS pushes data to Home Assistant via the local network when data and entity states change in real-time.
AVR receiver features, such as zone selection/control and power on/off, cannot be controlled through this integration. Use the Universal Media Player to combine AVR receiver functionality with this integration.
TTS TTS (text-to-speech) allows Home Assistant to talk to you. [Learn more] is not supported.
The maximum length of a URL that can be used in the play_media action is 255 characters due to a limitation in the HEOS firmware.
The HEOS integration supports Home Assistant debug logs and diagnostics . Diagnostics are available at both the integration entry and device level.
Symptom: “The HEOS System is not logged in: Enter credentials in the integration options to access favorites and streaming services”
The message above is logged during integration startup and the source_list attribute of the integration’s media_player entities are empty. Attempting call the media_player.play_media action
for favorite and playlist will fail. Other functionality of the integration is unaffected.
Description
To access features, such as favorites, playlists, and streaming services, the HEOS System must be logged in to your HEOS Account. This occurs when credentials are not entered in the configuration options and the HEOS System is in a logged out state.
Resolution
Enter the credentials to your HEOS Account in the configuration options if you want to access playlists, favorites, and streaming services; otherwise, the logged warning can be ignored. If credentials are entered, the integration will ensure that the HEOS System remains logged in while the credentials remain valid.
Symptom: “Invalid authentication” Description
The integration was unable to log the HEOS System in using the credentials provided. An informational log message contains the specific reason, such as: User not found (10) or Invalid credentials (6) .
Validate your credentials by logging in to the HEOS Mobile App and then re-enter your credentials in the configuration options and try submitting again.
Symptom: “Unexpected error” Description
An unexpected error occurred signing in or logging out of your HEOS Account. An error-level log message contains the error information.
Power-cycle the host that the integration is connected to and try again. If the problem persists, open an issue and include the error information.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Denon HEOS hub was introduced in Home Assistant 0.92, and it's used by
3.2% of the active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@andrewsayre
Categories
Media player
Back to top
