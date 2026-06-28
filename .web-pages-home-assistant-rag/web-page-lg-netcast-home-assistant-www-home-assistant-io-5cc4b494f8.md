# LG Netcast - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lg_netcast
- Final URL: https://www.home-assistant.io/integrations/lg_netcast
- Canonical URL: https://www.home-assistant.io/integrations/lg_netcast/
- Fetched at: 2026-06-28T02:56:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a LG TV (Netcast 3.0 & 4.0) within Home Assistant.

## Extracted Text

On this page
Configuration
List of triggers
Change channel through play_media action
Remote
Action: Send command
Examples
The LG Netcast integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a LG Smart TV running NetCast 3.0 (LG Smart TV models released in 2012) and NetCast 4.0 (LG Smart TV models released in 2013).
For the new LG webOS TV’s use the LG webOS TV platform.
To add the LG Netcast device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LG Netcast .
Follow the instructions on screen to complete the setup.
The LG Netcast integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Device is requested to turn on ( lg_netcast.turn_on )
Triggers when something requests an LG Netcast TV to turn on.
For an overview of every trigger across all integrations, see the triggers reference .
The play_media action can be used in a script to switch to the specified TV channel. It selects the major channel number according to the media_content_id parameter:
# Example action entry in script to switch to channel number 15 action : media_player.play_media target : entity_id : media_player.lg_tv data : media_content_id : 15 media_content_type : channel
The LG Netcast remote platform creates a Remote entity for each configured TV. This entity allows you to send remote control commands. To power on the TV, use the Device is requested to turn on trigger.
The remote.send_command action sends one or more remote commands to the TV.
Data attribute : command
Description : Command, or list of commands, to send. See the list below.
Optional : No
Data attribute : num_repeats
Description : Number of times to repeat the command sequence. The default is 1 .
Optional : Yes
Data attribute : delay_secs
Description : Delay in seconds between commands and repeats.
Full key code list
APPS
ASPECT_RATIO
AUDIO_DESCRIPTION
AV_MODE
BACK
BLUE
CHANNEL_DOWN
CHANNEL_UP
DASH
DOWN
ENERGY_SAVING
EPG
EXIT
EXTERNAL_INPUT
FAST_FORWARD
FAVORITE_CHANNEL
GREEN
HOME_MENU
LEFT
LIVE_TV
LR_3D
MARK
MUTE_TOGGLE
NUMBER_0
NUMBER_1
NUMBER_2
NUMBER_3
NUMBER_4
NUMBER_5
NUMBER_6
NUMBER_7
NUMBER_8
NUMBER_9
OK
PAUSE
PIP_CHANNEL_DOWN
PIP_CHANNEL_UP
PIP_SECONDARY_VIDEO
PLAY
POWER
PREVIOUS_CHANNEL
PROGRAM_INFORMATION
PROGRAM_LIST
QUICK_MENU
RECORD
RECORDING_LIST
RED
REPEAT
RESERVATION_PROGRAM_LIST
REWIND
RIGHT
SHOW_SUBTITLE
SIMPLINK
SKIP_BACKWARD
SKIP_FORWARD
STOP
SWITCH_VIDEO
TELE_TEXT
TEXT_OPTION
UP
VIDEO_3D
VOLUME_DOWN
VOLUME_UP
YELLOW
Send a single command:
action : remote.send_command target : entity_id : remote.lg_tv data : command : HOME_MENU
Send repeated commands with a delay:
action : remote.send_command target : entity_id : remote.lg_tv data : command : - VOLUME_UP num_repeats : 5 delay_secs : 0.3
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LG Netcast device was introduced in Home Assistant 0.20, and it's used by
541 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Drafteed
@splinter98
Categories
Media player
Back to top
