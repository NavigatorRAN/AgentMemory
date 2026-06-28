---
source_url: "https://www.home-assistant.io/integrations/event.mqtt"
final_url: "https://www.home-assistant.io/integrations/event.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/event.mqtt/"
source_handle: "web:www-home-assistant-io:42f2b829a71e"
source_section: "integrations-event-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c337b04d8b29e6912b8097e394afc943cf4a332a3f6d03c6d1a0357905ba4a98"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Event - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/event.mqtt
- Final URL: https://www.home-assistant.io/integrations/event.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/event.mqtt/
- Fetched at: 2026-06-28T02:41:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT events into Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration with JSON data
Example: processing event data using a value template
The MQTT Event integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to process event info from an MQTT message. Events are signals that are emitted when something happens, for example, when a user presses a physical button like a doorbell or when a button on a remote control is pressed. With the event some event attributes can be sent to become available as an attribute on the entity. MQTT events are stateless. For example, a doorbell does not have a state like being “on” or “off” but instead is momentarily pressed.
To use an MQTT event entity in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - event : state_topic : " home/doorbell/state" event_types : - press
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
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, event.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this event is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
configuration_url string ( Optional )
A link to the webpage that can manage the configuration of this device. Can be either an HTTP or HTTPS link.
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
The type/class of the event to set the icon in the frontend. The device_class can be null .
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the published messages.
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
event_types list Required
A list of valid event_type strings.
icon icon ( Optional )
Icon for the entity.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic . Usage example can be found in MQTT sensor documentation.
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as sensor attributes. Usage example can be found in MQTT sensor documentation.
name string ( Optional , default: MQTT Event )
The name to use when displaying this event.
platform string Required
Must be event . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
state_topic string Required
The MQTT topic subscribed to receive JSON event payloads. The JSON payload should contain the event_type element. The event type should be one of the configured event_types . Note that replayed retained messages will be discarded.
unique_id string ( Optional )
An ID that uniquely identifies this event entity. If two events have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Defines a template to extract the value and render it to a valid JSON event payload. If the template throws an error, the current state will be used instead.
Important
Make sure that your topic matches exactly. some-topic/ and some-topic are different topics.
The example below shows a full configuration for an event MQTT entity.
# Example configuration.yaml entry mqtt : - event : state_topic : " home/doorbell/state" event_types : - " press" - " hold" availability : - topic : " home/doorbell/available" qos : 0 device_class : " doorbell"
The event information is extracted from a JSON formatted MQTT message.
To test, you can use the command line tool mosquitto_pub shipped with mosquitto or the mosquitto-clients package to send MQTT messages.
To set trigger the mqtt event entity manually:
mosquitto_pub -h 127.0.0.1 -t home/doorbell/available -m "online"
mosquitto_pub -h 127.0.0.1 -t home/doorbell/state -m '{"event_type": "hold"}'
Besides the required event_type element, the payload can contain additional event attributes.
These additional attribute updates will be exposed as attributes on the mqtt event entity.
The example below demonstrates how event attributes can be added to the event data.
mosquitto_pub -h 127.0.0.1 -t home/doorbell/state -m '{"event_type": "press", "duration": 0.1}'
In many cases, translation of an existing published payload is needed.
The example config below translates the payload {"Button1": {"Action": "SINGLE"}} of
the device Button1 with event type single to the required format.
An extra attribute button will be set to Button1 and be added to the entity,
but only if the Action property is set. Empty dictionaries will be ignored.
mqtt : - event : name : " Desk button" state_topic : " desk/button/state" event_types : - single - double device_class : " button" value_template : | { {% for key in value_json %} {% if value_json[key].get("Action") %} "button": "{{ key }}", "event_type": "{{ value_json[key].Action | lower }}" {% endif %} {% endfor %} }
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Event integration was introduced in Home Assistant 2023.8, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Event
Back to top
