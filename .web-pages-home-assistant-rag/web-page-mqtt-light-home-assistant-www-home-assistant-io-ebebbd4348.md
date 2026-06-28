# MQTT Light - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/light.mqtt
- Final URL: https://www.home-assistant.io/integrations/light.mqtt
- Canonical URL: https://www.home-assistant.io/integrations/light.mqtt/
- Fetched at: 2026-06-28T02:56:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up MQTT lights using default schema within Home Assistant.

## Extracted Text

On this page
Comparison of light MQTT schemas
Default schema
Default schema - Configuration
Default schema - Examples
Brightness and RGB support
Brightness and no RGB support
Brightness without on commands
Default schema - Implementations
JSON schema
JSON schema - Configuration
JSON schema - Examples
Brightness scaled
HS color
Brightness and RGBW support
Implementations
Template schema
Template schema - Configuration
Template schema - Examples
Simple string payload
JSON payload
CCT light (brightness and temperature)
Template schema - No brightness or color support
The MQTT Light integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your MQTT enabled lights through one of the supported message schemas, default , json or template .
Function default json template Brightness ✔ ✔ ✔ Color mode ✔ ✔ ✘ Color temperature ✔ ✔ ✔ Effects ✔ ✔ ✔ Flashing ✘ ✔ ✔ HS Color ✔ ✔ ✔ Light group ✘ ✔ ✘ RGB Color ✔ ✔ ✔ RGBW Color ✔ ✔ ✘ RGBWW Color ✔ ✔ ✘ Transitions ✘ ✔ ✔ White ✔ ✔ ✘ XY Color ✔ ✔ ✘
The mqtt light platform with default schema lets you control your MQTT enabled lights. It supports setting brightness, color temperature, effects, on/off, RGB colors, XY colors and white.
In an ideal scenario, the MQTT device will have a state topic to publish state changes. If these messages are published with a RETAIN flag, the MQTT light will receive an instant state update after subscription and will start with the correct state. Otherwise, the initial state of the switch will be unknown . An MQTT device can reset the current state to unknown using a None payload.
When a state topic is not available, the light will work in optimistic mode. In this mode, the light will immediately change state after every command. Otherwise, the light will wait for state confirmation from the device (message from state_topic ). The initial state is set to False / off in optimistic mode.
Optimistic mode can be forced, even if the state_topic is available. Try to enable it, if experiencing incorrect light operation.
Home Assistant internally assumes that a light’s state corresponds to a defined color_mode .
The state of MQTT lights with default schema and support for both color and color temperature will set the color_mode according to the last received valid color or color temperature. Optionally, a color_mode_state_topic can be configured for explicit control of the color_mode .
To use an MQTT basic light in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt : - light : command_topic : " office/rgb1/light/switch"
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
brightness_command_topic string ( Optional )
The MQTT topic to publish commands to change the light’s brightness.
brightness_command_template template ( Optional )
Defines a template to compose message which will be sent to brightness_command_topic . Available variables: value .
brightness_scale integer ( Optional , default: 255 )
Defines the maximum brightness value (that is, 100%) of the MQTT device.
brightness_state_topic string ( Optional )
The MQTT topic subscribed to receive brightness state updates.
brightness_value_template template ( Optional )
Defines a template to extract the brightness value.
color_mode_state_topic string ( Optional )
The MQTT topic subscribed to receive color mode updates. If this is not configured, color_mode will be automatically set according to the last received valid color or color temperature. The unit used is mireds, or if color_temp_kelvin is set to true , in Kelvin.
color_mode_value_template template ( Optional )
Defines a template to extract the color mode.
color_temp_command_template template ( Optional )
Defines a template to compose message which will be sent to color_temp_command_topic . Available variables: value .
color_temp_command_topic string ( Optional )
The MQTT topic to publish commands to change the light’s color temperature state. By default the color temperature command slider has a range of 153 to 500 mireds (micro reciprocal degrees) or a range of 2000 to 6535 Kelvin if color_temp_kelvin is set to true .
color_temp_kelvin boolean ( Optional , default: false )
When set to true , color_temp_command_topic will publish color mode updates in Kelvin and process color_temp_state_topic will process state updates in Kelvin. When not set the color_temp values are converted to mireds.
color_temp_state_topic string ( Optional )
The MQTT topic subscribed to receive color temperature state updates.
color_temp_value_template template ( Optional )
Defines a template to extract the color temperature value.
command_topic string Required
The MQTT topic to publish commands to change the switch state.
default_entity_id string ( Optional )
Use default_entity_id instead of name for automatic generation of the entity ID. For example, light.foobar . When used without a unique_id , the entity ID will update during restart or reload if the entity ID is available. If the entity ID already exists, the entity ID will be created with a number at the end. When used with a unique_id , the default_entity_id is only used when the entity is added for the first time. When set, this overrides a user-customized entity ID if the entity was deleted and added again.
device map ( Optional )
Information about the device this light is a part of to tie it into the device registry . Only works when unique_id is set. At least one of identifiers or connections must be present to identify the device.
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
effect_command_topic string ( Optional )
The MQTT topic to publish commands to change the light’s effect state.
effect_command_template template ( Optional )
Defines a template to compose message which will be sent to effect_command_topic . Available variables: value .
effect_list string | list ( Optional )
The list of effects the light supports.
effect_state_topic string ( Optional )
The MQTT topic subscribed to receive effect state updates.
effect_value_template template ( Optional )
Defines a template to extract the effect value.
group list ( Optional )
A list of unique IDs of the member light entities. Set this if the light entity represents a light group.
hs_command_template template ( Optional )
Defines a template to compose message which will be sent to hs_command_topic . Available variables: hue and sat .
hs_command_topic string ( Optional )
The MQTT topic to publish commands to change the light’s color state in HS format (Hue Saturation). Range for Hue: 0° .. 360°, Range of Saturation: 0..100. Note: Brightness is sent separately in the brightness_command_topic .
hs_state_topic string ( Optional )
The MQTT topic subscribed to receive color state updates in HS format. The expected payload is the hue and saturation values separated by commas, for example, 359.5,100.0 . Note: Brightness is received separately in the brightness_state_topic .
hs_value_template template ( Optional )
Defines a template to extract the HS value.
icon icon ( Optional )
Icon for the entity.
json_attributes_template template ( Optional )
Defines a template to extract the JSON dictionary from messages received on the json_attributes_topic . Usage example can be found in MQTT sensor documentation.
json_attributes_topic string ( Optional )
The MQTT topic subscribed to receive a JSON dictionary payload and then set as sensor attributes. Usage example can be found in MQTT sensor documentation.
max_kelvin integer ( Optional , default: 6535 )
The maximum color temperature in Kelvin.
max_mireds integer ( Optional )
The maximum color temperature in mireds.
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
min_kelvin integer ( Optional , default: 2000 )
The minimum color temperature in Kelvin.
min_mireds integer ( Optional )
The minimum color temperature in mireds.
name string ( Optional , default: MQTT Light )
The name of the light. Can be set to null if only the device name is relevant.
on_command_type string ( Optional )
Defines when on the payload_on is sent. Using last (the default) will send any style (brightness, color, etc) topics first and then a payload_on to the command_topic . Using first will send the payload_on and then any style topics. Using brightness will only send brightness commands instead of the payload_on to turn the light on.
optimistic boolean ( Optional )
Flag that defines if switch works in optimistic mode.
Default:
true if no state topic defined, else false .
payload_off string ( Optional , default: OFF )
The payload that represents the off state.
payload_on string ( Optional , default: ON )
The payload that represents the on state.
platform string Required
Must be light . Only allowed and required in MQTT auto discovery device messages .
qos integer ( Optional , default: 0 )
The maximum QoS level to be used when receiving and publishing messages.
retain boolean ( Optional , default: false )
If the published message should have the retain flag on or not.
rgb_command_template template ( Optional )
Defines a template to compose message which will be sent to rgb_command_topic . Available variables: red , green and blue .
rgb_command_topic string ( Optional )
The MQTT topic to publish commands to change the light’s RGB state.
rgb_state_topic string ( Optional )
The MQTT topic subscribed to receive RGB state updates. The expected payload is the RGB values separated by commas, for example, 255,0,127 .
rgb_value_template template ( Optional )
Defines a template to extract the RGB value.
rgbw_command_template template ( Optional )
Defines a template to compose message which will be sent to rgbw_command_topic . Available variables: red , green , blue and white .
rgbw_command_topic string ( Optional )
The MQTT topic to publish commands to change the light’s RGBW state.
rgbw_state_topic string ( Optional )
The MQTT topic subscribed to receive RGBW state updates. The expected payload is the RGBW values separated by commas, for example, 255,0,127,64 .
rgbw_value_template template ( Optional )
Defines a template to extract the RGBW value.
rgbww_command_template template ( Optional )
Defines a template to compose message which will be sent to rgbww_command_topic . Available variables: red , green , blue , cold_white and warm_white .
rgbww_command_topic string ( Optional )
The MQTT topic to publish commands to change the light’s RGBWW state.
rgbww_state_topic string ( Optional )
The MQTT topic subscribed to receive RGBWW state updates. The expected payload is the RGBWW values separated by commas, for example, 255,0,127,64,32 .
rgbww_value_template template ( Optional )
Defines a template to extract the RGBWW value.
schema string ( Optional , default: basic )
The schema to use. Must be basic or omitted to select the default schema.
state_topic string ( Optional )
The MQTT topic subscribed to receive state updates. A “None” payload resets to an unknown state. An empty payload is ignored. By default, valid state payloads are OFF and ON . The accepted payloads can be overridden with the payload_off and payload_on config options.
state_value_template template ( Optional )
Defines a template to extract the state value. The template should return the values defined by payload_on (defaults to “ON”) and payload_off (defaults to “OFF”) settings, or “None”.
unique_id string ( Optional )
An ID that uniquely identifies this light. If two lights have the same unique ID, Home Assistant will raise an exception. Required when used with device-based discovery.
white_command_topic string ( Optional )
The MQTT topic to publish commands to change the light to white mode with a given brightness.
white_scale integer ( Optional , default: 255 )
Defines the maximum white level (that is, 100%) of the MQTT device.
xy_command_template template ( Optional )
Defines a template to compose message which will be sent to xy_command_topic . Available variables: x and y .
xy_command_topic string ( Optional )
The MQTT topic to publish commands to change the light’s XY state.
xy_state_topic string ( Optional )
The MQTT topic subscribed to receive XY state updates. The expected payload is the X and Y color values separated by commas, for example, 0.675,0.322 .
xy_value_template template ( Optional )
Defines a template to extract the XY value.
Important
Make sure that your topics match exactly. some-topic/ and some-topic are different topics.
Note
XY and RGB cannot be used at the same time. If both are provided, XY overrides RGB.
In this section you will find some real-life examples of how to use this sensor.
To enable a light with brightness and RGB support in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry mqtt : - light : name : " Office Light RGB" state_topic : " office/rgb1/light/status" command_topic : " office/rgb1/light/switch" brightness_state_topic : " office/rgb1/brightness/status" brightness_command_topic : " office/rgb1/brightness/set" rgb_state_topic : " office/rgb1/rgb/status" rgb_command_topic : " office/rgb1/rgb/set" state_value_template : " {{ value_json.state }}" brightness_value_template : " {{ value_json.brightness }}" rgb_value_template : " {{ value_json.rgb | join(',') }}" qos : 0 payload_on : " ON" payload_off : " OFF" optimistic : false
To enable a light with brightness (no RGB version) in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry mqtt : - light : name : " Office light" state_topic : " office/light/status" command_topic : " office/light/switch" brightness_state_topic : ' office/light/brightness' brightness_command_topic : ' office/light/brightness/set' qos : 0 payload_on : " ON" payload_off : " OFF" optimistic : false
To enable a light that sends only brightness topics to turn it on, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. The command_topic is only used to send an off command in this case:
# Example configuration.yaml entry mqtt : - light : name : " Brightness light" state_topic : " office/light/status" command_topic : " office/light/switch" payload_off : " OFF" brightness_state_topic : ' office/light/brightness' brightness_command_topic : ' office/light/brightness/set' on_command_type : ' brightness'
A basic example using a NodeMCU board (ESP8266) to control its built-in LED (on/off).
Another example to control a RGB LED (on/off, brightness, and colors).
Integration guide for the ESPUrna firmware (ESP8285/ESP8266).
The mqtt light platform with JSON schema lets you control an MQTT-enabled light that can receive JSON messages.
This schema supports on/off, brightness, RGB colors, XY colors, color temperature, transitions and short/long flashing. The messages sent to/from the lights look similar to this, omitting fields when they aren’t needed. The color_mode will not be present in messages sent to the light. It is optional in messages received from the light, but can be used to disambiguate the current mode in the light. In the example below, color_mode is set to rgb and color_temp , color.c , color.w , color.x , color.y , color.h , color.s will all be ignored by Home Assistant:
{ "brightness" : 255 , "color_mode" : "rgb" , "color_temp" : 155 , "color" : { "r" : 255 , "g" : 180 , "b" : 200 , "c" : 100 , "w" : 50 , "x" : 0.406 , "y" : 0.301 , "h" : 344.0 , "s" : 29.412 }, "effect" : "colorloop" , "state" : "ON" , "transition" : 2 , }
In an ideal scenario, the MQTT device will have a state topic to publish state changes. If these messages are published with the RETAIN flag, the MQTT light will receive an instant state update after subscription and will start with the correct state. Otherwise, the initial state of the light will be off.
When a state topic is not available, the light will work in optimistic mode. In this mode, the light will immediately change state after every command. Otherwise, the light will wait for state confirmation from the device (message from state_topic ).
Optimistic mode can be forced, even if state topic is available. Try enabling it if the light is operating incorrectly.
To use an MQTT JSON light in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
# Example configuration.yaml entry mqtt : - light : schema : json command_topic : " home/rgb1/set"
brightness boolean ( Optional , default: false )
Flag that defines if light supports brightness when the rgb , rgbw , or rgbww color mode is supported.
When set to true , command_topic will publish color mode updates in Kelvin, and process state_topic will process state updates in Kelvin. By default, the color_temp values are converted to and from mireds.
The MQTT topic to publish commands to change the light’s state.
effect boolean ( Optional , default: false )
Flag that defines if the light supports effects.
flash boolean ( Optional , default: true )
Flag that defines if light supports the flash feature.
flash_time_long integer ( Optional , default: 10 )
The duration, in seconds, of a “long” flash.
flash_time_short integer ( Optional , default: 2 )
The duration, in seconds, of a “short” flash.
name string ( Optional , default: MQTT JSON Light )
The name of the light.
Flag that defines if the light works in optimistic mode.
The schema to use. Must be json to select the JSON schema.
The MQTT topic subscribed to receive state updates in a JSON-format. The JSON payload may contain the elements: "state" : "ON" the light is on, "OFF" the light is off, null the state is unknown ; "color_mode" : one of the supported_color_modes ; "color" : A dict with the color attributes*; "brightness" : The brightness; "color_temp" : The color temperature; "effect" : The effect of the light.
supported_color_modes list ( Optional )
A list of color modes supported by the light. Possible color modes are onoff , brightness , color_temp , hs , xy , rgb , rgbw , rgbww , white . Note that if onoff or brightness are used, that must be the only value in the list.
transition boolean ( Optional , default: true )
Flag that defines if light supports the transition feature.
Defines the maximum white level (that is, 100%) of the MQTT device. This is used when setting the light to white mode.
*The color attribute dict in the JSON state payload should contain the following keys based on the color_mode :
hs :
h : The hue value
s : The saturation value
xy :
x : X color value
y : Y color value
rgb :
r : Red color value
g : Green color value
b : Blue color value
rgbw :
w : White value
rgbww :
c : Cool white value
w : Warm white value
More details about the different colors, color modes and range values can be found here .
Make sure that your topics match exact. some-topic/ and some-topic are different topics.
RGB, XY and HSV cannot be used at the same time in state_topic messages. Make sure that only one of the color models is in the “color” section of the state MQTT payload.
In this section you find some real-life examples of how to use this sensor.
# Example configuration.yaml entry mqtt : - light : schema : json name : mqtt_json_light_1 state_topic : " home/rgb1" command_topic : " home/rgb1/set" brightness : true supported_color_modes : [ " rgb" ]
To enable a light with brightness (but no color support) in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry mqtt : - light : schema : json name : mqtt_json_light_1 state_topic : " home/rgb1" command_topic : " home/rgb1/set" brightness : true supported_color_modes : [ " brightness" ]
To enable a light using a brightness scale other than 8bit the brightness_scale option may be added to denote the “fully on” value:
# Example configuration.yaml entry mqtt : - light : schema : json name : mqtt_json_light_1 state_topic : " home/light" command_topic : " home/light/set" brightness : true brightness_scale : 4095 supported_color_modes : [ " brightness" ]
Home Assistant will then convert its 8bit value in the message to and from the device:
{ "brightness" : 4095 , "state" : "ON" }
To use a light with hue+saturation as the color model, set supported_color_modes to ["hs"] in the platform configuration:
mqtt : - light : schema : json name : mqtt_json_hs_light state_topic : " home/light" command_topic : " home/light/set" supported_color_modes : [ " hs" ]
Home Assistant expects the hue values to be in the range 0 to 360 and the saturation values to be scaled from 0 to 100. For example, the following is a blue color shade:
{ "state" : "ON" , "color_mode" : "hs" , "color" : { "h" : 24.0 , "s" : 100.0 } }
To enable a light with brightness, RGB support and a separate white channel (RGBW) in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry mqtt : - light : schema : json name : mqtt_json_light_1 state_topic : " home/rgbw1" command_topic : " home/rgbw1/set" brightness : true supported_color_modes : [ " rgbw" ]
A full example of custom lighting using this platform and an ESP8266 microcontroller can be found here . It supports on/off, brightness, transitions, RGB colors, and flashing.
There is also another implementation forked from the above repository, it supports all the same features but is made for addressable LED strips using FastLED on a NodeMCU V3 it can be found here .
McLighting is another ESP8266 firmware for WS2812 addressable LEDs.
MQTT JSON Light is another implementation for ESP8266 including MQTT discovery .
ESPHome implements the JSON schema for MQTT based installs and supports MQTT discovery .
AiLight is a custom firmware for the Ai-Thinker (and equivalent) RGBW WiFi light bulbs that has an ESP8266 onboard and controlled by the MY9291 LED driver. It implements the MQTT JSON light platform and supports ON/OFF, RGBW colours, brightness, color temperature, flashing and transitions. Also it includes MQTT Auto Discovery ) and the MQTT Last Will and Testament is enabled as well.
h801-mqtt-json is a custom firmware for the H801 LED dimmer, a 5 channel (RGBWWCW) WiFi LED strip controller for 12V LED strips. The firmware is meant to control the 5 channels of the H801 to simultaneously control an RGB and a Warm-white/Cold-white LED strip such as a 5050 RGB LED strip and a 5025 Dual White strip. It implements the MQTT JSON light platform and supports ON/OFF, RGBW colours (RGB strip), brightness, color temperature (CW/WW strip) and transitions.
The mqtt light platform with template schema lets you control an MQTT-enabled light that receive commands on a command topic and optionally sends status update on a state topic.
It is format-agnostic so you can use any data format you want (such as string or JSON), just configure it with templating.
This schema supports on/off, brightness, RGB colors, XY colors, HS Color, color temperature, transitions, short/long flashing and effects.
To use an MQTT template light in your installation, add an MQTT device as a subentry , or add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
# Example configuration.yaml entry mqtt : - light : schema : template command_topic : " home/rgb1/set" command_on_template : " on" command_off_template : " off"
blue_template template ( Optional )
Template to extract blue color from the state payload value. Expected result of the template is an integer from 0-255 range.
brightness_template template ( Optional )
Template to extract brightness from the state payload value. Expected result of the template is an integer from 0-255 range.
When set to true , command_topic will publish color mode updates in Kelvin and process state_topic will process state updates in Kelvin. When not set the color_temp values are converted to mireds.
color_temp_template template ( Optional )
Template to extract color temperature from the state payload value. Expected result of the template is an integer. If color_temp_kelvin is true the expected value is in Kelvin else mireds are expected.
command_off_template template Required
The template for off state changes. Available variables: state and transition .
command_on_template template Required
The template for on state changes. Available variables: state , brightness , color_temp , red , green , blue , hue , sat , flash , transition and effect . Values red , green , blue , brightness are provided as integers from range 0-255. Value of hue is provided as float from range 0-360. Value of sat is provided as float from range 0-100. Value of color_temp is provided as integer representing mired or Kelvin units if color_temp_kelvin is true .
List of possible effects.
effect_template template ( Optional )
Template to extract effect from the state payload value.
green_template template ( Optional )
Template to extract green color from the state payload value. Expected result of the template is an integer from 0-255 range.
name string ( Optional , default: MQTT Template Light )
true if no state topic or state template is defined, else false .
red_template template ( Optional )
Template to extract red color from the state payload value. Expected result of the template is an integer from 0-255 range.
The schema to use. Must be template to select the template schema.
state_template template ( Optional )
Template to extract state from the state payload value.
The MQTT topic subscribed to receive state updates. A “None” payload resets to an unknown state. An empty payload is ignored.
In this section you find some real-life examples of how to use this light.
For a simple string payload with the format state,brightness,r-g-b,h-s (e.g., on,255,255-255-255,360-100 ), add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry mqtt : - light : schema : template command_topic : " home/rgb1/set" state_topic : " home/rgb1/status" command_on_template : " on,{{ brightness|d }},{{ red|d }}-{{ green|d }}-{{ blue|d }},{{ hue|d }}-{{ sat|d }}" command_off_template : " off" state_template : " {{ value.split(',')[0] }}" # must return `on` or `off` brightness_template : " {{ value.split(',')[1] }}" red_template : " {{ value.split(',')[2].split('-')[0] }}" green_template : " {{ value.split(',')[2].split('-')[1] }}" blue_template : " {{ value.split(',')[2].split('-')[2] }}"
For a JSON payload with the format {"state": "on", "brightness": 255, "color": [255, 255, 255], "effect": "rainbow"} , add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry mqtt : - light : schema : template effect_list : - rainbow - colorloop command_topic : " home/rgb1/set" state_topic : " home/rgb1/status" command_on_template : > {"state": "on" {%- if brightness is defined -%} , "brightness": {{ brightness }} {%- endif -%} {%- if red is defined and green is defined and blue is defined -%} , "color": [{{ red }}, {{ green }}, {{ blue }}] {%- endif -%} {%- if hue is defined and sat is defined -%} , "huesat": [{{ hue }}, {{ sat }}] {%- endif -%} {%- if effect is defined -%} , "effect": "{{ effect }}" {%- endif -%} } command_off_template : ' {"state": "off"}' state_template : ' {{ value_json.state }}' brightness_template : ' {{ value_json.brightness }}' red_template : ' {{ value_json.color[0] }}' green_template : ' {{ value_json.color[1] }}' blue_template : ' {{ value_json.color[2] }}' effect_template : ' {{ value_json.effect }}'
This example comes from a configuration of Shelly RGBW Bulb working in White mode.
max_mireds and min_mireds set color temperature boundaries to 3000K - 6500K. Notice the same limits are applied in command_on_template , but in kelvin units this time. It’s due to conversion from mired to kelvin which causes exceeding boundary values accepted by the device.
The code also ensures bi-directional conversion of brightness scale between 0-100 (required by the device) and 0-255 (required by Home Assistant).
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry mqtt : - light : schema : template name : " Bulb-white" command_topic : " shellies/bulb/color/0/set" state_topic : " shellies/bulb/color/0/status" availability_topic : " shellies/bulb/online" command_on_template : > {"turn": "on", "mode": "white" {%- if brightness is defined -%} , "brightness": {{brightness | float | multiply(0.39215686) | round(0)}} {%- endif -%} {%- if color_temp is defined -%} , "temp": {{ [[(1000000 / color_temp | float) | round(0), 3000] | max, 6500] | min }} {%- endif -%} } command_off_template : ' {"turn":"off", "mode": "white"}' state_template : " {% if value_json.ison and value_json.mode == 'white' %}on{% else %}off{% endif %}" brightness_template : " {{ value_json.brightness | float | multiply(2.55) | round(0) }}" color_temp_template : " {{ (1000000 / value_json.temp | float) | round(0) }}" payload_available : " true" payload_not_available : " false" max_mireds : 334 min_mireds : 153 qos : 1 retain : false optimistic : false
If you don’t want brightness, color or effect support, just omit the corresponding configuration sections.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Light integration was introduced in Home Assistant 0.8, and it's used by
48.5% of the active installations.
Its IoT class is Configurable.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Light
Back to top
