# MQTT Valve - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/valve.mqtt
- Final URL: https://www.home-assistant.io/integrations/valve.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/valve.mqtt/
- Fetched at: 2026-06-28T03:26:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT valves into Home Assistant.

## Extracted Text

On this page
Configuration
Valve controlled by states
Valve controlled by position
Optimistic operation
Examples
Full configuration for a valve that does not report position
Sample configuration of a valve that reports the position
Configuration for disabling valve commands
Testing your configuration
The MQTT Valve integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control an MQTT valve (such a gas or water valve).
A valve entity can have the following states: open , opening , closed , or closing .
If a state_topic is configured, the entity’s state will be updated only after an MQTT message is received on state_topic matching state_open , state_opening , state_closed or state_closing . Commands configured through payload_open , payload_closed , and payload_stop will be published to command_topic to control the valve.
To use an MQTT valve in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry for a valve that is set by open or close commands mqtt : - valve : command_topic : " heater/valve/set" state_topic : " heater/valve/state"
Alternatively, you can set it up via MQTT discovery .
If the valve supports reporting its position (the reports_position config option is set to true ), a numeric state is expected on state_topic , but state updates are still allowed for state_opening and state_closing . Also, a JSON format is supported. It allows both state and position to be reported together.
Example of a JSON state update:
{ "state" : "opening" , "position" : 10 }
The wanted position value or payload will be published to command_topic to control the valve when the actions valve.open_valve , valve.close_valve , or valve.set_valve_position are called.
To use your MQTT valve in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry for a valve that reports position mqtt : - valve : command_topic : " heater/valve/set" state_topic : " heater/valve/state" reports_position : true
If a state_topic is not defined, the valve will work in optimistic mode. In this mode, the valve will immediately change state ( open or closed ) after every command sent by Home Assistant. It won’t wait for an update from the device. Optimistic mode can be forced by setting optimistic to true , even if a state_topic is defined. Try to enable it if you are experiencing an incorrect valve operation.
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
availability_mode string ( Optional , default: latest )
When availability is configured, this controls the conditions needed to set the entity to available . Valid entries are all , any , and latest . If set to all , payload_available must be received on all configured availability topics before the entity is marked as online. If set to any , payload_available must be received on at least one configured availability topic before the entity is marked as online. If set to latest , the last payload_available or payload_not_available received on any configured availability topic controls the availability.
availability_template template ( Optional )
Defines a template to extract the device’s availability from the availability_topic . To determine the device’s availability, the result of this template will be compared to payload_available and payload_not_available .
availability_topic string ( Optional )
The MQTT topic subscribed to receive birth and LWT messages from the MQTT valve device. If an availability topic is not defined, the valve availability state will always be available . If an availability topic is defined, the valve availability state will be unavailable by default. Must not be used together with availability .
command_template template ( Optional )
Defines a template to generate the payload to send to command_topic .
command_topic string ( Optional )
The MQTT topic to publish commands to control the valve. The value sent can be a value defined by payload_open , payload_close or payload_stop . If reports_position is set to true , a numeric value will be published instead.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, valve.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this valve is a part of to tie it into the device registry . Only works when unique_id is set. At least one of the identifiers or connections must be present to identify the device.
configuration_url string ( Optional )
A link to the webpage that can manage the configuration of this device. Can be either an http:// , https:// or an internal homeassistant:// URL.
connections list ( Optional )
A list of connections of the device to the outside world as a list of tuples [connection_type, connection_identifier] . For example, the MAC address of a network interface: "connections": [["mac", "02:5b:26:a8:dc:12"]] .
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
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend. The device_class can be null .
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received and published messages. Set to "" to disable decoding of incoming payload.
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
group list ( Optional )
A list of unique IDs of the member value entities. Set this if the value entity represents a valve group.
icon icon ( Optional )
Icon for the entity.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic . A usage example can be found in the MQTT sensor documentation.
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as sensor attributes. A usage example can be found in MQTT sensor documentation.
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
name string ( Optional , default: MQTT valve )
The name of the valve. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if a switch works in optimistic mode.
Default:
false if the state or position topic is defined; true otherwise.
The payload that represents the online state.
payload_close string ( Optional , default: CLOSE )
The command payload that closes the valve. Is only used when reports_position is set to false (default). The payload_close is not allowed if reports_position is set to true . Can be set to null to disable the valve’s close option.
The payload that represents the offline state.
payload_open string ( Optional , default: OPEN )
The command payload that opens the valve. Is only used when reports_position is set to false (default). The payload_open is not allowed if reports_position is set to true . Can be set to null to disable the valve’s open option.
payload_stop string ( Optional )
The command payload that stops the valve. When not configured, the valve will not support the valve.stop action.
platform string Required
Must be valve . Only allowed and required in MQTT auto discovery device messages .
position_closed integer ( Optional , default: 0 )
Number which represents closed position. The valve’s position will be scaled to the( position_closed … position_open ) range when an action is performed and scaled back when a value is received.
position_open integer ( Optional , default: 100 )
Number which represents open position. The valve’s position will be scaled to ( position_closed … position_open ) range when an is performed and scaled back when a value is received.
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
reports_position boolean ( Optional , default: false )
Set to true if the value reports the position or supports setting the position. Enabling the reports_position option will cause the position to be published instead of a payload defined by payload_open , payload_close or payload_stop . When receiving messages, state_topic will accept numeric payloads or one of the following state messages: open , opening , closed , or closing .
retain boolean ( Optional , default: false )
Defines if published messages should have the retain flag set.
state_closed string ( Optional , default: closed )
The payload that represents the closed state. Is only allowed when reports_position is set to False (default).
state_closing string ( Optional , default: closing )
The payload that represents the closing state.
state_open string ( Optional , default: open )
The payload that represents the open state. Is only allowed when reports_position is set to False (default).
state_opening string ( Optional , default: opening )
The payload that represents the opening state.
state_topic string ( Optional )
The MQTT topic subscribed to receive valve state messages. State topic accepts a state payload ( open , opening , closed , or closing ) or, if reports_position is supported, a numeric value representing the position. In a JSON format with variables state and position both values can be received together. A “None” state value resets to an unknown state. An empty string is ignored.
unique_id string ( Optional )
An ID that uniquely identifies this valve. If two valves have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Defines a template that can be used to extract the payload for the state_topic topic. The rendered value should be a defined state payload or, if reporting a position is supported and reports_position is set to true , a numeric value is expected representing the position. See also state_topic .
Note
MQTT valve expects position values to be in the range of 0 to 100, where 0 indicates a closed position and 100 indicates a fully open position.
If position_open or position_closed are set to a different range (for example, 40 to 140), when sending a command to the device, the range will be adjusted to the device range. For example, position 0 will send a value of 40 to device. When the device receives a position payload, it will be adjusted back to the 0 to 100 range. In our example, the device value of 40 will report valve position 0.
position_open and position_closed can also be used to reverse the direction of the device: If position_closed is set to 100 and position_open is set to 0, the device operation will be inverted. For example, when setting the position to 40, a value of 60 will be sent to the device.
This section provides some examples showing how you can use this platform.
The example below shows a full configuration for a valve that does not report position.
# Example configuration.yaml entry mqtt : - valve : name : " MQTT valve" command_template : ' {"x": {{ value }} }' command_topic : " heater/valve/set" state_topic : " heater/valve/state" availability : - topic : " heater/valve/availability" qos : 0 reports_position : false retain : true payload_open : " OPEN" payload_close : " CLOSE" payload_stop : " STOP" state_open : " open" state_opening : " opening" state_closed : " closed" state_closing : " closing" payload_available : " online" payload_not_available : " offline" optimistic : false value_template : " {{ value_json.x }}"
The example below shows a sample configuration for a valve that reports the position using JSON messages.
# Example configuration.yaml entry mqtt : - valve : name : " MQTT valve" command_template : ' {"x": {{ value }} }' command_topic : " heater/valve/set" state_topic : " heater/valve/state" availability : - topic : " heater/valve/availability" reports_position : true value_template : " {{ value_json.x }}"
The example below shows a configuration for a valve that does not have a close command.
Setting the payload_close to empty or to null disables the close command and will not show the close button.
# Example configuration.yaml entry mqtt : - valve : payload_open : " on" payload_close : payload_stop : " on"
An MQTT valve will support open and close commands if a command_topic is set. The MQTT valve supports stop if payload_stop is set.
To test, you can use the command line tool mosquitto_pub shipped with mosquitto or the mosquitto-clients package to send MQTT messages. This allows you to operate your valve manually:
mosquitto_pub -h 127.0.0.1 -t home-assistant/valve/set -m "CLOSE"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Valve integration was introduced in Home Assistant 2024.1, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Valve
Back to top
