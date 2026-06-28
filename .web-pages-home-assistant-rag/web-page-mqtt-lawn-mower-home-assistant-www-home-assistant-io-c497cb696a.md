# MQTT lawn mower - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lawn_mower.mqtt
- Final URL: https://www.home-assistant.io/integrations/lawn_mower.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/lawn_mower.mqtt/
- Fetched at: 2026-06-28T02:55:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT lawn mowers into Home Assistant.

## Extracted Text

On this page
Configuration
Example
The MQTT lawn mower integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows controlling a lawn mower over MQTT.
To use an MQTT lawn mower in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - lawn_mower : command_topic : topic name : " Test Lawn Mower"
Alternatively, you can set it up via MQTT discovery .
Configuration Variables
Looking for your configuration file?
activity_state_topic string ( Optional )
The MQTT topic subscribed to receive an update of the activity. Valid activities are mowing , paused , docked , and error . Use value_template to extract the activity state from a custom payload. When payload none is received, the activity state will be reset to unknown .
activity_value_template template ( Optional )
Defines a template to extract the value.
availability list ( Optional )
A list of MQTT topics subscribed to receive availability (online/offline) updates. Must not be used together with availability_topic .
payload_available string ( Optional , default: online )
The payload that represents the available state.
payload_not_available string ( Optional , default: offline )
The payload that represents the unavailable state.
topic string Required
An MQTT topic subscribed to receive availability (online/offline) updates.
value_template template ( Optional )
Defines a template to extract the device’s availability from the topic . To determine the device’s availability, the result of this template will be compared to payload_available and payload_not_available .
availability_topic string ( Optional )
The MQTT topic subscribed to receive availability (online/offline) updates. Must not be used together with availability .
availability_mode string ( Optional , default: latest )
When availability is configured, this controls the conditions needed to set the entity to available . Valid entries are all , any , and latest . If set to all , payload_available must be received on all configured availability topics before the entity is marked as online. If set to any , payload_available must be received on at least one configured availability topic before the entity is marked as online. If set to latest , the last payload_available or payload_not_available received on any configured availability topic controls the availability.
availability_template template ( Optional )
Defines a template to extract device’s availability from the availability_topic . To determine the devices’s availability, the result of this template will be compared to payload_available and payload_not_available .
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, lawn_mower.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this lawn mower is a part of to tie it into the device registry . Only works when the unique_id is set. At least one of the identifiers or connections must be present to identify the device.
configuration_url string ( Optional )
A link to the webpage that can manage the configuration of this device. Can be either an http:// , https:// , or an internal homeassistant:// URL.
connections list ( Optional )
A list of connections of the device to the outside world as a list of tuples [connection_type, connection_identifier] . For example the MAC address of a network interface: "connections": [["mac", "02:5b:26:a8:dc:12"]] .
hw_version string ( Optional )
The hardware version of the device.
identifiers list | string ( Optional )
A list of IDs that uniquely identify the device. For example, a serial number.
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
Identifier of a device that routes messages between this device and Home Assistant. Examples of such devices are hubs or parent devices of a sub-device. This is used to show the device topology in Home Assistant.
dock_command_template template ( Optional )
Defines a template to generate the payload to send to dock_command_topic . The value parameter in the template will be set to dock .
dock_command_topic string ( Optional )
The MQTT topic that publishes commands when the lawn_mower.dock action is performed. The value dock is published when the action is used. Use a dock_command_template to publish a custom format.
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received and published messages. Set to "" to disable decoding of the incoming payload.
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
icon icon ( Optional )
Icon for the entity.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic .
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as entity attributes. Implies force_update of the current activity state when a message is received on this topic.
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
The name of the lawn mower. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if the lawn mower works in optimistic mode.
Default:
true if no activity_state_topic defined, else false .
pause_command_template template ( Optional )
Defines a template to generate the payload to send to pause_command_topic . The value parameter in the template will be set to pause .
pause_command_topic string ( Optional )
The MQTT topic that publishes commands when the lawn_mower.pause action is performed. The value pause is published when the action is used. Use a pause_command_template to publish a custom format.
platform string Required
Must be lawn_mower . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
start_mowing_template template ( Optional )
Defines a template to generate the payload to send to start_mowing_command_topic . The value parameter in the template will be set to start_mowing .
start_mowing_command_topic string ( Optional )
The MQTT topic that publishes commands when the lawn_mower.start_mowing action is performed. The value start_mowing is published when the action used. Use a start_mowing_command_template to publish a custom format.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
unique_id string ( Optional )
An ID that uniquely identifies this lawn mower. If two lawn mowers have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Important
Make sure that your topic matches exactly. some-topic/ and some-topic are different topics.
The example below shows how to use a single command topic with a command template.
# Example configuration.yaml entry mqtt : - lawn_mower : name : " Lawn Mower Plus" activity_state_topic : " lawn_mower_plus/state" activity_value_template : " {{ value_json.activity }}" pause_command_topic : " lawn_mower_plus/set" pause_command_template : ' {"activity": "{{ value }}"}' dock_command_topic : " lawn_mower_plus/set" dock_command_template : ' {"activity": "{{ value }}"}' start_mowing_command_topic : " lawn_mower_plus/set" start_mowing_command_template : ' {"activity": "{{ value }}"}'
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT lawn mower integration was introduced in Home Assistant 2023.9, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Lawn mower
Back to top
