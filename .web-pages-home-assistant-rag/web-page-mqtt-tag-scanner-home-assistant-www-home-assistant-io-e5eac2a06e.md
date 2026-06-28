# MQTT tag scanner - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tag.mqtt
- Final URL: https://www.home-assistant.io/integrations/tag.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/tag.mqtt/
- Fetched at: 2026-06-28T03:20:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT scanner within Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Full configuration with tag ID extracted from JSON data
The MQTT tag scanner integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses an MQTT message payload to generate tag scanned events.
MQTT scanners are only supported through MQTT discovery , manual setup through configuration.yaml is not supported.
The discovery topic needs to be: <discovery_prefix>/tag/[<node_id>/]<object_id>/config .
Configuration Variables
Looking for your configuration file?
topic string Required
The MQTT topic subscribed to receive tag scanned events.
value_template template ( Optional )
Defines a template that returns a tag ID.
device map Required
Information about the device this device trigger is a part of to tie it into the device registry . At least one of identifiers or connections must be present to identify the device.
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
In this section, you will find some real-life examples of how to use this sensor.
This is an example of a configuration where the tag ID is extracted from a JSON formatted MQTT message.
To test, you can use the command line tool mosquitto_pub shipped with mosquitto or the mosquitto-clients package to send MQTT messages.
Discover the tag scanner:
mosquitto_pub -h 127.0.0.1 -t homeassistant/tag/0AFFD2/config -m '{"topic": "0AFFD2/tag_scanned", "value_template": "{{ value_json.PN532.UID }}"}'
Generate tag scanned event:
mosquitto_pub -h 127.0.0.1 -t 0AFFD2/tag_scanned -m '{"Time":"2020-09-28T17:02:10","PN532":{"UID":"E9F35959", "DATA":"ILOVETASMOTA"}}'
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT tag scanner integration was introduced in Home Assistant 0.116, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Tag scanner
Back to top
