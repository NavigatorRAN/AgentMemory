# Elk-M1 Control - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/elkm1
- Final URL: https://www.home-assistant.io/integrations/elkm1
- Canonical URL: https://www.home-assistant.io/integrations/elkm1/
- Fetched at: 2026-06-28T02:39:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions to set up the Elk-M1 controller for home security and automation.

## Extracted Text

On this page
Configuration
Supported functionality
Prerequisites
ElkM1 version
ELK-M1XEP version
ElkM1 configuration and setup
Required global settings
System Trouble Status
Manual configuration
Events
Actions
Alarm actions
Sensor actions
Switch actions
System actions
Debugging
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Elk-M1 Control integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you connect your Elk-M1 Gold and EZ8 alarm panels to Home Assistant. These advanced home security and automation controllers offer robust alarm control panel capabilities, along with a wide range of automation features to help you manage and protect your home.
The Elk-M1 controller is manufactured by Elk Products .
To add the Elk-M1 Control hub to your Home Assistant instance, use this My button:
Elk-M1 Control can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Elk-M1 Control .
Follow the instructions on screen to complete the setup.
There is currently support for the following device types within Home Assistant:
Alarm control panel - Elk-M1 areas (also known as partitions) are represented as alarm_control_panel entities
Binary sensor - Elk-M1 zones with 4 states (non-analog zones) are represented as binary_sensor entities. Normal state is off and any other state is on
Climate - Elk-M1 thermostats are represented as climate entities
Light - Elk-M1 lights (X10, Insteon, UPB) are represented as light entities
Number - Elk-M1 number and duration settings are represented as number entities
Scene - Elk-M1 tasks are represented as scene entities
Sensor - Elk-M1 counters, keypads, panel status, settings, and zones are represented as sensor entities
Switch - Elk-M1 outputs are represented as switch entities
Time - Elk-M1 time settings are represented as time entities
The implementation follows the Elk Products ElkM1 “ASCII Protocol & Interface Specification, Revision 1.84” document. This document can be found on the Internet.
Before setting up the Elk-M1 integration, ensure your system meets these requirements:
ElkM1 should be running:
Version 4.6.8, or
Version 5.2.0 or higher
Force arm away and stay are available in 5.3.0 or higher.
Many features will work with lower versions of the ElkM1. Check the “ElkM1 RS232 Protocol” manual for details.
The ELK-M1XEP is the Ethernet controller board for the ElkM1. If connecting the integration in secure mode, the version of the ELK-M1XEP determines which secure protocol is supported.
ELK-M1XEP versions less than 2.0.46 support TLS 1.0 (use secure in the UI)
ELK-M1XEP version 2.0.46 and above support TLS 1.2 (use TLS 1.2 in the UI)
Note
ELK-M1XEP does not support auto-negotiation of the TLS protocol version. You must specify the correct TLS version when connecting.
For optimal functionality, configure the following global settings on your ElkM1 panel:
Global Setting 35 - Transmit Event Log
The ElkM1 integration tracks the user number and name of the last user to arm or disarm the panel. The changed_by and changed_by_id attributes of the alarm_control_panel entities hold this information.
Important
Global Setting 35, “Transmit Event Log” must be enabled for this feature to work properly.
Without Global Setting 35 enabled, in single area systems, changed_by and changed_by_id are only updated when a user enters a valid code on a physical keypad.
Global Settings 36-40 - Feature-specific settings
Enable these settings based on the features you want to use:
Setting Option Name Description 36 Transmit Zone Changes Enable if using zones. Allows Home Assistant to track zone status changes. 37 Transmit Output Changes Enable if using outputs. Allows Home Assistant to track output status changes. 38 Transmit Automation Task Changes Enable if using ElkM1 tasks. Allows Home Assistant to track task status changes. 39 Transmit Light Changes Enable if using ElkM1 lights. Allows Home Assistant to track light status changes. 40 Transmit Keypad Changes Enable to track keypad changes and alarm status. Required for keypress events and tracking armed/disarmed/alarm states.
The ElkM1 can report general system trouble statuses. This is
reported using the system_trouble_status attribute of the
panel sensor (often named sensor.elkm1 ) in Home Assistant.
The format of the system_trouble_status attribute is a comma separated list
of the active troubles. Only active trouble statuses are in the list.
If the trouble is for a zone then zone <number> is appended to the trouble name.
For example, if zone 42 wireless sensor lost communication with the panel then
system_trouble_status would be “Lost Transmitter zone 42”. If in addition there
was an AC failure then system_trouble_status would be the string
“AC Fail, Lost Transmitter zone 42”.
The complete list of trouble statuses are:
AC Fail
Box Tamper (zone is part of status)
Fail To Communicate
EEProm Memory Error
Low Battery Control
Transmitter Low Battery (zone is part of status)
Over Current
Telephone Fault
Output 2
Missing Keypad
Zone Expander
Output Expander
ELKRP Remote Access
Common Area Not Armed
Flash Memory Error
Security Alert (zone is part of status)
Serial Port Expander
Lost Transmitter (zone is part of status)
GE Smoke CleanMe
Ethernet
Display Message In Keypad Line 1
Display Message In Keypad Line 2
Fire (zone is part of status)
Alternatively, you can configure the integration through the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file for advanced setups.
Both configuration methods support auto configuration , which automatically discovers and adds only elements that have a “Name” configured on your ElkM1 panel. For example, if counter #11 on the panel is configured with the name “Test counter”, it will appear in Home Assistant. Elements without names will not appear unless auto configuration is disabled.
# Example configuration.yaml entry elkm1 : - host : elk://IP_ADDRESS_1 ... - host : elk://IP_ADDRESS_2 prefix : gh # for guest house controller
Configuration Variables
Looking for your configuration file?
host string Required
Connection string to Elk of the form <method>://<address>[:port] . <method> is elk for non-secure connection, elks for secure TLS 1.0 connection, elksv1_2 for secure TLS 1.2 connection, and serial for serial port connection. <address> is IP address or domain or for serial the serial port that the Elk is connected to. Optional <port> is the port to connect to on the Elk, defaulting to 2101 for elk and 2601 for elks and elksv1_2 . For serial method, address is the path to the tty /dev/ttyS1 for example and [:baud] is the baud rate to connect with (Elk systems default to 115200 baud, but this can be changed during Elk system configuration). See ELK-M1XEP section above for information on selecting the appropriate secure version. You may have multiple host sections for connecting multiple controllers.
username string ( Optional )
Username to log in to Elk. Required if using a secure connection method.
password string ( Optional )
Password to log in to Elk. Required if using a secure connection method.
prefix string
The prefix to use, if any, for all the devices created for this controller. At most one host can omit the prefix, all others must have a unique prefix within the Home Assistant instance.
auto_configure boolean ( Optional , default: false )
Auto configure area , counter , keypad , output , setting , task , thermostat , plc , and zone by only adding elements that ElkM1 reports on the initial sync.
area map ( Optional , default: All included. )
Elk areas to include in Home Assistant.
enabled boolean ( Optional , default: true )
Enable this configuration section.
include list ( Optional , default: All included. )
List to include in the form of either <value> or <value>-<value> where <value> is a positive integer or an X10 housecode. See configuration below for examples of ranges.
exclude list ( Optional , default: None excluded. )
List to exclude in the form of either <value> or <value>-<value> where <value> is a number or an X10 housecode. See configuration below for examples of ranges.
counter map ( Optional , default: All included. )
Elk counters to include in Home Assistant.
keypad map ( Optional , default: All included. )
Elk keypads to include in Home Assistant.
output map ( Optional , default: All included. )
Elk outputs to include in Home Assistant.
setting map ( Optional , default: All included. )
Elk settings to include in Home Assistant.
task map ( Optional , default: All included. )
Elk tasks to include in Home Assistant.
thermostat map ( Optional , default: All included. )
Elk thermostats to include in Home Assistant.
plc map ( Optional , default: All included. )
Elk PLC lights to include in Home Assistant.
zone map ( Optional , default: All included. )
Elk zones to include in Home Assistant.
Example configuration of the above:
elkm1 : host : elks://IP_ADDRESS username : USERNAME password : PASSWORD area : exclude : [ 5-8 ] zone : exclude : [ 11-16 , 19-192 , 199-208 ] plc : include : [ a1-d16 , 192 ] exclude : [ b12-d5 ]
Example configuration using auto_configure :
elkm1 : host : elks://IP_ADDRESS username : USERNAME password : PASSWORD auto_configure : true
Example for a serial port instance on /dev/ttyUSB0 at 115200 baud:
elkm1 : - host : serial:///dev/ttyUSB0:115200 # Elk doesn't know which areas/zones/etc are unused, so it can generate # many unwanted Home Assistant Entities. Be liberal in excluding them: area : exclude : [ 2-8 ] zone : exclude : [ 17-192 , 195-208 ] plc : enabled : false task : enabled : false counter : exclude : [ 1-64 ] keypad : exclude : [ 3-16 ] setting : exclude : [ 1-20 ] output : enabled : false thermostat : enabled : false
The ElkM1 integration supports the following event: elkm1.keypad_key_pressed .
The event is generated whenever a key is pressed on an ElkM1 keypad.
The event_data contains the following:
keypad_id : The number of the keypad that reported the keypress.
key_name : The name of the key that was pressed.
key : The number of the key that was pressed.
The ElkM1 integration provides additional actions beyond the standard Home Assistant actions for alarm control panels, climate, lights, scenes, sensors, and switches.
Arm modes
elkm1.alarm_arm_home_instant - Arms the area in “home instant” mode
elkm1.alarm_arm_night_instant - Arms the area in “night instant” mode
elkm1.alarm_arm_vacation - Arms the area in “vacation” mode
Data attribute Optional Description entity_id yes ElkM1 area to arm code no Alarm code to arm the system (4 or 6 digits) Zone management
elkm1.alarm_bypass - Bypasses all zones associated with the specified alarm panel
elkm1.alarm_clear_bypass - Clears bypass for all zones associated with the specified alarm panel
Data attribute Optional Description entity_id yes ElkM1 area to bypass or clear bypass code no Alarm code to bypass the alarm panel (4 or 6 digits) Display message
elkm1.alarm_display_message - Display text on an area’s keypads
Data attribute Optional Description entity_id yes ElkM1 area where to display the message clear yes 0=clear message, 1=clear message with * key, 2=display until timeout; default 2 beep yes 0=no beep, 1=beep; default 0 timeout yes Time to display message, 0=forever, max 65535, default 0 line1 yes Up to 16 characters of text (truncated if too long). Default blank line2 yes Up to 16 characters of text (truncated if too long). Default blank
Counter management
elkm1.sensor_counter_refresh - Refresh the value of a counter
elkm1.sensor_counter_set - Set counter to a specific value
The panel does not automatically send counter value updates under certain conditions. Use the refresh action to retrieve the current counter value.
Data attribute Required Description entity_id No ElkM1 counter to refresh or set value Yes (for sensor_counter_set ) Value to set the counter to (0-65536) Zone management
elkm1.sensor_zone_bypass - Bypass a zone
elkm1.sensor_zone_trigger - Trigger a zone virtually
Data attribute Required Description entity_id No ElkM1 zone to bypass or trigger code Yes (for bypass only) Alarm code (4 or 6 digits)
The only mechanism ElkM1 offers to clear zone bypass is to clear all bypassed zones in a given alarm panel (area).
The sensor_zone_trigger action creates a virtual momentary open condition on the zone as if the EOL hardwired loop had been physically opened.
Elk-M1 Output control
elkm1.switch_output_turn_on_for - Turn on the output for a specified duration
Data attribute Required Description entity_id No Elk-M1 output to turn on duration Yes Duration in integer seconds (1-65535).
Time synchronization
elkm1.set_time - Set the time on the panel to match Home Assistant’s current time
Data attribute Optional Description prefix yes Prefix to identify panel when multiple panels configured Voice announcements
elkm1.speak_phrase - Speak a predefined phrase
elkm1.speak_word - Speak a predefined word
The list of available phrases and words is defined in the ElkM1 ASCII Protocol documentation.
Data attribute Optional Description phrase no* Phrase to speak. *Required for speak_phrase only word no* Word to speak. *Required for speak_word only prefix yes Prefix to identify panel when multiple panels configured
If you encounter issues with the ElkM1 integration, debug logs can help identify the problem. For detailed instructions on enabling debug logging, see Enabling debug logging .
Alternatively, you can manually enable debug logging in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
logger : logs : elkm1_lib : debug homeassistant.components.elkm1 : debug
Restart Home Assistant.
Check the debug logs in the homeassistant.log file in your Home Assistant config directory.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Elk-M1 Control hub was introduced in Home Assistant 0.81, and it's used by
331 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gwww
@bdraco
Categories
Alarm
Binary sensor
Climate
Hub
Light
Number
Scene
Sensor
Switch
Time
Back to top
