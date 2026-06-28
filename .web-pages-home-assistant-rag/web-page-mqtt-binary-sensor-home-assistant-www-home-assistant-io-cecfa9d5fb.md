---
source_url: "https://www.home-assistant.io/integrations/binary_sensor.mqtt"
final_url: "https://www.home-assistant.io/integrations/binary_sensor.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/binary_sensor.mqtt/"
source_handle: "web:www-home-assistant-io:cecfa9d5fb79"
source_section: "integrations-binary-sensor-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6436540ed0d4d2c547b4f664ec532c5d630a61decf10c218d21b0b334b7cf034"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT binary sensor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/binary_sensor.mqtt
- Final URL: https://www.home-assistant.io/integrations/binary_sensor.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/binary_sensor.mqtt/
- Fetched at: 2026-06-28T02:31:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT binary sensors within Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Full configuration with JSON data
Toggle the binary sensor each time a message is received on state_topic
Get the state of a device with ESPEasy
The MQTT binary sensor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses an MQTT message received to set the binary sensor’s state to on , off or unknown .
The state will be updated only after a new message is published on state_topic matching payload_on , payload_off or None . If these messages are published with the retain flag set,
the binary sensor will receive an instant state update after subscription and Home Assistant will display the correct state on startup.
Otherwise, the initial state displayed in Home Assistant will be unknown .
Stateless devices, like buttons, remote controls, and similar stateless devices, are better represented by MQTT device triggers than by binary sensors.
The mqtt binary sensor platform optionally supports a list of availability topics to receive online and offline messages (birth and LWT messages) from the MQTT device. During normal operation, if the MQTT sensor device goes offline (that is, publishes payload_not_available to an availability topic), Home Assistant will display the binary sensor as unavailable . If these messages are published with the retain flag set, the binary sensor will receive an instant update after subscription and Home Assistant will display the correct availability state of the binary sensor when Home Assistant starts up. If the retain flag is not set, Home Assistant will display the binary sensor as unavailable when Home Assistant starts up. If no availability topic is defined, Home Assistant will consider the MQTT device to be available and will display its state.
To use an MQTT binary sensor in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - binary_sensor : state_topic : " basement/window/contact"
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
The MQTT topic subscribed to receive birth and LWT messages from the MQTT device. If availability is not defined, the binary sensor will always be considered available and its state will be on , off or unknown . If availability is defined, the binary sensor will be considered as unavailable by default and the sensor’s initial state will be unavailable . Must not be used together with availability .
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, binary_sensor.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this binary sensor is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
The encoding of the payloads received. Set to "" to disable decoding of incoming payload.
entity_category string ( Optional )
The category of the entity. When set, the entity category must be diagnostic for sensors.
entity_picture string ( Optional )
Picture URL for the entity.
expire_after integer ( Optional )
If set, it defines the number of seconds after the sensor’s state expires if it’s not updated. After expiry, the sensor’s state becomes unavailable . By default, the sensor’s state never expires. Note that when a sensor’s value was sent retained to the MQTT broker, the last value sent will be replayed by the MQTT broker when Home Assistant restarts or is reloaded. As this could cause the sensor to become available with an expired state, it is not recommended to retain the sensor’s state payload at the MQTT broker. Home Assistant will store and restore the sensor’s state for you and calculate the remaining time to retain the sensor’s state before it becomes unavailable.
force_update boolean ( Optional , default: false )
Sends update events (which results in update of state object ’s last_changed ) even if the sensor’s state hasn’t changed. Useful if you want to have meaningful value graphs in history or want to create an automation that triggers on every incoming state message (not only when the sensor’s new state is different to the current one).
group list ( Optional )
A list of unique IDs of the member binary sensor entities. Set this if the binary sensor entity represents a binary sensor group.
icon icon ( Optional )
Icon for the entity.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic . Usage example can be found in MQTT sensor documentation.
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as sensor attributes. Usage example can be found in MQTT sensor documentation.
name string ( Optional , default: MQTT binary sensor )
The name of the binary sensor. Can be set to null if only the device name is relevant.
off_delay integer ( Optional )
For sensors that only send on state updates (like PIRs), this variable sets a delay in seconds after which the sensor’s state will be updated back to off .
The string that represents the online state.
The string that represents the offline state.
payload_off string ( Optional , default: OFF )
The string that represents the off state. It will be compared to the message in the state_topic (see value_template for details)
payload_on string ( Optional , default: ON )
The string that represents the on state. It will be compared to the message in the state_topic (see value_template for details)
platform string Required
Must be binary_sensor . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
state_topic string Required
The MQTT topic subscribed to receive sensor’s state. Valid states are OFF and ON . Custom OFF and ON values can be set with the payload_off and payload_on config options.
unique_id string ( Optional )
An ID that uniquely identifies this sensor. If two sensors have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Defines a template that returns a string to be compared to payload_on / payload_off or an empty string, in which case the MQTT message will be removed. Remove this option when payload_on and payload_off are sufficient to match your payloads (that is, no preprocessing of the original message is required).
In this section, you will find some real-life examples of how to use this sensor.
This is an example of a configuration where the state is extracted from a JSON formatted MQTT message.
To test, you can use the command line tool mosquitto_pub shipped with mosquitto or the mosquitto-clients package to send MQTT messages.
To set the state of the binary sensor manually:
mosquitto_pub -h 127.0.0.1 -t home-assistant/window/availability -m "online"
mosquitto_pub -h 127.0.0.1 -t home-assistant/window/contact -m '{"state":"ON"}'
mosquitto_pub -h 127.0.0.1 -t home-assistant/window/contact -m '{"state":"OFF"}'
The example below shows a full configuration for a binary sensor:
# Example configuration.yaml entry mqtt : - binary_sensor : name : " Window Contact Sensor" state_topic : " bedroom/window/contact" payload_on : " ON" availability : - topic : " bedroom/window/availability" payload_available : " online" payload_not_available : " offline" qos : 0 device_class : opening value_template : " {{ value_json.state }}"
# Example configuration.yaml entry mqtt : - binary_sensor : state_topic : " lab_button/cmnd/POWER" value_template : " {%if is_state(entity_id, \" on \" )-%}OFF{%-else-%}ON{%-endif%}"
Assuming that you have flashed your ESP8266 unit with ESPEasy . Under “Config” is a name (“Unit Name:”) set for your device (here it’s “bathroom”). A configuration for a “Controller” for MQTT with the protocol “OpenHAB MQTT” is present and the entries (“Controller Subscribe:” and “Controller Publish:”) are adjusted to match your needs. In this example, the topics are prefixed with “home”. Also, add a “Switch Input” in the “Devices” tap with the name “switch” and “button” as value.
As soon as the unit is online, you will get the state of the attached button.
home/bathroom/status Connected
...
home/bathroom/switch/button 1
The configuration will look like the example below:
# Example configuration.yaml entry mqtt : - binary_sensor : name : Bathroom state_topic : " home/bathroom/switch/button" payload_on : " 1" payload_off : " 0"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT binary sensor integration was introduced in Home Assistant 0.9, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Binary sensor
Back to top
