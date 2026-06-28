---
source_url: "https://www.home-assistant.io/integrations/humidifier.mqtt"
final_url: "https://www.home-assistant.io/integrations/humidifier.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/humidifier.mqtt/"
source_handle: "web:www-home-assistant-io:5b04cb386c9d"
source_section: "integrations-humidifier-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "086dfb77467de335c2deb2880060796a7527bcec5d7006f02c1866e89ab65b78"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Humidifier - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/humidifier.mqtt
- Final URL: https://www.home-assistant.io/integrations/humidifier.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/humidifier.mqtt/
- Fetched at: 2026-06-28T02:50:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT humidifiers into Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Full configuration
The MQTT Humidifier integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your MQTT enabled humidifiers.
In an ideal scenario, the MQTT device will have a state_topic to publish state changes. If these messages are published with a RETAIN flag, the MQTT humidifier will receive an instant state update after subscription and will start with the correct state. Otherwise, the initial state of the humidifier will be unknown . An MQTT device can reset the current state to unknown using a None payload.
When a state_topic is not available, the humidifier will work in optimistic mode. In this mode, the humidifier will immediately change state after every command. Otherwise, the humidifier will wait for state confirmation from the device (message from state_topic ). The initial state is set to False / off in optimistic mode.
Optimistic mode can be forced even if a state_topic is available. Try to enable it if you are experiencing incorrect humidifier operation.
To use an MQTT humidifier in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - humidifier : command_topic : " bedroom_humidifier/on/set" target_humidity_command_topic : " bedroom_humidifier/humidity/set"
Alternatively, you can set it up via MQTT discovery .
Configuration Variables
Looking for your configuration file?
action_template template ( Optional )
A template to render the value received on the action_topic with.
action_topic string ( Optional )
The MQTT topic to subscribe for changes of the current action. Valid values: off , humidifying , drying , idle
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
current_humidity_template template ( Optional )
A template with which the value received on current_humidity_topic will be rendered.
current_humidity_topic string ( Optional )
The MQTT topic on which to listen for the current humidity. A "None" value received will reset the current humidity. Empty values ( ''' ) will be ignored.
command_template template ( Optional )
Defines a template to generate the payload to send to command_topic .
command_topic string Required
The MQTT topic to publish commands to change the humidifier state.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, humidifier.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this humidifier is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
device_class string ( Optional , default: humidifier )
The device class of the MQTT device. Must be either humidifier , dehumidifier or null .
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received and published messages. Set to "" to disable decoding of incoming payload.
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
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
max_humidity float ( Optional , default: 100 )
The minimum target humidity percentage that can be set.
min_humidity float ( Optional , default: 0 )
The maximum target humidity percentage that can be set.
name string ( Optional , default: MQTT humidifier )
The name of the humidifier. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if humidifier works in optimistic mode
Default:
true if no state topic defined, else false .
payload_off string ( Optional , default: OFF )
The payload that represents the stop state.
payload_on string ( Optional , default: ON )
The payload that represents the running state.
payload_reset_humidity string ( Optional , default: “None” )
A special payload that resets the target_humidity state attribute to an unknown state when received at the target_humidity_state_topic . When received at current_humidity_topic it will reset the current humidity state.
payload_reset_mode string ( Optional , default: “None” )
A special payload that resets the mode state attribute to an unknown state when received at the mode_state_topic .
target_humidity_command_template template ( Optional )
Defines a template to generate the payload to send to target_humidity_command_topic .
target_humidity_command_topic string Required
The MQTT topic to publish commands to change the humidifier target humidity state based on a percentage.
target_humidity_state_topic string ( Optional )
The MQTT topic subscribed to receive humidifier target humidity.
target_humidity_state_template template ( Optional )
Defines a template to extract a value for the humidifier target_humidity state.
mode_command_template template ( Optional )
Defines a template to generate the payload to send to mode_command_topic .
mode_command_topic string ( Optional )
The MQTT topic to publish commands to change the mode on the humidifier. This attribute ust be configured together with the modes attribute.
mode_state_topic string ( Optional )
The MQTT topic subscribed to receive the humidifier mode .
mode_state_template template ( Optional )
Defines a template to extract a value for the humidifier mode state.
modes list ( Optional , default: [] )
List of available modes this humidifier is capable of running at. Common examples include normal , eco , away , boost , comfort , home , sleep , auto and baby . These examples offer built-in translations but other custom modes are allowed as well. This attribute ust be configured together with the mode_command_topic attribute.
platform string Required
Must be humidifier . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: true )
If the published message should have the retain flag on or not.
state_topic string ( Optional )
The MQTT topic subscribed to receive state updates. A “None” payload resets to an unknown state. An empty payload is ignored. Valid state payloads are OFF and ON . Custom OFF and ON values can be set with the payload_off and payload_on config options.
state_value_template template ( Optional )
Defines a template to extract a value from the state.
unique_id string ( Optional )
An ID that uniquely identifies this humidifier. If two humidifiers have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Important
Make sure that your topics match exactly. some-topic/ and some-topic are different topics.
In this section you find some real-life examples of how to use this humidifier.
The example below shows a full configuration for an MQTT humidifier including modes.
# Example configuration.yaml mqtt : - humidifier : name : " Bedroom humidifier" device_class : " humidifier" state_topic : " bedroom_humidifier/on/state" action_topic : " bedroom_humidifier/action" command_topic : " bedroom_humidifier/on/set" current_humidity_topic : " bedroom_humidifier/humidity/current" target_humidity_command_topic : " bedroom_humidifier/humidity/set" target_humidity_state_topic : " bedroom_humidifier/humidity/state" mode_state_topic : " bedroom_humidifier/mode/state" mode_command_topic : " bedroom_humidifier/preset/preset_mode" modes : - " normal" - " eco" - " away" - " boost" - " comfort" - " home" - " sleep" - " auto" - " baby" qos : 0 payload_on : " true" payload_off : " false" min_humidity : 30 max_humidity : 80
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Humidifier integration was introduced in Home Assistant 2021.8, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Humidifier
Back to top
