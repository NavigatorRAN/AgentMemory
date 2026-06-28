# RESTful - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rest
- Final URL: https://www.home-assistant.io/integrations/rest
- Canonical URL: https://www.home-assistant.io/integrations/rest/
- Fetched at: 2026-06-28T03:12:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate REST sensors and binary sensors into Home Assistant.

## Extracted Text

On this page
Using templates
The RESTful integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is consuming a given endpoint which is exposed by a RESTful API of a device, an application, or a web service. The sensor has support for GET and POST requests.
RESTful Sensor and RESTful Binary Sensor can also be set up as platforms if there is only a single sensor per endpoint.
# Example configuration.yaml entry rest : - authentication : basic username : " admin" password : " password" scan_interval : 60 resource : http://192.168.1.12/status.xml sensor : - name : " Adult Pool Data System" json_attributes_path : " $.response.system" value_template : " OK" json_attributes : - " runstate" - " model" - " opmode" - " freeze" - " time" - " sensor1" - " sensor2" - " sensor3" - " sensor4" - " sensor5" - " version" - name : " Adult Pool Data Equipment" json_attributes_path : " $.response.equipment" value_template : " OK" json_attributes : - " circuit1" - " circuit2" - " circuit3" - " circuit4" - " circuit5" - " circuit6" - " circuit7" - " circuit8" - name : " Adult Pool Data Temp" json_attributes_path : " $.response.temp" value_template : " OK" json_attributes : - " htstatus" - " poolsp" - " spasp" - " pooltemp" - " spatemp" - " airtemp" - authentication : basic username : " admin" password : " password" scan_interval : 60 resource : " http://192.168.1.13/status.xml" sensor : - name : " Kiddie Pool Data System" json_attributes_path : " $.response.system" value_template : " OK" json_attributes : - " runstate" - " model" - " opmode" - " freeze" - " time" - " sensor1" - " sensor2" - " sensor3" - " sensor4" - " version" - name : " Kiddie Pool Data Equipment" json_attributes_path : " $.response.equipment" value_template : " OK" json_attributes : - " circuit1" - " circuit2" - " circuit3" - " circuit4" - " circuit5" - " circuit6" - " circuit7" - " circuit8" - name : " Kiddie Pool Data Temp" json_attributes_path : " $.response.temp" value_template : " OK" json_attributes : - " htstatus" - " poolsp" - " spasp" - " pooltemp" - " spatemp" - " airtemp"
Configuration Variables
Looking for your configuration file?
resource string Required
The resource or endpoint that contains the value.
resource_template template Required
The resource or endpoint that contains the value with template support.
method string ( Optional , default: GET )
The method of the request. Either POST or GET .
payload string ( Optional )
The payload to send with a POST request. Depends on the service, but usually formed as JSON.
payload_template template ( Optional )
The payload to send with a POST request, with template support. Depends on the service, but usually formed as JSON.
verify_ssl boolean ( Optional , default: true )
Whether to verify the SSL certificate of the endpoint.
ssl_cipher_list string ( Optional , default: default )
The list of SSL ciphers to be accepted from this endpoint. python_default ( default ), modern or intermediate ( inspired by Mozilla Security/Server Side TLS ).
timeout integer ( Optional , default: 10 )
The maximum time in seconds to wait for data from the endpoint. If the timeout is reached, the sensor will become unavailable .
authentication string ( Optional )
Type of the HTTP authentication. basic or digest .
username string ( Optional )
The username for accessing the REST endpoint.
password string ( Optional )
The password for accessing the REST endpoint.
headers list | template ( Optional )
The headers for the requests.
params list | template ( Optional )
The query params for the requests.
scan_interval integer ( Optional , default: 30 )
The frequency in seconds to call the REST endpoint.
encoding string ( Optional , default: UTF-8 )
The character encoding to use if none provided in the header of the shared data.
sensor list ( Optional )
A list of sensors to create from the shared data. All configuration settings that are supported by RESTful Sensor not listed above can be used here.
binary_sensor list ( Optional )
A list of binary sensors to create from the shared data. All configuration settings that are supported by RESTful Binary Sensor not listed above can be used here.
Important
Use either resource or resource_template .
For incoming data, a value template translates incoming JSON or raw data to a valid payload.
Incoming payloads are rendered with possible JSON values, so when rendering, the value_json can be used to access the attributes in a JSON based payload, otherwise the value variable can be used for non-json based data.
Additional, the this can be used as variables in the template. The this attribute refers to the current entity state of the entity.
Further information about this variable can be found in the template documentation
Note
Example value template with json:
With given payload:
{ "state" : "ON" , "temperature" : 21.902 }
Template {{ value_json.temperature | round(1) }} renders to 21.9 .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RESTful service was introduced in Home Assistant 0.7.4, and it's used by
8.2% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Binary sensor
Sensor
Back to top
