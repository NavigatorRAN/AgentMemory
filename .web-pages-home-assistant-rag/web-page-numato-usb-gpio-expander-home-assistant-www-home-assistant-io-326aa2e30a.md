---
source_url: "https://www.home-assistant.io/integrations/numato"
final_url: "https://www.home-assistant.io/integrations/numato"
canonical_url: "https://www.home-assistant.io/integrations/numato/"
source_handle: "web:www-home-assistant-io:326aa2e30a08"
source_section: "integrations-numato"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3d150810e818018a645ed42c1c4f58c8aa454e6f70a46558b65f3bd570997646"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Numato USB GPIO Expander - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/numato
- Final URL: https://www.home-assistant.io/integrations/numato
- Canonical URL: https://www.home-assistant.io/integrations/numato/
- Fetched at: 2026-06-28T03:04:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Numato GPIO expander into Home Assistant.

## Extracted Text

On this page
Binary sensor
Sensor
Switch
IO ports
Device IDs
Configure the Device ID
The Numato USB GPIO Expander integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the base for all related GPIO platforms of the
Numato 32 Port USB GPIO expander :
The whole configuration of all Numato devices is located in the general setup
of this integration. The following minimalistic example configures a couple of
binary_sensor, switch and sensor ports for a single device with ID 0.
numato : devices : - id : 0 binary_sensors : ports : 2 : Window Livingroom Open 3 : Window Livingroom Glassbreak 4 : Doorbell sensors : ports : 1 : name : Soil Moisture Ficus switches : ports : 5 : Relay Light Outdoor 6 : Relay Circulation Pump 7 : Door Opener
Configuration Variables
Looking for your configuration file?
discover list ( Optional )
List of OS device files (/dev/…) to try during discovery
Default:
List of /dev/ttyACM0 .. /dev/ttyACM9
devices list Required
List of Numato 32 Port USB GPIO devices.
id integer Required
ID configured in the device (not the Linux device since this can change).
binary_sensors map
Configuration of ports for the binary_sensor platform
invert_logic boolean ( Optional , default: false )
Whether to invert the logic, so a high voltage level is interpreted as false.
ports map Required
Map of port numbers to names.
port: name string Required
The port numbers and corresponding names.
sensors map
Configuration of ports for the sensor platform
Map of port numbers to ADC configurations.
port: adc_config map Required
The port number and corresponding ADC configuration.
name string Required
Name of the ADC sensor port.
source_range list ( Optional , default: [0, 1024] )
Range within the ADC’s resolution to map values from.
destination_range list ( Optional , default: [0.0, 100.0] )
Range to map values from the source range to in a linear fashion.
unit string ( Optional , default: % )
Unit of the destination values.
switches map
Whether to invert the logic, so a value of true leads to a low voltage level at the output.
The numato binary_sensor platform allows you to operate the GPIOs of your
Numato 32 port USB GPIO expander in binary input mode.
Caution
As the Numato devices do not have internal pull-up or pull-down circuitry,
be careful not to destroy a port by creating a short circuit. Refer to the
Numato documentation
on how to connect a switch to an input port, for example.
The numato sensor platform allows you to operate some GPIOs of your USB GPIO
expander in analog input mode.
The Numato device has several built-in analog-digital-converters (ADCs) to
convert a voltage level between VCC and GND into a 10-bit integer value. Read
the IO Ports section for constraints on the ports to use.
By default, the ADC’s whole 10-bit range will be mapped to a float value between
0.0 and 1.0. Use the optional source_range to map from a specific range and
the destination_range to specify the value range to represent the entity
state.
The numato switch platform allows you to operate the GPIOs of your
Numato 32 port USB GPIO expander in output mode.
The IO port numbers used in this configuration refer to the port numbers
printed on the PCB. Note that the Sensor platform can be configured on ports
1-7 only. These are the only ports on the 32 port device equipped with an ADC.
For details about the GPIO layout, take a look at the Numato 32 GPIO
documentation .
This integration uses an internal device ID to identify the device, which is
not the Linux device path. The Linux device path (e.g., /dev/ttyACM0 ) can
change, for example, when you disconnect and re-connect the device or if you
connect the device to a different USB port.
The internal device ID is 0 by default. If you have only one device, you should
not need to care about changing it. If you have multiple devices, their IDs are
shown in the console log during startup of Home Assistant.
Configure your Numato device’s ID with the following steps. Though you can use
any terminal emulator to connect to and communicate with your device, the
following steps are based on using GNU Screen . On a Debian or Ubuntu-based OS
install Screen like sudo apt install screen .
Plug in only the one device to assign an id to so it’ll get /dev/ttyACM0
Wait a couple of seconds as your Linux OS may be trying to identify the
device as a Modem right after plugging it in
Run screen /dev/ttyACM0
Type id get to see the current ID
Type id set 00000005 and hit enter to assign ID 5
Type id get to validate and expect 00000005 as a reply
Quit screen with: Ctrl-a + \ and confirm with y
Note that during communication with the device the ID values are strictly 32
bit hexadecimal numbers (8 hex digits) with leading 0 padding.
Hint: It is a good practice to put sticky labels with the IDs onto the PCBs in
order to avoid confusion of devices and their port configuration since this
could easily destroy your device.
Warning
Numato devices used by Home Assistant are expected to be exclusive to Home
Assistant and remain permanently connected.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Numato USB GPIO Expander hub was introduced in Home Assistant 0.110, and it's used by
3 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@clssn
Categories
DIY
Back to top
