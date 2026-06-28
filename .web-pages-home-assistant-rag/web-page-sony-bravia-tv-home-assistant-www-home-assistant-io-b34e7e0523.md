---
source_url: "https://www.home-assistant.io/integrations/braviatv"
final_url: "https://www.home-assistant.io/integrations/braviatv"
canonical_url: "https://www.home-assistant.io/integrations/braviatv/"
source_handle: "web:www-home-assistant-io:b34e7e05231d"
source_section: "integrations-braviatv"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "16ffd2ddd32518edd18da2e7fe1a7525275f40fd67353c334e3dc04bb3968cb1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Sony Bravia TV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/braviatv
- Final URL: https://www.home-assistant.io/integrations/braviatv
- Canonical URL: https://www.home-assistant.io/integrations/braviatv/
- Fetched at: 2026-06-28T02:32:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Sony Bravia TV into Home Assistant.

## Extracted Text

On this page
Configuration
Authentication
Media browser
Using with Google Cast
Play media action
Remote
Buttons
Limitations and known issues
TV does not generate new PIN
Sometimes, the integration displays an error in the logs and does not respond to commands
Integration shows ‘Smart TV’ instead of the name of the running application
Power consumption ~15 W when the TV in standby mode while integration is enabled
For TVs older than 2013
The Sony Bravia TV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Sony Bravia TV .
Almost all Sony Bravia TV 2013 and newer are supported. For older TVs see more generic methods to control your device below .
To add the Sony Bravia TV device to your Home Assistant instance, use this My button:
Sony Bravia TV can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sony Bravia TV .
Follow the instructions on screen to complete the setup.
The Bravia TV integration supports two types of authentication:
PSK (Pre-Shared-Key) is a user-defined secret key used for access control. This authentication method is recommended as more reliable and stable. To set up and enable PSK on your TV, go to: Settings > Network > Home Network Setup > IP Control .
PIN Code authentication is easier and does not require additional settings. See this guide if your TV does not show the PIN code.
For more information, see IP Control Authentication .
Using the media browser, you can view a list of all installed applications and TV channels and launch them. You can access the media browser from the Media section in the Home Assistant side menu or by selecting the Browse media button on the media player card.
The Bravia TV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides information about the power status of the device, current source, and volume. It gives you the ability to control playback, run applications, and send remote control commands. Unfortunately, due to limitations of the Bravia REST API, it does not provide information about the currently playing content in applications (app name, media title, duration, play/pause state, and more). In turn, the Google Cast integration does not provide reliable information about the power status of the device (for example, on Home Screen) and does not allow you to control playback in Android apps without MediaSession support. However, it can display full information about the content being played in supported apps. If your TV runs on Android or Google TV, you can use the Google Cast integration together with the Bravia TV integration. For convenience, you can combine two media players into one using Universal Media Player . Universal Media Player will automatically select the appropriate active media player entity.
Example YAML configuration
Replace media_player.sony_tv_native with your Bravia TV integration media player entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] ID. Replace media_player.sony_tv_cast with your Google Cast integration media player entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] ID.
media_player : - platform : universal name : Sony TV unique_id : sony_tv_combined device_class : tv children : - media_player.sony_tv_native - media_player.sony_tv_cast active_child_template : > {% if state_attr('media_player.sony_tv_native', 'media_content_id') %} media_player.sony_tv_native {% endif %} attributes : source : media_player.sony_tv_native|source source_list : media_player.sony_tv_native|source_list browse_media_entity : media_player.sony_tv_native commands : turn_off : action : media_player.turn_off data : entity_id : media_player.sony_tv_native turn_on : action : media_player.turn_on data : entity_id : media_player.sony_tv_native select_source : action : media_player.select_source data : entity_id : media_player.sony_tv_native source : " {{ source }}" media_play : action : media_player.media_play target : entity_id : media_player.sony_tv_native media_pause : action : media_player.media_pause target : entity_id : media_player.sony_tv_native media_play_pause : action : media_player.media_play_pause target : entity_id : media_player.sony_tv_native media_previous_track : action : media_player.media_previous_track target : entity_id : media_player.sony_tv_native media_next_track : action : media_player.media_next_track target : entity_id : media_player.sony_tv_native
The play_media action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] can be used in an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] or script Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] to switch to a specified application or TV channel. It selects the best matching application or channel according to the media_content_id :
Channel number (for example, ‘1’ or ‘6’)
Exact app or channel name (for example, ‘Google Play’ or ‘CNN’)
Substring in app or channel name (for example, ‘BFM’ in ‘BFM TV’)
URI-string of app or channel (for example, ‘tv:dvbt?trip=9999.441.41104&srvName=BBC HD’)
Example to open YouTube app:
action : media_player.play_media target : entity_id : media_player.bravia_tv data : media_content_id : " YouTube" media_content_type : " app"
Example to switch to channel number 11:
action : media_player.play_media target : entity_id : media_player.bravia_tv data : media_content_id : 11 media_content_type : " channel"
Example to switch to channel including ‘news’ in its name:
action : media_player.play_media target : entity_id : media_player.bravia_tv data : media_content_id : " news" media_content_type : " channel"
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports remote platform Platforms are building blocks provided by some integrations to be used by other integrations. [Learn more] . It allows you to send remote control commands to your TV with the remote.send_command action.
The commands that can be sent to the TV depend on the model of your TV. To display a list of supported commands for your TV, call the action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] remote.send_command with an invalid command, for example, Test . A list of available commands will be displayed in Home Assistant System Logs . The list of commands can also be displayed by downloading the diagnostics The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker. [Learn more] from the device info in the Integration Settings .
Example to send Down key command:
action : remote.send_command target : entity_id : remote.bravia_tv data : command : " Down"
Some commonly used commands
Up
Down
Left
Right
Confirm
Return
Home
Exit
Rewind
Forward
ActionMenu
SyncMenu
Num0
Num1
Num2
Num3
Num4
Num5
Num6
Num7
Num8
Num9
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports button platform Platforms are building blocks provided by some integrations to be used by other integrations. [Learn more] and allows you to reboot the device or terminate all running applications.
If you have previously set up your TV with any Home Assistant instances via PIN code, you must remove Home Assistant from your TV in order for your TV to generate a new PIN. On your TV, go to: Settings > Network > Remote device settings > Deregister remote device . Menu titles may differ slightly between models. If needed, refer to your specific model’s manual for additional guidance.
Unfortunately, the system service application (WebApiCore) on the TV that provides Sony Bravia REST API does not work very well and has many problems. The service may begin to reboot spontaneously or freeze, especially when the TV has not been rebooted for a long time or a heavy application is running. Perhaps sometimes the process is killed by Android TV itself due to lack of memory. When the service is being rebooted (about 30 seconds), the API will be unavailable, and any interaction with the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] may result in an error in the logs.
If you encounter this, you must completely reboot your TV. To do this, hold down the Power button on the remote control and select Restart . In addition, we recommend periodically completely restarting your TV. You can also create an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] that will automatically restart the TV (for example, every night if the TV is turned off).
If this happens very often, you can try to reset WebApiCore service. On your TV, go to: Settings > Apps > See all aps > Find WebApiCore > Press Clear data .
See Using with Google Cast section for more details.
The Bravia TV is local polling integration . Even if the TV is turned off, its status is constantly polled to determine the current state, so the TV’s network interface remains enabled. This is normal behavior. If you are concerned about this, you can disable polling for updates in the integration System options menu, but the TV status will no longer update automatically and you will have to force the entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] update by calling homeassistant.update_entity action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] manually.
This behavior can be caused not only by the integration, but also by some applications installed on the TV.
Users of TVs older than 2013 can control their devices using HDMI-CEC , Broadlink or Kodi integrations.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sony Bravia TV device was introduced in Home Assistant 0.23, and it's used by
3.1% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bieniu
@Drafteed
Categories
Button
Media player
Back to top
