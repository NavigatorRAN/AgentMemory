# Kodi - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/kodi
- Final URL: https://www.home-assistant.io/integrations/kodi
- Canonical URL: https://www.home-assistant.io/integrations/kodi/
- Fetched at: 2026-06-28T02:54:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Kodi into Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Automation examples
Turning Kodi on/off (media player action)
Turning Kodi on/off examples
Kodi action samples (media player actions)
Triggering a Kodi video library update (Kodi action)
Notifications
Script example
Keypress events
The Kodi integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Kodi multimedia system from Home Assistant.
The preferred way to set up the Kodi platform is through discovery, which requires an enabled web interface on your Kodi installation.
There is currently support for the following device types within Home Assistant:
Media player
To add the Kodi service to your Home Assistant instance, use this My button:
Kodi can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Kodi .
Follow the instructions on screen to complete the setup.
If you previously had Kodi configured through configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] , it’s advisable to remove it, and configure from the UI.
If you do not remove it, your configuration will be imported with the following limitations:
Your turn on/off actions will not be imported. This functionality is now available through device triggers.
You may have duplicate entities.
Kodi must be on when Home Assistant is loading for the first time for the configuration to be imported.
The Kodi integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add music to the Kodi playlist ( kodi.add_to_playlist )
Adds music to the default Kodi playlist.
Call a Kodi JSON-RPC API method ( kodi.call_method )
Calls a Kodi JSON-RPC API method with optional parameters.
For an overview of every action across all integrations, see the actions reference .
You can customize your turn on and off actions through automations. Simply use the relevant Kodi device triggers and your automation will be called to perform the turn_on or turn_off sequence; see the Kodi turn on/off samples section for scripts that can be used.
These automations can be configured through the UI (see device triggers for automations). If you prefer YAML, you’ll need to get the device ID from the UI automation editor. Automations would be of the form:
automation : - alias : " Kodi: turn on" triggers : - trigger : device device_id : !secret kodi_device_id domain : kodi entity_id : media_player.kodi type : turn_on actions : - action : script.kodi_turn_on - alias : " Kodi: turn off" triggers : - trigger : device device_id : !secret kodi_device_id domain : kodi entity_id : media_player.kodi type : turn_off actions : - action : script.kodi_turn_off
The following scripts can be used in automations for turning on/off your Kodi instance; see Turning on/off . You could also simply use these sequences directly in the automations without creating scripts.
Turning on Kodi with Wake on LAN
With this configuration, when calling media_player/turn_on on the Kodi device, a magic packet will be sent to the specified MAC address. To use this action, first you need to configure the wake_on_lan integration in Home Assistant, which is achieved simply by adding wake_on_lan: to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
script : turn_on_kodi_with_wol : sequence : - action : wake_on_lan.send_magic_packet data : mac : aa:bb:cc:dd:ee:ff broadcast_address : 192.168.255.255
Turn off Kodi with API calls
Here are the equivalent ways to configure each of the old options to turn off Kodi ( quit , hibernate , suspend , reboot , or shutdown ):
Quit method
script : kodi_quit : sequence : - action : kodi.call_method target : entity_id : media_player.kodi data : method : Application.Quit
Hibernate method
script : kodi_hibernate : sequence : - action : kodi.call_method target : entity_id : media_player.kodi data : method : System.Hibernate
Suspend method
script : kodi_suspend : sequence : - action : kodi.call_method target : entity_id : media_player.kodi data : method : System.Suspend
Reboot method
script : kodi_reboot : sequence : - action : kodi.call_method target : entity_id : media_player.kodi data : method : System.Reboot
Shutdown method
script : kodi_shutdown : sequence : - action : kodi.call_method target : entity_id : media_player.kodi data : method : System.Shutdown
Turn on and off the TV with the Kodi JSON-CEC app
For Kodi devices running 24/7 attached to a CEC capable TV (OSMC / OpenElec and systems alike running in Rasperry Pi’s, for example), this configuration enables the optimal way to turn on/off the attached TV from Home Assistant while Kodi is always active and ready:
script : turn_on_kodi_with_cec : sequence : - action : kodi.call_method target : entity_id : media_player.kodi data : method : Addons.ExecuteAddon addonid : script.json-cec params : command : activate turn_off_kodi_with_cec : sequence : - action : media_player.media_stop target : entity_id : media_player.kodi - action : kodi.call_method target : entity_id : media_player.kodi data : method : Addons.ExecuteAddon addonid : script.json-cec params : command : standby
Important
This example and the following requires to have the script.json-cec plugin installed on your Kodi player. It’ll also expose the endpoints standby, toggle and activate without authentication on your Kodi player. Use this with caution.
Simple script to turn on the PVR in some channel as a time function
script : play_kodi_pvr : alias : " Turn on the silly box" sequence : - alias : " TV on" action : media_player.turn_on target : entity_id : media_player.kodi - alias : " Play TV channel" action : media_player.play_media target : entity_id : media_player.kodi data : media_content_type : " CHANNEL" media_content_id : > {% if (now().hour < 14) or ((now().hour == 14) and (now().minute < 50)) %} 10 {% elif (now().hour < 16) %} 15 {% elif (now().hour < 20) %} 2 {% elif (now().hour == 20) and (now().minute < 50) %} 10 {% elif (now().hour == 20) or ((now().hour == 21) and (now().minute < 15)) %} 15 {% else %} 10 {% endif %}
Simple script to play a smart playlist
script : play_kodi_smp : alias : " Turn on the silly box with random Firefighter Sam episode" sequence : - alias : " TV on" action : media_player.turn_on target : entity_id : media_player.kodi - action : media_player.play_media target : entity_id : media_player.kodi data : media_content_type : DIRECTORY media_content_id : special://profile/playlists/video/feuerwehrmann_sam.xsp
script : update_library : alias : " Update Kodi Library" sequence : - alias : " Call Kodi update" action : kodi.call_method target : entity_id : media_player.kodi data : method : VideoLibrary.Scan
The kodi notifications platform allows you to send messages to your Kodi multimedia system from Home Assistant.
To add Kodi to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - platform : kodi name : NOTIFIER_NAME host : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
name string ( Optional )
Name displayed in the frontend. The notifier will bind to the notify.NOTIFIER_NAME action.
host string Required
The host name or address of the device that is running Kodi.
port integer ( Optional , default: 8080 )
The HTTP port number.
proxy_ssl boolean ( Optional , default: false )
Connect to Kodi with HTTPS. Useful if Kodi is behind an SSL proxy.
username string ( Optional )
The XBMC/Kodi HTTP username.
password string ( Optional )
The XBMC/Kodi HTTP password.
kodi_notification : sequence : - action : notify.NOTIFIER_NAME data : title : " Home Assistant" message : " Message to KODI from Home Assistant!" data : displaytime : 20000 icon : " warning"
Message variables
title string ( Optional )
Title that is displayed on the message.
message string Required
Message to be displayed.
data map ( Optional )
Configure message properties
icon string ( Optional , default: info )
Kodi comes with 3 default icons: info , warning and error , a URL to an image is also valid.
displaytime integer ( Optional , default: 10000 ms )
Length in milliseconds the message stays on screen.
To use notifications, please see the getting started with automation page .
key presses of keyboards/remotes can be overwritten in Kodi and configured to send an event to Home Assistant, which can then be used in automations to, for instance, turn up/down the volume of a TV/receiver.
A keypress can be overwritten in Kodi by using the Kodi keymap XML or from within the Kodi GUI using the Keymap Editor add-on .
An example of the Kodi keymap configuration using XML, which will overwrite the volume_up/volume_down buttons and instead send an event to Home Assistant:
<keymap> <global> <keyboard> <volume_up> NotifyAll("KodiLivingroom", "OnKeyPress", {"key":"volume_up"}) </volume_up> <volume_down> NotifyAll("KodiLivingroom", "OnKeyPress", {"key":"volume_down"}) </volume_down> </keyboard> </global> </keymap>
The "KodiLivingroom" can be set to any value and will be present in the event data as the "sender"
The "OnKeyPress" is needed to identify the event in Home Assistant, do not change this.
The {"key":"volume_up"} can contain any JSON which will be present in the event data under the "data" key, normally this is used to identify which key was pressed.
For possible keyboard key names, see: https://kodi.wiki/view/List_of_keynames
For other actions, see: https://kodi.wiki/view/Keymap#Keynames
For the example above, when the volume up key is pressed, an event in Home Assistant will be fired that looks like this:
event_type : kodi_keypress data : type : keypress device_id : 72e5g0ay5621f5d719qd8cydj943421a entity_id : media_player.kodi_livingroom sender : KodiLivingroom data : key : volume_up
A example of a automation to turn up/down the volume of a receiver using the event:
alias : Kodi keypress mode : parallel max : 10 triggers : - trigger : event event_type : kodi_keypress event_data : entity_id : media_player.kodi_livingroom actions : - choose : - conditions : - condition : template value_template : " {{trigger.event.data.data.key=='volume_up'}}" sequence : - action : media_player.volume_up target : entity_id : media_player.receiver - conditions : - condition : template value_template : " {{trigger.event.data.data.key=='volume_down'}}" sequence : - action : media_player.volume_down target : entity_id : media_player.receiver
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Kodi service was introduced in Home Assistant pre 0.7, and it's used by
1.3% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@OnFreund
Categories
Media source
Back to top
