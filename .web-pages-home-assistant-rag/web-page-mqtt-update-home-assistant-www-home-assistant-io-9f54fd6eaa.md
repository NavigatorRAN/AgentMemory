---
source_url: "https://www.home-assistant.io/integrations/update.mqtt"
final_url: "https://www.home-assistant.io/integrations/update.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/update.mqtt/"
source_handle: "web:www-home-assistant-io:9f54fd6eaa5e"
source_section: "integrations-update-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c720e9cc3ee212550d485cf9f455c7bcd18449b99fd6a355a3a6bf1784cad2a0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Update - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/update.mqtt
- Final URL: https://www.home-assistant.io/integrations/update.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/update.mqtt/
- Fetched at: 2026-06-28T03:25:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to interact with a device exposing an Update entity through MQTT from within Home Assistant.

## Extracted Text

On this page
Configuration
Examples
The MQTT Update integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate devices that might expose firmware/software installed and the latest versions through MQTT into Home Assistant as an Update entity. Every time a message under the topic in the configuration is received, the entity will be updated in Home Assistant.
To use an MQTT update entity in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - update : state_topic : topic-installed latest_version_topic : topic-latest
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
availability_topic string ( Optional )
The MQTT topic subscribed to receive availability (online/offline) updates. Must not be used together with availability .
availability_mode string ( Optional , default: latest )
When availability is configured, this controls the conditions needed to set the entity to available . Valid entries are all , any , and latest . If set to all , payload_available must be received on all configured availability topics before the entity is marked as online. If set to any , payload_available must be received on at least one configured availability topic before the entity is marked as online. If set to latest , the last payload_available or payload_not_available received on any configured availability topic controls the availability.
availability_template template ( Optional )
Defines a template to extract device’s availability from the availability_topic . To determine the devices’s availability result of this template will be compared to payload_available and payload_not_available .
command_topic string ( Optional )
The MQTT topic to publish payload_install to start installing process.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, update.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this Update is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
The type/class of the update to set the icon in the frontend. The device_class can be null .
display_precision integer ( Optional , default: 0 )
Number of decimal digits for display of update progress.
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
The MQTT topic subscribed to receive a JSON dictionary payload and then set as entity attributes. Implies force_update of the current select state when a message is received on this topic.
latest_version_template template ( Optional )
Defines a template to extract the latest version value. Use state_topic with a value_template if all update state values can be extracted from a single JSON payload.
latest_version_topic string ( Optional )
The MQTT topic subscribed to receive an update of the latest version. Use state_topic with a value_template if all update state values can be extracted from a single JSON payload.
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
The name of the Update. Can be set to null if only the device name is relevant.
payload_install string ( Optional )
The MQTT payload to start installing process.
platform string Required
Must be update . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
release_summary string ( Optional )
Summary of the release notes or changelog. This is suitable a brief update description of max 255 characters.
release_url string ( Optional )
URL to the full release notes of the latest version available.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
state_topic string ( Optional )
The MQTT topic subscribed to receive state updates. The state update may be either JSON or a simple string with installed_version value. When a JSON payload is detected, the state value of the JSON payload should supply the installed_version and can optionally supply: latest_version , title , release_summary , release_url , and an entity_picture URL. To allow progress monitoring in_progress (a boolean to indicate an update is in progress), or update_percentage (a float value to indicate the progress percentage) may be part of the JSON message.
title string ( Optional )
Title of the software, or firmware update. This helps to differentiate between the device or entity name versus the title of the software installed.
unique_id string ( Optional )
An ID that uniquely identifies this Update. If two Updates have the same unique ID Home Assistant will raise an exception.
Defines a template to extract the installed_version state value or to render to a valid JSON payload on from the payload received on state_topic .
Important
Make sure that your topic matches exactly. some-topic/ and some-topic are different topics.
This is an example of Update entity configuration for Shelly Gen1 device.
# Example configuration.yaml entry mqtt : - update : name : " Shelly Plug S Firmware Update" title : " Shelly Plug S Firmware" release_url : " https://shelly-api-docs.shelly.cloud/gen1/#changelog" entity_picture : " https://brands.home-assistant.io/_/shelly/icon.png" state_topic : " shellies/shellyplug-s-112233/info" value_template : " {{ value_json['update'].old_version }}" latest_version_topic : " shellies/shellyplug-s-112233/info" latest_version_template : " {% if value_json['update'].new_version %}{{ value_json['update'].new_version }}{% else %}{{ value_json['update'].old_version }}{% endif %}" device_class : " firmware" command_topic : " shellies/shellyplug-s-112233/command" payload_install : " update_fw"
JSON can also be used as state_topic payload. Note that this feature also allows you to process and show live progress information.
{ "installed_version" : "1.21.0" , "latest_version" : "1.22.0" , "title" : "Device Firmware" , "release_url" : "https://example.com/release" , "release_summary" : "A new version of our amazing firmware" , "entity_picture" : "https://example.com/icon.png" }
Simple progress state update example:
{ "installed_version" : "1.21.0" , "latest_version" : "1.22.0" , "title" : "Device Firmware" , "release_url" : "https://example.com/release" , "release_summary" : "A new version of our amazing firmware" , "entity_picture" : "https://example.com/icon.png" , "in_progress" : true }
Update percentage state update example:
{ "installed_version" : "1.21.0" , "latest_version" : "1.22.0" , "title" : "Device Firmware" , "release_url" : "https://example.com/release" , "release_summary" : "A new version of our amazing firmware" , "entity_picture" : "https://example.com/icon.png" , "update_percentage" : 78 }
Publish null to reset the update percentage state update’s:
{ "installed_version" : "1.22.0" , "latest_version" : "1.22.0" , "title" : "Device Firmware" , "release_url" : "https://example.com/release" , "release_summary" : "A new version of our amazing firmware" , "entity_picture" : "https://example.com/icon.png" , "update_percentage" : null }
The values in the JSON are optional but must be valid within the following schema:
installed_version string ( Optional )
The software or firmware version installed.
latest_version string ( Optional )
The latest software or firmware version available.
Title of the software or firmware update available.
Summary of the software or firmware update available.
URL pointing to the software release notes.
URL pointing to an image of the update to be applied as entity picture.
in_progress boolean ( Optional , default: false )
Boolean to report an update is in progress or not.
update_percentage integer | float ( Optional )
Number between 0 and 100 to report the update process. A null value resets the in-progress state.
For the above JSON payload examples, the update entity configuration should look like this:
# Example configuration.yaml entry mqtt : - update : name : " Amazing Device Update" title : " Device Firmware" state_topic : " amazing-device/state-topic" device_class : " firmware" command_topic : " amazing-device/command" payload_install : " install"
If the device/service sends data as JSON but the schema differs, value_template can be use to reformat the JSON.
{ "installed_ver" : "2022.11" , "new_ver" : "2022.12" }
For the above JSON payload, the update entity configuration should look like this:
# Example configuration.yaml entry mqtt : update : name : " Amazing Device Update" title : " Device Firmware" state_topic : " amazing-device/state-topic" value_template : " {{ {'installed_version': value_json.installed_ver, 'latest_version': value_json.new_ver } | to_json }}" device_class : " firmware" command_topic : " amazing-device/command" payload_install : " install"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Update integration was introduced in Home Assistant 2021.11, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Update
Back to top
