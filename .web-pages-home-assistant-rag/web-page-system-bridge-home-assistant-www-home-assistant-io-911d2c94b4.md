---
source_url: "https://www.home-assistant.io/integrations/system_bridge"
final_url: "https://www.home-assistant.io/integrations/system_bridge"
canonical_url: "https://www.home-assistant.io/integrations/system_bridge/"
source_handle: "web:www-home-assistant-io:911d2c94b43c"
source_section: "integrations-system-bridge"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d333bfeab61fe81ce0767bde21d3207cfd9103781f22d5d93dc210aec9ab6030"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# System Bridge - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/system_bridge
- Final URL: https://www.home-assistant.io/integrations/system_bridge
- Canonical URL: https://www.home-assistant.io/integrations/system_bridge/
- Fetched at: 2026-06-28T03:20:25Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate the System Bridge integration into Home Assistant.

## Extracted Text

On this page
Prerequisites
Version
Token
Configuration
Binary sensors
Sensors
Media player
Media source
Update
Notifiers
Notifications
Parameters
List of actions
System Bridge is an application that runs on your local machine to share system information via its API/WebSocket. You can also send commands to the device such as opening a URL or sending keyboard keypresses.
This integration requires System Bridge 4.0.2 and above. Any older version will not work.
You will need your token. For instructions on finding your token, follow the steps in the System Bridge documentation .
To add the System Bridge device to your Home Assistant instance, use this My button:
System Bridge can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select System Bridge .
Follow the instructions on screen to complete the setup.
This integration provides the following binary sensors:
Name Description Battery Is Charging Whether the battery is charging Camera In Use Whether the camera/webcam is in use Pending Reboot Whether a reboot is pending New Version Available Whether a new version is available
This integration provides the following sensors:
Name Description Battery Battery level of the device Boot Time Time the device was turned on CPU Speed The current CPU speed Displays Connected Number of displays connected Display Resolution X Display resolution (across) Display Resolution Y Display resolution (down) Display Refresh Rate Display refresh rate Filesystem(s) Space used for each drive letter / filesystem mount GPU Memory Free GPU memory free in GB GPU Usage % GPU usage percentage Kernel Version information of the Kernel Latest Version System Bridge Latest Version Load System load percentage Power Usage Power usage in watts (if available) Memory Free Memory (RAM) free in GB Memory Used Memory (RAM) used in GB Memory Used % Memory (RAM) % used Operating System Version information of the Operating System Processes Shows count of processes on the system Version System Bridge Version
These sensors are also available, but are not enabled by default:
Name Description CPU Temperature The current temperature of the CPU CPU Voltage The current voltage of the CPU GPU Core Clock Speed GPU core clock speed in MHz GPU Memory Clock Speed GPU memory clock speed in MHz GPU Fan Speed GPU fan speed percentage GPU Memory Used GPU memory used in GB GPU Memory Used % GPU memory used percentage GPU Power Usage GPU power usage GPU Temperature The current temperature of the GPU
The integration also provides a media player. This allows you control the currently playing media on your device.
This is currently only supported devices running System Bridge on Windows.
This integration is available as a media source to use with the media browser integration. You can browse and view media from your system to media players such as your web browser and other supported media players.
The integration provides an update component, which will notify you when a new version of the app is available.
The System Bridge integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds a notify entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] for your configured device. To send a notification, you can use the notify.send_message action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . For more customizable notifications, you can use the notify platform instead. For further instructions on using notifiers in automations, refer to the getting started with automation page .
Action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called *sequence*. [Learn more] action: notify.send_message
target:
entity_id: notify.my_device
data:
title: "Reminder"
message: "Have you considered frogs?"
You can send notifications to the device using the notify.system_bridge_hostname notify entity.
action : notify.system_bridge_hostname data : data : image : " https://brands.home-assistant.io/system_bridge/ [email protected] " timeout : 30 actions : - command : api data : endpoint : open method : POST body : url : " http://homeassistant.local:8123/lovelace/cameras" label : " Open Cameras" audio : source : " https://d3qhmae9zx9eb.cloudfront.net/home/amzn_sfx_doorbell_chime_02.mp3" volume : 80 title : " Test Title" message : " This is a message"
target : The target to send the notification to. This can be ignored.
title : The title of the notification.
message : The message of the notification.
data : The data to send to the device. See below for more information.
Actions ( data parameter)
This is a list of actions that can be sent to the device. These are buttons that show below the title, message, and image.
command : The command to send to the device. For example, api sends a request to the System Bridge API.
label : The label of the button.
data : The data to send to the device. The available parameters for the api command are endpoint , method , body , and params .
Here is an example action that opens a URL in the device’s browser:
- command : api label : " Open Cameras" data : endpoint : open method : POST body : url : " http://homeassistant.local:8123/lovelace/cameras"
Audio ( data parameter)
This is an object containing the source and volume (0-100). The source must be a URL to a playable audio file, such as an MP3.
The System Bridge integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get process by ID ( system_bridge.get_process_by_id )
Gets a running process from a System Bridge server by its process ID.
Get processes by name ( system_bridge.get_processes_by_name )
Gets the running processes from a System Bridge server that match a name.
Open path ( system_bridge.open_path )
Opens a file on a System Bridge server with the default application.
Open URL ( system_bridge.open_url )
Opens a URL on a System Bridge server with the default application.
Power command ( system_bridge.power_command )
Sends a power command to a System Bridge server.
Send keyboard keypress ( system_bridge.send_keypress )
Sends a keyboard keypress to a System Bridge server.
Send keyboard text ( system_bridge.send_text )
Sends text for a System Bridge server to type.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The System Bridge device was introduced in Home Assistant 2021.6, and it's used by
270 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@timmo001
Categories
Sensor
System monitor
Back to top
