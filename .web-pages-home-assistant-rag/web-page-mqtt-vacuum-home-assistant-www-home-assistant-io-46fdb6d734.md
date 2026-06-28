---
source_url: "https://www.home-assistant.io/integrations/vacuum.mqtt"
final_url: "https://www.home-assistant.io/integrations/vacuum.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/vacuum.mqtt/"
source_handle: "web:www-home-assistant-io:46fdb6d73401"
source_section: "integrations-vacuum-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4e0db1b21a952f00545d2f1b877ca68746ab19acdf37c495d3c5468a0cf23e2f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Vacuum - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vacuum.mqtt
- Final URL: https://www.home-assistant.io/integrations/vacuum.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/vacuum.mqtt/
- Fetched at: 2026-06-28T03:25:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your MQTT enabled Vacuum within Home Assistant.

## Extracted Text

On this page
Configuration
Configuration example
MQTT Protocol
Basic Commands
Send custom command
Status/Sensor Updates
Set Fan Speed
Usage examples
Usage with cloudless Xiaomi vacuums
Retrofitting non-wifi vacuums
The MQTT Vacuum integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your MQTT-enabled vacuum.
The initial state of the MQTT vacuum entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] will set to unknown and can be reset by a device by sending a null payload as state.
To use an MQTT vacuum in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - vacuum : state_topic : state-topic command_topic : command-topic
Alternatively, you can set it up via MQTT discovery .
Configuration Variables
Looking for your configuration file?
availability list ( Optional )
A list of MQTT topics subscribed to receive availability (online/offline) updates. Must not be used together with availability_topic .
payload_available string ( Optional , default: online )
The payload that represents the available state.
payload_not_available string ( Optional , default: offline )
The payload that represents the unavailable state.
topic string Required
An MQTT topic subscribed to receive availability (online/offline) updates.
value_template template ( Optional )
Defines a template to extract device’s availability from the topic . To determine the devices’s availability result of this template will be compared to payload_available and payload_not_available .
availability_mode string ( Optional , default: latest )
When availability is configured, this controls the conditions needed to set the entity to available . Valid entries are all , any , and latest . If set to all , payload_available must be received on all configured availability topics before the entity is marked as online. If set to any , payload_available must be received on at least one configured availability topic before the entity is marked as online. If set to latest , the last payload_available or payload_not_available received on any configured availability topic controls the availability.
availability_template template ( Optional )
Defines a template to extract device’s availability from the availability_topic . To determine the devices’s availability result of this template will be compared to payload_available and payload_not_available .
availability_topic string ( Optional )
The MQTT topic subscribed to receive availability (online/offline) updates. Must not be used together with availability .
clean_segments_command_template template ( Optional )
Defines a template to generate the payload to send to clean_segments_command_topic . The value variable contains a list of segment ID strings.
clean_segments_command_topic string ( Optional )
The MQTT topic to publish a JSON list of segment ID strings for the segments that should be cleaned. Use the clean_segments_command_template option if another payload format is needed. The available segments must be provided by the vacuum in the segments attribute of the JSON payload published to state_topic before the MQTT vacuum will support cleaning segments. Using clean_segments_command_topic also requires that the MQTT vacuum has a unique_id configured.
command_topic string ( Optional )
The MQTT topic to publish commands to control the vacuum.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, vacuum.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this switch is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
configuration_url string ( Optional )
A link to the webpage that can manage the configuration of this device. Can be either an http:// , https:// or an internal homeassistant:// URL.
connections list ( Optional )
A list of connections of the device to the outside world as a list of tuples [connection_type, connection_identifier] . For example the MAC address of a network interface: "connections": [["mac", "02:5b:26:a8:dc:12"]] .
hw_version string ( Optional )
The hardware version of the device.
identifiers string | list ( Optional )
A list of IDs that uniquely identify the device. For example a serial number.
manufacturer string ( Optional )
The manufacturer of the device.
model string ( Optional )
The model of the device.
model_id string ( Optional )
The model identifier of the device.
name string ( Optional )
The name of the device.
serial_number string ( Optional )
The serial number of the device.
suggested_area string ( Optional )
Suggest an area if the device isn’t in one yet.
sw_version string ( Optional )
The firmware version of the device.
via_device string ( Optional )
Identifier of a device that routes messages between this device and Home Assistant. Examples of such devices are hubs, or parent devices of a sub-device. This is used to show device topology in Home Assistant.
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received and published messages. Set to "" to disable decoding of incoming payload.
fan_speed_list string | list ( Optional )
List of possible fan speeds for the vacuum.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic . Usage example can be found in MQTT sensor documentation.
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as sensor attributes. Usage example can be found in MQTT sensor documentation.
message_expiry_interval map ( Optional )
Controls how long queued or retained messages sent from Home Assistant persist at the broker for offline subscribers. This option prevents the broker from retaining stale messages. The expected value for this option is a JSON mapping, for example, {"days": 1, "hours": 2, "minutes": 20, "seconds": 30} or {"seconds": 3600} .
days integer ( Optional )
Number of days published messages are queued or retained for offline subscribers.
hours integer ( Optional )
Number of hours published messages are queued or retained for offline subscribers.
minutes integer ( Optional )
Number of minutes published messages are queued or retained for offline subscribers.
seconds integer ( Optional )
Number of seconds published messages are queued or retained for offline subscribers.
name string ( Optional , default: MQTT Vacuum )
The name of the vacuum. Can be set to null if only the device name is relevant.
payload_clean_spot string ( Optional , default: clean_spot )
The payload to send to the command_topic to begin a spot cleaning cycle.
payload_locate string ( Optional , default: locate )
The payload to send to the command_topic to locate the vacuum (typically plays a song).
payload_pause string ( Optional , default: pause )
The payload to send to the command_topic to pause the vacuum.
payload_return_to_base string ( Optional , default: return_to_base )
The payload to send to the command_topic to tell the vacuum to return to base.
payload_start string ( Optional , default: start )
The payload to send to the command_topic to begin the cleaning cycle.
payload_stop string ( Optional , default: stop )
The payload to send to the command_topic to stop cleaning.
platform string Required
Must be vacuum . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
send_command_topic string ( Optional )
The MQTT topic to publish custom commands to the vacuum.
set_fan_speed_topic string ( Optional )
The MQTT topic to publish commands to control the vacuum’s fan speed.
state_topic string ( Optional )
The MQTT topic subscribed to receive state messages from the vacuum. Messages received on the state_topic must be a valid JSON dictionary, with a mandatory state key and optionally fan_speed and segments keys as shown in the example .
supported_features string | list ( Optional )
List of features that the vacuum supports (possible values are start , stop , pause , return_home , status , locate , clean_spot , fan_speed , send_command ).
Default:
start , stop , return_home , status , clean_spot
unique_id string ( Optional )
An ID that uniquely identifies this vacuum. If two vacuums have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
# Example configuration.yaml entry mqtt : - vacuum : name : " MQTT Vacuum" supported_features : - start - pause - stop - return_home - status - locate - clean_spot - fan_speed - send_command command_topic : " vacuum/command" clean_segments_command_topic : " vacuum/clean_segments" set_fan_speed_topic : " vacuum/set_fan_speed" fan_speed_list : - min - medium - high - max send_command_topic : " vacuum/send_command"
The configuration for this integration expects an MQTT protocol like the following.
MQTT topic: vacuum/command
Possible MQTT payloads:
start - Start cleaning
pause - Pause cleaning
return_to_base - Return to base/dock
stop - Stop the vacuum.
clean_spot - Initialize a spot cleaning cycle
locate - Locate the vacuum (typically by playing a song)
Vacuum send_command allows three parameters:
entity_id
command
params - optional
If params are not provided it sends command as payload to MQTT send_command topic.
If params are provided service sends JSON as payload with such structure:
{ 'command': 'command' , 'param 1 -key': 'param 1 -value' }
Action trigger example:
- alias : " Push command based on sensor" triggers : - trigger : state entity_id : sensor.sensor actions : - action : vacuum.send_command target : entity_id : vacuum.vacuum_entity data : command : " custom_command" params : - key : value
MQTT topic: vacuum/send_command
MQTT topic: vacuum/state
MQTT payload:
{ "state" : "docked" , "fan_speed" : "off" , "segments" : { "1" : "Kitchen" , "2" : "Living room" } }
State has to be one of vacuum states supported by Home Assistant:
cleaning,
docked,
paused,
idle,
returning,
error.
The optional segments attribute in the MQTT payload should contain a mapping of the available cleanable segments the MQTT vacuum can clean. When this mapping changes, Home Assistant can guide you through a repair flow will support to update the segment-to-area mapping for the vacuum.
MQTT topic: vacuum/set_fan_speed
min - Minimum fan speed
medium - Medium fan speed
high - High fan speed
max - Max fan speed
This integration is supported by the cloud-free Xiaomi Vacuum Webinterface Valetudo .
Retrofitting your old Roomba with an ESP8266. This repository provides MQTT client firmware.
If you own a non-wifi Neato, you can refer to this repository that uses a Raspberry Pi to retrofit an old Neato.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Vacuum integration was introduced in Home Assistant 0.54, and it's used by
48.5% of the active installations.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Vacuum
Back to top
