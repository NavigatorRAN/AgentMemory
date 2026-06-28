---
source_url: "https://www.home-assistant.io/integrations/arest"
final_url: "https://www.home-assistant.io/integrations/arest"
canonical_url: "https://www.home-assistant.io/integrations/arest/"
source_handle: "web:www-home-assistant-io:ee3a87e09012"
source_section: "integrations-arest"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3aa81cabc9e63afc2d5684fb07691eb4cb4b053e4397edb0b8607f683fcb358f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# aREST - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/arest
- Final URL: https://www.home-assistant.io/integrations/arest
- Canonical URL: https://www.home-assistant.io/integrations/arest/
- Fetched at: 2026-06-28T02:29:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate aREST within Home Assistant.

## Extracted Text

On this page
Binary sensor
Sensor
Switch
Related topics
There is currently support for the following device types within Home Assistant:
The arest binary sensor platform allows you to get all data from your devices (like Arduinos with an ethernet/Wi-Fi connection, the ESP8266, and the Raspberry Pi) running the aREST RESTful framework.
To use your aREST binary sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry binary_sensor : - platform : arest resource : http://IP_ADDRESS pin : 8
Configuration Variables
Looking for your configuration file?
resource string Required
IP address and schema of the device that is exposing an aREST API, e.g., http://192.168.1.10 .
pin integer Required
Number of the pin to monitor.
name string ( Optional )
Let you overwrite the name of the device. By default name from the device is used.
Accessing the URL http://IP_ADDRESS/digital/PIN_NUMBER should give you the state of the pin inside a JSON response as return_value .
$ curl -X GET http://192.168.0.5/digital/9
{ "return_value" : 0, "id" : "office1" , "name" : "Office" , "connected" : true }
An example for Pin 9 inspired by the command above could look like this:
# Example configuration.yaml entry binary_sensor : - platform : arest resource : http://192.168.0.5/digital/9 pin : 9 name : Office
Note
This sensor is not suitable for fast state changes because there is a high possibility that the change took place between two update cycle.
The arest sensor platform allows you to get all data from your devices (like Arduinos with a Ethernet/Wi-Fi connection, the ESP8266, and the Raspberry Pi) running the aREST RESTful framework.
To use your aREST enabled device in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : arest resource : https://IP_ADDRESS monitored_variables : temperature : name : temperature pins : A0 : name : Pin 0 analog
IP address and schema of the device that is exposing an aREST API, e.g., https://192.168.1.10 .
name string ( Optional , default: aREST sensor )
Let you overwrite the name of the device.
pins list ( Optional )
List of pins to monitor. Analog pins need a leading A for the pin number.
pin list Required
Pin number to use.
name string Required
The name of the variable you wish to monitor.
unit_of_measurement string ( Optional )
Defines the unit of measurement of the sensor, if any.
value_template template ( Optional )
Defines a template to extract a value from the payload.
monitored_variables list ( Optional )
List of exposed variables.
variable list Required
Name of the variable to monitor.
The name to use for the frontend.
Defines the units of measurement of the sensor, if any.
The variables in the monitored_variables array must be available in the response of the device. As a starting point you could use the one of the example sketches (eg. Ethernet for an Arduino with Ethernet shield). In those sketches are two variables ( temperature and humidity ) available which will act as endpoints.
Accessing one of the endpoints (eg. http://192.168.1.10/temperature ) will give you the value inside a JSON response.
{ "temperature" : 23 , "id" : "sensor01" , "name" : "livingroom" , "connected" : true }
The root will give you a JSON response that contains all variables and their current values along with some device details.
{ "variables" : { "temperature" : 23 , "humidity" : 82 }, "id" : "sensor01" , "name" : "livingroom" , "connected" : true }
return_value contains the sensor’s data in a JSON response for a given pin (eg. http://192.168.1.10/analog/2/ or http://192.168.1.10/digital/7/ ).
{ "return_value" : 34 , "id" : "sensor02" , "name" : "livingroom" , "connected" : true }
The arest switch platform allows you to toggle pins of your devices (like Arduino boards with an Ethernet/Wi-Fi connection, ESP8266 based devices, and the Raspberry Pi) running the aREST RESTful framework.
To use your aREST enabled device with pins in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : arest resource : http://IP_ADDRESS pins : 11 : name : Fan 13 : name : Switch invert : true
If you want to use custom functions, then add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : arest resource : http://IP_ADDRESS name : Office functions : function1 : name : Light Desk
IP address and schema of the device that is exposing an aREST API, e.g., http://192.168.1.10 (no-trailing slash)
pins map ( Optional )
An array with all used pins.
The name of the pin to use in the frontend.
invert boolean ( Optional , default: false )
If the logic for on/off should be inverted.
functions map ( Optional )
An array with all used functions.
The name to use in the frontend.
You can still switch your pins with a web browser or a command line tool. Use the URL http://192.168.1.10/digital/8/1 to set pin 8 to high/on, the JSON response will give you the feedback.
{ "message" : "Pin D8 set to 1" , "id" : "sensor02" , "name" : "livingroom" , "connected" : true }
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The aREST integration was introduced in Home Assistant 0.9, and it's used by
3 active installations.
Its IoT class is Local Polling.
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
