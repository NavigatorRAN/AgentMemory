# DLNA Digital Media Renderer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dlna_dmr
- Final URL: https://www.home-assistant.io/integrations/dlna_dmr
- Canonical URL: https://www.home-assistant.io/integrations/dlna_dmr/
- Fetched at: 2026-06-28T02:37:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a DLNA DMR device into Home Assistant.

## Extracted Text

On this page
Configuration
Options
Actions
Playing media
Media sources
Removing the integration
To remove an integration instance from Home Assistant
The DLNA Digital Media Renderer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a DLNA Digital Media Renderer , such as DLNA enabled TVs or radios.
Note that some devices, such as Samsung TVs, are rather picky about the source used to play from. The TTS action might not work in combination with these devices. If the play_media action does not work, please try playing from a DLNA/DMS (such as MiniDLNA ).
To add the DLNA Digital Media Renderer device to your Home Assistant instance, use this My button:
DLNA Digital Media Renderer can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select DLNA Digital Media Renderer .
Follow the instructions on screen to complete the setup.
Options for DLNA DMR devices can be set by going to Settings > Devices & services > DLNA Digital Media Renderer > Configuration .
Event listener port
Local port to listen on for events sent by the DLNA device. If this is not set, a random port will be allocated. Use this if you need a specific incoming port for firewall or NAT reasons.
Event listener callback URL
Local URL destination for events sent by the DLNA device. It should be of the form http://{host}:{port}/notify , where the keywords {host} and {port} are filled in automatically but can be set explicitly here, for example, http://192.88.99.1:5555/notify . Use this if the local IP address or port seen by Home Assistant is not what the device should connect to, because of Network Address Translation (NAT).
Poll for device availability
Periodically try to connect to the DLNA device, even if it is unavailable. Enable this if SSDP advertisements sent by the device are not received by Home Assistant, for example, when IP multicast is broken on your network.
Show incompatible media when browsing
When browsing media, show all media files and links, even if the device reports that it is not compatible with the media type.
DLNA devices can support a range of features. Depending on the device itself, the following media_player actions may be supported:
media_player.volume_up , media_player.volume_down , and media_player.volume_set
media_player.volume_mute
media_player.media_play
media_player.media_pause and media_player.media_play_pause
media_player.media_stop
media_player.media_next_track
media_player.media_previous_track
media_player.play_media
media_player.shuffle_set
media_player.repeat_set
media_player.select_sound_mode
Most DLNA DMR devices can play media from local HTTP servers. For best results, use HTTP instead of HTTPS, and refer to the server using an IP address instead of a hostname, for example, http://192.168.1.1:8080/song.mp3 .
The DLNA Digital Media Renderer integration can browse any configured media source . Displayed media will be filtered based on the capabilities of the DLNA DMR device.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DLNA Digital Media Renderer device was introduced in Home Assistant 0.76, and it's used by
28.2% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@chishm
Categories
Media player
Back to top
