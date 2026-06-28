# MusicCast - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yamaha_musiccast
- Final URL: https://www.home-assistant.io/integrations/yamaha_musiccast
- Canonical URL: https://www.home-assistant.io/integrations/yamaha_musiccast/
- Fetched at: 2026-06-28T03:30:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Yamaha MusicCast Receivers into Home Assistant.

## Extracted Text

On this page
Configuration
Grouping functionality
Play media functionality
Examples:
Configuration / diagnostic entities
Number entities
Select entities
Switch entities
Troubleshooting
Errors on handling UDP messages
The Yamaha MusicCast integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Yamaha MusicCast Receivers from Home Assistant.
Supported devices are listed on their site .
To add the MusicCast device to your Home Assistant instance, use this My button:
MusicCast can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select MusicCast .
Follow the instructions on screen to complete the setup.
The Yamaha MusicCast integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] implements the grouping actions. There are some limitations in the MusicCast system for grouping:
It is not possible to let mediaplayer entities of the same device (e.g., different zones) be in distinct groups.
If a non-main zone is the master of a group, it is not possible to let other mediaplayers of the same device join this group.
The MusicCast integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports the Home Assistant media browser for all streaming services, your device supports. For services such as Deezer, you have to log in using the official MusicCast app. In addition, local HTTP URLs can be played back using this action. This includes the Home Assistant text-to-speech actions.
It is also possible to recall NetUSB presets using the play media action. To do so “presets:<preset_num>” has to be used as media_content_id in the action.
This is an example action that plays an audio file from a web server on the local network (like the Home Assistant built-in webserver):
action : media_player.play_media target : entity_id : media_player.sonos data : media_content_type : " music" media_content_id : " http://192.168.188.18:8123/local/sound_files/doorbell-front.mp3"
This example call shows how to call netusb preset 1:
action : media_player.play_media target : entity_id : media_player.buro data : media_content_id : " presets:1" media_content_type : " music"
Depending on the features supported by the device, several entities will be added for every MusicCast Device. Some of the entities are related to the MusicCast device and some are related to a zone of the device. All device and main zone related entities will be assigned to the Home Assistant device of the main zone. Entities related to other zones will be assigned to the Home Assistant device of the corresponding zone.
The following entities will be added, if they are supported by the MusicCast device:
Equalizer (configuration, zone level)
One number entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] each is added for high, mid and low
Tone Control (configuration, zone level)
One number entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] each is added for bass and treble
Dialogue Level (configuration, zone level)
Set the volume of dialogues in relation to the general volume
Dialogue Lift (configuration, zone level)
Set the vertical position of the dialogues in the surround system
DTS Dialogue Control (configuration, zone level)
Control the volume of dialogues for DTS:X content
Dimmer (configuration, device level)
Set the display brightness
Surround Decoder Type (configuration, zone level)
If sound program is set to surround decoder, the decoder type can be selected here
Sleep (configuration, zone level)
Set a sleep timer for the device
Equalizer Mode (configuration, zone level)
Some devices support multiple different equalizer modes
Tone Control Mode (configuration, zone level)
Some devices support multiple different tone control modes
Link Audio Delay (configuration, zone level)
Some devices let the user select, whether he prefers to have audio and video in sync or the audio of linked speakers in a group
Link Control (configuration, zone level)
Some devices support compressed audio for groups
Link Audio Quality (configuration, zone level)
Set the audio quality for grouped speakers
Speaker A (configuration, device level)
A switch to turn on the speaker set A
Speaker B (configuration, device level)
A switch to turn on the speaker set B
Party Mode (configuration, device level)
Lets all zones play the same content like the main zone
Bass Extension (configuration, zone level)
Extend the bass to more speakers (especially useful in configurations without a subwoofer)
Extra Bass (configuration, zone level)
Seems to be the same as bass extension, but on other devices
Enhancer (configuration, zone level)
Enhances compressed audio formats
Pure Direct (configuration, zone level)
Lets the device play the audio directly without any additional processing
Adaptive DRC (configuration, zone level)
Adjusts the volume of high and low frequency levels for better sound at low volume
In this section known problems and their resolution are documented.
The Yamaha MusicCast integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is working with updates sent from the device to Home Assistant instead of pulling all information every few seconds. There is no error correction mechanism in these messages, so that only 100% correct messages can be processed. Whenever there is a corrupt message the Yamaha MusicCast integration will update all device information and log an error message like these:
Received invalid message: <message>
Received non UTF-8 compliant message: b'<binary>'
If you receive these errors frequently, you should first try to disconnect your MusicCast devices from the power, wait 30 seconds and reconnect them to the power. If this does not help, you can try to use a LAN cable instead of WiFi to connect the device to the network.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MusicCast device was introduced in Home Assistant 0.53, and it's used by
1.8% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@vigonotion
@micha91
Categories
Media player
Back to top
