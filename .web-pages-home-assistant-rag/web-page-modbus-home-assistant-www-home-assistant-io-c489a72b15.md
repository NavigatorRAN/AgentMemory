---
source_url: "https://www.home-assistant.io/integrations/modbus"
final_url: "https://www.home-assistant.io/integrations/modbus"
canonical_url: "https://www.home-assistant.io/integrations/modbus/"
source_handle: "web:www-home-assistant-io:c489a72b154b"
source_section: "integrations-modbus"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9c89b854872e57919487115e0b6a7ae4c94589d156d99b68be27fbea18d49850"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Modbus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/modbus
- Final URL: https://www.home-assistant.io/integrations/modbus
- Canonical URL: https://www.home-assistant.io/integrations/modbus/
- Fetched at: 2026-06-28T03:00:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate modbus and platforms.

## Extracted Text

On this page
Configuring tcp connection
Example: typical tcp configuration
Example: full tcp configuration
Configuring a TCP-RTU connection
Example: typical TCP-RTU configuration
Example: full TCP-RTU configuration
Configuring a UDP connection
Example: typical udp configuration
Example: full UDP configuration
Configuring serial connection
Example: typical serial configuration
Example: full serial configuration
Configuring multiple connections
Example: entities grouping
Configuring binary sensor entities
Example: typical binary sensor configuration
Example: full binary sensor configuration
Example: multiple identical binary sensor configuration
Configuring climate entities
Example: climate configuration
Configuring cover entities
Example: Modbus cover
Example: Modbus cover controlled by a coil
Example: Modbus cover controlled by a coil, its state is read from the register
Example: Modbus cover controlled by a holding register
Example: Modbus cover controlled by a holding register, its state is read from the status register
Configuring fan entities
Example: fan configuration
Configuring light entities
Example: light configuration
Configuring sensor entities
Example: sensor configuration
Example: sensor full configuration
Configuring switch entities
Example: switch configuration
Example: switch full configuration
Parameters usage matrix
List of actions
Related topics
modbus is a communication protocol to control PLCs (Programmable Logic Controller) and RTUs (Remote Terminal Unit).
The integration adheres strictly to the protocol specification using pymodbus for the protocol implementation.
The modbus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports all devices adhering to the modbus standard. The communication to the device/devices can be serial (rs-485), TCP, or UDP connections. The modbus integration allows multiple communication channels e.g. a serial port connection combined with one or more TCP connections.
Configuring modbus communication
Configure the modbus communication with modbus devices. This is a general setup needed establish access to the device.
The modbus integration allows you to use multiple connections each with multiple sensors.
The modbus integration provides several parameters to help communicate with “difficult” devices, these parameters are independent of the type of communication.
To enable this integration, add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
Configuration Variables
Looking for your configuration file?
delay integer ( Optional , default: 0 )
Time to delay sending messages in seconds after connecting. Some modbus devices need a delay of typically 1-2 seconds after connection is established to prepare the communication. If a device does not respond to messages after connecting, then try this parameter. Remark: solely affect the first message.
message_wait_milliseconds integer ( Optional )
Time to wait in milliseconds between requests.
Default:
30 for serial connection, 0 for all other connections.
name string Required
Name of this hub. Must be unique.
timeout integer ( Optional , default: 5 )
Timeout while waiting for a response in seconds.
type list Required
Type of modbus.
tcp
TCP/IP connection with socket framer, used with Ethernet enabled devices.
udp
UDP connection with socket framer, rarely used.
rtuovertcp
TCP/IP connection with rtu framer, used when connection to modbus forwarders.
serial
Serial connection with RTU framer, used with TTY port or USB rs485 converter.
type: tcp is required. Used for devices providing a TCP/IP interface directly.
host string Required
IP address or name of your modbus device, e.g., 192.168.1.1 .
port integer Required
Network port for the communication.
# Example yaml: typical tcp connection modbus : - name : modbus_hub type : tcp host : IP_ADDRESS port : 502
# Example yaml: full tcp connection modbus : - name : modbus_hub type : tcp host : IP_ADDRESS port : 502 delay : 0 message_wait_milliseconds : 30 timeout : 5
type: rtuovertcp is required. Used for devices providing a TCP/IP interface directly.
This is typically used, when communicating with a modbus-forwarder, a device that
has a TCP/IP connection upwards, and one or more serial connections downwards.
# Example yaml: typical tcp-rtu connection modbus : - name : modbus_hub type : rtuovertcp host : IP_ADDRESS port : 502
# Example yaml: full tcp-rtu connection modbus : - name : modbus_hub type : rtuovertcp host : IP_ADDRESS port : 502 delay : 0 message_wait_milliseconds : 30 timeout : 5
type: udp is required. This is rarely used, and only for very special configurations.
# Example yaml: typical udp connection modbus : - name : modbus_hub type : udp host : IP_ADDRESS port : 502
# Example yaml: full udp connection modbus : - name : modbus_hub type : udp host : IP_ADDRESS port : 502 delay : 0 message_wait_milliseconds : 30 timeout : 5
type: serial is required. This is used for devices providing a serial rs485 interface.
The physical interface is typically a USB serial-rs485 converter or an rs232-rs485 connected to a serial port.
baudrate integer Required
Speed of the serial connection, higher speed gives better performance.
bytesize list Required
Data size in bits of each byte.
5
5 bit for data, rarely used.
6
6 bit for data, rarely used.
7
7 bit for data, used for very old devices.
8
8 bit for data, standard.
method list Required
Method of the connection to modbus.
rtu
Binary data transmission preceded by slave id and followed by a crc, standard.
ascii
ASCII data transmission preceded by slave id and followed by a crc, used for few devices.
parity list Required
Parity of the data bytes.
E
Even parity bit.
O
Odd parity bit.
N
No parity bit, standard.
port string Required
Serial port or USB device where your modbus device is connected to your Home Assistant host.
stopbits list Required
Stopbits of the data bytes.
1
1 stop bit.
2
2 stop bits, standard.
# Example yaml: typical serial connection modbus : - name : modbus_hub type : serial port : /dev/ttyUSB0 baudrate : 9600 bytesize : 8 method : rtu parity : E stopbits : 1
# Example yaml: full udp connection modbus : - name : modbus_hub type : serial port : /dev/ttyUSB0 baudrate : 9600 bytesize : 8 method : rtu parity : E stopbits : 1 delay : 0 message_wait_milliseconds : 30 timeout : 5
Multiple connections can freely mix different communications:
# Example yaml: multiple tcp connections modbus : - name : modbus_hub type : tcp host : IP_ADDRESS_1 port : 2020 - name : modbus_hub2 type : tcp host : IP_ADDRESS_2 port : 502
# Example yaml: tcp connection and serial connection modbus : - name : modbus_hub type : tcp host : IP_ADDRESS_1 port : 2020 - name : modbus_hub2 type : serial port : /dev/ttyUSB0 baudrate : 9600 bytesize : 8 method : rtu parity : E stopbits : 1
Configuring modbus entities
modbus entities are grouped below each modbus communication entry.
REMARK Each modbus device must have at least 1 entity defined, otherwise the integration will not be loaded.
Please refer to Parameter usage for conflicting parameters.
All modbus entities have the following parameters:
address integer Required
Address of coil/register. Note that this can also be specified in Hex. For example: 0x789A
Name of the entity which must be unique within the entity type.
scan_interval integer ( Optional , default: 15 )
Update interval in seconds. scan_interval = 0 for no polling. Entities are read shortly after startup and then according to scan_interval. Remark, when restarting HA the last known value is restored.
slave integer ( Optional , default: 1 )
Identical to device_address
device_address integer ( Optional , default: 1 )
Id of the device. Used to address multiple devices on a rs485 bus or devices connected to a modbus repeater. 0 is the broadcast id.
unique_id string ( Optional )
ID that uniquely identifies this entity. Slaves will be given a unique_id of <<unique_id>>_<<slave_index>>. If two entities have the same unique ID, Home Assistant will raise an exception.
# Example yaml: entities grouping modbus : - type : tcp host : IP_ADDRESS_1 port : 2020 name : " modbus_hub" binary_sensors : - name : binary_sensor1 address : 100 climates : - name : " Watlow F4T" address : 200 covers : - name : Door1 address : 300 fans : - name : Fan1 address : 400 lights : - name : light1 address : 500 sensors : - name : sensor1 address : 600 switches : - name : Switch1 address : 700
The different types of entities are detailed in the following.
The Modbus binary sensor allows you to gather data from coils which as per standard have state ON/OFF.
Normally, a register contains 16 coils, giving different addresses depending on the request used.
Register 512 : Coil 1 - 16 Register 513 : Coil 17 - 32
input_type: coils would use addresses from 1 through 32, while input_type: input would use addresses 512 and 513.
For that reason, many devices (especially older ones) do not share the coil address space with the register address space,
and this input would read from a different address space than coil . The problem is present in devices with
shared address space and are a frequent cause of problems when configuring entities.
binary_sensors map ( Optional )
A list of all binary sensors configured for this connection.
device_class string ( Optional )
The type/class to be used for the UI.
input_type string ( Optional , default: coil )
Type of request discrete_input , coil , holding or input
slave_count integer ( Optional )
Identical to virtual_count .
virtual_count integer ( Optional )
Generate count+1 binary sensors (master + slaves). Addresses are automatically incremented. The parameter simplifies configuration and provides a much better performance by not using count+1 requests but a single request.
ID that uniquely identifies the entity. Slaves will automatically be given a unique_id of <<unique_id>>_<<slave_index>>. If two sensors have the same unique ID, Home Assistant will raise an exception.
# Example yaml: typical binary_sensor modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 binary_sensors : - name : my_relay address : 100 slave : 1
# Example yaml: binary_sensor with all options modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 binary_sensors : - name : my_relay address : 100 device_class : door input_type : coil scan_interval : 15 slave : 1 slave_count : 0 unique_id : my_relay
# Example of 10 identical binary_sensor modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 binary_sensors : - name : my_relay address : 100 slave : 1 slave_count : 10 unique_id : my_relay
This configuration will poll coil addresses 100 to 110 every 15 seconds and update the binary_sensors: my_relay
and my_relay_1 to my_relay_10 .
The master configuration like device_class are automatically copied to the slaves.
The Modbus climate platform allows you to monitor a thermostat or heaters as well as set a target temperature, HVAC action, HVAC mode, swing mode, and fan state.
climates map ( Optional )
A list of all climate entities in this modbus instance.
temperature_unit list ( Optional , default: C )
Temperature unit: C or F.
C
Celsius
F
Fahrenheit
precision integer ( Optional , default: 0 )
Number of valid decimals for temperature.
temp_step float ( Optional , default: 0.5 )
Step size target temperature.
max_temp integer ( Optional , default: 35 )
Maximum setpoint for target temperature.
min_temp integer ( Optional , default: 5 )
Minimum setpoint for target temperature.
count integer ( Optional )
Number of registers to read to fetch the current temperature. only valid for data_type: custom and data_type: string , for other data types count is automatically calculated.
data_type list ( Optional , default: int16 )
Response representation when reading the current temperature register(s).
custom
user defined format, structure: and count: must be configured.
float16
16 bit signed float (1 register holds 1 value).
float32
32 bit signed float (2 registers holds 1 value).
float64
64 bit signed float (4 register holds 1 value).
int
DEPRECATED is silently converted to int16
int16
16 bit signed integer (1 register holds 1 value).
int32
32 bit signed integer (2 registers holds 1 value).
int64
64 bit signed integer (4 registers holds 1 value).
string
set of 8 bit characters, count: must be configured.
uint
DEPRECATED is silently converted to uint16
uint16
16 bit unsigned integer (1 register holds 1 value).
uint32
32 bit unsigned integer (2 registers holds 1 value).
uint64
64 bit unsigned integer (4 registers holds 1 value).
input_type list ( Optional , default: holding )
Modbus register type for current temperature.
holding
Holding register.
input
Input register.
scale float ( Optional , default: 1 )
Scale factor ( output = scale * value + offset) for setting target and current temperature. Cannot be used together with current_temp_scale or `target_temp_scale.
offset float ( Optional , default: 0 )
Final offset for target and current temperature ( output = scale * value + offset). Cannot be used together with current_temp_offset or target_temp_offset .
current_temp_scale float ( Optional , default: 1.0 )
Scale factor for current temperature (output = current_temp_scale * value + current_temp_offset ). Cannot be used together with scale
current_temp_offset float ( Optional , default: 0.0 )
Offset for current temperature (output = current_temp_scale * value + current_temp_offset ). Cannot be used together with offset .
target_temp_scale float ( Optional , default: 1.0 )
Scale factor for target temperature ( output = target_temp_scale * value + target_temp_offset ). Cannot be used together with scale`.
target_temp_offset float ( Optional , default: 0.0 )
Offset for target temperature ( output = target_temp_scale * value + target_temp_offset ). Cannot be used together with offset`.
target_temp_register integer | list Required
Register address for target temperature (Setpoint). Using a list, it is possible to define one register for each of the available HVAC Modes. The list has to have a fixed size of 7 registers corresponding to the 7 available HVAC Modes, as follows: Register 1: HVAC AUTO mode ; Register 2: HVAC Cool mode ; Register 3: HVAC Dry mode ; Register 4: HVAC Fan only mode ; Register 5: HVAC Heat mode ; Register 6: HVAC Heat Cool mode ; Register 7: HVAC OFF mode . It is possible to set duplicated values for the modes where the devices don’t have a related register.
target_temp_write_registers boolean ( Optional , default: false )
If true use write_registers for target temperature ( target_temp_register ), else use write_register .
structure string ( Optional )
If data_type: custom is specified a double-quoted Python struct is expected, to format the string to unpack the value. See Python documentation for details. Example: >i .
f
swap list ( Optional , default: none )
Swap the order of bytes/words, not valid with custom and datatype: string when setting target temperature
byte
Swap bytes AB -> BA.
word
Swap word ABCD -> CDAB, not valid with data types: int16 , uint16
word_byte
Swap word ABCD -> DCBA, not valid with data types: int16 , uint16
hvac_action_register map ( Optional )
Configuration of register for HVAC action
Address of HVAC action register.
input_type string ( Optional , default: holding )
Type of register, either holding or input
values map Required
Mapping between the register values and HVAC actions
action_off integer | list ( Optional )
Value corresponding to HVAC Off action.
action_cooling integer | list ( Optional )
Value corresponding to HVAC Cooling action.
action_defrosting integer | list ( Optional )
Value corresponding to HVAC Defrosting action.
action_drying integer | list ( Optional )
Value corresponding to HVAC Drying action.
action_fan integer | list ( Optional )
Value corresponding to HVAC Fan action.
action_heating integer | list ( Optional )
Value corresponding to HVAC Heating action.
action_idle integer | list ( Optional )
Value corresponding to HVAC Idle action.
action_preheating integer | list ( Optional )
Value corresponding to HVAC Preheating action.
hvac_mode_register map ( Optional )
Configuration of register for HVAC mode
Address of HVAC mode register.
write_registers boolean ( Optional , default: false )
Request type for setting HVAC mode, use write_registers if true else write_register . If more than one value is specified for a specific mode, only the first one is used for writing to the register.
Mapping between the register values and HVAC modes
state_off integer | list ( Optional )
Value corresponding to HVAC Off mode. If the On/Off state handled on a different address and/or register the state_off state should be omitted from your configuration
state_heat integer | list ( Optional )
Value corresponding to HVAC Heat mode.
state_cool integer | list ( Optional )
Value corresponding to HVAC Cool mode.
state_auto integer | list ( Optional )
Value corresponding to HVAC Auto mode.
state_dry integer | list ( Optional )
Value corresponding to HVAC Dry mode.
state_fan_only integer | list ( Optional )
Value corresponding to HVAC Fan only mode.
state_heat_cool integer | list ( Optional )
Value corresponding to HVAC Heat/Cool mode.
fan_mode_register map ( Optional )
Configuration of register for Fan mode
address integer | list Required
Address of Fan mode register. (int to call write_register, list of 1 int to call write_registers)
Mapping between the register values and Fan modes This is typically used to control one of: Speed, Direction or On/Off state.
state_fan_on integer ( Optional )
Value corresponding to Fan On mode.
state_fan_off integer ( Optional )
Value corresponding to Fan Off mode.
state_fan_low integer ( Optional )
Value corresponding to Fan Low mode.
state_fan_medium integer ( Optional )
Value corresponding to Fan Medium mode.
state_fan_high integer ( Optional )
Value corresponding to Fan High mode.
state_fan_auto integer ( Optional )
Value corresponding to Fan Auto mode.
state_fan_top integer ( Optional )
Value corresponding to Fan Top mode.
state_fan_middle integer ( Optional )
Value corresponding to Fan Middle mode.
state_fan_focus integer ( Optional )
Value corresponding to Fan Focus mode.
state_fan_diffuse integer ( Optional )
Value corresponding to Fan Diffuse mode.
hvac_onoff_coil integer ( Optional )
Address of On/Off state. Only use this setting if your On/Off state is not handled as an HVAC mode. When zero is read from this coil, the HVAC state is set to Off, otherwise the hvac_mode_register dictates the state of the HVAC. If no such coil is defined, it defaults to Auto. When the HVAC mode is set to Off, the value 0 is written to the coil, otherwise the value 1 is written. Cannot be used with hvac_onoff_register .
hvac_onoff_register integer ( Optional )
Address of On/Off state. Only use this setting if your On/Off state is not handled as an HVAC mode. When zero is read from this register, the HVAC state is set to Off, otherwise the hvac_mode_register dictates the state of the HVAC. If no such register is defined, it defaults to Auto. When the HVAC mode is set to Off, the value 0 is written to the register, otherwise the value 1 is written.
hvac_on_value integer ( Optional )
The value that will be written to the hvac_onoff_register to turn the HVAC system on. If not specified, the default value is 1.
hvac_off_value integer ( Optional )
The value that will be written to the hvac_onoff_register to turn the HVAC system off. If not specified, the default value is 0.
swing_mode_register map ( Optional )
Configuration of the register for swing mode
Address of swing mode register. (int to call write_register, list of 1 int to call write_registers). - Reading done through holding register
Mapping between the register values and swing modes
swing_mode_state_on integer ( Optional )
Value corresponding to swing mode on.
swing_mode_state_off integer ( Optional )
Value corresponding to swing mode off.
swing_mode_state_horizontal integer ( Optional )
Value corresponding to swing mode horizontal.
swing_mode_state_vertical integer ( Optional )
Value corresponding to swing mode vertical.
swing_mode_state_both integer ( Optional )
Value corresponding to Swing mode both.
If true use write_registers to control the On/Off state ( hvac_onoff_register ), else use write_register . Note that it is not yet possible to control the On/Off state via a coil.
# Example configuration.yaml entry modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 climates : - name : " Watlow F4T" address : 0x6BC2 input_type : holding count : 1 data_type : custom max_temp : 35 min_temp : 15 offset : 0 precision : 1 scale : 0.1 max_temp : 30 structure : " >f" target_temp_register : 2782 target_temp_write_registers : true temp_step : 1 temperature_unit : C
The modbus cover platform allows you to control covers (such as blinds, a roller shutter, or a garage door).
At the moment, platform cover support the opening and closing of a cover. You can control your covers either using coils or holding registers.
Cover that uses input_type: coil is not able to determine intermediary states such as opening and closing. Coil stores only two states — “0” means cover closed, and “1” implies cover open. To allow detecting intermediary states, there is an optional status_register attribute. It will enable you to write your command (e.g., to open a cover) into a coil, and read current cover status back through the register. Additionally, you can specify values for state_open , state_opening , state_closed , and state_closing attributes. These will be matched with the value read from the status_register .
If your cover uses input_type: holding (default) to send commands, it can also read the intermediary states. To adjust which value represents what state, you can fine-tune the optional state attributes, like state_open . These optional state values are also used for specifying values written into the register. If you specify an optional status_register attribute, cover states will be read from status_register instead of the register used for sending commands.
covers map Required
A list of all cover entities configured for this connection.
device_class device_class ( Optional , default: None )
The type/class of the cover to set the icon in the frontend.
Cover register type.
state_open integer ( Optional , default: 1 )
A value in status_register or register representing an open cover. If your configuration uses the register attribute, this value will be written into the holding register to open the cover.
state_closed integer ( Optional , default: 0 )
A value in status_register or register representing a closed cover. If your configuration uses the register attribute, this value will be written into the holding register to close the cover.
state_opening integer ( Optional , default: 2 )
A value in status_register or register representing an opening cover. Note that this state should be also supported on your connected Modbus cover. If it won’t report the state, this state won’t be detected.
state_closing integer ( Optional , default: 3 )
A value in status_register or register representing a closing cover. Note that this state should be also supported on your connected Modbus cover. If it will not report the state, this state won’t be detected.
status_register integer ( Optional )
Address of register, from which all the cover states will be read. If you specified register attribute, and not status_register attribute, your main register will also be used as a status register.
status_register_type list ( Optional )
Cover status register type (holding, input), default holding.
# Example configuration.yaml entry modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 covers : - name : Door1 device_class : door input_type : coil address : 117 state_open : 1 state_opening : 2 state_closed : 0 state_closing : 3 status_register : 119 status_register_type : holding - name : " Door2" address : 118
This example shows a configuration for a Modbus cover controlled using a coil. Intermediary states like opening/closing are not supported. The cover state is polled from Modbus every 10 seconds.
modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 covers : - name : Door1 slave : 1 coil : 1 device_class : door scan_interval : 10 - name : Door2 slave : 2 coil : 2 device_class : door scan_interval : 10
This example shows a configuration for a Modbus cover controlled using a coil. Actual cover state is read from the status_register . We’ve also specified register values to match with the states open/opening/closed/closing. The cover state is polled from Modbus every 10 seconds.
modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 covers : - name : Door1 slave : 1 device_class : door scan_interval : 10 coil : 1 status_register : 1 status_register_type : input state_opening : 1 state_open : 2 state_closing : 3 state_closed : 4
This example shows a configuration for a Modbus cover controlled using a holding register, from which we also read current cover state. We’ve also specified register values to match with the states open/opening/closed/closing. The cover state is polled from Modbus every 10 seconds.
modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 covers : - name : Door1 slave : 1 device_class : door scan_interval : 10 register : 1 state_opening : 1 state_open : 2 state_closing : 3 state_closed : 4
This example shows a configuration for a Modbus cover controlled using a holding register. However, cover state is read from a status_register . In this case, we’ve specified only values for state_open and state_closed , for the rest, default values are used. The cover state is polled from Modbus every 10 seconds.
modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 covers : - name : Door1 slave : 1 device_class : door scan_interval : 10 register : 1 status_register : 2 register_type : holding state_open : 1 state_closed : 0
The modbus fan platform allows you to control Modbus coils or registers.
fans map Required
A list of all fan entities in this modbus instance.
command_on integer ( Optional , default: 1 )
Value to write to turn on the fan.
command_off integer ( Optional , default: 0 )
Value to write to turn off the fan.
write_type list ( Optional , default: holding )
Type of write request.
write_register is called.
holdings
write_registers is called.
coil
write_coil is called.
coils
write_coils is called.
verify map ( Optional )
Read from Modbus device to verify fan. If used without attributes, it uses the toggle register configuration. If omitted, no verification is done, but the state of the fan is set with each toggle.
address integer ( Optional , default: write address )
Address to read from.
Delay between write and verify.
input_type list ( Optional )
Type of address.
same as write_type
Coil (1bit relay).
discrete
Discret input (1bit relay).
state_on integer ( Optional )
Value when the fan is on.
same as command_on
state_off integer ( Optional )
Value when the fan is off.
same as command_off
# Example configuration.yaml entry modbus : - type : tcp host : IP_ADDRESS port : 502 fans : - name : " Fan1" address : 13 write_type : coil - name : " Fan2" slave : 2 address : 14 write_type : coil verify : - name : " Register1" address : 11 command_on : 1 command_off : 0 verify : input_type : holding address : 127 state_on : 25 state_off : 1
The modbus light platform allows you to control Modbus coils or registers.
lights map Required
A list of all light entities in this modbus instance.
Value to write to turn on the light.
Value to write to turn off the light.
brightness_address integer ( Optional , default: None )
Address to read/write color brightness.
color_temp_address integer ( Optional , default: None )
Address to read/write color temperature.
min_temp integer ( Optional , default: 2000 )
Minimal level of color temperature in Kelvin.
max_temp integer ( Optional , default: 7000 )
Maximal level of color temperature in Kelvin.
Read from Modbus device to verify the light. If used without attributes, it uses the toggle register configuration. If omitted no verification, is done, but the state of the light is set with each toggle.
address integer ( Optional )
Same as address
delay between write and verify.
Type of address (holding/coil/discrete/input).
Same as write_type
Discrete inout (1bit relay).
Value when the light is on.
Same as command_on
Value when the light is off.
Same as command_off
# Example configuration.yaml entry modbus : - type : tcp host : IP_ADDRESS port : 502 lights : - name : " light1" address : 13 write_type : coil - name : " light2" slave : 2 address : 14 write_type : coil brightness_address : 1006 verify : - name : " light3" slave : 2 address : 14 write_type : coil brightness_address : 1006 color_temp_address : 2006 - name : " light4" slave : 2 address : 14 write_type : coil brightness_address : 1006 color_temp_address : 2006 min_temp : 2500 max_temp : 5500 verify : - name : " Register1" address : 11 command_on : 1 command_off : 0 verify : input_type : holding address : 127 state_on : 25 state_off : 1
The modbus sensor allows you to gather data from Modbus registers.
sensors map Required
A list of all sensors in this modbus instance.
Number of registers to read. only valid for data_type: custom and data_type: string , for other data types count is automatically calculated.
Response representation.
The type/class of the sensor to set the icon in the frontend.
Modbus register type for sensor.
min_value float ( Optional )
The minimum allowed value of a sensor. If value < min_value –> min_value. Can be float or integer
max_value float ( Optional )
The maximum allowed value of a sensor. If value > max_value –> max_value. Can be float or integer
nan_value string ( Optional )
If a Modbus sensor has a defined NaN value, this value can be set as a hex string starting with 0x containing one or more bytes (for example, 0xFFFF or 0x80000000 ) or provided as an integer directly. If triggered, the sensor becomes unknown . Please note that the hex to int conversion for nan_value does currently not obey home-assistants Modbus encoding using the data_type , structure , or swap arguments.
zero_suppress float ( Optional )
Suppress values close to zero. If -zero_suppress <= value <= +zero_suppress –> 0. Can be float or integer
Final offset (output = scale * value + offset).
Number of valid decimals.
Scale factor (output = scale * value + offset).
Generates x+1 sensors (master + slaves), allowing read of multiple registers with a single read message.
state_class string ( Optional )
The state_class of the sensor.
Swap the order of bytes/words, not valid with custom and datatype: string
unit_of_measurement string ( Optional )
Unit to attach to value.
ID that uniquely identifies the entity. If two sensors have the same unique ID, Home Assistant will raise an exception.
Note
If you specify scale or offset as floating point values, double precision floating point arithmetic will be used to calculate final value. This can cause loss of precision for values that are larger than 2^53.
# Example configuration.yaml entry modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 sensors : - name : Sensor1 unit_of_measurement : °C slave : 1 address : 100 - name : Sensor2 unit_of_measurement : mg address : 110 count : 2 - name : Sensor3 unit_of_measurement : °C slave : 1 address : 120 input_type : input data_type : float scale : 0.01 offset : -273.16 precision : 2
Example temperature sensor with a default scan interval:
modbus : - name : hub1 type : tcp host : IP_ADDRESS port : 502 sensors : - name : Room_1 slave : 10 address : 0x9A input_type : holding unit_of_measurement : °C state_class : measurement count : 1 scale : 0.1 offset : 0 precision : 1 data_type : integer
The modbus switch platform allows you to control Modbus coils or registers.
switches map Required
A list of all switches in this modbus instance.
Value to write to turn on the switch.
Value to write to turn off the switch.
Read from Modbus device to verify switch. If used without attributes, it uses the toggle register configuration. If omitted, no verification is done, but the state of the switch is set with each toggle.
Same as write address
state_on integer | list ( Optional )
Value(s) when switch is on. The value must be an integer or a list of integers.
Value(s) when switch is off. The value must be an integer or a list of integers.
# Example configuration.yaml entry modbus : - type : tcp host : IP_ADDRESS port : 502 switches : - name : Switch1 address : 13 write_type : coil - name : Switch2 slave : 2 address : 14 write_type : coil verify : - name : Register1 address : 11 command_on : 1 command_off : 0 verify : input_type : holding address : 127 state_on : 25 state_off : 1
Some parameters exclude other parameters, the following tables show what can be combined:
Datatype: custom string *16 *32 *64 count Yes Yes No No No structure Yes No No No No slave_count No No Yes Yes Yes virtual_count No No Yes Yes Yes swap: byte No No Yes Yes Yes swap: word No No No Yes Yes swap: word_byte No No No Yes Yes
The Modbus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload Modbus configuration ( modbus.reload )
Reloads the Modbus configuration from your YAML configuration.
Stop hub ( modbus.stop )
Stops a Modbus hub and closes its connection.
Write coil ( modbus.write_coil )
Writes a state to one or more Modbus coils.
Write register ( modbus.write_register )
Writes a value to one or more Modbus holding registers.
For an overview of every action across all integrations, see the actions reference .
Opening an issue
When opening an issue, please add your current configuration (or a scaled down version), with at least:
the modbus configuration lines
the entity lines (such as sensor)
In order for the developers better to identify the problem, please add the
following lines to configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
logger : default : warning logs : homeassistant.components.modbus : debug pymodbus : debug
and restart Home Assistant, reproduce the problem, and include the log in the issue.
Building on top of modbus
The only recommended way is to inherit the entities needed.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Modbus integration was introduced in Home Assistant pre 0.7, and it's used by
3.1% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
