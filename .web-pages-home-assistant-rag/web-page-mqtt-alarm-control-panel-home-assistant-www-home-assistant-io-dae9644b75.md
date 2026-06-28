---
source_url: "https://www.home-assistant.io/integrations/alarm_control_panel.mqtt"
final_url: "https://www.home-assistant.io/integrations/alarm_control_panel.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/alarm_control_panel.mqtt/"
source_handle: "web:www-home-assistant-io:dae9644b75f3"
source_section: "integrations-alarm-control-panel-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "03aa102a2b65437f0903b9a7c0536d1aaee7da1837e7cb5fd14e18f84fe65140"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Alarm control panel - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/alarm_control_panel.mqtt
- Final URL: https://www.home-assistant.io/integrations/alarm_control_panel.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/alarm_control_panel.mqtt/
- Fetched at: 2026-06-28T02:27:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT capable alarm panels into Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Configuration with partial feature support
Configuration with local code validation
Configurations with remote code validation
Related topics
The MQTT Alarm control panel integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables the possibility to control MQTT capable alarm panels. The Alarm icon will change state after receiving a new state from state_topic . If these messages are published with RETAIN flag, the MQTT alarm panel will receive an instant state update after subscription and will start with the correct state. Otherwise, the initial state will be unknown .
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will accept the following states from your Alarm Panel (in lower case):
disarmed
armed_home
armed_away
armed_night
armed_vacation
armed_custom_bypass
pending
triggered
arming
disarming
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can control your Alarm Panel by publishing to the command_topic when a user interacts with the Home Assistant frontend.
To use an MQTT alarm control panel in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - alarm_control_panel : state_topic : " home/alarm" command_topic : " home/alarm/set"
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
code string ( Optional )
If defined, specifies a code to enable or disable the alarm in the frontend. Note that the code is validated locally and blocks sending MQTT messages to the remote device. For remote code validation, the code can be configured to either of the special values REMOTE_CODE (numeric code) or REMOTE_CODE_TEXT (text code). In this case, local code validation is bypassed but the frontend will still show a numeric or text code dialog. Use command_template to send the code to the remote device. Example configurations for remote code validation can be found here .
code_arm_required boolean ( Optional , default: true )
If true the code is required to arm the alarm. If false the code is not validated.
code_disarm_required boolean ( Optional , default: true )
If true the code is required to disarm the alarm. If false the code is not validated.
code_trigger_required boolean ( Optional , default: true )
If true the code is required to trigger the alarm. If false the code is not validated.
command_template template ( Optional , default: action )
The template used for the command payload. Available variables: action and code .
command_topic string Required
The MQTT topic to publish commands to change the alarm state.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, alarm_control_panel.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this alarm panel is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
name string ( Optional , default: MQTT Alarm )
The name of the alarm. Can be set to null if only the device name is relevant.
payload_arm_away string ( Optional , default: ARM_AWAY )
The payload to set armed-away mode on your Alarm Panel.
payload_arm_home string ( Optional , default: ARM_HOME )
The payload to set armed-home mode on your Alarm Panel.
payload_arm_night string ( Optional , default: ARM_NIGHT )
The payload to set armed-night mode on your Alarm Panel.
payload_arm_vacation string ( Optional , default: ARM_VACATION )
The payload to set armed-vacation mode on your Alarm Panel.
payload_arm_custom_bypass string ( Optional , default: ARM_CUSTOM_BYPASS )
The payload to set armed-custom-bypass mode on your Alarm Panel.
payload_disarm string ( Optional , default: DISARM )
The payload to disarm your Alarm Panel.
payload_trigger string ( Optional , default: TRIGGER )
The payload to trigger the alarm on your Alarm Panel.
platform string Required
Must be alarm_control_panel . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
state_topic string Required
The MQTT topic subscribed to receive state updates. A “None” payload resets to an unknown state. An empty payload is ignored. Valid state payloads are: armed_away , armed_custom_bypass , armed_home , armed_night , armed_vacation , arming , disarmed , disarming pending and triggered .
supported_features list ( Optional )
A list of features that the alarm control panel supports. The available list options are arm_home , arm_away , arm_night , arm_vacation , arm_custom_bypass , and trigger .
Default:
[“arm_home”, “arm_away”, “arm_night”, “arm_vacation”, “arm_custom_bypass”, “trigger”]
unique_id string ( Optional )
An ID that uniquely identifies this alarm panel. If two alarm panels have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Defines a template to extract the value.
In this section you find some real-life examples of how to use this alarm control panel.
The example below shows a full configuration with an alarm panel that only supports the arm_home and arm_away features.
# Example with partial feature support mqtt : - alarm_control_panel : name : " Alarm Panel" supported_features : - arm_home - arm_away state_topic : " alarmdecoder/panel" command_topic : " alarmdecoder/panel/set"
The example below shows a full configuration with local code validation.
# Example using text based code with local validation configuration.yaml mqtt : - alarm_control_panel : name : " Alarm Panel With Numeric Keypad" state_topic : " alarmdecoder/panel" value_template : " {{value_json.state}}" command_topic : " alarmdecoder/panel/set" code : mys3cretc0de
The example below shows a full configuration with remote code validation and command_template .
# Example using text code with remote validation configuration.yaml mqtt : - alarm_control_panel : name : " Alarm Panel With Text Code Dialog" state_topic : " alarmdecoder/panel" value_template : " {{ value_json.state }}" command_topic : " alarmdecoder/panel/set" code : REMOTE_CODE_TEXT command_template : > { "action": "{{ action }}", "code": "{{ code }}" }
# Example using numeric code with remote validation configuration.yaml mqtt : - alarm_control_panel : name : " Alarm Panel With Numeric Keypad" state_topic : " alarmdecoder/panel" value_template : " {{ value_json.state }}" command_topic : " alarmdecoder/panel/set" code : REMOTE_CODE command_template : > { "action": "{{ action }}", "code": "{{ code }}" }
Caution
When your MQTT connection is not secured, this will send your secret code over the network unprotected!
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Alarm control panel integration was introduced in Home Assistant 0.7.4, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Alarm
Back to top
