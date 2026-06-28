---
source_url: "https://www.home-assistant.io/integrations/water_heater.mqtt"
final_url: "https://www.home-assistant.io/integrations/water_heater.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/water_heater.mqtt/"
source_handle: "web:www-home-assistant-io:5b2a1ce2e892"
source_section: "integrations-water-heater-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "821a2069989d7fac08cf5fce84d6cd3c4fe1c43ba7a83372632e11cbd3adaf54"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT water heater - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/water_heater.mqtt
- Final URL: https://www.home-assistant.io/integrations/water_heater.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/water_heater.mqtt/
- Fetched at: 2026-06-28T03:27:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT water heater into Home Assistant.

## Extracted Text

On this page
Configuration
Optimistic mode
Using templates
Example
The MQTT water heater integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your MQTT enabled water heater devices.
To use an MQTT water heater in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - water_heater : name : Boiler mode_command_topic : " basement/boiler/mode/set"
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
current_temperature_template template ( Optional )
A template with which the value received on current_temperature_topic will be rendered.
current_temperature_topic string ( Optional )
The MQTT topic on which to listen for the current temperature. A "None" value received will reset the current temperature. Empty values ( ''' ) will be ignored.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, water_heater.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this water heater device is a part of to tie it into the device registry . Only works through MQTT discovery and when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received and published messages. Set to "" to disable decoding of incoming payload.
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
group list ( Optional )
A list of unique IDs of the member water heater entities. Set this if the water heater entity represents a water heater group.
initial integer ( Optional )
Set the initial target temperature. The default value depends on the temperature unit, and will be 43.3°C or 110°F.
icon icon ( Optional )
Icon for the entity.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic . Usage example can be found in MQTT sensor documentation.
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as sensor attributes. Usage example can be found in MQTT sensor documentation.
max_temp float ( Optional )
Maximum set point available. The default value depends on the temperature unit, and will be 60°C or 140°F.
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
min_temp float ( Optional )
Minimum set point available. The default value depends on the temperature unit, and will be 43.3°C or 110°F.
mode_command_template template ( Optional )
A template to render the value sent to the mode_command_topic with.
mode_command_topic string ( Optional )
The MQTT topic to publish commands to change the water heater operation mode.
mode_state_template template ( Optional )
A template to render the value received on the mode_state_topic with.
mode_state_topic string ( Optional )
The MQTT topic to subscribe for changes of the water heater operation mode. If this is not set, the operation mode works in optimistic mode (see below). A “None” payload resets to an unknown state. An empty payload is ignored.
modes list ( Optional )
A list of supported modes. Needs to be a subset of the default values.
Default:
[“off”, “eco”, “electric”, “gas”, “heat_pump”, “high_demand”, “performance”]
name string ( Optional , default: MQTT water heater )
The name of the water heater. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if the water heater works in optimistic mode
true if no state topic defined, else false .
payload_off string ( Optional , default: OFF )
The payload that represents disabled state.
payload_on string ( Optional , default: ON )
The payload that represents enabled state.
platform string Required
Must be water_heater . Only allowed and required in MQTT auto discovery device messages .
power_command_template template ( Optional )
A template to render the value sent to the power_command_topic with. The value parameter is the payload set for payload_on or payload_off .
power_command_topic string ( Optional )
The MQTT topic to publish commands to change the water heater power state. Sends the payload configured with payload_on if the water heater is turned on via the water_heater.turn_on , or the payload configured with payload_off if the water heater is turned off via the water_heater.turn_off action. Note that optimistic mode is not supported through water_heater.turn_on and water_heater.turn_off actions. When called, these actions will send a power command to the device but will not optimistically update the state of the water heater. The water heater device should report its state back via mode_state_topic .
precision float ( Optional )
The desired precision for this device. Can be used to match your actual water heater’s precision. Supported values are 0.1 , 0.5 and 1.0 .
0.1 for Celsius and 1.0 for Fahrenheit.
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
Defines if published messages should have the retain flag set.
temperature_command_template template ( Optional )
A template to render the value sent to the temperature_command_topic with.
temperature_command_topic string ( Optional )
The MQTT topic to publish commands to change the target temperature.
temperature_state_template template ( Optional )
A template to render the value received on the temperature_state_topic with.
temperature_state_topic string ( Optional )
The MQTT topic to subscribe for changes in the target temperature. If this is not set, the target temperature works in optimistic mode (see below). A "None" value received will reset the temperature set point. Empty values ( ''' ) will be ignored.
temperature_unit string ( Optional )
Defines the temperature unit of the device, C or F . If this is not set, the temperature unit is set to the system temperature unit.
unique_id string ( Optional )
An ID that uniquely identifies this water heater device. If two water heater devices have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Default template to render the payloads on all *_state_topic s with.
If a property works in optimistic mode (when the corresponding state topic is not set), Home Assistant will assume that any state changes published to the command topics did work and change the internal state of the entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] immediately after publishing to the command topic. If it does not work in optimistic mode, the internal state of the entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is only updated when the requested update is confirmed by the device through the state topic. You can enforce optimistic mode by setting the optimistic option to true . When set, the internal state will always be updated, even when a state topic is defined.
For all *_state_topic s, a template can be specified that will be used to render the incoming payloads on these topics. Also, a default template that applies to all state topics can be specified as value_template . This can be useful if you received payloads are e.g., in JSON format. Since in JSON, a quoted string (e.g., "foo" ) is just a string, this can also be used for unquoting.
Say you receive the operation mode "off" via your mode_state_topic , but the mode is actually called just off , here’s what you could do:
mqtt : - water_heater : name : Boiler modes : - " off" - " eco" - " performance" mode_command_topic : " basement/boiler/mode/set" mode_state_topic : " basement/boiler/mode/state" mode_state_template : " {{ value_json }}"
This will parse the incoming "off" as JSON, resulting in off . Obviously, in this case you could also just set value_template: {% raw %}"{{ value_json }}"{% endraw %} .
Similarly for *_command_topic s, a template can be specified to render the outgoing payloads on these topics.
A full configuration example looks like the one below.
# Full example configuration.yaml entry mqtt : - water_heater : name : Boiler modes : - " off" - " eco" - " performance" mode_state_topic : " basement/boiler/mode" mode_command_topic : " basement/boiler/mode/set" mode_command_template : " {{ value if value=="off" else "on" }}" temperature_state_topic : " basement/boiler/temperature" temperature_command_topic : " basement/boiler/temperature/set" current_temperature_topic : " basement/boiler/current_temperature" precision : 1.0
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT water heater integration was introduced in Home Assistant 2023.7, and it's used by
48.5% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Water heater
Back to top
