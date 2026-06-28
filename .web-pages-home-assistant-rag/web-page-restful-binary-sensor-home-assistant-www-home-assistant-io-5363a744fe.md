---
source_url: "https://www.home-assistant.io/integrations/binary_sensor.rest"
final_url: "https://www.home-assistant.io/integrations/binary_sensor.rest"
canonical_url: "https://www.home-assistant.io/integrations/binary_sensor.rest/"
source_handle: "web:www-home-assistant-io:5363a744fe69"
source_section: "integrations-binary-sensor-rest"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ada1a334f5ddb26f2c8327788570b599834a77160ae8dd06c140ca04e3ff8fdc"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# RESTful binary sensor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/binary_sensor.rest
- Final URL: https://www.home-assistant.io/integrations/binary_sensor.rest
- Canonical URL: https://www.home-assistant.io/integrations/binary_sensor.rest/
- Fetched at: 2026-06-28T02:31:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate REST binary sensors into Home Assistant.

## Extracted Text

On this page
Configuration
Using templates
Examples
aREST sensor
Accessing an HTTP authentication protected endpoint
The RESTful binary sensor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is consuming a given endpoint which is exposed
by a
RESTful API
of a device, an application, or a web service.
The binary sensor has support for GET and POST requests.
Tip: If you want to create multiple sensors using the same endpoint, use the RESTful configuration instructions.
If the endpoint returns one of the values of these pairs: 0 / 1 ,
"0" / "1" , FALSE / TRUE , false / true , off / on or closed / open
it can be used as-is. If the return value differs, use a
template .
If the endpoint returns XML with the text/xml , application/xml , or
application/xhtml+xml content type, it will automatically be converted
to JSON according to this specification .
{ "name" : "Binary sensor" , "state" : { "open" : "true" , "timestamp" : "2016-06-20 15:42:52.926733" } }
To enable this sensor,
add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file for a GET request:
# Example configuration.yaml entry binary_sensor : - platform : rest resource : http://IP_ADDRESS/ENDPOINT
or for a POST request:
# Example configuration.yaml entry binary_sensor : - platform : rest resource : http://IP_ADDRESS/ENDPOINT method : POST
or a template based request:
# Example configuration.yaml entry binary_sensor : - platform : rest resource_template : " http://IP_ADDRESS/{{ now().strftime('%Y-%m-%d') }}"
Configuration Variables
Looking for your configuration file?
resource string Required , default: string
The resource or endpoint that contains the value.
resource_template template ( Optional )
The resource or endpoint that contains the value with template support.
method string ( Optional , default: GET )
The method of the request.
name template ( Optional , default: REST Binary Sensor )
Name of the REST binary sensor.
icon template ( Optional )
Defines a template for the icon of the entity.
picture template ( Optional )
Defines a template for the entity picture of the entity.
availability template ( Optional )
Defines a template if the entity state is available or not.
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
value_template template ( Optional )
Defines a template to extract the value.
payload string ( Optional )
The payload to send with a POST request. Usually formed as a dictionary.
unique_id string ( Optional )
An ID that uniquely identifies this entity. This allows changing the name , icon and entity_id from the web interface.
verify_ssl boolean ( Optional , default: true )
Verify the certification of the endpoint.
timeout integer ( Optional , default: 10 )
Defines max time to wait data from the endpoint.
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
For incoming data, a value template translates incoming JSON or raw data to a valid payload.
Incoming payloads are rendered with possible JSON values, so when rendering, the value_json can be used to access the attributes in a JSON based payload, otherwise the value variable can be used for non-json based data.
Additional, the this can be used as variables in the template. The this attribute refers to the current entity state of the entity.
Further information about this variable can be found in the template documentation
Note
Example value template with json:
With given payload:
{ "state" : "ON" , "temperature" : 21.902 }
Template {{ value_json.temperature | round(1) }} renders to 21.9 .
In this section you find some real-life examples of how to use this sensor.
Instead of using an aREST binary sensor,
you could retrieve the value of a device supporting
aREST directly with a REST binary sensor.
binary_sensor : - platform : rest resource : http://192.168.0.5/digital/9 method : GET name : Light device_class : light value_template : ' {{ value_json.return_value }}'
The REST sensor supports HTTP authentication and template-enabled customized headers.
binary_sensor : - platform : rest resource : http://IP_ADDRESS:5000/binary_sensor username : ha1 password : test1 authentication : basic headers : User-Agent : Home Assistant Content-Type : application/json X-Custom-Header : ' {{ states("input_text.the_custom_header") }}'
The headers will contain all relevant details. This will also give
you the ability to access endpoints that are protected by tokens.
Content-Length: 1024
Host: IP_ADDRESS1:5000
Authorization: Basic aGExOnRlc3Qx
Accept-Encoding: identity
Content-Type: application/json
User-Agent: Home Assistant
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RESTful binary sensor integration was introduced in Home Assistant 0.10, and it's used by
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
Back to top
