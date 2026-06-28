---
source_url: "https://www.home-assistant.io/integrations/androidtv_remote"
final_url: "https://www.home-assistant.io/integrations/androidtv_remote"
canonical_url: "https://www.home-assistant.io/integrations/androidtv_remote/"
source_handle: "web:www-home-assistant-io:d1fb8939c15f"
source_section: "integrations-androidtv-remote"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "919079321d5f97e919d0d4fad9c4ce8e022c4d0b024fd05409016e3809bb63ad"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Android TV Remote - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/androidtv_remote
- Final URL: https://www.home-assistant.io/integrations/androidtv_remote
- Canonical URL: https://www.home-assistant.io/integrations/androidtv_remote/
- Fetched at: 2026-06-28T02:28:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Android TV Remote into Home Assistant.

## Extracted Text

On this page
Configuration
Options
Media player
Launching apps
Launching activities
Switch channels
Using with Google Cast
Remote
Dashboard example
Limitations and known issues
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Android TV Remote integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control an Android TV and launching apps. For this to work, the Android TV device needs to have Android TV Remote Service which is pre-installed on most devices (Fire TV devices are a notable exception).
For a quick introduction on how to get started with Android TV Remote, check out this video:
To add the Android TV Remote device to your Home Assistant instance, use this My button:
Android TV Remote can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Android TV Remote .
Follow the instructions on screen to complete the setup.
To define options for Android TV Remote, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Android TV Remote are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Configure Applications List
Here you can define applications where the keys are app IDs and the values are app names and icons that will be displayed in the UI.
Enable IME
Enable this option to be able to get the current app name and send text as keyboard input. Disable it for devices that show ‘Use keyboard on mobile device screen’ instead of the on-screen keyboard.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds a media_player with basic playback and volume controls. The media player provides volume information and display name of current active app on the Android TV. Due to API limitations, the integration will not display the playback status. It is recommended to use this integration together with Google Cast integration . Two media players can be combined into one using the Universal Media Player integration. See Using with Google Cast section for more details.
Using the media_player.play_media action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] , you can launch applications, switch channels, and start activities via Deep Links . Only app , url and channel media types are supported.
If the Android TV device has the Google Play Store, you can directly launch any app by its application ID (package name).
The app doesn’t need to exist in the Google Play Store.
If it exists, you can find the application ID in the URL of the app’s Google Play Store listing.
For example, if the URL of an app page is play.google.com/store/apps/details?id=com.example.app123 , the application ID is com.example.app123 .
The application ID is also displayed in the media player card when you launch the application on the device.
Examples of application IDs for popular applications:
App App ID YouTube com.google.android.youtube.tv Netflix com.netflix.ninja Prime Video com.amazon.amazonvideo.livingroom Disney+ com.disney.disneyplus Plex com.plexapp.android Kodi org.xbmc.kodi Twitch tv.twitch.android.app
Example:
# Launch the YouTube app action : media_player.play_media data : media : media_content_type : app media_content_id : com.google.android.youtube.tv target : entity_id : media_player.living_room_tv
Alternatively, if the device doesn’t have the Google Play Store or if you want to open specific activity in the app, you can pass deep links supported by some applications.
Examples of deep links for popular applications:
App Deep link YouTube https://www.youtube.com or vnd.youtube:// or vnd.youtube.launch:// Netflix https://www.netflix.com/title or netflix:// Prime Video https://app.primevideo.com Disney+ https://www.disneyplus.com Plex plex:// Twitch twitch://home [home, stream, game, video, clip, search, browse, channel, user]
# Open a specific YouTube video: action : media_player.play_media data : media : media_content_type : url media_content_id : https://www.youtube.com/watch?v=dQw4w9WgXcQ target : entity_id : media_player.living_room_tv
You can pass the channel number to switch channels. The channel number must be an integer.
# Change channel to number 15: action : media_player.play_media data : media : media_content_type : channel media_content_id : 15 target : entity_id : media_player.living_room_tv
Android TV Remote integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides information about the power status of the device and gives you the ability to control playback. However, it does not provide information about the currently playing content (media title, duration, play/pause state, etc.). In turn, Google Cast integration does not provide reliable information about the power status of the device (e.g. on Android TV Home Screen) and does not allow you to control playback in Android apps without MediaSession support. However, it can display full information about the content being played in supported apps. For convenience, you can combine two media players into one using Universal Media Player integration. Universal Media Player will automatically select the appropriate active media player entity.
Example YAML configuration
Replace media_player.living_room_tv_remote with your Android TV Remote media player entity ID.
Replace media_player.living_room_tv_cast with your Google Cast media player entity ID.
media_player : - platform : universal name : living_room_tv unique_id : living_room_tv device_class : tv children : - media_player.living_room_tv_remote - media_player.living_room_tv_cast browse_media_entity : media_player.living_room_tv_cast commands : turn_off : action : media_player.turn_off data : entity_id : media_player.living_room_tv_remote turn_on : action : media_player.turn_on data : entity_id : media_player.living_room_tv_remote volume_up : action : media_player.volume_up data : entity_id : media_player.living_room_tv_remote volume_down : action : media_player.volume_down data : entity_id : media_player.living_room_tv_remote
The remote allows you to send key commands and text as input to your Android TV device with the remote.send_command action.
The entity has the current_activity attribute that shows the current foreground app on the Android TV.
You can pass the application ID shown in this current_activity as activity in the remote.turn_on action to launch that app.
List of the most common commands
Navigation:
DPAD_UP
DPAD_DOWN
DPAD_LEFT
DPAD_RIGHT
DPAD_CENTER
BUTTON_A
BUTTON_B
BUTTON_X
BUTTON_Y
BACK
Volume Control:
VOLUME_DOWN
VOLUME_UP
VOLUME_MUTE
MUTE
Media Control:
MEDIA_PLAY_PAUSE
MEDIA_PLAY
MEDIA_PAUSE
MEDIA_NEXT
MEDIA_PREVIOUS
MEDIA_STOP
MEDIA_RECORD
MEDIA_REWIND
MEDIA_FAST_FORWARD
TV Control:
0
1
2
3
4
5
6
7
8
9
DEL
ENTER
CHANNEL_UP
CHANNEL_DOWN
F1
F2
F3
F4
F5
F6
F7
F8
F9
F10
F11
F12
TV
PROG_RED
PROG_GREEN
PROG_YELLOW
PROG_BLUE
Other:
BUTTON_MODE
EXPLORER
MENU
HOME
INFO
GUIDE
TV_TELETEXT
CAPTIONS
DVR
MEDIA_AUDIO_TRACK
SETTINGS
SEARCH
ASSIST
POWER
Whether a command does something depends on your Android TV device, its firmware, and the app in the foreground. Some devices remap or ignore certain keys, so a command like GUIDE or MENU might do nothing or trigger a different action than you expect. The commands are sent to your device as is, so Home Assistant cannot change how your device reacts to them.
To send text as keyboard input use the remote.send_command and prefix the text to send with text: , e.g. command: text:hello world to type “hello world” in the selected input field.
If activity is specified in remote.turn_on it will open the specified URL or the application with the given package name. See Launching apps section .
Example actions:
# Open the currently selected item on the Android TV action : remote.send_command data : command : DPAD_CENTER target : entity_id : remote.living_room_tv
# Long press on the currently selected item on the Android TV action : remote.send_command data : command : DPAD_CENTER hold_secs : 0.5 target : entity_id : remote.living_room_tv
# Send "Never Gonna Give You Up" as keyboard input text to the selected input field action : remote.send_command data : command : text:Never Gonna Give You Up target : entity_id : remote.living_room_tv
# Launch YouTube action : remote.turn_on data : activity : https://www.youtube.com target : entity_id : remote.living_room_tv
# Open a specific YouTube video: action : remote.turn_on data : activity : https://www.youtube.com/watch?v=dQw4w9WgXcQ target : entity_id : remote.living_room_tv
You have to manually create buttons in Lovelace to send commands to the Android TV device or launch apps on it.
Below is an example for you to start with. Many of the buttons support long press.
YAML Lovelace example
Add a Manual card with the following code.
Replace all instances of living_room_tv with your entity ID.
To use the replace all functionality, inside the code editor, press ctrl+F (or command+F on Mac).
type : vertical-stack cards : - type : entities entities : - entity : remote.living_room_tv - square : true columns : 3 type : grid cards : - type : button show_icon : false tap_action : action : none hold_action : action : none - type : button icon : mdi:arrow-up-bold tap_action : action : perform-action perform_action : remote.send_command data : command : DPAD_UP target : entity_id : remote.living_room_tv hold_action : action : none - type : button show_icon : false tap_action : action : none hold_action : action : none - type : button icon : mdi:arrow-left-bold tap_action : action : perform-action perform_action : remote.send_command data : command : DPAD_LEFT target : entity_id : remote.living_room_tv hold_action : action : none - type : button icon : mdi:circle tap_action : action : perform-action perform_action : remote.send_command data : command : DPAD_CENTER target : entity_id : remote.living_room_tv hold_action : action : perform-action perform_action : remote.send_command data : command : DPAD_CENTER hold_secs : 0.5 target : entity_id : remote.living_room_tv - type : button icon : mdi:arrow-right-bold tap_action : action : perform-action perform_action : remote.send_command data : command : DPAD_RIGHT target : entity_id : remote.living_room_tv hold_action : action : none - type : button icon : mdi:arrow-left tap_action : action : perform-action perform_action : remote.send_command data : command : BACK target : entity_id : remote.living_room_tv hold_action : action : perform-action perform_action : remote.send_command data : command : BACK hold_secs : 0.5 target : entity_id : remote.living_room_tv - type : button icon : mdi:arrow-down-bold tap_action : action : perform-action perform_action : remote.send_command data : command : DPAD_DOWN target : entity_id : remote.living_room_tv hold_action : action : none - type : button icon : mdi:home-outline tap_action : action : perform-action perform_action : remote.send_command data : command : HOME target : entity_id : remote.living_room_tv hold_action : action : perform-action perform_action : remote.send_command data : command : HOME hold_secs : 0.5 target : entity_id : remote.living_room_tv - square : false columns : 3 type : grid cards : - type : button icon : mdi:skip-previous tap_action : action : perform-action perform_action : remote.send_command data : command : MEDIA_PREVIOUS target : entity_id : remote.living_room_tv hold_action : action : perform-action perform_action : remote.send_command data : command : MEDIA_REWIND target : entity_id : remote.living_room_tv - type : button icon : mdi:play-pause tap_action : action : perform-action perform_action : remote.send_command data : command : MEDIA_PLAY_PAUSE target : entity_id : remote.living_room_tv hold_action : action : perform-action perform_action : remote.send_command data : command : MEDIA_STOP target : entity_id : remote.living_room_tv - type : button icon : mdi:skip-next tap_action : action : perform-action perform_action : remote.send_command data : command : MEDIA_NEXT target : entity_id : remote.living_room_tv hold_action : action : perform-action perform_action : remote.send_command data : command : MEDIA_FAST_FORWARD target : entity_id : remote.living_room_tv - type : button icon : mdi:volume-off tap_action : action : perform-action perform_action : remote.send_command data : command : MUTE target : entity_id : remote.living_room_tv hold_action : action : none - type : button icon : mdi:volume-medium tap_action : action : perform-action perform_action : remote.send_command data : command : VOLUME_DOWN target : entity_id : remote.living_room_tv hold_action : action : none - type : button icon : mdi:volume-high tap_action : action : perform-action perform_action : remote.send_command data : command : VOLUME_UP target : entity_id : remote.living_room_tv hold_action : action : none - square : false columns : 4 type : grid cards : - type : button icon : mdi:youtube tap_action : action : perform-action perform_action : remote.turn_on data : activity : https://www.youtube.com target : entity_id : remote.living_room_tv hold_action : action : none - type : button icon : mdi:netflix tap_action : action : perform-action perform_action : remote.turn_on data : activity : com.netflix.ninja target : entity_id : remote.living_room_tv hold_action : action : none - type : picture image : >- https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Amazon_Prime_Video_logo.svg/450px-Amazon_Prime_Video_logo.svg.png tap_action : action : perform-action perform_action : remote.turn_on data : activity : com.amazon.amazonvideo.livingroom target : entity_id : remote.living_room_tv hold_action : action : none - type : picture image : >- https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Disney%2B_logo.svg/440px-Disney%2B_logo.svg.png tap_action : action : perform-action perform_action : remote.turn_on data : activity : com.disney.disneyplus target : entity_id : remote.living_room_tv hold_action : action : none - type : entity entity : remote.living_room_tv attribute : current_activity - type : media-control entity : media_player.living_room_tv
The integration doesn’t work with Fire TV devices because they are missing the Android TV Remote Service . Attempts to sideload it haven’t been successful.
If you cannot use the Google TV mobile app or the Google Home mobile app to send commands to the device, you cannot send commands with this integration either.
Commands don’t work on Netflix. They don’t work from the Google TV mobile app or the Google Home mobile app either.
Some devices, like Xiaomi, become unavailable after they are turned off and can’t be turned on with this integration.
Some devices, like TCL, become unavailable after they are turned off, unless you activate the Screenless service . To activate it, go to Settings > System > Power and energy > Screenless service , and activate it.
Some devices experience disconnects every 15 seconds. This is typically resolved by rebooting the Android TV device after the initial setup of the integration.
If you are not able to connect to the Android TV device, or are asked to pair it again and again, try force-stopping the Android TV Remote Service and clearing its storage. On the Android TV device, go to Settings > Apps > Show system apps . Then, select Android TV Remote Service > Storage > Clear storage . You will have to reboot Home Assistant to restart pairing with the Android TV.
Some onscreen keyboards enabled by TV manufacturers do not support concurrent virtual and onscreen keyboard use. This presents whenever a text field is selected, such as “search” where a constant use the keyboard on your mobile device will show, preventing you from opening the onscreen keyboard to type. This can be overcome by either disabling your 3rd party keyboard and using the default Gboard keyboard or by deselecting Enable IME in the Configure page of the integration.
If you can’t turn on your Nvidia Shield device, go to Settings > Remotes & accessories > Simplified wake buttons and disable the following options: SHIELD 2019 Remote: Wake on power and Netflix buttons only and Controllers: Wake on NVIDIA or logo buttons only .
Android TV devices push data directly to Home Assistant, enabling immediate updates for device state changes such as power state, volume, and current active app. But the media player entity has assumed playback state since the Android TV Remote API doesn’t provide playback status.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Android TV Remote device was introduced in Home Assistant 2023.5, and it's used by
20.7% of the active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tronikos
@Drafteed
Categories
Back to top
