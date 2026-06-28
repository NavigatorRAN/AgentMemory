# 1-Wire - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/onewire
- Final URL: https://www.home-assistant.io/integrations/onewire
- Canonical URL: https://www.home-assistant.io/integrations/onewire/
- Fetched at: 2026-06-28T03:05:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate One wire (1-wire) sensors into Home Assistant.

## Extracted Text

On this page
Supported devices:
Interfacing with the 1-wire bus
Interface adapter setup
Configuration
Options
Entities and attributes
Removing the integration
To remove an integration instance from Home Assistant
Troubleshooting
Temperature reported as 85°C
The 1-Wire integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports sensors that use the 1-wire bus for communication.
Every 1-wire device has a (globally) unique ID that identifies the device on the bus. The first two digits identify a device family and the last 14 digits are a globally unique number given to it during manufacturing.
Different families have different functionality and can measure different quantities.
Each 1-wire component data sheet describes the different properties the component provides. The owfs software adds some extra tools to make it easier for DIY implementers to use the component.
Binary sensors: Family Device Physical Quantity 05 DS2405 1 sensed 4 12 DS2406 2 sensed (sensed.A/B) 4 29 DS2408 8 sensed (sensed.0-7) 4 3A DS2413 2 sensed (sensed.A/B) 4 EF HobbyBoard Hub Branch State 3 4 Select: Family Device Physical Quantity 28 DS18B20 Temperature resolution Sensors: Family Device Physical Quantity 10 DS18S20 Temperature 12 DS2406 Temperature and pressure when using TAI-8570 1 1D DS2423 Counter 20 DS2450 4 x Voltage 22 DS1822 26 DS2438 Temperature, Voltage, Current (pressure when using B1-R1-A, illuminance when using S2-R1-A, humidity when using compatible Honeywell or Humirel sensor) 2 28 DS18B20 Temperature 30 DS2760 Temperature, Voltage, Thermocouple Type K 2 3B DS1825 Temperature 42 DS28EA00 Temperature 7E EDS00xx Temperature/Humidity/Barometric pressure/Light 6 A6 Secondary family code for DS2438 Temperature, Voltage, Current (pressure when using B1-R1-A, illuminance when using S2-R1-A, humidity when using compatible Honeywell or Humirel sensor) 2 EF HobbyBoard Temperature, Humidity, Moisture, Wetness 3 Switches: Family Device Physical Quantity 05 DS2405 1 PIO 4 12 DS2406 2 latches (latch.A/B) and 2 PIOs (PIO.A/B) 4 29 DS2408 8 latches (latch.0-7) and 8 PIOs (PIO.0/7) 4 3A DS2413 2 PIOs (PIO.A/B) 4 EF HobbyBoard Hub Branch Enable, Moisture Sensor Type 3 4 Bridges: Family Device Physical Quantity 1F DS2409 None 5
Notes:
The TAI-8570 Pressure Sensor is based on a 1-wire composite device by AAG Electronica. It contains, above 1-wire components, also a barometer, hygrometer and illuminance sensors. This onewire platform can read and present values from that device, but the sensors will default to disabled 4 .
For hobbyists , it is quite common to use DS2438 or DS2760 families of Smart Battery Monitor as a multipurpose measurement node that can place temperature, humidity, current, thermocouple temperature, and luminosity on the 1-wire bus by just adding some standard components to the DS2438 or DS2760. For different component types, there are ready-made algorithms implemented in owfs. Those are exposed by the owfs software and can be read by this platform. The B1-R1-A/pressure is exposed as a barometric pressure sensor. S2-R1-A/illuminance is presented as an illuminance sensor. For a more detailed description of these properties, refer to the owfs documentation DS2438 , DS2760 .
For these components, the more basic quantities (temperature, VAD, VDD and IAD) are exported as separate sensors. Some of the sensors will default to disabled 4 .
Hobbyboards is a company that has been selling DIY boards of different kinds. The company has been away from the market for some time, so no reference to the boards can be made. This platform has an implementation for some of those.
Some sensors are disabled by default to avoid overloading the bus. These can be activated by opening the integrations page in your configuration, listing your 1-Wire integration devices and updating the entity.
Bridge devices have no sensors . The aux and main branches are searched for additional 1-wire devices during discovery.
Multisensors manufactured by Embedded Data Systems . Currently only EDS0066 (temperature/barometric pressure) and EDS0068 (temperature/humidity/barometric pressure/light) are supported.
The 1-Wire bus can be connected with a remote 1-wire host over a network connection using owfs and owserver.
owserver on Linux hosts is part of the owfs 1-Wire file system . When a 1-wire interface adapter is used, you can access sensors on a remote or local Linux host that is running owserver . owserver by default runs on port 4304. Use the host option to specify the host or IP of the remote server, and the optional port option to change the port from the default.
To add the 1-Wire hub to your Home Assistant instance, use this My button:
1-Wire can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select 1-Wire .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your OWServer instance.
Port
The port of your OWServer instance.
To define options for 1-Wire, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of 1-Wire are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Device selection
The precision of the DS18B20 temperature sensors can be configured for individual devices. The lower the precision, the faster the sensor will respond, but with less accuracy. The selected precision is reflected in the device_path attribute of the sensor entities.
Upon startup of the platform, the 1-wire bus is searched for available 1-wire devices. On Bridge devices, the aux and main branches are recursively searched. For each device that this platform handles (see list of supported devices above), the platform adds one sensor for each physical quantity it measures. The name of the sensor is the device ID with the physical quantity it measures appended. Unsupported sensors are noted with a warning message in the log.
sensor.28.FF5C68521604_temperature
Each sensor will present its value in the state variable and for presentation purposes, rounded to one decimal for analog values and as integers for counts.
Each sensor also exposes some additional attributes.
device_file: /28.FF5C68521604/temperature << Device path in owfs file system (or on Rpi system directory)
raw_value: 31.9375 << The raw measurement numbers as red from device. Not rounded.
unit_of_measurement: °C
friendly_name: 28.FF5C68521604 Temperature
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
A reading of 85°C on a DS18B20 may indicate a valid value, or it may indicate a wiring issue or a loss of power.
85°C is the power-on reset value of the DS18B20 . It can report such a value when its tiny internal capacitor that acts as its power supply is depleted.
There is currently no way to distinguish between a valid and an invalid 85°C value. If such values are reported incorrectly, the first step is to check the wiring (possibly ensuring that the temperature sensors are powered, and not using parasitic power).
If all else fails, then a template can be used to filter out the incorrect values:
{% if states('sensor.28_a05966040000_temperature') | float != 85 %}
{{ states('sensor.28_a05966040000_temperature') }}
{% else %}
None
{% endif %}
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The 1-Wire hub was introduced in Home Assistant 0.12, and it's used by
353 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@garbled1
@epenet
Categories
DIY
Back to top
