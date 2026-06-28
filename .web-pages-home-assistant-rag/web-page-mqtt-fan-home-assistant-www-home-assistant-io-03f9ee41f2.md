# MQTT Fan - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fan.mqtt
- Final URL: https://www.home-assistant.io/integrations/fan.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/fan.mqtt/
- Fetched at: 2026-06-28T02:42:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT fans into Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Full configuration
Configuration using command templates
The MQTT Fan integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your MQTT enabled fans.
In an ideal scenario, the MQTT device will have a state_topic to publish state changes. If these messages are published with a RETAIN flag, the MQTT fan will receive an instant state update after subscription and will start with the correct state. Otherwise, the initial state of the fan will be unknown . An MQTT device can reset the current state to unknown using a None payload.
When a state_topic is not available, the fan will work in optimistic mode. In this mode, the fan will immediately change state after every command. Otherwise, the fan will wait for state confirmation from the device (message from state_topic ). The initial state is set to False / off in optimistic mode.
Optimistic mode can be forced even if a state_topic is available. Try to enable it if you are experiencing incorrect fan operation.
To use an MQTT fan in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - fan : command_topic : " bedroom_fan/on/set"
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
command_template template ( Optional )
Defines a template to generate the payload to send to command_topic .
command_topic string Required
The MQTT topic to publish commands to change the fan state.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, fan.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this fan is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
group list ( Optional )
A list of unique IDs of the member fan entities. Set this if the fan entity represents a fan group.
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
name string ( Optional , default: MQTT Fan )
The name of the fan. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if fan works in optimistic mode
Default:
true if no state topic defined, else false .
direction_command_template template ( Optional )
Defines a template to generate the payload to send to direction_command_topic .
direction_command_topic string ( Optional )
The MQTT topic to publish commands to change the direction state.
direction_state_topic string ( Optional )
The MQTT topic subscribed to receive direction state updates.
direction_value_template template ( Optional )
Defines a template to extract a value from the direction.
oscillation_command_template template ( Optional )
Defines a template to generate the payload to send to oscillation_command_topic .
oscillation_command_topic string ( Optional )
The MQTT topic to publish commands to change the oscillation state.
oscillation_state_topic string ( Optional )
The MQTT topic subscribed to receive oscillation state updates.
oscillation_value_template template ( Optional )
Defines a template to extract a value from the oscillation.
payload_off string ( Optional , default: OFF )
The payload that represents the stop state.
payload_on string ( Optional , default: ON )
The payload that represents the running state.
payload_oscillation_off string ( Optional , default: oscillate_off )
The payload that represents the oscillation off state.
payload_oscillation_on string ( Optional , default: oscillate_on )
The payload that represents the oscillation on state.
payload_reset_percentage string ( Optional , default: “None” )
A special payload that resets the percentage state attribute to unknown when received at the percentage_state_topic .
payload_reset_preset_mode string ( Optional , default: “None” )
A special payload that resets the preset_mode state attribute to unknown when received at the preset_mode_state_topic .
percentage_command_template template ( Optional )
Defines a template to generate the payload to send to percentage_command_topic .
percentage_command_topic string ( Optional )
The MQTT topic to publish commands to change the fan speed state based on a percentage setting. The value shall be in the range from speed_range_min to speed_range_max .
percentage_state_topic string ( Optional )
The MQTT topic subscribed to receive fan speed state. This is a value in the range from speed_range_min to speed_range_max .
percentage_value_template template ( Optional )
Defines a template to extract the percentage value from the payload received on percentage_state_topic .
platform string Required
Must be fan . Only allowed and required in MQTT auto discovery device messages .
preset_mode_command_template template ( Optional )
Defines a template to generate the payload to send to preset_mode_command_topic .
preset_mode_command_topic string ( Optional )
The MQTT topic to publish commands to change the preset mode.
preset_mode_state_topic string ( Optional )
The MQTT topic subscribed to receive fan speed based on presets.
preset_mode_value_template template ( Optional )
Defines a template to extract the preset_mode value from the payload received on preset_mode_state_topic .
preset_modes list ( Optional , default: [] )
List of preset modes this fan is capable of running at. Common examples include auto , smart , whoosh , eco and breeze .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: true )
If the published message should have the retain flag on or not.
speed_range_max integer ( Optional , default: 100 )
The maximum of numeric output range (representing 100 %). The percentage_step is defined by 100 / the number of speeds within the speed range.
speed_range_min integer ( Optional , default: 1 )
The minimum of numeric output range ( off not included, so speed_range_min - 1 represents 0 %). The percentage_step is defined by 100 / the number of speeds within the speed range.
state_topic string ( Optional )
The MQTT topic subscribed to receive state updates. A “None” payload resets to an unknown state. An empty payload is ignored. By default, valid state payloads are OFF and ON . The accepted payloads can be overridden with the payload_off and payload_on config options.
state_value_template template ( Optional )
Defines a template to extract a value from the state.
unique_id string ( Optional )
An ID that uniquely identifies this fan. If two fans have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Important
Make sure that your topics match exactly. some-topic/ and some-topic are different topics.
In this section you find some real-life examples of how to use this fan.
The example below shows a full configuration for an MQTT fan using percentage and preset modes.
There are 10 speeds within the speed range, so percentage_step = 100 / 10 steps = 10.0 %.
# Example using percentage based speeds with preset modes configuration.yaml mqtt : - fan : name : " Bedroom Fan" state_topic : " bedroom_fan/on/state" command_topic : " bedroom_fan/on/set" direction_state_topic : " bedroom_fan/direction/state" direction_command_topic : " bedroom_fan/direction/set" oscillation_state_topic : " bedroom_fan/oscillation/state" oscillation_command_topic : " bedroom_fan/oscillation/set" percentage_state_topic : " bedroom_fan/speed/percentage_state" percentage_command_topic : " bedroom_fan/speed/percentage" preset_mode_state_topic : " bedroom_fan/preset/preset_mode_state" preset_mode_command_topic : " bedroom_fan/preset/preset_mode" preset_modes : - " auto" - " smart" - " whoosh" - " eco" - " breeze" qos : 0 payload_on : " true" payload_off : " false" payload_oscillation_on : " true" payload_oscillation_off : " false" speed_range_min : 1 speed_range_max : 10
This example demonstrates how to use command templates with JSON output.
# Example configuration.yaml with command templates mqtt : - fan : name : " Bedroom Fan" command_topic : " bedroom_fan/on/set" command_template : " { state: '{{ value }}'}" direction_command_template : " {{ iif(value == 'forward', 'fwd', 'rev') }}" direction_value_template : " {{ iif(value == 'fwd', 'forward', 'reverse') }}" oscillation_command_topic : " bedroom_fan/oscillation/set" oscillation_command_template : " { oscillation: '{{ value }}'}" percentage_command_topic : " bedroom_fan/speed/percentage" percentage_command_template : " { percentage: '{{ value }}'}" preset_mode_command_topic : " bedroom_fan/preset/preset_mode" preset_mode_command_template : " { preset_mode: '{{ value }}'}" preset_modes : - " auto" - " smart" - " whoosh" - " eco" - " breeze"
This example shows how to configure a fan that doesn’t use forward and backward as directions.
# Example configuration.yaml with direction templates mqtt : - fan : name : " Bedroom Fan" direction_command_template : " {{ iif(value == 'forward', 'fwd', 'rev') }}" direction_value_template : " {{ iif(value == 'fwd', 'forward', 'reverse') }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Fan integration was introduced in Home Assistant 0.27, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Fan
Back to top
