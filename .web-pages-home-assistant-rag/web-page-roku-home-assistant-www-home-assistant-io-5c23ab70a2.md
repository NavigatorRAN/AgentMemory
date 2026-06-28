---
source_url: "https://www.home-assistant.io/integrations/roku"
final_url: "https://www.home-assistant.io/integrations/roku"
canonical_url: "https://www.home-assistant.io/integrations/roku/"
source_handle: "web:www-home-assistant-io:5c23ab70a2db"
source_section: "integrations-roku"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d142e94a9b649b94f199f424517691244a84ec333e464d7001a0f073a7f4ed1d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Roku - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/roku
- Final URL: https://www.home-assistant.io/integrations/roku
- Canonical URL: https://www.home-assistant.io/integrations/roku/
- Fetched at: 2026-06-28T03:12:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to integrate Roku devices into Home Assistant.

## Extracted Text

On this page
Configuration
Options
Data updates
Supported functionality
Entities
Source automation
TV channel tuning
Play on Roku
Content deeplinking
Camera stream integration
List of actions
Tips and tricks
Obtaining application IDs
Obtaining content IDs
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Roku integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Roku media playback device. This integration only supports Roku media playback devices (such as sticks, streaming boxes, and televisions). All other smart home products (such as light bulbs and cameras) are part of a different ecosystem.
To add the Roku device to your Home Assistant instance, use this My button:
Roku can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Roku .
Follow the instructions on screen to complete the setup.
When adding the integration, you will be asked to provide a host A device that participates in your network. If asked for the host, enter either the device’s IP address or host name. If you don’t know those, check the list of hosts in your router. [Learn more] . Unless you changed the hostname, this refers to the IP address of your Roku device. You can find the IP address or hostname in the network settings of your Roku device, by checking your router, or by using a network scanning tool.
If you are having issues connecting, you may have to adjust the settings on your Roku device to allow local control. The common setting is: Settings / System / Advanced / Control by mobile apps / Network access
To define options for Roku, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Roku are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Play Media Application ID
The application ID to use when launching media playback. The default is 15985 . This application must support the PlayOnRoku API.
The Roku integration polls every 10 seconds to check the current state of media playback. The available applications and television channels are only fetched every 15 minutes.
The Roku integration provides the following entities.
Binary sensor
Headphones connected sensor
Description : The headphones connected sensor will tell if you if the device has headphones connected for private listening.
Available for devices : All
Supports AirPlay sensor
Description : The supports AirPlay sensor will tell if the device is capable of accepting AirPlay connections.
Supports Ethernet sensor
Description : The supports Ethernet sensor will tell if the device is capable of being connected via an Ethernet cable.
Supports find remote sensor
Description : The supports find remote sensor will tell if the device is capable of the find remote feature.
Media player
The integration allows for media playback control including power and source control. It also supports the ability to select sources such as text-to-speech and Camera via “Browse Media”.
Remote
The integration allows you to send remote control commands. It is automatically set up for all devices.
The following commands are currently supported depending on device type and manufacturer support:
back
backspace
channel_down
channel_up
down
enter
find_remote
forward
home
info
input_av1
input_hdmi1
input_hdmi2
input_hdmi3
input_hdmi4
input_tuner
left
play
power
replay
reverse
right
search
select
up
volume_down
volume_mute
volume_up
Strings can be typed by using the command Lit_STRING (e.g. Lit_example will type “example”). Punctuation and spaces are allowed in the string.
Example
action : remote.send_command target : entity_id : remote.roku data : command : - left - left - select
Select
Application control
Description : The application select control allows changing the active application.
Channel control
Description : The channel select control allows changing the active television channel.
Available for devices : Only available for Roku TV devices.
Sensor
Active app sensor
Description : The active app sensor will tell you the name of the active application.
Active app ID sensor
Description : The active app ID sensor will tell you the ID of the active application.
The media_player.select_source action may be used to launch specific applications on your Roku device.
Data attribute Optional Description Example entity_id no Target a specific media player. source no An application name or application ID. Prime Video Examples
actions : - action : media_player.select_source target : entity_id : media_player.roku data : source : " Prime Video"
Alternatively, the application id can be used for source . See Obtaining Application IDs .
actions : - action : media_player.select_source target : entity_id : media_player.roku data : source : 20197
The media_player.play_media action may be used to tune to specific channels on your Roku TV device with OTA antenna.
Data attribute Optional Description Example entity_id no Target a specific media player. media_content_id no A channel number. 5.1 media_content_type no A media type. channel Example
actions : - action : media_player.play_media target : entity_id : media_player.roku data : media_content_id : 5.1 media_content_type : channel
The media_player.play_media action may be used to send media URLs (primarily videos) for direct playback on your device.
This feature uses the PlayOnRoku API. If you are using an older Roku OS (pre-11.5), the defaults of this integration should just work with the configuration defaults. Alternatively, you can configure a third-party application that supports the PlayOnRoku API via the Play Media Roku Application ID option.
The following third-party applications have been tested with this integration:
Media Assistant (ID: 782875)
Service data attribute Optional Description Example entity_id no Target a specific media player. media_content_id no A media URL. http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4 media_content_type no A media type. url extra.format no A media format. It should be one of mp4 (supports mov and m4v), mp3 , hls , ism (smooth streaming), dash (MPEG-DASH), mkv , mka , mks mp4 extra.name yes A name for the media. Big Buck Bunny extra.thumbnail yes A thumbnail URL for the media. extra.artist_name yes The name of the media artist. Blender Example
actions : - action : media_player.play_media target : entity_id : media_player.roku data : media_content_id : " http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" media_content_type : url extra : format : " mp4" name : " Big Buck Bunny"
The media_player.play_media action may be used to deep-link to content within a channel application using content IDs. See Obtaining Content IDs to learn more about content IDs.
Data attribute Optional Description Example entity_id no Target a specific media player. media_content_id no A media identifier. 291097 media_content_type no A media type. app extra.content_id no A unique content identifier passed to app. 8e06a8b7-d667-4e31-939d-f40a6dd78a88 extra.media_type no A media type passed to app. Should be one of movie , episode , season , series , shortFormVideo , special , live movie Example
actions : - action : media_player.play_media target : entity_id : media_player.roku data : media_content_id : 291097 media_content_type : app extra : content_id : 8e06a8b7-d667-4e31-939d-f40a6dd78a88 media_type : movie
The camera.play_stream action may be used to send camera streams (HLS) directly to your device. This feature requires the stream integration and uses the PlayOnRoku API.
actions : - action : camera.play_stream target : entity_id : camera.camera data : media_player : media_player.roku
The Roku integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Search ( roku.search )
Open the search screen on a Roku device and enter a search keyword.
For an overview of every action across all integrations, see the actions reference .
The currently active application ID can be found in the Active App ID diagnostic sensor.
Alternatively, you can make a manual HTTP request (GET) to http://ROKU_IP:8060/query/apps , in either your browser or terminal, to retrieve a complete list of installed applications in XML format.
Content IDs are unique to each streaming service and vary in format but are often part of the video webpage URL. Here are some examples:
Service App ID URL Format Content ID Media Type Disney Plus 291097 disneyplus.com/video/8e06a8b7-d667-4e31-939d-f40a6dd78a88 8e06a8b7-d667-4e31-939d-f40a6dd78a88 movie Hulu 2285 hulu.com/series/american-dad-977c8e25-cde0-41b7-80ce-e746f2d2093f american-dad-977c8e25-cde0-41b7-80ce-e746f2d2093f series Spotify 22297 open.spotify.com/playlist/5xddIVAtLrZKtt4YGLM1SQ spotify:playlist:5xddIVAtLrZKtt4YGLM1SQ playlist YouTube 837 youtu.be/6ZMXE5PXPqU 6ZMXE5PXPqU live
Roku has been known to remove or restrict local control functionality as part of major Roku OS upgrades. As such devices may become less functional after an upgrade.
Roku channels, such as YouTube, are maintained by third-parties and as such the availability of features like Content Deeplinking are subject to change without notice.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Roku device was introduced in Home Assistant 0.86, and it's used by
2.3% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ctalkington
Categories
Hub
Back to top
