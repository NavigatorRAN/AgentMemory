---
source_url: "https://www.home-assistant.io/integrations/kaleidescape"
final_url: "https://www.home-assistant.io/integrations/kaleidescape"
canonical_url: "https://www.home-assistant.io/integrations/kaleidescape/"
source_handle: "web:www-home-assistant-io:dbaaf0741616"
source_section: "integrations-kaleidescape"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2417325c4a9e5738691433849b7d86e6374cb3fea80b1a8c0b112ac94cb37b29"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Kaleidescape - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/kaleidescape
- Final URL: https://www.home-assistant.io/integrations/kaleidescape
- Canonical URL: https://www.home-assistant.io/integrations/kaleidescape/
- Fetched at: 2026-06-28T02:54:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Kaleidescape into Home Assistant.

## Extracted Text

On this page
Supported Models
Configuration
Media player
Remote
Sensor
Media Location
Play Status
Play Speed
Video Mode
Video Color EOTF
Video Color Space
Video Color Depth
Video Color Sampling
Screen Mask Ratio
Screen Mask Top Trim Rel
Screen Mask Bottom Trim Rel
Screen Mask Conservative Ratio
Screen Mask Top Mask Abs
Screen Mask Bottom Mask Abs
Cinemascape Mask
Cinemascape Mode
The Kaleidescape integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows for the automation of Kaleidescape movie players.
Ideas for automation include:
Playing and pausing a movie sets lighting scenes.
The start of movie credits turns up the lights.
A change in aspect ratio controls a projection masking system.
A change in video resolution controls a lens system or video scaler.
This integration is intended for the automation of Kaleidescape players with a movie zone. This includes all Strato and Premier players. Strato players support auto-discovery in Home Assistant. Premier players must be added manually by adding an instance of this integration and specifying the IP address of the player.
To add the Kaleidescape device to your Home Assistant instance, use this My button:
Kaleidescape can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Kaleidescape .
Follow the instructions on screen to complete the setup.
The Kaleidescape media player platform will create a media player entity for the device. This entity will display the currently playing media and playback controls.
The Kaleidescape remote platform will create a Remote entity for the device. This entity allows you to send the following commands via the remote.send_command action.
select
up
down
left
right
cancel
replay
scan_forward
scan_reverse
go_movie_covers
menu_toggle
A typical action might look like the example below, which sends a command to the device to select the currently highlighted item.
action : remote.send_command target : entity_id : remote.kaleidescape_theater data : command : - select
The Kaleidescape sensor platform will create multiple Sensor entities for the device. The follow sensors are provided:
The location in the current movie.
none
content
intermission
credits
disc_menu
The play status of the current movie.
paused
playing
forward
reverse
The playback speed of the current movie. An integer between 1 (normal) and 3 (fast).
The video mode of the current movie.
480i60_4:3
480i60_16:9
480p60_4:3
480p60_16:9
576i50_4:3
576i50_16:9
576p50_4:3
576p50_16:9
720p60_ntsc_hd
720p50_pal_hd
1080i60_16:9
1080i50_16:9
1080p60_16:9
1080p50_16:9
1080p24_16:9
480i60_64:27
576i50_64:27
1080i60_64:27
1080i50_64:27
1080p60_64:27
1080p50_64:27
1080p23976_64:27
1080p24_64:27
3840x2160p23976_16:9
3840x2160p23976_64:27
3840x2160p30_16:9
3840x2160p30_64:27
3840x2160p60_16:9
3840x2160p60_64:27
3840x2160p25_16:9
3840x2160p25_64:27
3840x2160p50_16:9
3840x2160p50_64:27
3840x2160p24_16:9
3840x2160p24_64:27
The Electro-Optical Transfer Function standard of the current movie.
unknown
sdr
hdr
smtpest2084
The color space standard of the current movie.
default
rgb
bt601
bt709
bt2020
The color depth standard of the current movie.
24bit
30bit
36bit
The chroma color sampling standard of the current movie.
ycbcr422
ycbcr444
ycbcr420
The actual aspect ratio of the current movie.
1.33
1.66
1.78
1.85
2.35
The top trim value, relative to the current Screen Mask Ratio. A percentage between -100% and +100%.
The bottom trim value, relative to the current Screen Mask Ratio. A percentage between -100% and +100%.
Has the same possible values as the Screen Mask Ratio, but represents a more conservative estimate of the image aspect ratio.
The position for the top mask in absolute terms, measured from the top of the screen. A percentage between -100% and +100%.
The position for the bottom mask in absolute terms, measured from the bottom of the screen. A percentage between -100% and +100%.
The Cinemascape frame aspect ratio of the current movie.
0
133
166
178
237
240
The Cinemascape mode of the current movie.
anamorphic
letterbox
native
Additional details about the values provided by the sensors can be found in Kaleidescape’s Control Protocol Reference Manual .
A typical automation might look like the example below, which turns up the lights when the media_location sensor leaves the content state.
- alias : " Kaleidescape theater lights up" triggers : - trigger : state entity_id : sensor.kaleidescape_theater_media_location from : content actions : - action : scene.turn_on target : entity_id : scene.theater_lights
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Kaleidescape device was introduced in Home Assistant 2022.4, and it's used by
125 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@SteveEasley
Categories
Back to top
