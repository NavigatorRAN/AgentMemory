# EnOcean - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/enocean
- Final URL: https://www.home-assistant.io/integrations/enocean
- Canonical URL: https://www.home-assistant.io/integrations/enocean/
- Fetched at: 2026-06-28T02:40:36Z
- Content type: text/html; charset=UTF-8

## Description

Connect EnOcean devices to Home Assistant

## Extracted Text

On this page
Configuration
Binary sensor
Automation example
Light
Sensor
Power sensor
Humidity sensor
Temperature sensor
Window handle
Switch
Related topics
The EnOcean standard is supported by many different vendors. There are switches and sensors of many different kinds, and typically they employ energy harvesting to get power such that no batteries are necessary.
The EnOcean integration adds support for some of these devices. You will need a controller like the USB300 in order for it to work.
There is currently support for the following device types within Home Assistant:
Binary sensor - Wall switches
Sensor - Power meters, temperature sensors, humidity sensors and window handles
Light - Dimmers
However, due to the wide range of message types, not all devices will work without code changes.
The following devices have been confirmed to work out of the box:
Eltako FUD61 dimmer
Eltako FT55 battery-less wall switch
Jung ENOA590WW battery-less wall switch
Omnio WS-CH-102-L-rw battery-less wall switch
Permundo PSC234 (switch and power monitor)
EnOcean STM-330 temperature sensor
Hoppe SecuSignal window handle from Somfy
If you own a device not listed here, please check whether your device can talk in one of the listed EnOcean Equipment Profiles (EEP). If it does, it will most likely work. The available profiles are usually listed somewhere in the device manual.
Support for tech-in messages is not implemented.
To add the EnOcean hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select EnOcean .
Follow the instructions on screen to complete the setup.
Despite the UI-based configuration of the hub, the entities are still configured using YAML see next chapters).
This can typically be one of those batteryless wall switches.
Tested with:
Eltako FT55 which uses the EnOcean PTM 215 module
TRIO2SYS Wall switches which uses the EnOcean PTM210 DB module
Omnio WS-CH-102
The following EnOcean Equipment Profiles are supported:
F6-02-01 (Light and Blind Control - Application Style 1)
F6-02-02 (Light and Blind Control - Application Style 2)
To use your EnOcean device, you first have to set up your EnOcean hub and then add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry binary_sensor : - platform : enocean id : [ 0x01 , 0x90 , 0x84 , 0x3C ]
Configuration Variables
Looking for your configuration file?
id list Required
The ID of the device. This is the 4 bytes long number written on the dimmer.
name string ( Optional , default: EnOcean binary sensor )
An identifier for the switch in the frontend.
device_class device_class ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
EnOcean binary sensors have no state, they only generate ‘button_pressed’ events. The event data has following fields:
id : The ID of the device (see configuration).
pushed : 1 for a button press, 0 for a button release.
which : Always 0 when using the single rocket. 0 or 1 when using the dual rocket switch.
onoff : 0 or 1 for either side of the rocket.
Sample automation to switch lights on and off:
# Example automation to turn lights on/off on button release automation : - alias : " Hall light switches" triggers : - trigger : event event_type : button_pressed event_data : id : [ 0xYY , 0xYY , 0xYY , 0xYY ] pushed : 0 actions : - action : " {% if trigger.event.data.onoff %} light.turn_on {% else %} light.turn_off {%endif %}" target : entity_id : " {% if trigger.event.data.which == 1 %} light.hall_left {% else %} light.hall_right {%endif %}"
You can find the event_data id by going to Settings > Developer tools > Events and listening to “button_pressed” events. Then hit a button on the device and you should see an event.
An EnOcean light can take many forms. Currently only one type has been tested: Eltako FUD61 dimmer.
To use your EnOcean device, you first have to set up your EnOcean hub and then add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry light : - platform : enocean id : [ 0x01 , 0x90 , 0x84 , 0x3C ] sender_id : [ 0xFF , 0xC6 , 0xEA , 0x04 ]
sender_id list Required
The Sender ID of the device. This is a 4 bytes long number.
name string ( Optional , default: EnOcean Light )
An identifier for the light in the frontend.
The EnOcean sensor platform currently supports the following device types:
power sensor
humidity sensor
temperature sensor
window handle
# Example configuration.yaml entry sensor : - name : Television platform : enocean id : [ 0x01 , 0x90 , 0x84 , 0x3C ]
The ID of the device. This is the 4 bytes long identifier of your device.
name string ( Optional , default: EnOcean sensor )
An identifier for the sensor in the frontend.
device_class device_class ( Optional , default: powersensor )
This has been tested with a Permundo PSC234 switch, but any device sending EEP A5-12-01 messages will work.
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - name : Television platform : enocean id : [ 0x01 , 0x90 , 0x84 , 0x3C ] device_class : powersensor
Any profile that contains the humidity value at position DB2.7 to DB2.0
A5-04-01 - Temp. and Humidity Sensor, Range 0°C to +40°C and 0% to 100%
A5-04-02 - Temp. and Humidity Sensor, Range -20°C to +60°C and 0% to 100%
A5-10-10 to A5-10-14 - Room Operating Panels
# Example configuration.yaml entry sensor : - name : Bathroom platform : enocean id : [ 0x01 , 0x90 , 0x84 , 0x3C ] device_class : humidity
This sensor has been tested with a generic STM-330 sensor, which is used in most indoor temperature sensor devices.
Any profile that contains an 8-bit temperature at position DB1.7 to DB1.0. 10-bit is not supported.
A5-02-01 to A5-02-1B - Temperature Sensor with various temperature ranges
A5-10-01 to A5-10-14 - Room Operating Panels
A5-10-03 - Temp. Sensor, Set point control
A5-10-10 - Temp. and Humidity Sensor and Set Point
A5-10-12 - Temp. and Humidity Sensor, Set Point and Occupancy Control
Check the manual of your temperature sensor to figure out what EEP it uses.
If you do not know, make an educated guess and check the reported values. It’s easiest to validate the temperature at the boundaries of the range, so maybe put the sensor into the fridge for a while.
# Example configuration.yaml entry sensor : - name : Living Room platform : enocean id : [ 0x01 , 0x90 , 0x84 , 0x3C ] device_class : temperature
The temperature sensor supports these additional configuration properties.
min_temp integer ( Optional , default: 0 )
The minimal temperature in °C your sensor supports.
max_temp integer ( Optional , default: 40 )
The maximum temperature in °C your sensor supports.
range_from integer ( Optional , default: 255 )
The range value your sensor reports for min_temp
range_to integer ( Optional , default: 0 )
The range value your sensor reports for max_temp
Note that the default configuration values of range_from and range_to are not typos, the range is backwards for most sensors.
However, some EEPs have a different, inverted range, which goes from 0 to 250. This includes the following EEPs:
A5-04-01
A5-04-02
A5-10-10 to A5-10-14
A5-20-01 - Battery powered actuator (bi-dir)
Adapt the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] for those sensors:
# Example configuration.yaml entry for EEP A5-10-10 sensor : - name : Living Room platform : enocean id : [ 0x01 , 0x90 , 0x84 , 0x3C ] device_class : temperature range_from : 0 range_to : 250
As of now, the Hoppe SecuSignal window handle from Somfy has been successfully tested. However, any mechanical window handle that follows the EnOcean RPS telegram spec F6 10 00 (Hoppe AG) is supported.
To configure a window handle, add the following code to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry for window handle EEP F6-10-00 sensor : - name : Living Room Window Handle platform : enocean id : [ 0xDE , 0xAD , 0xBE , 0xEF ] device_class : windowhandle
The configuration does not have any optional parameters.
The window handle sensor can have the following states:
closed : The window handle is in closed position (typically down, or 6 o’clock)
open : The window handle is in open position (typically left or right, or 3 o’clock or 9 o’clock)
tilt : The window handle is in tilt position (typically up or 12 o’clock)
An EnOcean switch can take many forms. Currently, only a few types have been tested: Permundo PSC234 and Nod On SIN-2-1-01.
# Example configuration.yaml entry switch : - platform : enocean id : [ 0x01 , 0x90 , 0x84 , 0x3C ]
The ID of the device. This is a 4 bytes long number.
name string ( Optional , default: EnOcean Switch )
An identifier for the switch.
channel integer ( Optional , default: 0 )
The number of the channel (typically 0 or 1) for the output channel to switch.
# Example entries for a switch with 2 outputs (channels), e.g., the Nod On SIN-2-1-01 switch nodon01_0 : - platform : enocean id : [ 0x05 , 0x04 , 0x03 , 0x02 ] name : enocean_nodon01_0 channel : 0 switch nodon01_1 : - platform : enocean id : [ 0x05 , 0x04 , 0x03 , 0x02 ] name : enocean_nodon01_1 channel : 1
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EnOcean hub was introduced in Home Assistant 0.21, and it's used by
437 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
