# Apple TV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/apple_tv
- Final URL: https://www.home-assistant.io/integrations/apple_tv
- Canonical URL: https://www.home-assistant.io/integrations/apple_tv/
- Fetched at: 2026-06-28T02:28:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Apple TV devices into Home Assistant.

## Extracted Text

On this page
Configuration
Media player
Launching apps
Remote
Action send_command
Examples
Keyboard
Example
List of actions
FAQ
My Apple TV does not turn on/off when I press on/off in the frontend
Is it possible to see if a device is on without interacting with it
When adding a new device, a PIN code is requested, but none is shown on the screen
The buttons (play, pause, etc.) do not work
Setting volume doesn’t work on my Apple TV
I’m trying to play a stream via AirPlay, but it doesn’t work
“No devices found on the network” error during setup even when connecting by IP
Debugging
The Apple TV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control an Apple TV (any generation).
There is currently support for the following entities within the Apple TV device:
Media Player
Keyboard binary_sensor and text input actions
To add the Apple TV device to your Home Assistant instance, use this My button:
Apple TV can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Apple TV .
Follow the instructions on screen to complete the setup.
The Apple TV media player platform will create a Media Player entity for each
Apple TV discovered on your network.
This entity will display the active app and playback controls.
You can launch apps using the media_player.select_source action, or using the
“Apps” folder in the media browser.
Using the media_player.play_media action, you can also use Deep Links to
launch specific content in applications.
Examples of some Deep Links for popular applications:
App URL YouTube youtube://www.youtube.com/watch?v=dQw4w9WgXcQ Netflix https://www.netflix.com/title/80234304 Disney+ https://www.disneyplus.com/series/the-beatles-get-back/7DcWEeWVqrkE Apple TV+ https://tv.apple.com/show/severance/umc.cmc.1srk2goyh2q2zdxcx605w8vtx
The simplest way to find useful Deep Links is to use the “Share” feature in iOS
or macOS versions of the App. Share sheets will often have a “Copy” or
“Copy link” feature. For apps that have a web-accessible version, links copied
from the browser usually work too. Such links may not work if a developer
maintains separate iOS and tvOS apps. More methods of discovering links
supported by apps can be found in the
pyatv documentation .
Examples:
# Open the Netflix app at a specific title action : media_player.play_media data : media_content_type : url media_content_id : https://www.netflix.com/title/80234304 target : entity_id : media_player.living_room_apple_tv
# Open a specific YouTube video: action : media_player.play_media data : media_content_type : url media_content_id : youtube://www.youtube.com/watch?v=dQw4w9WgXcQ target : entity_id : media_player.living_room_apple_tv
The Apple TV remote platform will automatically create a Remote entity for each Apple TV
configured on your Home Assistant instance.
These entities allow you to turn the device on/off and to send control commands.
The following commands are currently available:
wakeup
suspend
home
top_menu
menu
select
play
pause
up
down
left
right
volume_up
volume_down
previous
next
skip_backward
skip_forward
NOTE: Not all commands are supported by all Apple TV versions.
Service data
attribute Optional Description entity_id no entity_id of the Apple TV command no Command, or list of commands to be sent num_repeats yes Number of times to repeat the commands delay_secs yes Interval in seconds between one send and another
This is a float value e.g. 1, 1.2 etc. hold_secs yes Number of seconds to hold the button.
This is a float value but please use 0 for not hold and 1 for holding the button
Create a script to invoke the Netflix application based on the application icon
being in a fixed place on the home screen:
lounge_appletv_netflix : alias : " Select Netflix" sequence : - action : remote.send_command target : entity_id : remote.lounge_appletv data : delay_secs : 1.5 command : - top_menu - home - right - select
Script using the quick action menu to send your Apple TV to sleep and turn off
the Media Player:
apple_tv_sleep : alias : " Make the Apple TV sleep" sequence : - action : remote.send_command target : entity_id : remote.lounge_appletv data : command : - suspend - action : media_player.turn_off target : entity_id : media_player.lounge_appletv
Send 3 left commands with delay between each:
action : remote.send_command target : entity_id : remote.apple_tv data : num_repeats : 3 delay_secs : 2.5 command : - left
The Apple TV remote platform will automatically create a Binary sensor entity
for each Apple TV configured on your Home Assistant instance to determine if the
on-screen keyboard is active.
Create an automation that clears the search text whenever the on-screen keyboard
is activated:
description : " Always start with clear Apple TV search text" mode : single triggers : - trigger : state entity_id : - binary_sensor.my_apple_tv_keyboard_focused from : " off" to : " on" actions : - action : apple_tv.clear_keyboard_text data : config_entry_id : YOUR_CONFIG_ENTRY_ID
Three actions are available for sending text to the focused input field: Set keyboard text , Append keyboard text , and Clear keyboard text . They require that the keyboard is currently focused on the device.
The config_entry_id can be found under Settings > Devices & services > Apple TV > your device. It is the last part of the URL when viewing the device page.
Type a search query when the keyboard appears:
description : " Search for a show on Apple TV" mode : single triggers : - trigger : state entity_id : - binary_sensor.my_apple_tv_keyboard_focused from : " off" to : " on" actions : - action : apple_tv.set_keyboard_text data : config_entry_id : YOUR_CONFIG_ENTRY_ID text : " Severance"
The Apple TV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Append keyboard text ( apple_tv.append_keyboard_text )
Appends text to the currently focused text input field on an Apple TV.
Clear keyboard text ( apple_tv.clear_keyboard_text )
Clears the text in the currently focused text input field on an Apple TV.
Set keyboard text ( apple_tv.set_keyboard_text )
Sets the text in the currently focused text input field on an Apple TV.
For an overview of every action across all integrations, see the actions reference .
That is correct; it only toggles the power state in Home Assistant. See the
example above to use the quick action menu. This can be used on Apple TVs
running tvOS 14.0 or later.
No
This can happen when pairing the AirPlay protocol if the access settings are too restrictive. On your Apple TV, go to Settings > AirPlay and HomeKit and make sure the access setting is set to Everyone on the Same Network , then try again.
If that does not resolve the issue, open the Home app on your iPhone or iPad, go to Home Settings > Speakers & TV , and set the access to Everyone . In some network configurations, the Everyone on the Same Network setting is not sufficient for the Apple TV to display the PIN prompt or for pairing to complete.
The tvOS apps themselves decide what commands they support and when they support
them. Likely, the app you are using does not support the action you are trying
to perform. Before writing an issue about this, verify if the same action is possible with the
Remote app in iOS. If that is the case, please write a bug in
pyatv
and include logs (see Debugging below).
Volume control functionality depends on how the Apple TV is set up.
All volume controls should work if the Apple TV is connected to a
HomePod or HomePod stereo pair. If the Apple TV is connected to
TV speakers and with volume control
over HDMI CEC (Settings -> Remotes and Devices -> Volume Control) only volume
up/down controls will work. If volume control is over IR then volume cannot be
controlled remotely through the Apple TV, but you can integrate your
TV or soundbar directly.
The Apple TV is quite picky when it comes to which formats it plays. The best bet is MP4. If it doesn’t
work, it’s likely because of the media format.
Ensure AirPlay is enabled and configured properly. See this FAQ entry .
If you have any problems and intend to write an issue, make sure you have the
relevant logs included. For this integration, you can enable them like this:
logger : logs : pyatv : debug homeassistant.components.apple_tv : debug
By providing logs directly when creating the issue, you will likely get help
much faster.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Apple TV device was introduced in Home Assistant 0.49, and it's used by
15.8% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@postlund
Categories
Multimedia
Back to top
