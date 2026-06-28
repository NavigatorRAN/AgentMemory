# MQTT device tracker - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/device_tracker.mqtt
- Final URL: https://www.home-assistant.io/integrations/device_tracker.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/device_tracker.mqtt/
- Fetched at: 2026-06-28T02:36:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use MQTT to track devices in Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Using the discovery protocol
YAML configuration
Related topics
The MQTT device tracker integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to define new device_trackers through manual YAML configuration in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] and also to automatically discover device_trackers using the MQTT Discovery protocol .
To use an MQTT device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - device_tracker : name : " annetherese_n4" state_topic : " location/annetherese" - device_tracker : name : " paulus_oneplus" state_topic : " location/paulus"
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
Use default_entity_id instead of name for automatic generation of the entity ID. For example, device_tracker.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this device tracker is a part of that ties it into the device registry . At least one of identifiers or connections must be present to identify the device.
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
suggested_area string ( Optional )
Suggest an area if the device isn’t in one yet.
sw_version string ( Optional )
The firmware version of the device.
via_device string ( Optional )
Identifier of a device that routes messages between this device and Home Assistant. Examples of such devices are hubs, or parent devices of a sub-device. This is used to show device topology in Home Assistant.
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
icon icon ( Optional )
Icon for the entity.
group list ( Optional )
A list of unique IDs of the member device tracker entities. Set this if the device tracker entity represents a device tracker group.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic . Usage example can be found in MQTT sensor documentation.
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary message containing device tracker attributes. This topic can be used to set the location of the device tracker under the following conditions:
If the attributes in the JSON message include longitude , latitude , and gps_accuracy (optional).
If the device tracker is within a configured zone .
If these conditions are met, it is not required to configure state_topic .
Be aware that any location message received at state_topic overrides the location received via json_attributes_topic until a message configured with payload_reset is received at state_topic . For a more generic usage example of the json_attributes_topic , refer to the MQTT sensor documentation.
The name of the MQTT device_tracker.
payload_home string ( Optional , default: home )
The payload value that represents the ‘home’ state for the device.
payload_not_home string ( Optional , default: not_home )
The payload value that represents the ‘not_home’ state for the device.
payload_reset string ( Optional , default: “None” )
The payload value that will have the device’s location automatically derived from Home Assistant’s zones.
platform string Required
Must be device_tracker . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
source_type string ( Optional )
Attribute of a device tracker that affects state when being used to track a person . Valid options are gps , router , bluetooth , or bluetooth_le .
state_topic string ( Optional )
The MQTT topic subscribed to receive device tracker state changes. The states defined in state_topic override the location states defined by the json_attributes_topic . This state override is turned inactive if the state_topic receives a message containing payload_reset . The state_topic can only be omitted if json_attributes_topic is used. An empty payload is ignored. Valid payloads are not_home , home or any other custom location or zone name. Payloads for not_home , home can be overridden with the payload_not_home and payload_home config options.
unique_id string ( Optional )
An ID that uniquely identifies this device_tracker. If two device_trackers have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Defines a template that returns a device tracker state.
The device_tracker can be created via publishing to a discovery topic that follows the following MQTT Discovery topic name format: <discovery_prefix>/device_tracker/[<node_id>/]<object_id>/config .
You can use the command line tool mosquitto_pub shipped with mosquitto or the mosquitto-clients package to send MQTT messages.
To create the device_tracker:
mosquitto_pub -h 127.0.0.1 -t homeassistant/device_tracker/a4567d663eaf/config -m '{"state_topic": "homeassistant/device_tracker/a4567d663eaf/state", "name": "My Tracker", "payload_home": "home", "payload_not_home": "not_home"}'
To set the state of the device tracker to “home”:
mosquitto_pub -h 127.0.0.1 -t homeassistant/device_tracker/a4567d663eaf/state -m 'home'
To set the state of the device tracker to a named location:
mosquitto_pub -h 127.0.0.1 -t homeassistant/device_tracker/a4567d663eaf/state -m 'location_name'
If the device supports GPS coordinates then they can be sent to Home Assistant by specifying an attributes topic (that is, json_attributes_topic ) in the configuration payload:
Attributes topic: homeassistant/device_tracker/a4567d663eaf/attributes
Example attributes payload:
Example message to be received at topic homeassistant/device_tracker/a4567d663eaf/attributes :
{ "latitude" : 32.87336 , "longitude" : -117.22743 , "gps_accuracy" : 1.2 }
To create the device_tracker with GPS coordinates support:
mosquitto_pub -h 127.0.0.1 -t homeassistant/device_tracker/a4567d663eaf/config -m '{"json_attributes_topic": "homeassistant/device_tracker/a4567d663eaf/attributes", "name": "My Tracker"}'
Note
Using state_topic is optional when using json_attributes_topic to determine the state of the device tracker.
To set the state of the device tracker to specific coordinates:
mosquitto_pub -h 127.0.0.1 -t homeassistant/device_tracker/a4567d663eaf/attributes -m '{"latitude": 32.87336, "longitude": -117.22743, "gps_accuracy": 1.2}'
The following example shows how to configure the same device tracker through configuration.yaml
# Example configuration.yaml entry mqtt : - device_tracker : name : " My Tracker" state_topic : " a4567d663eaf/state" payload_home : " home" payload_not_home : " not_home"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT device tracker integration was introduced in Home Assistant 0.7.3, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
