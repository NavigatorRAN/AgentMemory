---
source_url: "https://www.home-assistant.io/integrations/androidtv"
final_url: "https://www.home-assistant.io/integrations/androidtv"
canonical_url: "https://www.home-assistant.io/integrations/androidtv/"
source_handle: "web:www-home-assistant-io:bcc17e544f3a"
source_section: "integrations-androidtv"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c27a3abf5ca62fea69167ad8981ddcbe8f54ee1be94797725576701468b91ad5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Android Debug Bridge - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/androidtv
- Final URL: https://www.home-assistant.io/integrations/androidtv
- Canonical URL: https://www.home-assistant.io/integrations/androidtv/
- Fetched at: 2026-06-28T02:28:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Android and Fire TV devices into Home Assistant.

## Extracted Text

On this page
Device preparation
Configuration
Options
ADB setup
1. Python ADB Implementation
2. ADB Server
ADB troubleshooting
Device Unavailable
Actions
Action: Select source
androidtv.adb_command
Action: Learn sendevent (for faster ADB commands)
Action: Download and upload
Custom state detection
Remote
The Android Debug Bridge integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control an Android device or Amazon Fire TV device.
Important
When setting up this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , it is recommended that you do NOT use an ADB server and instead use the built-in Python ADB implementation. This simplifies the setup and makes it easier to troubleshoot issues. If there are stability issues with this approach, then you may wish to try using an ADB server. See the ADB Setup section for more information.
To set up your device, you will need to find its IP address and enable ADB debugging. For Android devices, please consult the documentation for your device.
For Fire TV devices, the instructions are as follows:
Turn on ADB Debugging on your Amazon Fire TV:
From the main (Launcher) screen, select Settings.
Select My Fire TV > Developer Options.
Select ADB Debugging.
Find Amazon Fire TV device IP address:
Select My Fire TV > About > Network.
If Developer Options is missing from Settings, then select My Fire TV and press the button seven times on About. Note that on some Fire TV devices, such as the Insignia F30 series, it is not possible to enable Developer Options until you have signed in to an Amazon account on the device.
To add the Android Debug Bridge device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Android Debug Bridge .
Follow the instructions on screen to complete the setup.
To define options for Android Debug Bridge, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Android Debug Bridge are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Configure Applications List
Here you can define applications that are not automatically detected by the backend library, where the keys are app IDs and the values are app names that will be displayed in the UI. If a name is not provided and the option Exclude apps with unknown name is enabled, the app will never be shown in the sources list.
Retrieve the running apps as the list of sources
Whether or not to retrieve the running apps as the list of sources. If this option is checked, the running apps will be retrieved and used as the sources. If not, there will be only one source: the current app.
Exclude apps with unknown name
Exclude app with unknown name from the source list. If this option is checked, then only apps configured in Configured Application List option will be listed among the sources.
Use screen capture for album art
Determines if album art should be pulled from what is shown on screen.
ADB shell turn off command
ADB shell command to override default turn off command. Leave empty to use default.
ADB shell turn on command
ADB shell command to override default turn on command. Leave empty to use default.
Configure State Detection Rules
Here you can configure a list of rules where the rule key is the app IDs and whose values are lists of state detection rules. As example a valid value for a detection rule is ["standby", {"playing":{"media_session_state":4}}, {"paused":{"media_session_state":3, "wake_lock_size":4}}] . Note that rule values must be always inside square bracket ( [...] ). See the section Custom State Detection for more info.
This integration works by sending ADB commands to your Android / Fire TV device. There are two ways to accomplish this.
When connecting to your device for the first time, a dialog will appear on your Android / Fire TV asking you to approve the connection. Check the box that says “always allow connections from this device” and hit OK.
The default approach is to connect to your device using the adb-shell Python package. As of Home Assistant 0.101, if a key is needed for authentication and it is not provided by the ADB Key setup option, then Home Assistant will generate a key for you.
Before Home Assistant 0.101, this approach did not work well for newer devices. Efforts have been made to resolve these issues, but if you experience problems then you should use the ADB server option.
The second option is to use an ADB server to connect to your Android and Fire TV devices.
Using this approach, Home Assistant will send the ADB commands to the server, which will then send them to the Android / Fire TV device and report back to Home Assistant. To use this option, add the adb_server_ip option to your configuration. If you are running the server on the same machine as Home Assistant, you can use 127.0.0.1 for this value.
If the setup for your Android or Fire TV device fails, then there is probably an issue with your ADB connection. Here are some possible causes.
You have the wrong IP address for the device.
ADB is not enabled on your device.
You are already connected to the Android / Fire TV via ADB from another device. Only one device can be connected, so disconnect the other device, restart the Android / Fire TV (for good measure), and then restart Home Assistant.
You need to approve the ADB connection; see the note in the ADB Setup section above.
Some Android devices (for example, Philips TVs running Android TV) only accept the initial ADB connection request over their Wi-Fi interface. If you have the TV wired, you need to connect it to Wi-Fi and try the initial connection again. Once the authentication has been granted via Wi-Fi, you can connect to the TV over the wired interface as well.
If your device drops off WiFi, breaking the ADB connection and causing the entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] to become unavailable in Home Assistant, you could install a wake lock utility (such as Wakelock ) to prevent this from happening. Some users have reported this problem with Xiaomi Mi Box devices.
If you are using the Python ADB implementation approach, as mentioned above, there may be some issues with newer devices. In this case, you should use the ADB server approach instead.
Some devices, such as the Insignia F30 series, disappear from the network when they are turned off. This can be seen as the device becoming unavailable in Home Assistant (logs show TCP timeout errors), disappearing from the network, and not responding to ping. Often, this is for approximately 50 minutes out of each hour when turned off. This can be fixed by opening the Settings app on the device and using “Display & Sounds” -> “Power Controls” -> “Voice Commands When TV Screen is Off”. Change this value to “On” and accept the warning about increased power consumption. This will cause the device to always remain listening on the network so that it can be turned on via Home Assistant. Note that after being unplugged or losing power, the device will need to be manually turned on once before this setting takes effect again.
The media_player.select_source action allows you to launch an app on your device. Simply provide the app ID as the source . You can also stop an app by prefixing the app ID with a ! . For example, you could define scripts to start and stop Netflix as follows:
start_netflix : sequence : - action : media_player.select_source target : entity_id : media_player.fire_tv_living_room data : source : " com.netflix.ninja" stop_netflix : sequence : - action : media_player.select_source target : entity_id : media_player.fire_tv_living_room data : source : " !com.netflix.ninja"
The androidtv.adb_command action allows you to send either keys or ADB shell commands to your Android / Fire TV device. If there is any output, it will be stored in the 'adb_response' attribute, which you can read with the state_attr function (for example, state_attr('media_player.android_tv_living_room', 'adb_response') in a template) and logged at the INFO level.
Data attribute Optional Description entity_id no Name(s) of Android / Fire TV entities. command no Either a key command or an ADB shell command.
In an action of your automation setup it could look like this:
actions : - action : androidtv.adb_command target : entity_id : media_player.androidtv_tv_living_room data : command : " HOME"
Available key commands include:
POWER
SLEEP
HOME
UP
DOWN
LEFT
RIGHT
CENTER
BACK
MENU
The full list of key commands can be found in the backend androidtv package.
You can also use the command GET_PROPERTIES to retrieve the properties used by Home Assistant to update the device’s state. These will be stored in the media player’s 'adb_response' attribute and logged at the INFO level. This information can be used to help improve state detection in the backend androidtv package, and also to define your own custom state detection rules.
A list of various intents can be found here .
When sending commands like UP, DOWN, and HOME via ADB, the device can be slow to respond. The problem isn’t ADB, but rather the Android command input that is used to perform those actions. A faster way to send these commands is using the Android sendevent command. The challenge is that these commands are device-specific. To assist users in learning commands for their device, the Android debug bridge integration provides the androidtv.learn_sendevent action. Its usage is as follows:
Data attribute Optional Description entity_id no Name(s) of Android / Fire TV entities.
Perform the androidtv.learn_sendevent action.
Within 8 seconds, hit a single button on your Android / Fire TV remote.
After 8 seconds, a persistent notification will appear that contains the equivalent command that can be sent via the androidtv.adb_command action. This command can also be found in the adb_response attribute of the media player in Home Assistant, and it will be logged at the INFO level.
As an example, an action in a script could be changed from this:
# Send the "UP" command (slow) - action : androidtv.adb_command target : entity_id : media_player.fire_tv_living_room data : command : UP
to this:
# Send the "UP" command using `sendevent` (faster) - action : androidtv.adb_command target : entity_id : media_player.fire_tv_living_room data : command : " sendevent /dev/input/event4 4 4 786979 && sendevent /dev/input/event4 1 172 1 && sendevent /dev/input/event4 0 0 0 && sendevent /dev/input/event4 4 4 786979 && sendevent /dev/input/event4 1 172 0 && sendevent /dev/input/event4 0 0 0"
The androidtv.download action allows you to download a file from your Android / Fire TV device to your Home Assistant instance.
Data attribute Optional Description entity_id no Name of Android / Fire TV entity. device_path no The filepath on the Android / Fire TV device. local_path no The filepath on your Home Assistant instance.
The androidtv.upload action allows you to upload a file from your Home Assistant instance to Android / Fire TV devices.
Data attribute Optional Description entity_id no Name(s) of Android / Fire TV entities. device_path no The filepath on the Android / Fire TV device. local_path no The filepath on your Home Assistant instance.
The Android Debug Bridge integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] works by polling the Android / Fire TV device at a regular interval and collecting a handful of properties. Unfortunately, there is no standard API for determining the state of the device to which all apps adhere. Instead, the backend androidtv package uses three of the properties that it collects to determine the state: audio_state , media_session_state , and wake_lock_size . The correct logic for determining the state differs depending on the current app, and the backend androidtv package implements app-specific state detection logic for a handful of apps. Of course, it is not feasible to implement custom logic for each and every app in the androidtv package. Moreover, the correct state detection logic may differ across devices and device configurations.
The solution to this problem is the state_detection_rules configuration parameter, which allows you to provide your own rules for state detection. The keys are app IDs, and the values are lists of rules that are evaluated in order. Valid rules are:
'standby' , 'playing' , 'paused' , 'idle' , or 'off'
If this is not a map, then this state will always be reported when this app is the current app
If this is a map, then its entries are conditions that will be checked. If all of the conditions are true, then this state will be reported. Valid conditions pertain to 3 properties (see the example configuration above):
'media_session_state'
'audio_state'
'wake_lock_size'
'media_session_state' = try to use the media_session_state property to determine the state
'audio_state' = try to use the audio_state property to determine the state
To determine what these rules should be, you can use the androidtv.adb_command action with the command GET_PROPERTIES , as described in the androidtv.adb_command section.
The integration supports the remote platform. The remote allows you to send commands to your device with the remote.send_command action. You can send either keys or ADB shell commands to your Android / Fire TV device. The supported keys vary between Android models and version.
Full keycodes list
Power Keys
Key Description “POWER” Power toggle “SLEEP” Sleep mode “RESUME” Resume “SUSPEND” Suspend mode “WAKEUP” Wake up
Input Keys
Key Description “COMPONENT1” Component 1 “COMPONENT2” Component 2 “COMPOSITE1” Composite 1 “COMPOSITE2” Composite 2 “HDMI1” HDMI output port 1 “HDMI2” HDMI output port 2 “HDMI3” HDMI output port 3 “HDMI4” HDMI output port 4 “INPUT” Change input “SAT” Satellite “VGA” VGA
Volume Keys
Key Description “VOLUME_DOWN” Volume down “VOLUME_UP” Volume up “MUTE” Volume mute
Color Keys
Key Description “BLUE” Blue “GREEN” Green “YELLOW” Yellow “RED” Red
Other Keys
Key Description “BACK” Back “CENTER” Center “DOWN” Down “END” End “ENTER” Enter “ESCAPE” Escape “FAST_FORWARD” Fast forward “HOME” Home “LEFT” Left “MENU” Menu “MOVE_HOME” Move home “PAIRING” Pairing “REWIND” Rewind “RIGHT” Right “SEARCH” Search “SETTINGS” Settings “SYSDOWN” Sysdown “SYSLEFT” Sysleft “SYSRIGHT” Sysright “SYSUP” Sysup “TEXT” Text “TOP” Top “UP” Up
You can also send other Android keys using the syntax input keyevent {key} , replacing {key} with the Android numeric key event. Refer to Android TV KeyEvent for details.
Example to send sequence of commands:
action : remote.send_command target : device_id : 12345f9b4c9863e28ddd52c87dcebe05 data : command : - MENU - RIGHT - UP - UP - ENTER
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Android Debug Bridge device was introduced in Home Assistant 0.7.6, and it's used by
2.7% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@JeffLIrion
@ollo69
Categories
Media player
Back to top
