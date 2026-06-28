# AlarmDecoder - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/alarmdecoder
- Final URL: https://www.home-assistant.io/integrations/alarmdecoder
- Canonical URL: https://www.home-assistant.io/integrations/alarmdecoder/
- Fetched at: 2026-06-28T02:27:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a DSC/Honeywell alarm panel with Home Assistant using an AlarmDecoder device.

## Extracted Text

On this page
Configuration
Settings
Arming settings
Zones
Alarm control panel
List of actions
Examples
Chime status and control
Arming key sequences
Honeywell
DSC
The AlarmDecoder integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will allow Home Assistant users who own either a DSC or Honeywell alarm panel to leverage their alarm system and its sensors to provide Home Assistant with rich information about their homes. Connectivity between Home Assistant and the alarm panel is accomplished through a device produced by Nu Tech Software Solutions, known as the AlarmDecoder. The AlarmDecoder devices provide a serial, TCP/IP socket or USB interface to the alarm panel, where it emulates an alarm keypad.
Please visit the AlarmDecoder website for further information about the AlarmDecoder devices.
There is currently support for the following device A device is a model representing a physical or logical unit that contains entities. types within Home Assistant:
Alarm control panel : Reports on alarm status, and can be used to arm/disarm the system
Sensor: Emulates a keypad display
Binary sensor: Reports on zone status
This is a fully event-based integration. Any event Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] sent by the AlarmDecoder device will be immediately reflected within Home Assistant.
To add the AlarmDecoder device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AlarmDecoder .
Follow the instructions on screen to complete the setup.
You will be prompted to select a protocol (for example, socket or serial ). Depending on your selection, you will be asked for the following connection information:
socket :
host - The hostname or IP address of AlarDecoder device that is connected to your alarm panel.
port - The port that AlarmDecoder is accessible on (for example, 10000 ).
serial :
path - The path to the AlarmDecoder device (for example, /dev/ttyUSB0 ).
baud rate - The baud rate of the AlarmDecoder device (for example, 115200 ).
Once AlarmDecoder has been set up according to the instructions above, the arming settings and zones can be configured by selecting Options on the AlarmDecoder card on the Settings > Devices & services page.
There are currently 3 arming settings for AlarmDecoder (shown below).
Alternative Night Mode - For Honeywell systems, set to true to enable Night-Stay mode instead of Instant mode for night arming. For DSC systems, set to true to enable No-Entry mode instead of Stay mode for night arming. For both systems, whenever this option is set to true , a code will be required for night arming regardless of the Code Required for Arming setting. See Arming Key Sequences section below for more information.
Auto Bypass on Arm - (Honeywell only) Set to true to automatically bypass all open zones by sending code + 6# before arming. This setting requires a code only if there are faulted zones when arming.
Code Required for Arming - Set to false to enable arming without a code. See Arming Key Sequences section below for more information.
Zones can be added, edited, and removed through the option forms.
Each zone Zones allow you to specify certain regions on a map. They enable zone presence-detection and can be used in automations. For example, to start the vacuum after you left home or start the heating at home when you leave the office. [Learn more] that’s added to AlarmDecoder will have its own binary sensor created.
Adding a new zone
When prompted, enter the number of the zone Zones allow you to specify certain regions on a map. They enable zone presence-detection and can be used in automations. For example, to start the vacuum after you left home or start the heating at home when you leave the office. [Learn more] you’d like to add. Select Submit to move to the next screen, where you’ll be prompted for the zone settings . Select Submit again to save.
Note: The zone number that was entered will appear as an attribute on the binary sensor entity that’s created to easily edit the zone settings at a later time.
Editing an existing zone
When prompted, enter the number of the zone Zones allow you to specify certain regions on a map. They enable zone presence-detection and can be used in automations. For example, to start the vacuum after you left home or start the heating at home when you leave the office. [Learn more] you’d like to edit. Select Submit to move to the next screen, where the existing zone settings will be pre-filled. Edit the zone settings and select Submit to save the changes.
Removing an existing zone
When prompted, enter the number of the zone Zones allow you to specify certain regions on a map. They enable zone presence-detection and can be used in automations. For example, to start the vacuum after you left home or start the heating at home when you leave the office. [Learn more] you’d like to remove. Select Submit to move to the next screen, where the existing zone settings will be pre-filled. Clear the Zone Name field and select Submit .
Zone settings
The settings for zone Zones allow you to specify certain regions on a map. They enable zone presence-detection and can be used in automations. For example, to start the vacuum after you left home or start the heating at home when you leave the office. [Learn more] are described below:
Zone Name - a name for the zone
Zone Type - the type of sensor (see Device Classes )
RF Serial - (optional) The RF serial-number associated with wireless RF zones. Providing this field allows Home Assistant to associate raw sensor data to a given zone, allowing direct monitoring of the state, battery, and supervision status.
RF Loop - (optional) The loop number associated with RF zones (1, 2, 3, or 4). Providing this field allows Home Assistant to read open/closed status from the raw sensor data in addition to from the panel display, meaning it can correctly show a bypassed RF zone as open or closed when the alarm is armed. (This is an alternative to relayaddr/relaychan below for RF zones.)
Relay Address - (optional) Address of the relay or zone expander board to associate with the zone. (ex: 12, 13, 14, or 15). Typically used in cases where a panel will not send bypassed zones such as motion during an armed home state, the Vista 20P is an example of this. AlarmDecoder can emulate a zone expander board and the panel can be programmed to push zone events to this virtual expander. This allows the bypassed zone binary sensors to be utilized. One example is using bypassed motion sensors at night for motion-based automated lights while the system is armed with the motion sensor bypassed.
Relay Channel - (optional) Channel of the relay or zone expander board to associate with the zone. (ex: 1, 2, 3, or 4 for relay expander boards, 1 - 8 for zone expander boards)
There are several attributes available on the alarm panel to give you more information about your alarm.
ac_power : Set to true if your system has AC power supplying it.
alarm_event_occurred : Set to true if your system was recently triggered. When alarm_event_occurred is true , it must be cleared by entering your code + 1 (or calling the alarm_control_panel.alarm_disarm action) before attempting to arm your alarm.
backlight_on : Set to true if your keypad’s backlight is on.
battery_low : Set to true if your system’s back-up battery is low.
check_zone : Set to true if your system detects a problem with a zone.
chime : Set to true if your system’s chime is activated. When activated, your system will beep anytime a door or window is faulted while the alarm is disarmed.
entry_delay_off : Set to true if your system is in “Instant” mode, meaning the alarm will sound on any faults.
programming_mode : Set to true if your system is in programming mode.
ready : Set to true if your system is ready to be armed. Any faults, including motions sensors, will make this value false .
zone_bypassed : Set to true if your system is currently bypassing a zone.
code_arm_required : Set to the value specified in your AlarmDecoder options.
The AlarmDecoder integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Key press ( alarmdecoder.alarm_keypress )
Sends custom key presses to an AlarmDecoder alarm panel.
Toggle chime ( alarmdecoder.alarm_toggle_chime )
Toggles the chime on an AlarmDecoder alarm panel.
For an overview of every action across all integrations, see the actions reference .
Alongside these, the AlarmDecoder integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports the standard alarm control panel actions to control your alarm: arm away, arm home, arm night, and disarm.
Note
alarm_arm_custom_bypass and alarm_trigger , while available in the actions list in Home Assistant, are not currently implemented in the AlarmDecoder platform.
Using a combination of the available actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] and attributes, you can create switch templates.
- platform : template switches : alarm_chime : friendly_name : Chime value_template : " {{ is_state_attr('alarm_control_panel.alarm_panel', 'chime', true) }}" turn_on : - condition : state entity_id : alarm_control_panel.alarm_panel attribute : chime state : false - action : alarmdecoder.alarm_toggle_chime target : entity_id : alarm_control_panel.alarm_panel data : code : !secret alarm_code turn_off : - condition : state entity_id : alarm_control_panel.alarm_panel attribute : chime state : true - action : alarmdecoder.alarm_toggle_chime target : entity_id : alarm_control_panel.alarm_panel data : code : !secret alarm_code icon_template : >- {% if is_state_attr('alarm_control_panel.alarm_panel', 'chime', true) %} mdi:bell-ring {% else %} mdi:bell-off {% endif %}
The tables below show the key press sequences used for arming for the different panel brands and configuration setting combinations. They are taken from the adext PyPI package.
code_arm_required = true (default) Mode Key Sequence alarm_arm_home code + 3 alarm_arm_away code + 2 alarm_arm_night ( alt_night_mode = false , default) code + 7 alarm_arm_night ( alt_night_mode = true ) code + 33 code_arm_required = false Mode Key Sequence alarm_arm_home #3 alarm_arm_away #2 alarm_arm_night ( alt_night_mode = false , default) #7 alarm_arm_night ( alt_night_mode = true ) code + 33
code_arm_required = true (default) Mode Key Sequence alarm_arm_home code alarm_arm_away code alarm_arm_night ( alt_night_mode = false , default) code alarm_arm_night ( alt_night_mode = true ) *9 + code code_arm_required = false
The chr(4) and chr(5) sequences below are equivalent to pressing the Stay and Away keypad keys respectively (as outlined in the AlarmDecoder documentation ).
Mode Key Sequence alarm_arm_home chr(4) + chr(4) + chr(4) alarm_arm_away chr(5) + chr(5) + chr(5) alarm_arm_night ( alt_night_mode = false , default) chr(4) + chr(4) + chr(4) alarm_arm_night ( alt_night_mode = true ) *9 + code
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AlarmDecoder device was introduced in Home Assistant 0.43, and it's used by
113 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Alarm
Binary sensor
Sensor
Back to top
