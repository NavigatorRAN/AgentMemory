---
source_url: "https://www.home-assistant.io/integrations/device_trigger.mqtt"
final_url: "https://www.home-assistant.io/integrations/device_trigger.mqtt"
canonical_url: "https://www.home-assistant.io/integrations/device_trigger.mqtt/"
source_handle: "web:www-home-assistant-io:8c43055cf447"
source_section: "integrations-device-trigger-mqtt"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "71d9aaa036b76b83d1dbddbca77afc98f778bd3d8c48b64d81f753160f161fa4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# MQTT Device trigger - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/device_trigger.mqtt
- Final URL: https://www.home-assistant.io/integrations/device_trigger.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/device_trigger.mqtt/
- Fetched at: 2026-06-28T02:36:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT device triggers within Home Assistant.

## Extracted Text

On this page
Configuration
Example
The MQTT Device trigger integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses an MQTT message payload to generate device trigger events.
An MQTT device trigger is a better option than a binary sensor for buttons and remote controls.
MQTT device triggers are only supported through MQTT discovery , manual setup through configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] is not supported.
The discovery topic needs to be: <discovery_prefix>/device_automation/[<node_id>/]<object_id>/config . Note that only one trigger may be defined per unique discovery topic. Also note that the combination of type and subtype should be unique for a device.
Configuration Variables
Looking for your configuration file?
automation_type string Required
The type of automation, must be ‘trigger’.
payload string ( Optional )
Optional payload to match the payload being sent over the topic.
platform string Required
Must be device_automation . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
topic string Required
The MQTT topic subscribed to receive trigger events.
type string Required
The type of the trigger, for example, button_short_press . Entries supported by the frontend: button_short_press , button_short_release , button_long_press , button_long_release , button_double_press , button_triple_press , button_quadruple_press , button_quintuple_press . If set to an unsupported value, will render as subtype type , for example, button_1 spammed with type set to spammed and subtype set to button_1
subtype string Required
The subtype of the trigger, for example, button_1 . Entries supported by the frontend: turn_on , turn_off , button_1 , button_2 , button_3 , button_4 , button_5 , button_6 . If set to an unsupported value, will render as subtype type , for example, left_button pressed with type set to button_short_press and subtype set to left_button
device map Required
Information about the device this device trigger is a part of to tie it into the device registry . At least one of identifiers or connections must be present to identify the device.
configuration_url string ( Optional )
A link to the webpage that can manage the configuration of this device. Can be either an http:// , https:// or an internal homeassistant:// URL.
connections list ( Optional )
A list of connections of the device to the outside world as a list of tuples [connection_type, connection_identifier] . For example the MAC address of a network interface: "connections": [["mac", "02:5b:26:a8:dc:12"]] .
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
value_template template ( Optional )
Defines a template to extract the value.
This shows a complete example of defining a remote control type device with two triggers: “left arrow click” and “right arrow click”.
Note that it is not necessary to provide the full device information in each message, but the identifying information, identifier in the example, must be the same.
Left arrow click configuration
Discovery topic: homeassistant/device_automation/0x90fd9ffffedf1266/action_arrow_left_click/config
Discovery payload:
{ "automation_type" : "trigger" , "type" : "action" , "subtype" : "arrow_left_click" , "payload" : "arrow_left_click" , "topic" : "zigbee2mqtt/0x90fd9ffffedf1266/action" , "device" : { "identifiers" : [ "zigbee2mqtt_0x90fd9ffffedf1266" ], "name" : "0x90fd9ffffedf1266" , "sw_version" : "Zigbee2MQTT 1.14.0" , "model" : "TRADFRI remote control (E1524/E1810)" , "manufacturer" : "IKEA" } }
Trigger topic: zigbee2mqtt/0x90fd9ffffedf1266/action
Trigger payload: arrow_left_click
Right arrow click configuration
Discovery topic: homeassistant/device_automation/0x90fd9ffffedf1266/action_arrow_right_click/config
{ "automation_type" : "trigger" , "type" : "action" , "subtype" : "arrow_right_click" , "payload" : "arrow_right_click" , "topic" : "zigbee2mqtt/0x90fd9ffffedf1266/action" , "device" : { "identifiers" : [ "zigbee2mqtt_0x90fd9ffffedf1266" ] } }
Trigger payload: arrow_right_click
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Device trigger integration was introduced in Home Assistant 0.106, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Device automation
Back to top
