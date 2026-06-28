# QwikSwitch QSUSB - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/qwikswitch
- Final URL: https://www.home-assistant.io/integrations/qwikswitch
- Canonical URL: https://www.home-assistant.io/integrations/qwikswitch/
- Fetched at: 2026-06-28T03:10:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the QwikSwitch QSUSB Hub into Home Assistant.

## Extracted Text

On this page
Configuration
QwikSwitch Events
Qwikswitch sensors
Switch
Related topics
The QwikSwitch QSUSB integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the main integration to integrate various QwikSwitch devices with Home Assistant. The integration requires the QSUSB Modem device and connects to the QS Mobile application.
There is currently support for the following device types within Home Assistant:
Binary sensor
Light
Sensor
The qwikswitch integration discovers all devices from QS Mobile. Currently, Relays and LED dimmers are discovered in Home Assistant. Relay devices are lights by default, and can be configured as switches .
To use the QwickSwitch integration in your installation, add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry qwikswitch : url : http://127.0.0.1:2020
Configuration Variables
Looking for your configuration file?
url string Required
The URL including the port of your QwikSwitch hub.
dimmer_adjust float ( Optional , default: 1 )
A decimal value to adjust the brightness of the dimmer exponentially. Increasing this value allows dimmers that reach full brightness with low values in QS Mobile to appear more linear in Home Assistant. Recommended values between 1 and 2 and the default is 1.
button_events string ( Optional , default: TOGGLE,SCENE EXE,LEVEL )
A comma-separated list of button types that will generate events. See [QwikSwitch Events] for detail.
switches list ( Optional )
A list of device QS_id’s that should be switches, and not lights (for example, ['@0dev01', '@0dev02'] )
sensors list ( Optional )
A dictionary of sensors.
name Required
The sensor name from which the entity_id will be derived.
id string Required
A QS_Id
type string Required
The Qwikswitch sensor type. These could include:
imod (binary_sensor, up to 6 channels)
door (binary_sensor, single channel)
qwikcord (Channel 1 = CTavg, Channel 2 = CTsum)
channel integer ( Optional , default: 1 )
The channel of interest. Refer to type above.
invert string ( Optional , default: false )
Invert the open/close state. Only applicable to binary_sensors
class string ( Optional , default: door )
The class or binary_sensor. Only applicable to binary_sensors.
QwikSwitch devices (that is, transmitter buttons) will fire events on the Home Assistant bus. These events can then be used as triggers for any automation action, as follows:
automation : - alias : " Action - Respond to A button press" triggers : - trigger : event event_type : qwikswitch.button.@12df34
event_type names should be in the format qwikswitch.button.@ QS_id . where @ QS_id will be captured in the Home Assistant log when pressing the button. Alternatively, you can also get the device ID from the QS Mobile application or by using the listen API call by browsing to http://127.0.0.1:2020/&listen and then pressing the button.
The full packet from the QSUSB API will be passed as data
By default events will be fired if the value in the command (cmd) field of the listen packet equals:
TOGGLE - Normal QwikSwitch Transmitter button
SCENE EXE - QwikSwitch Scene Transmitter buttons
LEVEL - QwikSwitch OFF Transmitter buttons
The list of recognized commands can be extended for Keyfobs, door sensors, and PIR transmitters with the button_events configuration option. button_events can be a list or comma separated list of additional commands that will fire Home Assistant events. By default, it is: TOGGLE,SCENE EXE,LEVEL.
On some QS Mobile servers button events are only generated for switches added to the QS Mobile application, so it might be best to test button presses through the /&listen API
The sensor configuration is a list of sensors. Depending on the type of sensor, it will be a sensor or binary_sensor.
Example sensor configuration:
qwikswitch : ... sensors : - name : door sensor id : " @id03" type : door - name : Imod 1 sensor id : " @id02" channel : 1 type : imod - name : Imod 2 sensor id : " @id02" channel : 2 type : imod
The qwikswitch platform allows you to control your QwikSwitch relays as switches from within Home Assistant.
If the device name in the QS Mobile application ends with Switch it will be created as a switch, otherwise as a light.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The QwikSwitch QSUSB integration was introduced in Home Assistant 0.20, and it's used by
5 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kellerza
Categories
Hub
Back to top
