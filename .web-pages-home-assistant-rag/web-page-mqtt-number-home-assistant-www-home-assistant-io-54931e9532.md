# MQTT Number - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/number.mqtt
- Final URL: https://www.home-assistant.io/integrations/number.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/number.mqtt/
- Fetched at: 2026-06-28T03:04:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to interact with a device exposing a Number through MQTT from within Home Assistant.

## Extracted Text

On this page
Configuration
The MQTT Number integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate devices that might expose configuration options through MQTT into Home Assistant as a Number. Every time a message under the topic in the configuration is received, the number entity will be updated in Home Assistant and vice-versa, keeping the device and Home Assistant in-sync.
To use an MQTT number entity in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - number : command_topic : my-device/threshold
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
availability_topic string ( Optional )
The MQTT topic subscribed to receive availability (online/offline) updates. Must not be used together with availability .
availability_mode string ( Optional , default: latest )
When availability is configured, this controls the conditions needed to set the entity to available . Valid entries are all , any , and latest . If set to all , payload_available must be received on all configured availability topics before the entity is marked as online. If set to any , payload_available must be received on at least one configured availability topic before the entity is marked as online. If set to latest , the last payload_available or payload_not_available received on any configured availability topic controls the availability.
command_template template ( Optional )
Defines a template to generate the payload to send to command_topic .
command_topic string Required
The MQTT topic to publish commands to change the number.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, number.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this Number is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
device_class device_class ( Optional )
The type/class of the number. The device_class can be null .
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
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic .
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as number attributes. Implies force_update of the current number state when a message is received on this topic.
min float ( Optional , default: 1 )
Minimum value.
max float ( Optional , default: 100 )
Maximum value.
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
mode string ( Optional , default: “auto” )
Control how the number should be displayed in the UI. Can be set to box or slider to force a display mode.
The name of the Number. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if number works in optimistic mode.
Default:
true if no state_topic defined, else false .
payload_reset string ( Optional , default: “None” )
A special payload that resets the state to unknown when received on the state_topic .
platform string Required
Must be number . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
state_topic string ( Optional )
The MQTT topic subscribed to receive number values. An empty payload is ignored.
step float ( Optional , default: 1 )
Step value. Smallest value 0.001 .
unique_id string ( Optional )
An ID that uniquely identifies this Number. If two Numbers have the same unique ID Home Assistant will raise an exception. Required when used with device-based discovery.
unit_of_measurement string ( Optional )
Defines the unit of measurement of the sensor, if any. The unit_of_measurement can be null .
value_template template ( Optional )
Defines a template to extract the value.
Important
Make sure that your topic matches exactly. some-topic/ and some-topic are different topics.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Number integration was introduced in Home Assistant 2021.2, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Number
Back to top
