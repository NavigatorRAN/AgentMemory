---
source_url: "https://www.home-assistant.io/integrations/datetime.mqtt"
final_url: "https://www.home-assistant.io/integrations/datetime.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/datetime.mqtt/"
source_handle: "web:www-home-assistant-io:061f3fecee84"
source_section: "integrations-datetime-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2afa99840d3a266050481cd4ec4da96cf03d41342bff89e2fd255976cf1731c7"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Date/Time - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/datetime.mqtt
- Final URL: https://www.home-assistant.io/integrations/datetime.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/datetime.mqtt/
- Fetched at: 2026-06-28T02:36:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to interact with a device exposing a date/time control capability through MQTT from within Home Assistant.

## Extracted Text

On this page
Configuration
Examples
The MQTT Date/Time integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate devices that expose a control to set the date and time.
To use an MQTT date/time entity in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - datetime : command_topic : command-topic
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
Defines a template to extract the device’s availability from the topic . To determine the device’s availability, the result of this template will be compared to payload_available and payload_not_available .
availability_topic string ( Optional )
The MQTT topic subscribed to receive availability (online/offline) updates. Must not be used together with availability .
availability_mode string ( Optional , default: latest )
When availability is configured, this controls the conditions needed to set the entity to available . Valid entries are all , any , and latest . If set to all , payload_available must be received on all configured availability topics before the entity is marked as online. If set to any , payload_available must be received on at least one configured availability topic before the entity is marked as online. If set to latest , the most recent payload_available or payload_not_available received on any configured availability topic determines availability.
availability_template template ( Optional )
Defines a template to extract the device’s availability from the availability_topic . To determine the device’s availability, the result of this template will be compared to payload_available and payload_not_available .
command_template template ( Optional )
Defines a template to generate the payload to send to command_topic .
command_topic string Required
The MQTT topic to publish the date/time value that is set in ISO format (UTC timezone). Use the command_template option to render to a different format.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, datetime.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, it will be created with a number appended. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Device information for this time entity. Used to link the entity to a device in the device registry . Only works when unique_id is set. At least one of identifiers or connections is required to identify the device.
configuration_url string ( Optional )
A link to the webpage that can manage the configuration of this device. Can be either an http:// , https:// or an internal homeassistant:// URL.
connections list ( Optional )
A list of device connections to the outside world, each specified as a tuple of [connection_type, connection_identifier] . For example, the MAC address of a network interface: "connections": [["mac", "02:5b:26:a8:dc:12"]] .
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
Identifier of a device that routes messages between this device and Home Assistant. Examples of such devices are hubs, or parent devices of a sub-device. This is used to show device topology in Home Assistant.
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding used for received payloads and published messages. Set to "" to disable decoding of incoming payload.
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic .
json_attributes_topic string ( Optional )
The MQTT topic subscribed to for receiving a JSON dictionary payload that sets the entity attributes. Implies force_update of the current date/time state when a message is received on this topic.
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
name string ( Optional , default: MQTT Date/Time )
The name of the date/time entity. Can be set to null if only the device name is relevant.
platform string Required
Must be datetime . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
state_topic string ( Optional )
The MQTT topic subscribed to receive date/time state updates. Date state updates should contain a parsable date string, e.a. ‘2025-12-01’ or ‘1 March 2025’. If a time structure is passed, the current date will be will be used. Can be used with value_template to render the incoming payload to a parsable date/time string expression. The expression must include a timezone, but must be omitted if the timezone option is set. If needed, the value_template option can be used to define a template that renders to a valid date/time structure.
timezone string ( Optional )
Set to a valid IANA timezone identifier . Do not set this option if the data/time structure is providing timezone information via the status update.
unique_id string ( Optional )
An ID that uniquely identifies this date/time entity. If two date/time entities have the same unique ID Home Assistant will raise an exception. Required when used with device-based discovery.
Defines a template to extract the date/time state value from the payload received on state_topic .
Important
Make sure that your topic matches exactly. some-topic/ and some-topic are different topics.
This is an example of a manual configured MQTT datetime item.
# Example configuration.yaml entry mqtt : - datetime : name : " Scheduled task" icon : mdi:ab-testing command_topic : " date_selector/set" state_topic : " date_selector/state"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Date/Time integration was introduced in Home Assistant 2026.5, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Date/Time
Back to top
