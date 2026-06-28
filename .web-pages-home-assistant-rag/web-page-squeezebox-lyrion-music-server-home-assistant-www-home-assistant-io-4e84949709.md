# Squeezebox (Lyrion Music Server) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/squeezebox
- Final URL: https://www.home-assistant.io/integrations/squeezebox
- Canonical URL: https://www.home-assistant.io/integrations/squeezebox/
- Fetched at: 2026-06-28T03:18:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Squeezebox players and a Lyrion Music Server (LMS) into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Options
Announce
Extra Keys
Examples
Announcements and Text to Speech (TTS)
Supported functionality
Switches
Binary sensors
Buttons
Sensors
Updates
List of actions
Data updates
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Squeezebox integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control music players from the Lyrion Music Server (LMS) ecosystem. Lyrion Music Server was formerly known as Logitech Media Server .
This integration connects to an existing LMS server and provides both media players and sensors for monitoring server status.
The Squeezebox music player ecosystem, which can be controlled through this integration, includes hardware audio players from Logitech, including Squeezebox 3rd Generation , Squeezebox Boom , Squeezebox Receiver , Transporter , Squeezebox2 , Squeezebox and SLIMP3 , and many software emulators like Squeezelite , SqueezeSlave , SoftSqueeze and SqueezePlay .
The integration supports any Squeezebox compatible hardware or software players and both Lyrion Music Servers and Logitech Media Servers.
One or more Squeezebox compatible hardware or software players .
One or more Lyrion Music Servers or Logitech Media Servers (LMS) with the Squeezebox players connected to these servers.
To add the Squeezebox (Lyrion Music Server) hub to your Home Assistant instance, use this My button:
Squeezebox (Lyrion Music Server) can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Squeezebox (Lyrion Music Server) .
Follow the instructions on screen to complete the setup.
Note
A single configuration entry for the integration adds all Squeezebox devices connected to one LMS to Home Assistant.
When the LMS cannot be discovered, it can be manually configured.
Host
The host name or IP address (e.g., “192.168.1.2”) of your LMS.
Port
The integration uses the web interface of the Lyrion Music Server (LMS) to send commands. The default port of the web interface is 9000. It is the same port that you use to access the LMS through your web browser.
Username
If you have selected “Password Protection” in your LMS Advanced Security, enter your Username here.
Password
If you have selected “Password Protection” in your LMS Advanced Security, enter your Password here.
Connect over HTTPS
The integration now supports Lyrion Music Servers behind an HTTPS reverse proxy. Please note that Lyrion Music Server natively only supports HTTP traffic. Unless you have configured a reverse proxy, do not select the “Connect over HTTPS” option. If you have configured a reverse proxy, remember to update the port number.
The Logitech Transporter which have two digital inputs can be activated using a script. The following example turns on the Transporter and activates the toslink input interface:
# Turn on Transporter and activate toslink interface transporter_toslink : sequence : - action : homeassistant.turn_on target : entity_id : media_player.transporter - action : media_player.play_media target : entity_id : media_player.transporter data : media_content_id : ' source:toslink' media_content_type : ' music'
To define options for Squeezebox (Lyrion Music Server), follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Squeezebox (Lyrion Music Server) are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Browse limit
Maximum number of items to include when browsing media or in a playlist.
Volume step
Amount to adjust the volume when turning volume up or down.
The Squeezebox media player entity supports the “announce” parameter in the media_player.play_media action. When media is played with announce:true, the current state of the media player is saved, the media is then played, and when playing is finished, the original state is restored. For example, if the media player is on and playing a track, once the announcement is finished, the track will resume playing at the same point it was paused by the announcement. If the media player was off, it will be turned off again after playing the announcement.
The following extra keys are available to modify the announcement
Data attribute Optional Description announce_volume yes Specifies the volume at which the announcement should play. The value must be between 0 and 1, where 0.1 represents 10% of the player’s volume, 0.2 represents 20%, and so on announce_timeout yes Specify the maximum length of the announcement in seconds after which the original media will be resumed.
These extra keys are optional. If announce_volume is unspecified, the announcement will play at the current volume of the player. If announce_timeout is unspecified, the announcement will play until completion.
Playing a local file as an announcement:
action : media_player.play_media target : entity_id : media_player.squeezebox data : media_content_type : music media_content_id : media-source://media_source/local/doorbell.mp3 announce : true
Playing a local file as an announcement with volume of 20 and timeout of 60 seconds:
action : media_player.play_media target : entity_id : media_player.squeezebox data : media_content_type : music media_content_id : media-source://media_source/local/doorbell.mp3 announce : true extra : announce_volume : 0.2 announce_timeout : 60
When using the “Text-to-speech (TTS): Speak” action, Home Assistant automatically sets the announce parameter as true, and the announcement features, such as pausing current playback, will be used.
However, the “Text-to-speech (TTS): Speak” action doesn’t support the extra keys described above. If you wish to use announce_volume and/or announce_timeout with TTS, you need to use media-source://tts/(tts_provider) to construct media_content_id as shown below.
Example
Play announcement using Text-to-speech (TTS) action
action : tts.speak data : media_player_entity_id : media_player.squeezebox message : There's someone at the door cache : false target : entity_id : tts.google_translate_en_co_uk
Play announcement using TTS media-source with announce_volume and announce_timeout
action : media_player.play_media target : entity_id : media_player.squeezebox data : media_content_type : music media_content_id : media-source://tts/tts.google_translate_en_co_uk?message="There's someone at the door" announce : true extra : announce_volume : 0.2 announce_timeout : 60
The integration provides the following functionality:
Alarm : Enables a scheduled alarm to sound. Alarms must also be enabled on the associated player for the alarm to sound, using the Alarms Enabled switch or directly on the Lyrion Music Server for that player.
Alarms Enabled : Enables a player to sound alarms. Disabling will prevent all alarms from sounding on that player, regardless of whether the individual alarm is enabled.
Alarm active
Description : One of the alarms on the Squeezebox player is currently going off.
Alarm snoozed
Description : One of the alarms on the Squeezebox player is currently active but snoozed. In this case the “Alarm active” binary sensor will be in state OFF.
Alarm upcoming
Description : The Squeezebox player has an alarm scheduled within the next 24 hours.
Library rescan
Description : The music library is currently being scanned by LMS (depending on the type of scan, some content may be unavailable).
Needs restart
Description : Server Service needs to be restarted (typically, this is needed to apply updates).
Preset 1 … Preset 6
Description : Play media stored in Preset 1 to Preset 6 on Squeezebox.
Brightness up, Brightness down
Description : Adjust the brightness on Logitech Squeezebox players
Available on : Logitech hardware players with built-in screen, such as Radio and Boom.
Bass up, Bass down
Description : Adjust the bass on Logitech Squeezebox players, such as Radio and Boom.
Available on : Logitech hardware players such as Radio, Duet and Boom.
Treble up, Treble down
Description : Adjust the treble on Logitech Squeezebox players, such as Radio and Boom.
Available on : Logitech hardware players such as Radio, Duet, and Boom.
Last scan
Description : Date of the last library scan.
Next alarm
Description : Timestamp of the next enabled alarm of a player.
Player count
Description : Number of players on the service.
Player count off service
Description : Number of players not on this service.
Total albums
Description : Total number of albums currently available on the service.
Total artists
Description : Total number of artists currently available on the service.
Total duration
Description : Duration of all tracks in service (HHHH:MM:SS).
Total genres
Description : Total number of genres used in current service.
Total songs
Description : Total number of music files currently in service.
This integration will notify you when updates are available on the LMS for the LMS version or for plugins installed on the LMS
Lyrion Music Server : Update of the server software is available.
Updated plugins : Plugin updates are available. The list of updates can be viewed by selecting the “Read release announcement” link. On the LMS, an option is available on the Manage Plugins settings page to “Update plugins automatically”. If this option is selected, plugins will be downloaded automatically by the LMS and then installed on the next restart of the LMS. For some installation types of LMS, the LMS can be restarted by selecting the Update button. Allow enough time for the LMS to restart as it will become briefly unavailable.
The Squeezebox (Lyrion Music Server) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Call method ( squeezebox.call_method )
Call a custom Squeezebox JSON-RPC API command on a Lyrion Music Server.
Call query ( squeezebox.call_query )
Call a custom Squeezebox JSON-RPC API query and store the result on the player.
For an overview of every action across all integrations, see the actions reference .
The integration uses polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] to receive updates from the Lyrion Music Server (LMS). It uses the web interface of the LMS to send commands. The default port of the web interface is 9000. It is the same port that you use to access the LMS through your web browser.
The LMS API, which is used by this integration, does not currently provide the ability to override or control fade-in & crossfade settings. This means that if you have enabled Play or Resume fade-in duration within the player’s audio settings, this fade-in will be applied to any announcement played. This could potentially lead to the start of an announcement being missed as it fades in. You should, therefore, consider a short Play or Resume fade-in duration or preferably disabling this feature if you use announcements.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Squeezebox (Lyrion Music Server) hub was introduced in Home Assistant pre 0.7, and it's used by
2221 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rajlaud
@pssc
@peteS-UK
Categories
Media player
Update
Back to top
