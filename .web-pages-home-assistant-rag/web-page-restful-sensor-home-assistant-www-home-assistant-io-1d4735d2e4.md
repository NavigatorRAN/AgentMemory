# RESTful Sensor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sensor.rest
- Final URL: https://www.home-assistant.io/integrations/sensor.rest
- Canonical URL: https://www.home-assistant.io/integrations/sensor.rest/
- Fetched at: 2026-06-28T03:14:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate REST sensors into Home Assistant.

## Extracted Text

On this page
Using templates
Data updates
Examples
External IP address
Single value from a local Glances instance
Value from another Home Assistant instance
Accessing an HTTP authentication protected endpoint
Use GitHub to get the latest release of Home Assistant
Fetch multiple JSON attributes and present them as values
The RESTful Sensor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is consuming a given endpoint which is exposed by a RESTful API of a device, an application, or a web service. The sensor has support for GET and POST requests.
Tip: If you want to create multiple sensors using the same endpoint, use the RESTful configuration instructions.
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file for a GET request:
# Example configuration.yaml entry sensor : - platform : rest resource : http://IP_ADDRESS/ENDPOINT
or for a POST request:
# Example configuration.yaml entry sensor : - platform : rest resource : http://IP_ADDRESS/ENDPOINT method : POST payload : ' { "device" : "heater" }'
or a template based request:
# Example configuration.yaml entry sensor : - platform : rest resource_template : http://IP_ADDRESS/{{ now().strftime('%Y-%m-%d') }} headers : Authorization : > Bearer {{ states("input_text.my_access_token") }} params : start_date : > {{ (now() - timedelta(days = 1)).strftime('%Y-%m-%d') }}
Configuration Variables
Looking for your configuration file?
authentication string ( Optional )
Type of the HTTP authentication. basic or digest .
availability template ( Optional )
Defines a template if the entity state is available or not.
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
encoding string ( Optional , default: UTF-8 )
The character encoding to use if none provided in the header of the shared data.
force_update boolean ( Optional , default: false )
Sends update events even if the value hasn’t changed. Useful if you want to have meaningful value graphs in history.
headers template | list ( Optional )
The headers for the requests.
icon template ( Optional )
Defines a template for the icon of the REST sensor.
json_attributes string | list ( Optional )
A list of keys to extract values from a JSON dictionary result and then set as sensor attributes. If the endpoint returns XML with the text/xml , application/xml or application/xhtml+xml content type, it will automatically be converted to JSON according to this specification
json_attributes_path string ( Optional )
A JSONPath that references the location of the json_attributes in the JSON content.
method string ( Optional , default: GET )
The method of the request. Either POST or GET .
name template ( Optional , default: REST Sensor )
Defines a template for the name of the REST sensor.
params template | list ( Optional )
The query params for the requests.
password string ( Optional )
The password for accessing the REST endpoint.
payload string ( Optional )
The payload to send with a POST request. Depends on the service, but usually formed as JSON.
picture template ( Optional )
Defines a template for the entity picture of the REST sensor.
resource string Required
The resource or endpoint that contains the value.
resource_template template Required
The resource or endpoint that contains the value with template support.
scan_interval integer ( Optional , default: 30 )
The frequency in seconds to call the REST endpoint.
state_class string ( Optional )
The state_class of the sensor.
timeout integer ( Optional , default: 10 )
Defines the maximum time in seconds to wait for data from the endpoint before the sensor is marked as unavailable .
unique_id string ( Optional )
An ID that uniquely identifies this entity. This allows changing the name , icon and entity_id from the web interface.
unit_of_measurement string ( Optional )
Defines the units of measurement of the sensor, if any.
username string ( Optional )
The username for accessing the REST endpoint.
value_template template ( Optional )
Defines a template to extract the value.
verify_ssl boolean ( Optional , default: true )
Verify the SSL certificate of the endpoint.
Important
Use either resource or resource_template .
curl can help you identify the variable you want to display in your Home Assistant frontend. The example below shows the JSON response of a device that is running with aREST .
$ curl -X GET http://192.168.1.31/temperature/
{ "temperature" : 77, "id" : "sensor02" , "name" : "livingroom" , "connected" : true }
The response is expected to be a dictionary or a list with a dictionary as its 0th element.
For incoming data, a value template translates incoming JSON or raw data to a valid payload.
Incoming payloads are rendered with possible JSON values, so when rendering, the value_json can be used to access the attributes in a JSON based payload, otherwise the value variable can be used for non-json based data.
Additional, the this can be used as variables in the template. The this attribute refers to the current entity state of the entity.
Further information about this variable can be found in the template documentation
Note
Example value template with json:
With given payload:
{ "state" : "ON" , "temperature" : 21.902 }
Template {{ value_json.temperature | round(1) }} renders to 21.9 .
The RESTful sensor polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the configured endpoint every 30 seconds by default. To change how often it polls, set the scan_interval option to a different value in seconds.
If you want to refresh the sensor manually, for example, from an automation or a script, call the homeassistant.update_entity action and target the sensor. This triggers an immediate request to the endpoint, outside of the normal polling schedule.
The force_update option changes how state updates are published, not how often the endpoint is polled. When force_update is enabled, the sensor still polls on the configured interval, but it emits a state change event on every poll even if the returned value has not changed. This is useful for long-term statistics and history graphs that rely on state change events.
In this section you find some real-life examples of how to use this sensor.
You can find your external IP address using the ipify service for both IPv4 and IPv6.
sensor : - platform : rest name : " External IP" resource : " https://api.ipify.org/?format=json" value_template : " {{ value_json.ip }}" - platform : rest name : " External IPv6" resource : " https://api6.ipify.org/?format=json" value_template : " {{ value_json.ip }}"
The glances sensor is doing the exact same thing for all exposed values.
sensor : - platform : rest resource : http://IP_ADRRESS:61208/api/2/mem/used name : Used mem value_template : " {{ value_json.used| multiply(0.000000954) | round(0) }}" unit_of_measurement : MB
The Home Assistant API exposes the data from your attached sensors. If you are running multiple Home Assistant instances which are not connected you can still get information from them.
If the Home Assistant instance in the resource variable is protected by an API password, you can append ?api_password=YOUR_PASSWORD to the resource URL to authenticate or use headers: .
sensor : - platform : rest resource : http://IP_ADDRESS:8123/api/states/sensor.weather_temperature name : Temperature value_template : " {{ value_json.state }}" unit_of_measurement : " °C"
The REST sensor supports HTTP authentication and customized headers.
sensor : - platform : rest resource : http://IP_ADDRESS:5000/sensor username : ha1 password : test1 authentication : basic headers : User-Agent : Home Assistant Content-Type : application/json
The headers will contain all relevant details. This will also give you the ability to access endpoints that are protected by tokens.
Content-Length: 1024
Host: IP_ADDRESS1:5000
Authorization: Basic aGExOnRlc3Qx
Accept-Encoding: identity
Content-Type: application/json
User-Agent: Home Assistant
If you are accessing a resource protected by a Bearer token in an Authorization header, you can either put the token in the header field of the sensor configuration (not recommended) or store the token in your secrets.yaml file. In that case, be sure to include the word Bearer in the secrets file.
sensor : - platform : rest resource : http://IP_ADDRESS:5000/sensor headers : Authorization : !secret my_sensor_secret_token
Example entry for the secrets.yaml file:
my_sensor_secret_token : Bearer gh_DHQIXKVf6Pr4H8Yqz8uhApk_mnV6Zje6Pr4H8Yqz8A8nCxz6SBghQdS51
This sample retrieves the latest Home Assistant release information from GitHub.
sensor : - platform : rest resource : https://api.github.com/repos/home-assistant/home-assistant/releases/latest username : YOUR_GITHUB_USERNAME password : YOUR_GITHUB_ACCESS_TOKEN authentication : basic value_template : " {{ value_json.tag_name }}" headers : Accept : application/vnd.github.v3+json Content-Type : application/json User-Agent : Home Assistant REST sensor
Most examples below use the rest: configuration format, which belongs to the RESTful integration . The RESTful integration allows defining multiple sensors from a single HTTP endpoint, reducing the number of requests to the same service. If you only need a single sensor from an endpoint, use the sensor platform configuration shown in the examples above.
JSON Test returns the current time, date and milliseconds since epoch from http://date.jsontest.com/ .
rest : - resource : " http://date.jsontest.com/" sensor : - name : " Time" value_template : " {{ value_json.time }}" - name : " Date" value_template : " {{ value_json.date }}" - name : " Milliseconds" value_template : " {{ value_json.milliseconds_since_epoch }}"
JSONPlaceholder provides sample JSON data for testing. In the below example, JSONPath locates the attributes in the JSON document. JSONPath Online Evaluator provides a tool to test your JSONPath. If the endpoint returns XML, it will be converted to JSON using xmltodict before searching for attributes. You may find this XML to JSON Converter helpful for testing how your XML converts to JSON.
sensor : - platform : rest name : JSON users json_attributes_path : " $.[0].address" json_attributes : - street - suite - city - zipcode resource : https://jsonplaceholder.typicode.com/users value_template : " {{ value_json[0].name }}"
This sample fetches a weather report from OpenWeatherMap , maps the resulting data into attributes of the RESTful sensor and then creates a set of template sensors that monitor the attributes and present the values in a usable form.
rest : - resource : " https://api.openweathermap.org/data/2.5/weather?zip=80302,us&APPID=VERYSECRETAPIKEY" sensor : - name : " Report" value_template : " {{ value_json['weather'][0]['description'].title() }}" picture : " {{ 'https://openweathermap.org/img/w/' + value_json['weather'][0]['icon'].lower() + '.png' }}" - name : " Outside temp" value_template : " {{ value_json['main']['temp'] - 273.15 }}" unit_of_measurement : " °C" - name : " Outside pressure" value_template : " {{ value_json['main']['pressure'] }}" unit_of_measurement : " hP" - name : " Outside humidity" value_template : " {{ value_json['main']['humidity'] }}" unit_of_measurement : " %"
This configuration shows how to extract multiple values from a dictionary. This method avoids flooding the REST service because the result is only requested once. From that single request, multiple sensors can be created by using template sensors.
{ "bedroom1" : { "temperature" : 15.79 , "humidity" : 55.78 , "battery" : 5.26 , "timestamp" : "2019-02-27T22:21:37Z" }, "bedroom2" : { "temperature" : 18.99 , "humidity" : 49.81 , "battery" : 5.08 , "timestamp" : "2019-02-27T22:23:44Z" }, "bedroom3" : { "temperature" : 18.58 , "humidity" : 47.95 , "battery" : 5.15 , "timestamp" : "2019-02-27T22:21:22Z" } }
rest : resource : " http://<address_to_rest_service>" sensor : - name : " Bedroom1 Temperature" value_template : " {{ value_json['bedroom1']['temperature'] }}" device_class : temperature unit_of_measurement : " °C" - name : " Bedroom1 Humidity" value_template : " {{ value_json['bedroom1']['humidity'] }}" device_class : humidity unit_of_measurement : " %" - name : " Bedroom1 Battery" value_template : " {{ value_json['bedroom1']['battery'] }}" device_class : battery unit_of_measurement : " V" - name : " Bedroom2 Temperature" value_template : " {{ value_json['bedroom2']['temperature'] }}" device_class : temperature unit_of_measurement : " °C"
The example below shows how to extract multiple values from a dictionary from the XML file of a Steamist Steambath Wi-Fi interface. The values are used to create multiple sensors without having to poll the endpoint numerous times.
rest : # Steam Controller - resource : " http://192.168.1.105/status.xml" scan_interval : 15 sensor : - name : " Steam Temp" value_template : " {{ value_json['response']['temp0'] | regex_findall_index('([0-9]+)XF') }}" unit_of_measurement : " °F" steam_time_remaining : - name : " Steam Time Remaining" value_template : " {{ value_json['response']['time0'] }}" unit_of_measurement : " minutes" rest_command : set_steam_led : url : http://192.168.1.105/leds.cgi?led={{ led }}
For reference, the XML content of endpoint shown above example is below:
<?xml version="1.0" encoding="utf-8"?> <response> <scan> 0 </scan> <ver> 12556 </ver> <count> 48 </count> <ssid> alexander </ssid> <bss> <valid> 0 </valid> <name> 0 </name> <privacy> 0 </privacy> <wlan> 0 </wlan> <strength> 0 </strength> </bss> <led0> 0 </led0> <led1> 0 </led1> <led2> 0 </led2> <led3> 0 </led3> <led4> 0 </led4> <led5> 0 </led5> <led6> 0 </led6> <led7> 0 </led7> <btn0> up </btn0> <btn1> up </btn1> <btn2> up </btn2> <btn3> up </btn3> <pot0> 0 </pot0> <usr0> 0 </usr0> <temp0> 0x73XF0x73XF </temp0> <time0> 0 </time0> </response>
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RESTful Sensor integration was introduced in Home Assistant 0.7.4, and it's used by
8.2% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
