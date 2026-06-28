---
source_url: "https://www.home-assistant.io/integrations/siren.mqtt"
final_url: "https://www.home-assistant.io/integrations/siren.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/siren.mqtt/"
source_handle: "web:www-home-assistant-io:898fc72cc787"
source_section: "integrations-siren-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0e314c5bccb5389d910ed48140dedda2605e89cc535ab773b065567eba51c749"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Siren - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/siren.mqtt
- Final URL: https://www.home-assistant.io/integrations/siren.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/siren.mqtt/
- Fetched at: 2026-06-28T03:16:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT sirens into Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Full configuration
On/Off only siren controlling a Tasmota relay
The MQTT Siren integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your MQTT enabled sirens and text based notification devices.
In an ideal scenario, the MQTT device will have a state_topic to publish state changes. If these messages are published with a RETAIN flag, the MQTT siren will receive an instant state update after subscription, and will start with the correct state. Otherwise, the initial state of the siren will be false / off .
When a state_topic is not available, the siren will work in optimistic mode. In this mode, the siren will immediately change state after every command. Otherwise, the siren will wait for state confirmation from the device (message from state_topic ).
Optimistic mode can be forced, even if the state_topic is available. Try to enable it, if experiencing incorrect operation.
To use an MQTT siren in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - siren : command_topic : " home/bedroom/siren/set"
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
available_tones list ( Optional )
A list of available tones the siren supports. When configured, this enables the support for setting a tone and enables the tone state attribute.
command_template template ( Optional )
Defines a template to generate a custom payload to send to command_topic . The variable value will be assigned with the configured payload_on or payload_off setting. The siren turn on action parameters tone , volume_level or duration can be used as variables in the template. When operation in optimistic mode the corresponding state attributes will be set. Turn on parameters will be filtered if a device misses the support.
command_off_template template ( Optional )
Defines a template to generate a custom payload to send to command_topic when the siren turn off action is called. By default command_template will be used as template for action turn off. The variable value will be assigned with the configured payload_off setting.
command_topic string ( Optional )
The MQTT topic to publish commands to change the siren state. Without command templates, a default JSON payload like {"state":"ON", "tone": "bell", "duration": 10, "volume_level": 0.5 } is published. When the siren turn on action is performed, the startup parameters will be added to the JSON payload. The state value of the JSON payload will be set to the payload_on or payload_off configured payload.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, siren.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this siren is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
A list of unique IDs of the member siren entities. Set this if the siren entity represents a siren group.
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
name string ( Optional , default: MQTT Siren )
The name to use when displaying this siren. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if siren works in optimistic mode.
Default:
true if no state_topic defined, else false .
payload_off string ( Optional , default: OFF )
The payload that represents off state. If specified, will be used for both comparing to the value in the state_topic (see value_template and state_off for details) and sending as off command to the command_topic .
payload_on string ( Optional , default: ON )
The payload that represents on state. If specified, will be used for both comparing to the value in the state_topic (see value_template and state_on for details) and sending as on command to the command_topic .
platform string Required
Must be siren . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
state_off string ( Optional )
The payload that represents the off state. Used when value that represents off state in the state_topic is different from value that should be sent to the command_topic to turn the device off .
payload_off if defined, else 'OFF'
state_on string ( Optional )
The payload that represents the on state. Used when value that represents on state in the state_topic is different from value that should be sent to the command_topic to turn the device on .
payload_on if defined, else 'ON'
state_topic string ( Optional )
The MQTT topic subscribed to receive state updates. The state update may be either JSON or a simple string. When a JSON payload is detected, the state value of the JSON payload should supply the payload_on or payload_off defined payload to turn the siren on or off. Additionally, the state attributes duration , tone and volume_level can be updated. Use value_template to transform the received state update to a compliant JSON payload. Attributes will only be set if the function is supported by the device and a valid value is supplied. When a non JSON payload is detected, it should be either of the payload_on or payload_off defined payloads or None to reset the siren’s state to unknown . The initial state will be unknown . The state will be reset to unknown if a None payload or null JSON value is received as a state update.
state_value_template template ( Optional )
Defines a template to extract device’s state from the state_topic . To determine the siren’s state result of this template will be compared to state_on and state_off . Alternatively value_template can be used to render to a valid JSON payload.
support_duration boolean ( Optional , default: true )
Set to true if the MQTT siren supports the duration turn on action parameter and enables the duration state attribute.
support_volume_set boolean ( Optional , default: true )
Set to true if the MQTT siren supports the volume_set turn on action parameter and enables the volume_level state attribute.
unique_id string ( Optional )
An ID that uniquely identifies this siren device. If two sirens have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Important
Make sure that your topic matches exactly. some-topic/ and some-topic are different topics.
In this section, you will find an example of how to use this siren platform.
The example below shows a full configuration for a siren.
# Example configuration.yaml entry mqtt : - siren : unique_id : custom_siren name : " Intrusion siren" state_topic : " home/alarm/siren1" command_topic : " home/alarm/siren1/set" available_tones : - ping - siren availability : - topic : " home/alarm/siren1/available" payload_on : " ON" payload_off : " OFF" state_on : " ON" state_off : " OFF" optimistic : false qos : 0 retain : true
The example below shows a configuration for an On/Off type siren, which does not accept JSON commands.
# Example configuration.yaml entry mqtt : - siren : unique_id : tasmota_siren name : " garage" state_topic : " stat/SIREN/RESULT" command_topic : " cmnd/SIREN/POWER" availability_topic : " tele/SIREN/LWT" command_template : " {{ value }}" state_value_template : " {{ value_json.POWER }}" payload_on : " ON" payload_off : " OFF" payload_available : " Online" payload_not_available : " Offline"
For a check, you can use the command line tools mosquitto_pub shipped with mosquitto to send MQTT messages. This allows you to operate your siren manually:
mosquitto_pub -h 127.0.0.1 -t home/alarm/siren1 -m "ON"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Siren integration was introduced in Home Assistant 2022.3, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Siren
Back to top
