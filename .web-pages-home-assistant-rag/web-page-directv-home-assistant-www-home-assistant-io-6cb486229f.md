# DirecTV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/directv
- Final URL: https://www.home-assistant.io/integrations/directv
- Canonical URL: https://www.home-assistant.io/integrations/directv/
- Fetched at: 2026-06-28T02:37:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate DirecTV receivers into Home Assistant.

## Extracted Text

On this page
Requirements
Configuration
Actions
Media control actions
Remote
The DirecTV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a DirecTV receiver and its client devices.
For proper integration with Home Assistant, your DirecTV device settings should allow “External Access”.
This is done via series of settings found via Menu > Settings & Help > Settings > Whole Home > External Device :
External Access: Allow
Current Program: Allow
Recordings: Allow
To add the DirecTV hub to your Home Assistant instance, use this My button:
DirecTV can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select DirecTV .
Follow the instructions on screen to complete the setup.
Available actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] : turn_on, turn_off, media_play, media_pause, media_stop, media_next_track, media_previous_track, play_media
Action media_player.play_media Data attribute Optional Description entity_id yes Target a specific media player. Defaults to all. media_content_id no The channel number to change to. media_content_type no A media type. Has to be channel .
The DirecTV remote platform allows you to send remote control buttons to a DirecTV receiver. It is automatically set up when a DirecTV receiver is configured.
At the moment, the following buttons are supported:
power
poweron
poweroff
format
pause
rew
replay
stop
advance
ffwd
record
play
guide
active
list
exit
back
menu
info
up
down
left
right
select
red
green
yellow
blue
chanup
chandown
prev
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
dash
enter
A typical action for pressing several buttons looks like this.
action : remote.send_command target : entity_id : remote.directv_entity data : command : - left - left - menu - select
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DirecTV hub was introduced in Home Assistant 0.25, and it's used by
389 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Media player
Back to top
