---
source_url: "https://www.home-assistant.io/integrations/cover.mqtt"
final_url: "https://www.home-assistant.io/integrations/cover.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/cover.mqtt/"
source_handle: "web:www-home-assistant-io:c9df18ec71dc"
source_section: "integrations-cover-mqtt"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "660d4c2a31c228eba26facdd98d02044cc0c0046a03aad0db4ff14bfac41ec91"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# MQTT Cover - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cover.mqtt
- Final URL: https://www.home-assistant.io/integrations/cover.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/cover.mqtt/
- Fetched at: 2026-06-28T02:35:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT covers into Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Full configuration state topic without tilt
Full configuration position topic without tilt
Full configuration for position, state and tilt
Full configuration using stopped state
Configuration for disabling cover commands
Full configuration using entity_id- variable in the template
Full configuration using advanced templating
Testing your configuration
The MQTT cover integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control an MQTT cover (such as blinds, a roller shutter or a garage door).
A cover entity can be in states ( open , opening , closed or closing ).
If a state_topic is configured, the entity’s state will be updated only after an MQTT message is received on state_topic matching state_open , state_opening , state_closed or state_closing . For covers that only report 3 states ( opening , closing , stopped ), a state_stopped state can be configured to indicate that the device is not moving. When this payload is received on the state_topic , and a position_topic is not configured, the cover will be set to state closed if its state was closing and to state open otherwise. If a position_topic is set, the cover’s position will be used to set the state to either open or closed state.
If the cover reports its position, a position_topic can be configured for receiving the position. If no state_topic is configured, the cover’s state will be set to either open or closed when a position is received.
If the cover reports its tilt position, a tilt_status_topic can be configured for receiving the tilt position.
If position topic and state topic are both defined, the device state ( open , opening , closed or closing ) will be set by the state topic and the cover position will be set by the position topic.
If neither a state topic nor a position topic are defined, the cover will work in optimistic mode. In this mode, the cover will immediately change state ( open or closed ) after every command sent by Home Assistant. If a state topic/position topic is defined, the cover will wait for a message on state_topic or position_topic .
Optimistic mode can be forced, even if a state_topic / position_topic is defined. Try to enable it if you experience incorrect cover operation (Google Assistant gauge may need optimistic mode, as it often sends requests to your Home Assistant immediately after sending set_cover_position , in which case MQTT could be too slow).
The mqtt cover platform optionally supports a list of availability topics to receive online and offline messages (birth and LWT messages) from the MQTT cover device. During normal operation, if the MQTT cover device goes offline (that is, publishes a matching payload_not_available to any availability topic), Home Assistant will display the cover as “unavailable”. If these messages are published with the retain flag set, the cover will receive an instant update after subscription and Home Assistant will display correct availability state of the cover when Home Assistant starts up. If the retain flag is not set, Home Assistant will display the cover as “unavailable” when Home Assistant starts up.
To use an MQTT cover in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - cover : command_topic : " living-room-cover/set"
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
The subscribed-to MQTT topic to receive birth and LWT messages from the MQTT cover device. If an availability topic is not defined, the cover availability state will always be available . If an availability topic is defined, the cover availability state will be unavailable by default. Must not be used together with availability .
command_topic string ( Optional )
The MQTT topic to publish commands to control the cover.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, cover.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this cover is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
configuration_url string ( Optional )
A link to the webpage that can manage the configuration of this device. Can be either an http:// , https:// or an internal homeassistant:// URL.
connections list ( Optional )
A list of connections of the device to the outside world as a list of tuples [connection_type, connection_identifier] . For example the MAC address of a network interface: "connections": [["mac", "02:5b:26:a8:dc:12"]] .
hw_version string ( Optional )
The hardware version of the device.
identifiers list | string ( Optional )
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
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend. The device_class can be null .
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received and published messages. Set to "" to disable decoding of incoming payload.
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
group list ( Optional )
A list of unique IDs of the member cover entities. Set this if the cover entity represents a cover group.
icon icon ( Optional )
Icon for the entity.
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
name string ( Optional , default: MQTT Cover )
The name of the cover. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if switch works in optimistic mode.
Default:
false if state or position topic defined, else true .
The payload that represents the online state.
payload_close string ( Optional , default: CLOSE )
The command payload that closes the cover.
The payload that represents the offline state.
payload_open string ( Optional , default: OPEN )
The command payload that opens the cover.
payload_stop string ( Optional , default: STOP )
The command payload that stops the cover.
payload_stop_tilt string ( Optional , default: stop )
The command payload that stops the tilt.
platform string Required
Must be cover . Only allowed and required in MQTT auto discovery device messages .
position_closed integer ( Optional , default: 0 )
Number which represents closed position.
position_open integer ( Optional , default: 100 )
Number which represents open position.
position_template template ( Optional )
Defines a template that can be used to extract the payload for the position_topic topic. Within the template the following variables are available: entity_id , position_open ; position_closed ; tilt_min ; tilt_max . The entity_id can be used to reference the entity’s attributes with help of the states template function;
position_topic string ( Optional )
The MQTT topic subscribed to receive cover position messages.
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
Defines if published messages should have the retain flag set.
set_position_template template ( Optional )
Defines a template to define the position to be sent to the set_position_topic topic. Incoming position value is available for use in the template {{ position }} . Within the template the following variables are available: entity_id , position , the target position in percent; position_open ; position_closed ; tilt_min ; tilt_max . The entity_id can be used to reference the entity’s attributes with help of the states template function;
set_position_topic string ( Optional )
The MQTT topic to publish position commands to. You need to set position_topic as well if you want to use position topic. Use template if position topic wants different values than within range position_closed - position_open . If template is not defined and position_closed != 100 and position_open != 0 then proper position value is calculated from percentage position.
state_closed string ( Optional , default: closed )
The payload that represents the closed state.
state_closing string ( Optional , default: closing )
The payload that represents the closing state.
state_open string ( Optional , default: open )
The payload that represents the open state.
state_opening string ( Optional , default: opening )
The payload that represents the opening state.
state_stopped string ( Optional , default: stopped )
The payload that represents the stopped state (for covers that do not report open / closed state).
state_topic string ( Optional )
The MQTT topic subscribed to receive cover state messages. State topic can only read a ( open , opening , closed , closing or stopped ) state. A “None” payload resets to an unknown state. An empty payload is ignored.
tilt_closed_value integer ( Optional , default: 0 )
The value that will be sent on a close_cover_tilt command.
tilt_command_template template ( Optional )
Defines a template that can be used to extract the payload for the tilt_command_topic topic. Within the template the following variables are available: entity_id , tilt_position , the target tilt position in percent; position_open ; position_closed ; tilt_min ; tilt_max . The entity_id can be used to reference the entity’s attributes with help of the states template function;
tilt_command_topic string ( Optional )
The MQTT topic to publish commands to control the cover tilt.
tilt_max integer ( Optional , default: 100 )
The maximum tilt value.
tilt_min integer ( Optional , default: 0 )
The minimum tilt value.
tilt_opened_value integer ( Optional , default: 100 )
The value that will be sent on an open_cover_tilt command.
tilt_optimistic boolean ( Optional )
Flag that determines if tilt works in optimistic mode.
true if tilt_status_topic is not defined, else false
tilt_status_template template ( Optional )
Defines a template that can be used to extract the payload for the tilt_status_topic topic. Within the template the following variables are available: entity_id , position_open ; position_closed ; tilt_min ; tilt_max . The entity_id can be used to reference the entity’s attributes with help of the states template function;
tilt_status_topic string ( Optional )
The MQTT topic subscribed to receive tilt status update values.
unique_id string ( Optional )
An ID that uniquely identifies this cover. If two covers have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Defines a template that can be used to extract the payload for the state_topic topic.
Note
MQTT cover expects position and tilt values to be in range of 0 to 100, where 0 indicates closed position and 100 indicates fully open position.
If position min or max are set to a different range, for example, 40 to 140, when sending command to the device the range will be adjusted to the device range (position 0 will send a value of 40 to device) and when position payload is received from the device it will be adjusted back to the 0 to 100 range (device value of 40 will report cover position 0).
If min is set to 100 and max is set to 0 , min and max can also be used to reverse the direction of the device, and device operation will be inverted. For example, when setting position to 40, a value of 60 will be sent to the device.
In this section you will find some real-life examples of how to use this platform.
The example below shows a full configuration for a cover without tilt with state topic only.
# Example configuration.yaml entry mqtt : - cover : name : " MQTT Cover" command_topic : " living-room-cover/set" state_topic : " living-room-cover/state" availability : - topic : " living-room-cover/availability" qos : 0 retain : true payload_open : " OPEN" payload_close : " CLOSE" payload_stop : " STOP" state_open : " open" state_opening : " opening" state_closed : " closed" state_closing : " closing" payload_available : " online" payload_not_available : " offline" optimistic : false value_template : " {{ value.x }}"
The example below shows a full configuration for a cover without tilt with position topic.
# Example configuration.yaml entry mqtt : - cover : name : " MQTT Cover" command_topic : " living-room-cover/set" position_topic : " living-room-cover/position" availability : - topic : " living-room-cover/availability" set_position_topic : " living-room-cover/set_position" qos : 0 retain : true payload_open : " OPEN" payload_close : " CLOSE" payload_stop : " STOP" position_open : 100 position_closed : 0 payload_available : " online" payload_not_available : " offline" optimistic : false value_template : " {{ value.x }}"
The example below shows a full configuration for a cover with position, state & tilt.
# Example configuration.yaml entry mqtt : - cover : name : " MQTT Cover" command_topic : " living-room-cover/set" state_topic : " living-room-cover/state" position_topic : " living-room-cover/position" availability : - topic : " living-room-cover/availability" qos : 0 retain : true payload_open : " OPEN" payload_close : " CLOSE" payload_stop : " STOP" state_open : " open" state_opening : " opening" state_closed : " closed" state_closing : " closing" payload_available : " online" payload_not_available : " offline" optimistic : false value_template : " {{ value.x }}" position_template : " {{ value.y }}" tilt_command_topic : " living-room-cover/tilt" tilt_status_topic : " living-room-cover/tilt-state" tilt_status_template : " {{ value_json["PWM"]["PWM1"] }}" tilt_min : 0 tilt_max : 180 tilt_closed_value : 70 tilt_opened_value : 180
The example below shows a full configuration for a cover using stopped state.
# Example configuration.yaml entry mqtt : - cover : name : " MQTT Cover" command_topic : " living-room-cover/set" state_topic : " living-room-cover/state" position_topic : " living-room-cover/position" availability : - topic : " living-room-cover/availability" qos : 0 retain : true payload_open : " OPEN" payload_close : " CLOSE" payload_stop : " STOP" state_opening : " opening" state_closed : " closed" state_stopped : " stopped" payload_available : " online" payload_not_available : " offline" optimistic : false value_template : " {{ value.x }}" position_template : " {{ value.y }}"
The example below shows a configuration for a cover that does not have a close command.
Setting payload_close empty or to null disables the close command and will not show the close button.
# Example configuration.yaml entry mqtt : - cover : payload_open : " on" payload_close : payload_stop : " on"
The following commands can be disabled: open , close , stop by overriding their payloads: payload_open , payload_close , payload_stop
For auto discovery message the payload needs to be set to null , example for cover without close command:
{ "cover" : [ { "payload_open" : "on" , "payload_close" : null , "payload_stop" : "on" } ] }
Full configuration using entity_id - variable in the template
The example below shows an example of how to correct the state of the blind depending if it moved up, or down.
# Example configuration.yaml entry mqtt : - cover : name : " MQTT Cover" command_topic : " living-room-cover/set" state_topic : " living-room-cover/state" position_topic : " living-room-cover/position" set_position_topic : " living-room-cover/position/set" payload_open : " open" payload_close : " close" payload_stop : " stop" state_opening : " open" state_closing : " close" state_stopped : " stop" optimistic : false position_template : |- {% if not state_attr(entity_id, "current_position") %} {{ value }} {% elif state_attr(entity_id, "current_position") < (value | int) %} {{ (value | int + 1) }} {% elif state_attr(entity_id, "current_position") > (value | int) %} {{ (value | int - 1) }} {% else %} {{ value }} {% endif %}
The position_template can accept JSON, where position and tilt_position is provided at the same time.
The example below shows a full example of how to set up a venetian blind which has a combined position and tilt topic. The blind in the example has moveable slats which tilt with a position change. In the example, it takes the blind 6% of the movement for a full rotation of the slats.
Following variable might be used in position_template , set_position_template , tilt_command_template and tilt_status_template , json_attributes_template (only entity_id ).
entity_id - The ID of the entity itself. It can be used to reference its attributes with the help of the states template function.
position_open
position_closed
tilt_min
tilt_max
# Example configuration.yaml entry mqtt : - cover : name : " MQTT Cover" command_topic : " living-room-cover/set" state_topic : " living-room-cover/state" position_topic : " living-room-cover/position" set_position_topic : " living-room-cover/position/set" tilt_command_topic : " living-room-cover/position/set" # same as `set_position_topic` qos : 1 retain : false payload_open : " open" payload_close : " close" payload_stop : " stop" state_opening : " open" state_closing : " close" state_stopped : " stop" position_open : 100 position_closed : 0 tilt_min : 0 tilt_max : 6 tilt_opened_value : 3 tilt_closed_value : 0 optimistic : false position_template : |- {% if not state_attr(entity_id, "current_position") %} { "position" : {{ value }}, "tilt_position" : 0 } {% else %} {% set old_position = state_attr(entity_id, "current_position") %} {% set old_tilt_percent = (state_attr(entity_id, "current_tilt_position")) %} {% set movement = value | int - old_position %} {% set old_tilt_position = (old_tilt_percent / 100 * (tilt_max - tilt_min)) %} {% set new_tilt_position = min(max((old_tilt_position + movement), tilt_min), tilt_max) %} { "position": {{ value }}, "tilt_position": {{ new_tilt_position }} } {% endif %} tilt_command_template : >- {% set position = state_attr(entity_id, "current_position") %} {% set tilt = state_attr(entity_id, "current_tilt_position") %} {% set movement = (tilt_position - tilt) / 100 * tilt_max %} {{ position + movement }} payload_open : " on" payload_close : payload_stop : " on"
To test, you can use the command line tool mosquitto_pub shipped with mosquitto or the mosquitto-clients package to send MQTT messages. This allows you to operate your cover manually:
mosquitto_pub -h 127.0.0.1 -t living-room-cover/set -m "CLOSE"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Cover integration was introduced in Home Assistant 0.18, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Cover
Back to top
