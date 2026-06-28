---
source_url: "https://www.home-assistant.io/integrations/switch.mqtt"
final_url: "https://www.home-assistant.io/integrations/switch.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/switch.mqtt/"
source_handle: "web:www-home-assistant-io:461a628e8023"
source_section: "integrations-switch-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2851405690495317414f9341655b7ff1c8966cda8afc77e8bf89d0a4bcf8ff4a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Switch - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/switch.mqtt
- Final URL: https://www.home-assistant.io/integrations/switch.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/switch.mqtt/
- Fetched at: 2026-06-28T03:19:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT switches into Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Full configuration
Set the state of a device with ESPEasy
The MQTT Switch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your MQTT enabled switches.
In an ideal scenario, the MQTT device will have a state_topic to publish state changes. If these messages are published with a RETAIN flag, the MQTT switch will receive an instant state update after subscription, and will start with the correct state. Otherwise, the initial state of the switch will be unknown . An MQTT device can reset the current state to unknown using a None payload.
When a state_topic is not available, the switch will work in optimistic mode. In this mode, the switch will immediately change state after every command. Otherwise, the switch will wait for state confirmation from the device (message from state_topic ). The initial state is set to False / off in optimistic mode.
Optimistic mode can be forced, even if the state_topic is available. Try to enable it, if experiencing incorrect switch operation.
To use an MQTT switch in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - switch : command_topic : " home/bedroom/switch1/set"
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
Defines a template to generate the payload to send to command_topic . The switch command template accepts the parameters value . The value parameter will contain the configured value for either payload_on or payload_off .
command_topic string Required
The MQTT topic to publish commands to change the switch state.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, switch.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
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
device_class device_class ( Optional )
The type/class of the switch to set the icon in the frontend. The device_class can be null .
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received and published messages. Set to "" to disable decoding of incoming payload.
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
group list ( Optional )
A list of unique IDs of the member switch entities. Set this if the switch entity represents a switch group.
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
name string ( Optional , default: MQTT Switch )
The name to use when displaying this switch. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if switch works in optimistic mode.
Default:
true if no state_topic defined, else false .
payload_off string ( Optional , default: OFF )
The payload that represents off state. If specified, will be used for both comparing to the value in the state_topic (see value_template and state_off for details) and sending as off command to the command_topic .
payload_on string ( Optional , default: ON )
The payload that represents on state. If specified, will be used for both comparing to the value in the state_topic (see value_template and state_on for details) and sending as on command to the command_topic .
platform string Required
Must be switch . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
state_off string ( Optional )
The payload that represents the off state. Used when value that represents off state in the state_topic is different from value that should be sent to the command_topic to turn the device off .
payload_off if defined, else OFF
state_on string ( Optional )
The payload that represents the on state. Used when value that represents on state in the state_topic is different from value that should be sent to the command_topic to turn the device on .
payload_on if defined, else ON
state_topic string ( Optional )
The MQTT topic subscribed to receive state updates. A “None” payload resets to an unknown state. An empty payload is ignored. By default, valid state payloads are OFF and ON . The accepted payloads can be overridden with the payload_off and payload_on config options.
unique_id string ( Optional )
An ID that uniquely identifies this switch device. If two switches have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Defines a template to extract device’s state from the state_topic . To determine the switches’s state result of this template will be compared to state_on and state_off .
Important
Make sure that your topic matches exactly. some-topic/ and some-topic are different topics.
In this section, you will find some real-life examples of how to use this sensor.
The example below shows a full configuration for a switch.
# Example configuration.yaml entry mqtt : - switch : unique_id : bedroom_switch name : " Bedroom Switch" state_topic : " home/bedroom/switch1" command_topic : " home/bedroom/switch1/set" availability : - topic : " home/bedroom/switch1/available" payload_on : " ON" payload_off : " OFF" state_on : " ON" state_off : " OFF" optimistic : false qos : 0 retain : true
For a check, you can use the command line tools mosquitto_pub shipped with mosquitto to send MQTT messages. This allows you to operate your switch manually. First, we can simulate the availability message sent for the switch:
mosquitto_pub -h 127.0.0.1 -t home/bedroom/switch1/available -m "online"
We can simulate the switch being turned on by publishing the ON command message:
mosquitto_pub -h 127.0.0.1 -t home/bedroom/switch1/set -m "ON"
Finally, we can simulate the switch reporting back the changed state to Home Assistant:
mosquitto_pub -h 127.0.0.1 -t home/bedroom/switch1 -m "ON"
Assuming that you have flashed your ESP8266 unit with ESPEasy . Under “Config” is a name (“Unit Name:”) set for your device (here it’s “bathroom”). A configuration for a “Controller” for MQTT with the protocol “OpenHAB MQTT” is present and the entries (“Controller Subscribe:” and “Controller Publish:”) are adjusted to match your needs. In this example, the topics are prefixed with “home”. There is no further configuration needed as the GPIOs can be controlled with MQTT directly.
Manually you can set pin 13 to high with mosquitto_pub or another MQTT tool:
mosquitto_pub -h 127.0.0.1 -t home/bathroom/gpio/13 -m "1"
The configuration will look like the example below:
# Example configuration.yaml entry mqtt : - switch : name : bathroom state_topic : " home/bathroom/gpio/13" command_topic : " home/bathroom/gpio/13" payload_on : " 1" payload_off : " 0"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Switch integration was introduced in Home Assistant 0.7, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Switch
Back to top
