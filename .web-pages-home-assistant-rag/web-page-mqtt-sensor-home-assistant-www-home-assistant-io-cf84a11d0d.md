# MQTT Sensor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sensor.mqtt
- Final URL: https://www.home-assistant.io/integrations/sensor.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/sensor.mqtt/
- Fetched at: 2026-06-28T03:14:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MQTT sensors within Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Processing Unix EPOCH timestamps
JSON attributes topic configuration
JSON attributes template configuration
Usage of entity_id in the template
Owntracks battery level sensor
Temperature and humidity sensors
Get sensor value from a device with ESPEasy
The MQTT Sensor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the MQTT message payload as the sensor value. If messages in this state_topic are published with RETAIN flag, the sensor will receive an instant update with last known value. Otherwise, the initial state will be undefined.
To use an MQTT sensor in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : sensor : - name : " Bedroom Temperature" state_topic : " home/bedroom/temperature"
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
The MQTT topic subscribed to receive availability (online/offline) updates.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, sensor.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this sensor is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
The type/class of the sensor to set the icon in the frontend. The device_class can be null .
enabled_by_default boolean ( Optional , default: true )
Controls whether this entity is enabled by default. When set to true , the entity is enabled and usable immediately. Disabled entities are hidden by default until you enable them from the device page.
encoding string ( Optional , default: utf-8 )
The encoding of the payloads received. Set to "" to disable decoding of incoming payload.
entity_category string ( Optional )
The category of the entity. When set, the entity category must be diagnostic for sensors.
entity_picture string ( Optional )
Picture URL for the entity.
expire_after integer ( Optional , default: 0 )
If set, it defines the number of seconds after the sensor’s state expires if it’s not updated. After expiry, the sensor’s state becomes unavailable . Default the sensors state never expires. By default, the sensor’s state never expires. Note that when a sensor’s value was sent retained to the MQTT broker, the last value sent will be replayed by the MQTT broker when Home Assistant restarts or is reloaded. As this could cause the sensor to become available with an expired state, it is not recommended to retain the sensor’s state payload at the MQTT broker. Home Assistant will store and restore the sensor’s state for you and calculate the remaining time to retain the sensor’s state before it becomes unavailable.
force_update boolean ( Optional , default: false )
Sends update events even if the value hasn’t changed. Useful if you want to have meaningful value graphs in history.
group list ( Optional )
A list of unique IDs of the member sensor entities. Set this if the sensor entity represents a sensor group.
icon icon ( Optional )
Icon for the entity.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic .
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as sensor attributes. Implies force_update of the current sensor state when a message is received on this topic.
last_reset_value_template template ( Optional )
Defines a template to extract the last_reset. When last_reset_value_template is set, the state_class option must be total . Available variables: entity_id . The entity_id can be used to reference the entity’s attributes.
name string ( Optional , default: MQTT Sensor )
The name of the MQTT sensor. Can be set to null if only the device name is relevant.
options list ( Optional )
List of allowed sensor state value. An empty list is not allowed. The sensor’s device_class must be set to enum . The options option cannot be used together with state_class or unit_of_measurement .
platform string Required
Must be sensor . Only allowed and required in MQTT auto discovery device messages .
suggested_display_precision integer ( Optional )
The number of decimals which should be used in the sensor’s state after rounding.
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
state_class string ( Optional )
The state_class of the sensor.
state_topic string Required
The MQTT topic subscribed to receive sensor values. If device_class , state_class , unit_of_measurement or suggested_display_precision is set, and a numeric value is expected, an empty value '' will be ignored and will not update the state, a 'None' value will set the sensor to an unknown state. If a value_template is used to parse a JSON payload, a null value in the JSON will be rendered as 'None' . Note that the device_class can be null .
unique_id string ( Optional )
An ID that uniquely identifies this sensor. If two sensors have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
unit_of_measurement string ( Optional )
Defines the units of measurement of the sensor, if any. The unit_of_measurement can be null .
Defines a template to extract the value. If the template throws an error, the current state will be used instead.
In this section, you find some real-life examples showing how to use this sensor.
The example below shows how an MQTT sensor can process a Unix EPOCH payload.
Set up via YAML:
# Example configuration.yaml entry mqtt : sensor : - name : " turned on" state_topic : " pump/timestamp_on" device_class : " timestamp" value_template : " {{ as_datetime(value) }}" unique_id : " hp_1231232_ts_on" device : name : " Heat pump" identifiers : - " hp_1231232"
Or set up via MQTT discovery:
Discovery topic: homeassistant/sensor/hp_1231232/config
{ "name" : "turned on" , "state_topic" : "pump/timestamp_on" , "device_class" : "timestamp" , "value_template" : "{{ as_datetime(value) }}" , "unique_id" : "hp_1231232_ts_on" , "device" : { "name" : "Heat pump" , "identifiers" : [ "hp_1231232" ] } }
To test, you can use the command line tool mosquitto_pub shipped with mosquitto or the mosquitto-clients package to send MQTT messages.
Payload topic: pump/timestamp_on
Payload: 1707294116
To set the state of the sensor manually:
mosquitto_pub -h 127.0.0.1 -p 1883 -u username -P some_password -t pump/timestamp_on -m '1707294116'
Make sure the IP address of your MQTT broker is used and that user credentials have been set up correctly.
The value_template will render the Unix EPOCH timestamp to correct format: 2024-02-07 08:21:56+00:00 .
The example sensor below shows a configuration example which uses the following separate topic and JSON structure to add extra attributes.
Topic: home/sensor1/attributes
{ "ClientName" : <string> , "IP" : <string> , "MAC" : <string> , "RSSI" : <string> , "HostName" : <string> , "ConnectedSSID" : <string> }
It also uses the availability topic.
Extra attributes will be displayed in the frontend and can also be extracted in Templates . For example, to extract the ClientName attribute from the sensor below, use a template similar to: {{ state_attr('sensor.bs_rssi', 'ClientName') }} .
# Example configuration.yaml entry mqtt : sensor : - name : " RSSI" state_topic : " home/sensor1/infojson" unit_of_measurement : " dBm" value_template : " {{ value_json.RSSI }}" availability : - topic : " home/sensor1/status" payload_available : " online" payload_not_available : " offline" json_attributes_topic : " home/sensor1/attributes"
The example sensor below shows a configuration example which uses the following topic and JSON structure with a template to add Timer1.Arm and Timer1.Time as extra attributes.
Topic: tele/sonoff/sensor
{ "Timer1" : { "Arm" : <status> , "Time" : <time> }, "Timer2" : { "Arm" : <status> , "Time" : <time> } }
To instead only add Timer1.Arm as an extra attribute, change json_attributes_template to: "{{ {'Arm': value_json.Timer1} | tojson }}" .
Extra attributes will be displayed in the frontend and can also be extracted in Templates . For example, to extract the Arm attribute from the sensor below, use a template similar to: {{ state_attr('sensor.timer1', 'Arm') }} .
# Example configuration.yaml entry mqtt : sensor : - name : " Timer 1" state_topic : " tele/sonoff/sensor" value_template : " {{ value_json.Timer1.Arm }}" json_attributes_topic : " tele/sonoff/sensor" json_attributes_template : " {{ value_json.Timer1 | tojson }}" - name : " Timer 2" state_topic : " tele/sonoff/sensor" value_template : " {{ value_json.Timer2.Arm }}" json_attributes_topic : " tele/sonoff/sensor" json_attributes_template : " {{ value_json.Timer2 | tojson }}"
Warning
If json_attributes_topic and state_topic share the same topic, a state update will happen only once, unless the state update did not change the state or force_update was set to true .
Setting up MQTT sensor’s with extra state attributes that contain values that change at every update, like timestamps, or enabling the force_update option, is discouraged, as this will trigger state writes for every update. This can have a serious impact on the total system performance. A better option is creating separate sensors instead.
The example below shows how a simple filter, that calculates the value by adding 90% of the new value and 10% of the previous value, can be implemented in a template.
# Example configuration.yaml entry mqtt : sensor : - name : " Temp 1" state_topic : " sensor/temperature" value_template : |- {% if states(entity_id) == None %} {{ value | round(2) }} {% else %} {{ value | round(2) * 0.9 + states(entity_id) * 0.1 }} {% endif %}
If you are using the OwnTracks and enable the reporting of the battery level then you can use an MQTT sensor to keep track of your battery. A regular MQTT message from OwnTracks looks like this:
Topic: owntracks/tablet/tablet
{ "_type" : "location" , "lon" : 7.21 , "t" : "u" , "batt" : 92 , "tst" : 144995643 , "tid" : "ta" , "acc" : 27 , "lat" : 46.12 }
Thus the trick is extracting the battery level from the payload.
# Example configuration.yaml entry mqtt : sensor : - name : " Battery Tablet" state_topic : " owntracks/tablet/tablet" unit_of_measurement : " %" value_template : " {{ value_json.batt }}"
If you are using a DHT sensor and a NodeMCU board (esp8266), you can retrieve temperature and humidity with an MQTT sensor. A code example can be found here . A regular MQTT message from this example looks like this:
Topic: office/sensor1
{ "temperature" : 23.20 , "humidity" : 43.70 }
Then use this configuration example to extract the data from the payload:
# Example configuration.yaml entry mqtt : sensor : - name : " Temperature" state_topic : " office/sensor1" suggested_display_precision : 1 unit_of_measurement : " °C" value_template : " {{ value_json.temperature }}" - name : " Humidity" state_topic : " office/sensor1" unit_of_measurement : " %" value_template : " {{ value_json.humidity }}"
Assuming that you have flashed your ESP8266 unit with ESPEasy . Under “Config” set a name (“Unit Name:”) for your device (here it’s “bathroom”). A “Controller” for MQTT with the protocol “OpenHAB MQTT” is present and the entries (“Controller Subscribe:” and “Controller Publish:”) are adjusted to match your needs. In this example the topics are prefixed with “home”. Please keep in mind that the ESPEasy default topics start with a / and only contain the name when writing your entry for the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
Controller Subscribe : home/%sysname%/# (instead of /%sysname%/# )
Controller Publish : home/%sysname%/%tskname%/%valname% (instead of /%sysname%/%tskname%/%valname% )
Also, add a sensor in the “Devices” tap with the name “analog” and “brightness” as value.
As soon as the unit is online, you will get the state of the sensor.
home/bathroom/status Connected
...
home/bathroom/analog/brightness 290.00
The configuration will look like the example below:
# Example configuration.yaml entry mqtt : sensor : - name : " Brightness" state_topic : " home/bathroom/analog/brightness"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Sensor integration was introduced in Home Assistant 0.7, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
