# Pilight - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pilight
- Final URL: https://www.home-assistant.io/integrations/pilight
- Canonical URL: https://www.home-assistant.io/integrations/pilight/
- Fetched at: 2026-06-28T03:08:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Pilight within Home Assistant.

## Extracted Text

On this page
Configuration
Binary sensor
Full example
Sensor
Example: Weather station
Switch
Examples
Light
Example
Troubleshooting
Related topics
Pilight is a modular and open source solution to communicate with 433 MHz devices and runs on various small form factor computers. A lot of common protocols are already available.
This pilight hub connects to the pilight-daemon via a socket connection to receive and send codes. Thus Home Assistant does not have to run on the computer in charge of the RF communication.
The received and supported RF codes are put on the event bus of Home Assistant and are therefore directly usable by other integrations (e.g., automation). Additionally a send action is provided to send RF codes.
There is currently support for the following device types within Home Assistant:
To integrate pilight into Home Assistant, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry pilight :
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: 127.0.0.1 )
The IP address of the computer running the pilight-daemon, e.g., 192.168.1.32.
port integer ( Optional , default: 5001 )
The network port to connect to, see also: ( https://manual.pilight.org/development/socket/ ).
send_delay float ( Optional , default: 0.0 )
You can define a send delay as a fraction of seconds if you experience transmission problems when you try to switch multiple switches at once. This can happen when you use a pilight USB Nano as hardware and switches a whole group of multiple switches on or off. Tested values are between 0.3 and 0.8 seconds depending on the hardware.
whitelist string ( Optional )
You can define a whitelist to prevent that too many unwanted RF codes (e.g., the neighbors weather station) are put on your Home Assistant event bus. All defined subsections have to be matched. A subsection is matched if one of the items are true.
In this example only received RF codes using a daycom or Intertechno protocol are put on the event bus and only when the device id is 42. For more possible settings please look at the receiver section of the pilight API .
A full configuration sample could look like the sample below:
# Example configuration.yaml entry pilight : host : 127.0.0.1 port : 5000 send_delay : 0.4 whitelist : # optional protocol : - daycom - intertechno id : - 42
The pilight binary sensor platform implements the pilight hub binary sensor functionality. There are two types of Pilight binary sensor configuration: a normal sensor which sends the on and off cyclical state and a trigger sensor which sends only a trigger when an event happened (for example lots of cheap PIR motion detectors).
To enable a Pilight binary sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : pilight variable : " state"
variable string Required
The variable name in the data stream that defines the sensor value.
payload string Required
Message payload identifiers. Only if all identifiers are matched the sensor value is set.
name string ( Optional )
Name of the sensor.
payload_on string | float | integer ( Optional )
Variable on value. The integration will recognize this as logical ‘1’.
payload_off string | float | integer ( Optional )
Variable off value. The integration will recognize this as logical ‘0’.
disarm_after_trigger boolean ( Optional , default: false )
Configure sensor as trigger type.
reset_delay_sec integer ( Optional , default: 30 )
Seconds before the sensor is disarmed if disarm_after_trigger is set to true.
A full configuration example could look like this:
# Example configuration.yaml entry binary_sensor : - platform : pilight name : " Motion" variable : " state" payload : unitcode : 371399 payload_on : " closed" disarm_after_trigger : true reset_delay_sec : 30
This pilight sensor platform for 433 MHz devices uses a value in the message payload as the sensor value. Unique identifiers (e.g., uuid ) can be set to distinguish between multiple pilight devices. To use a pilight sensor the pilight Home Assistant hub has to be set up.
To use your sensor via pilight, make sure it is supported and add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : pilight variable : temperature payload : uuid : " 0000-b8-27-eb-f447d3"
name string ( Optional , default: Pilight Sensor )
unit_of_measurement string ( Optional )
Defines the units of measurement of the sensor, if any.
This section shows a real life example how to use values of a weather station.
# Example configuration.yaml entry sensor : - platform : pilight name : " Temperature" variable : " temperature" payload : uuid : 0000-b8-27-eb-f1f72e unit_of_measurement : " °C" - platform : pilight name : " Humidity" variable : " humidity" payload : uuid : 0000-b8-27-eb-f1f72e unit_of_measurement : " %" - platform : pilight name : " Battery" variable : " battery" payload : uuid : 0000-b8-27-eb-f1f72e unit_of_measurement : " %"
The pilight switch platform is issuing 433 MHz commands using pilight to turn a 433 MHz device on or off. The Pilight Home Assistant hub has to be set up.
Additionally, RF commands can be defined that trigger this switch to turn on and off. This allows you to also use the remote shipped with your 433 MHz switch without mixing up the Home Assistant states. You can even define several on/off commands, thus several RF remotes to toggle this switch.
To be really sure that Home Assistant knows the actual state of your device it is recommended to use the RF remote with codes unknown to any of your 433 MHz devices. Thus you use the remote to trigger this switch to send the correct RF code to the device.
To define a Pilight switch, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry switch : - platform : pilight switches : Bed light : on_code : protocol : intertechno_old ' on' : 1 off_code : protocol : intertechno_old ' off' : 1
switches string Required
The list that contains all command switches.
entry list Required
Name of the command switch. Multiple entries are possible.
on_code list Required
The code to turn the device on.
off_code list Required
The code to turn the device off.
on_code_receive list ( Optional )
If given, this command will turn the switch on if it is received by pilight.
off_code_receive list ( Optional )
If given, this command will turn the switch off if it is received by pilight.
Variables for the different codes ( on_code and off_code ):
protocol ( Required ): Protocol to use, e.g., intertechno_old or daycom .
systemcode ( Optional ): The systemcode of the device.
unit ( Optional ): The unit to use (is equivalent to pilight-send --unit ).
unitcode ( Optional ): The unitcode to use (is equivalent to pilight-send --unitcode ).
id ( Optional ): ID of the device
state ( Optional ): 'on' or 'off' has to be in apostrophes to be parsed correctly.
‘off’ ( Optional ): 1 or 0
‘on’ ( Optional ): 1 or 0
For possible code entries, look at the pilight API . All commands allowed by pilight-send can be used. Which means that if, for a certain protocol, there are different parameters used, you should be able to replace the variables above by the proper ones required by the specific protocol. When using the elro_800_switch or mumbi protocol, for example, you will have to replace the variable unit with unitcode or there will be errors occurring.
Variables for the different receive codes ( on_code_receive and off_code_receive ):
echo ( Optional ) Set to true if the on-/off-code should be sent if the given code was received.
This is useful if you have paired your sender directly with the receiver to prevent sending the signal twice.
switch : - platform : pilight switches : Bed light : on_code : protocol : intertechno_old unit : 3 id : 4 ' on' : 1 off_code : protocol : intertechno_old unit : 3 id : 4 ' off' : 1 on_code_receive : protocol : daycom systemcode : 14462 unit : 6 id : 34 state : " on" off_code_receive : protocol : daycom systemcode : 14462 unit : 6 id : 34 state : " off"
Pilight dimmer devices, which can have different brightness values, can be used as a light.
The configuration parameters are the same for dimmers and switches, but dimmers support a minimum and maximum dimming level.
The dimlevel_min and dimlevel_max settings are to be set in the range of 0 to 15 , as used by pilight. Any dimming performed by Home Assistant (most likely in a 0 to 100 range) will be converted as a percentage of the available configured range in Pilight.
lights string Required
The list that contains all command lights.
Name of the command light, which are the same like for switches. Multiple entries are possible.
light : - platform : pilight lights : test2 : dimlevel_min : 2 dimlevel_max : 14 on_code : protocol : kaku_dimmer id : 23298822 unit : 10 ' on' : 1 off_code : protocol : kaku_dimmer id : 23298822 unit : 10 ' off' : 1 on_code_receive : protocol : kaku_dimmer id : 23298822 unit : 10 state : " on" off_code_receive : protocol : kaku_dimmer id : 23298822 unit : 10 state : " off"
A list of tested RF transceiver hardware is available here . This might be useful before buying.
Sending commands is simple when the protocol is known by pilight, but receiving commands can be rather difficult. It can happen that the code is not correctly recognized due to different timings in the sending hardware or the RF receiver. If this happens follow these steps:
Install pilight from source (do not worry that is very easy) and only activate the protocols you are expecting in the pop up menu. This reduces false positives.
Check the real timings of your device + RF receiver by running pilight-debug . Remember the pulslen parameter.
Go to the libs/pilight/protocols/433.92 subfolder of the pilight source code and open the .c file of your protocol. Search for MIN_PULSE_LENGTH , MAX_PULSE_LENGTH and AVG_PULSE_LENGTH . Change the pulse lengths to match your measured one. Recompile and install pilight by re-running $ sudo ./setup.sh .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pilight integration was introduced in Home Assistant 0.26, and it's used by
2 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
DIY
Back to top
