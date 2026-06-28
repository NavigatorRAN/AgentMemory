# IHC Controller - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ihc
- Final URL: https://www.home-assistant.io/integrations/ihc
- Canonical URL: https://www.home-assistant.io/integrations/ihc/
- Fetched at: 2026-06-28T02:51:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the IHC integrations with Home Assistant

## Extracted Text

On this page
Auto setup of IHC products
Manual setup
Binary sensor
Manual configuration
Sensor
Light
Switch
List of actions
Related topics
The IHC Controller integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to connect the LK IHC controller to Home Assistant. The controller is sold under other names in different countries - “ELKO Living system” in Sweden and Norway.
There is currently support for the following device types within Home Assistant:
An ihc section must be present in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file and contain the following options:
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry for two IHC controllers ihc : - url : ' http://192.168.1.3' username : YOUR_USERNAME password : YOUR_PASSWORD - url : ' http://192.168.1.4' username : YOUR_USERNAME2 password : YOUR_PASSWORD2
Configuration Variables
Looking for your configuration file?
url string Required
The URL of the IHC Controller.
username string Required
The username for the IHC Controller.
password string Required
The password for the IHC Controller.
auto_setup boolean ( Optional , default: true )
Automatic setup of IHC products.
info boolean ( Optional , default: true )
Shows the IHC “name”, “note” and “position” attributes of each integration. This will make it easier to identify the IHC products within Home Assistant.
If the auto setup is enabled, the ihc integration will automatically find IHC products and insert these as devices in Home Assistant. To disable this set auto_setup to false. See the individual device types for a list of IHC products to be recognized automatically.
Components will get a default name that is a combination of the IHC group and IHC resource id. If you want to change the display names use the Customizing entities .
Each device is associated with an IHC resource id. To manually set up integrations you specify resource ids from the IHC project. The IHC project is the file you edit/upload to the IHC Controller using LK IHC Visual - or similar program if your controller is not the LK brand.
The project file is an XML file and you can view it with any text/XML editor. You can rename it to have the XML extension and use a browser like Chrome or Internet Explorer. The resources are the <airlink_xxx> or <dataline_xxx> elements. Shown as inputs or outputs of products in the IHC application. You can also use inputs and outputs from function blocks. These are the <resource_input> and <resource_output> elements from the project file.
The IHC resource id should be specified as an integer value. In the project file the id will be specified as a hex number.
If you want an easier way to get the IHC resource ids, you can download the Alternative Service View application . The application will show the product tree. You can expand it, select inputs and outputs and when selected you can see the resource id.
See the manual of each device type for configuration options.
Before you can use the IHC Binary Sensor platform, you must set up the IHC integration.
When auto setup is enabled the following products will be found in the IHC project and setup as binary sensors:
Dataline magnet contacts
Dataline Pir sensors
Dataline Pir sensors with twilight detection
Dataline Pir alarm sensor
Dataline smoke detector
Dataline gas detector
Dataline light sensor
To manually configure IHC Binary Sensors insert the “binary_sensor” section in your IHC configuration:
# Example configuration.yaml entry ihc : - url : ' http://192.168.1.3' username : YOUR_USERNAME password : YOUR_PASSWORD info : true binary_sensor : - id : 12345 name : switch_front_door inverting : false note : Magnet contact position : Switch in door type : door
binary_sensor map ( Optional )
List of binary sensors to set up manually.
id integer Required
The IHC resource id.
inverting boolean ( Optional , default: false )
If True the sensor will be inverted.
name string ( Optional )
The name of the sensor.
type string ( Optional )
The binary sensor type. See Home Assistant binary sensor for available types.
note string ( Optional )
Descriptive note
position string ( Optional )
Where is it placed
The resource id should be an id of a boolean IHC resource. For more information about IHC resource ids see Manual Setup .
Before you can use the IHC Sensor platform, you must set up the IHC integration.
When auto setup is enabled the following products will be found in the IHC project and setup as sensors:
Dataline temperature sensor - Will insert 2 temperature sensors
Dataline Humidity - Will insert 1 humidity and 2 temperature sensors (calculated dewpoint)
Dataline Lux - will insert 1 light and 1 temperature sensor
To manually configure IHC sensors insert the “sensor” section in your IHC configuration:
ihc : - url : ' http://192.168.1.3' username : YOUR_USERNAME2 password : YOUR_PASSWORD2 info : true sensor : - id : 12345 name : Temperatur_living_room unit_of_measurement : " °C" note : Floor and wall temp. position : On wall between windows - id : 23456 ...
sensor map ( Optional )
List of sensors to set up manually.
unit_of_measurement string ( Optional )
Defines the unit of measurement of the sensor, if any.
Descriptive note.
Where it is placed.
The resource id should be a IHC float resource. For more information about IHC resource ids see Manual Setup .
Before you can use the IHC Light platform, you must set up the IHC integration.
When auto setup is enabled the following products will be found in the IHC project and setup as light devices:
Wireless lamp outlet dimmer
Wireless dimmer
Wireless combi dimmer 4 buttons
Wireless combi dimmer 4 buttons touch
Wireless combi dimmer 2 buttons touch
Wireless lamp outlet relay
Wireless combi relay 4 buttons
Wireless combi relay 2 buttons
Wireless mobile dimmer
Dataline lamp outlet
To manually configure IHC lights insert the “light” section in your IHC configuration:
ihc : - url : ' http://192.168.1.3' username : YOUR_USERNAME2 password : YOUR_PASSWORD2 info : true light : - id : 12345 name : tablelight - id : 23432
light map ( Optional )
List of lights to set up manually
dimmable boolean ( Optional , default: false )
Set to True if the IHC resource is a light level.
on_id integer ( Optional )
Optional IHC resource id that will be pulsed to turn ON this light.
off_id integer ( Optional )
Optional IHC resource id that will be pulsed to turn OFF this light.
The name of the integration
In the example above 12345 is ihc resource id and “tablelight” is the name. The IHC resource id can be a light level for dimmers or a boolean output of a relay. For more information about IHC resource ids see Manual Setup .
Before you can use the IHC Switch platform, you must set up the IHC integration.
When auto setup is enabled the following products will be found in the ihc project and setup as switch devices:
Wireless plug outlet
Wireless relay
Mobile wireless relay
Dataline plug outlet
To manually configure IHC switches insert the “switch” section in yourIHC configuration:
ihc : - url : ' http://192.168.1.3' username : YOUR_USERNAME password : YOUR_PASSWORD info : true switch : - id : 12345 - id : 12346
switch map ( Optional )
List of switches to set up manually
Optional IHC resource id that will be pulsed to turn ON this switch.
Optional IHC resource id that will be pulsed to turn OFF this switch.
The resource id should be a boolean resource (On/Off). For more information about IHC resource ids see Manual Setup .
The IHC Controller integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Pulse ( ihc.pulse )
Pulses an input on the IHC controller.
Set runtime value boolean ( ihc.set_runtime_value_bool )
Sets a boolean runtime value on the IHC controller.
Set runtime value float ( ihc.set_runtime_value_float )
Sets a float runtime value on the IHC controller.
Set runtime value integer ( ihc.set_runtime_value_int )
Sets an integer runtime value on the IHC controller.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IHC Controller integration was introduced in Home Assistant 0.62, and it's used by
288 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
