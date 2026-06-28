---
source_url: "https://www.home-assistant.io/integrations/switch.rest"
final_url: "https://www.home-assistant.io/integrations/switch.rest"
canonical_url: "https://www.home-assistant.io/integrations/switch.rest/"
source_handle: "web:www-home-assistant-io:afc03d280c98"
source_section: "integrations-switch-rest"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "955077c37c8beea9ae1919d6afc328fcdfcfcf15108ed4982b379a8429c0b7fe"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# RESTful Switch - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/switch.rest
- Final URL: https://www.home-assistant.io/integrations/switch.rest
- Canonical URL: https://www.home-assistant.io/integrations/switch.rest/
- Fetched at: 2026-06-28T03:19:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate REST switches into Home Assistant.

## Extracted Text

On this page
Configuration
Using templates
Example
Switch with templated value
The RESTful Switch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a given endpoint that supports a RESTful API . The switch can get the state via GET and set the state via POST on a given REST resource.
To enable this switch, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : rest resource : http://IP_ADDRESS/ENDPOINT
Configuration Variables
Looking for your configuration file?
resource string Required
The resource or endpoint used to control the REST switch.
state_resource string ( Optional )
The resource or endpoint that reports the state if different from resource . Used by is_on_template . Defaults to resource .
method string ( Optional , default: post )
The method of the request. Supported post , put or patch .
name template ( Optional , default: REST Switch )
Name of the REST Switch.
icon template ( Optional )
Defines a template for the icon of the entity.
picture template ( Optional )
Defines a template for the entity picture of the entity.
availability template ( Optional )
Defines a template if the entity state is available or not.
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
timeout integer ( Optional , default: 10 )
Timeout for the request.
body_on string ( Optional , default: ON )
The body of the POST request that commands the switch to become enabled. This value can be a template .
body_off string ( Optional , default: OFF )
The body of the POST request that commands the switch to become disabled. This value can also be a template .
is_on_template string ( Optional )
A template that determines the state of the switch from the value returned by the GET request on the resource URL. This template should compute to a boolean (True or False). If the value is valid JSON, it will be available in the template as the variable value_json . Default is equivalent to '{% raw %}{{ value_json == body_on }}{% endraw %}' . This means that by default, the state of the switch is on if and only if the response to the GET request matches.
username string ( Optional )
The username for accessing the REST endpoint.
password string ( Optional )
The password for accessing the REST endpoint.
headers list | template ( Optional )
The headers for the request.
params list | template ( Optional )
The query params for the requests.
verify_ssl boolean ( Optional , default: true )
Verify the SSL certificate of the endpoint.
Important
Make sure that the URL matches exactly your endpoint or resource.
For incoming data, a value template translates incoming JSON or raw data to a valid payload.
Incoming payloads are rendered with possible JSON values, so when rendering, the value_json can be used to access the attributes in a JSON based payload, otherwise the value variable can be used for non-json based data.
Additional, the this can be used as variables in the template. The this attribute refers to the current entity state of the entity.
Further information about this variable can be found in the template documentation
Note
Example value template with json:
With given payload:
{ "state" : "ON" , "temperature" : 21.902 }
Template {{ value_json.temperature | round(1) }} renders to 21.9 .
This example shows a switch that uses a template to allow Home Assistant to determine its state. In this example, the REST endpoint returns this JSON response with true indicating the switch is on.
{ "is_active" : "true" }
switch : - platform : rest resource : http://IP_ADDRESS/led_endpoint body_on : ' {"active": "true"}' body_off : ' {"active": "false"}' is_on_template : " {{ value_json.is_active }}" headers : Content-Type : application/json X-Custom-Header : ' {{ states("input_text.the_custom_header") }}' verify_ssl : true
body_on and body_off can also depend on the state of the system. For example, to enable a remote temperature sensor tracking on a radio thermostat, one has to send the current value of the remote temperature sensor. This can be achieved by using the template {% raw %}'{"rem_temp":{{states('sensor.bedroom_temp')}}}'{% endraw %} .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RESTful Switch integration was introduced in Home Assistant 0.7.6, and it's used by
8.2% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Switch
Back to top
