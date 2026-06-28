# MQTT Lock - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lock.mqtt
- Final URL: https://www.home-assistant.io/integrations/lock.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/lock.mqtt/
- Fetched at: 2026-06-28T02:57:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT locks into Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Full configuration
The MQTT Lock integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your MQTT enabled locks.
In an ideal scenario, the MQTT device will have a state_topic to publish state changes. If these messages are published with a RETAIN flag, the MQTT lock will receive an instant state update after subscription and will start with correct state. Otherwise, the initial state of the lock will be false / unlocked.
When a state_topic is not available, the lock will work in optimistic mode. In this mode, the lock will immediately change state after every command. Otherwise, the lock will wait for state confirmation from the device (message from state_topic ).
Optimistic mode can be forced, even if state topic is available. Try to enable it, if experiencing incorrect lock operation.
It’s mandatory for locks to support lock and unlock . A lock may optionally support open , (e.g. to open the bolt in addition to the latch), in this case, payload_open is required in the configuration. If the lock is in optimistic mode, it will change states to unlocked when handling the open command.
An MQTT lock can also report the intermediate states unlocking , locking or jammed if the motor reports a jammed state.
To use an MQTT lock in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - lock : command_topic : " home/frontdoor/set"
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
code_format string ( Optional )
A regular expression to validate a supplied code when it is set during the action to open , lock or unlock the MQTT lock.
command_template template ( Optional )
Defines a template to generate the payload to send to command_topic . The lock command template accepts the parameters value and code . The value parameter will contain the configured value for either payload_open , payload_lock or payload_unlock . The code parameter is set during the action to open , lock or unlock the MQTT lock and will be set None if no code was passed.
command_topic string Required
The MQTT topic to publish commands to change the lock state.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, lock.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this lock is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received and published messages. Set to "" to disable decoding of incoming payload.
entity_category string ( Optional )
The category of the entity.
entity_picture string ( Optional )
Picture URL for the entity.
group list ( Optional )
A list of unique IDs of the member lock entities. Set this if the lock entity represents a lock group.
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
name string ( Optional , default: MQTT Lock )
The name of the lock. Can be set to null if only the device name is relevant.
optimistic boolean ( Optional )
Flag that defines if lock works in optimistic mode.
Default:
true if no state_topic defined, else false .
payload_lock string ( Optional , default: LOCK )
The payload sent to the lock to lock it.
payload_unlock string ( Optional , default: UNLOCK )
The payload sent to the lock to unlock it.
payload_open string ( Optional )
The payload sent to the lock to open it.
payload_reset string ( Optional , default: “None” )
A special payload that resets the state to unknown when received on the state_topic .
platform string Required
Must be lock . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
state_jammed string ( Optional , default: JAMMED )
The payload sent to state_topic by the lock when it’s jammed.
state_locked string ( Optional , default: LOCKED )
The payload sent to state_topic by the lock when it’s locked.
state_locking string ( Optional , default: LOCKING )
The payload sent to state_topic by the lock when it’s locking.
state_topic string ( Optional )
The MQTT topic subscribed to receive state updates. It accepts states configured with state_jammed , state_locked , state_unlocked , state_locking or state_unlocking . A “None” payload resets to an unknown state. An empty payload is ignored.
state_unlocked string ( Optional , default: UNLOCKED )
The payload sent to state_topic by the lock when it’s unlocked.
state_unlocking string ( Optional , default: UNLOCKING )
The payload sent to state_topic by the lock when it’s unlocking.
unique_id string ( Optional )
An ID that uniquely identifies this lock. If two locks have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
Defines a template to extract a state value from the payload.
Important
Make sure that your topics match exactly. some-topic/ and some-topic are different topics.
In this section you will find some real-life examples of how to use this lock.
The example below shows a full configuration for an MQTT lock.
# Example configuration.yaml entry mqtt : - lock : name : Frontdoor state_topic : " home-assistant/frontdoor/state" code_format : " ^ \\ d{4}$" command_topic : " home-assistant/frontdoor/set" command_template : ' { "action": "{{ value }}", "code":"{{ code }}" }' payload_lock : " LOCK" payload_unlock : " UNLOCK" state_locked : " LOCK" state_unlocked : " UNLOCK" state_locking : " LOCKING" state_unlocking : " UNLOCKING" state_jammed : " MOTOR_JAMMED" state_ok : " MOTOR_OK" optimistic : false qos : 1 retain : true value_template : " {{ value.x }}"
Keep an eye on retaining messages to keep the state as you don’t want to unlock your door by accident when you restart something.
For a check you can use the command line tools mosquitto_pub shipped with mosquitto to send MQTT messages. This allows you to operate your lock manually:
mosquitto_pub -h 127.0.0.1 -t home-assistant/frontdoor/set -m "LOCK"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Lock integration was introduced in Home Assistant 0.15, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Lock
Back to top
