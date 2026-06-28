# Command line - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/command_line
- Final URL: https://www.home-assistant.io/integrations/command_line
- Canonical URL: https://www.home-assistant.io/integrations/command_line/
- Fetched at: 2026-06-28T02:34:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the command line utility within Home Assistant.

## Extracted Text

On this page
Troubleshooting
Using templates
Binary sensor
Cover
Notify
Sensor
Switch
Execution
Examples binary sensor platform
SickRage
Check RasPlex
Check if a system service is running
Example cover platform
Examples sensor platform
CPU temperature
Details about the upstream Home Assistant release
Read value out of a remote text file
Use an external script
Usage of templating in command:
Usage of JSON attributes in command output
Example switch platform
Change the icon when a state changes
aREST device
Shutdown your local host
Control your VLC player
Control Foscam motion sensor
List of actions
Related topics
The Command line integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers functionality that issues specific commands to get data or to control a device.
This is a YAML-only integration, so you set it up in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. After you add or change its configuration, restart Home Assistant to apply the changes. Once the integration is loaded, you can use the command_line.reload action to pick up later changes to your entities without restarting.
Tip
It’s highly recommended to enclose the command in single quotes ' as it ensures all characters can be used in the command and reduces the risk of unintentional escaping. To include a single quote in a command enclosed in single quotes, double it: '' .
Configuration Variables
Looking for your configuration file?
command_line list Required
The platforms to use for you command_line integration.
binary_sensor map ( Optional )
Binary sensor platform.
command template Required
The action to take to get the value.
command_timeout integer ( Optional , default: 15 )
Defines number of seconds for command timeout.
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
name string ( Optional , default: Binary Command Sensor )
Let you overwrite the name of the device.
icon template ( Optional )
Defines a template for the icon of the entity.
payload_on string ( Optional , default: ON )
The payload that represents enabled state.
unique_id string ( Optional )
An ID that uniquely identifies this binary sensor. Set this to a unique value to allow customization through the UI.
payload_off string ( Optional , default: OFF )
The payload that represents disabled state.
value_template string ( Optional )
Defines a template to extract a value from the payload.
availability template ( Optional , default: true )
Defines a template to get the available state of the entity. If the template either fails to render or returns True , "1" , "true" , "yes" , "on" , "enable" , or a non-zero number, the entity will be available . If the template returns any other value, the entity will be unavailable . If not configured, the entity will always be available . Note that string comparisons are not case sensitive; "TrUe" and "yEs" are allowed.
scan_interval integer ( Optional , default: 60 )
Define time in seconds between each update.
cover map ( Optional )
Cover platform.
command_close string Required , default: true
The action to close the cover.
command_open string Required , default: true
The command to open the cover.
command_state string ( Optional )
If given, this will act as a sensor that runs in the background and updates the state of the cover. If the command returns a 0 the indicates the cover is fully closed, whereas a 100 indicates the cover is fully open.
command_stop string Required , default: true
The action to stop the cover.
name string Required
The name used to display the cover in the frontend.
An ID that uniquely identifies this cover. Set this to a unique value to allow customization through the UI.
value_template template ( Optional )
if specified, command_state will ignore the result code of the command but the template evaluating will indicate the position of the cover. For example, if your command_state returns a string “open”, using value_template as in the example configuration above will allow you to translate that into the valid state 100 .
scan_interval integer ( Optional , default: 15 )
notify map ( Optional )
Notify platform.
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
The action to take.
sensor map ( Optional )
Sensor platform.
Defines number of seconds for command timeout
json_attributes string | list ( Optional )
Defines a list of keys to extract values from a JSON dictionary result and then set as sensor attributes.
json_attributes_path string ( Optional )
A JSONPath that references the location of the json_attributes in the JSON content.
name string ( Optional , default: Command Sensor )
Name of the command sensor.
An ID that uniquely identifies this sensor. Set this to a unique value to allow customization through the UI.
unit_of_measurement string ( Optional )
Defines the unit of measurement of the sensor, if any.
device_class device_class ( Optional )
Sets the class of the device, changing the device state and icon that is displayed on the UI (see below). It does not set the unit_of_measurement .
state_class string ( Optional )
The state_class of the sensor. This will display the value based on the Number Format defined in the user profile.
switch map ( Optional )
Switch platform.
command_on string Required
The action to take for on.
command_off string Required
The action to take for off.
If given, this command will be run. Returning a result code 0 will indicate that the switch is on.
The name used to display the switch in the frontend.
An ID that uniquely identifies this switch. Set this to a unique value to allow customization through the UI.
If specified, command_state will ignore the result code of the command but the template evaluating to true will indicate the switch is on.
scan_interval integer ( Optional , default: 30 )
Note
For sensors, while value_template is optional, if you set json_attributes because the output is a JSON, it is suggested to provide a template in the value_template field to provide a state to the sensor or the state will always be unknown . See example below.
As Command line integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is a yaml only integration, turning on extended logging needs to be done by setting the logging information in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
Entering this example in your configuration sets the default logging to info, and for command_line to debug. Once done, restart Home Assistant to enable.
# Set logging logger : default : info logs : homeassistant.components.command_line : debug
While command is accepting a template for sensor and binary_sensor , it’s only the arguments that can be a template. This means the command name itself cannot be generated by a template, but it must be literally provided.
For incoming data, a value template translates incoming JSON or raw data to a valid payload.
Incoming payloads are rendered with possible JSON values, so when rendering, the value_json can be used to access the attributes in a JSON based payload, otherwise the value variable can be used for non-json based data.
Additional, the this can be used as variables in the template. The this attribute refers to the current entity state of the entity.
Further information about this variable can be found in the template documentation
Example value template with json:
With given payload:
{ "state" : "ON" , "temperature" : 21.902 }
Template {{ value_json.temperature | round(1) }} renders to 21.9 .
To use your Command binary sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry command_line : - binary_sensor : command : " cat /proc/sys/net/ipv4/ip_forward" payload_on : " 1" payload_off : " 0" - binary_sensor : command : " echo 1" payload_on : " 1" payload_off : " 0"
A command_line cover platform that issues specific commands when it is moved up, down and stopped. It allows anyone to integrate any type of cover into Home Assistant that can be controlled from the command line.
To enable a command line cover in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry command_line : - cover : command_open : move_command up garage command_close : move_command down garage command_stop : move_command stop garage name : Garage
The command_line platform allows you to use external tools for notifications from Home Assistant. The message will be passed in as STDIN.
To enable those notifications in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry command_line : - notify : command : " espeak -vmb/mb-us1"
To use notifications, please see the getting started with automation page .
To enable it, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry command_line : - sensor : command : SENSOR_COMMAND - sensor : command : SENSOR_COMMAND_2
The command_line switch platform issues specific commands when it is turned on
and off. This might very well become our most powerful platform as it allows
anyone to integrate any type of switch into Home Assistant that can be
controlled from the command line, including calling other scripts!
# Example configuration.yaml entry command_line : - switch : name : Kitchen Light command_on : switch_command on kitchen command_off : switch_command off kitchen
A note on name for cover and switch :
The use of friendly_name and object_id has been deprecated and the slugified name will also be used as identifier.
Use unique_id to enable changing the name from the UI and if required, use the slugified name as identifier.
The command is executed within the configuration directory .
If you are using Home Assistant Operating System , the commands are executed in the homeassistant container context. So if you test or debug your script, it might make sense to do this in the context of this container to get the same runtime environment.
With a 0 exit code, the output (stdout) of the command is used as value . In case a command results in a non 0 exit code or is terminated by the command_timeout , the result is only logged to Home Assistant log and the sensors value is not updated.
In this section you find some real-life examples of how to use the command_line sensor.
Check the state of an SickRage instance.
# Example configuration.yaml entry command_line : - binary_sensor : command : ' netstat -na | grep "33322" | grep -q "LISTENING" > nul && (echo "Running") || (echo "Not running")' name : " sickragerunning" device_class : moving payload_on : " Running" payload_off : " Not running"
Check if RasPlex is online .
command_line : - binary_sensor : command : ' ping -c 1 rasplex.local | grep "1 received" | wc -l' name : " is_rasplex_online" device_class : connectivity payload_on : 1 payload_off : 0
An alternative solution could look like this:
command_line : - binary_sensor : name : Printer command : ' ping -W 1 -c 1 192.168.1.10 > /dev/null 2>&1 && echo success || echo fail' device_class : connectivity payload_on : " success" payload_off : " fail"
Consider to use the ping sensor as an alternative to the samples above.
The services running is listed in /etc/systemd/system and can be checked with the systemctl command:
$ systemctl is-active [email protected]
active
$ sudo service [email protected] stop
inactive
A binary command line sensor can check this:
command_line : - binary_sensor : command : ' /bin/systemctl is-active [email protected] ' payload_on : " active" payload_off : " inactive"
# Example configuration.yaml entry command_line : - cover : name : Garage door command_open : move_command up garage command_close : move_command down garage command_stop : move_command stop garage command_state : state_command garage value_template : > {% if value == 'open' %} 100 {% elif value == 'closed' %} 0 {% endif %}
In this section you find some real-life examples of how to use this sensor.
Thanks to the proc file system, various details about a system can be retrieved. Here the CPU temperature is of interest. Add something similar to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry command_line : - sensor : name : CPU Temperature command : " cat /sys/class/thermal/thermal_zone0/temp" # If errors occur, make sure configuration file is encoded as UTF-8 unit_of_measurement : " °C" value_template : " {{ value | multiply(0.001) | round(1) }}"
You can see directly in the frontend ( Developer tools -> About ) what release of Home Assistant you are running. The Home Assistant releases are available on the Python Package Index . This makes it possible to get the current release.
command_line : - sensor : command : python3 -c "import requests; print(requests.get('https://pypi.python.org/pypi/homeassistant/json').json()['info']['version'])" name : HA release
If you own devices which are storing values in text files which are accessible over HTTP then you can use the same approach as shown in the previous section. Instead of looking at the JSON response we directly grab the sensor’s value.
command_line : - sensor : command : python3 -c "import requests; print(requests.get('http://remote-host/sensor_data.txt').text)" name : File value
The example is doing the same as the aREST sensor but with an external Python script. It should give you an idea about interfacing with devices which are exposing a RESTful API.
The one-line script to retrieve a value is shown below. Of course it would be possible to use this directly in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file but need extra care about the quotation marks.
python3 -c "import requests; print(requests.get('http://10.0.0.48/analog/2').json()['return_value'])"
The script (saved as arest-value.py ) that is used looks like the example below.
#!/usr/bin/python3
from requests import get response = get ( " http://10.0.0.48/analog/2 " ) print ( response . json ()[ " return_value " ])
To use the script you need to add something like the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
# Example configuration.yaml entry command_line : - sensor : name : Brightness command : " python3 /path/to/script/arest-value.py"
Templates are supported in the command configuration variable. This could be used if you want to include the state of a specific sensor as an argument to your external script.
# Example configuration.yaml entry command_line : - sensor : name : Wind direction command : " sh /home/pi/.homeassistant/scripts/wind_direction.sh {{ states('sensor.wind_direction') }}" unit_of_measurement : " Direction"
The example shows how you can retrieve multiple values with one sensor (where the additional values are attributes) by using value_json and json_attributes .
# Example configuration.yaml entry command_line : - sensor : name : JSON time json_attributes : - date - milliseconds_since_epoch command : " python3 /home/pi/.homeassistant/scripts/datetime.py" value_template : " {{ value_json.time }}"
JSONPlaceholder provides sample JSON data for testing. In the below example, JSONPath locates the attributes in the JSON document. JSONPath Online Evaluator provides a tool to test your JSONPath.
command_line : - sensor : name : JSON user command : python3 -c "import requests; print(requests.get('https://jsonplaceholder.typicode.com/users').text)" json_attributes_path : " $.[0].address" json_attributes : - street - suite - city - zipcode value_template : " {{ value_json[0].name }}"
This example demonstrates how to use template to change the icon as its state changes. This icon is referencing its own state.
command_line : - switch : name : Driveway outside sensor command_on : > curl -X PUT -d '{"on":true}' "http://ip_address/api/sensors/27/config/" command_off : > curl -X PUT -d '{"on":false}' "http://ip_address/api/sensors/27/config/" command_state : curl http://ip_address/api/sensors/27/ value_template : > {{value_json.config.on}} icon : > {% if value_json.config.on == true %} mdi:toggle-switch {% else %} mdi:toggle-switch-off {% endif %}
The example below is doing the same as the
aREST switch .
The command line tool curl is used to toggle a pin
which is controllable through REST.
# Example configuration.yaml entry command_line : - switch : command_on : " /usr/bin/curl -X GET http://192.168.1.10/digital/4/1" command_off : " /usr/bin/curl -X GET http://192.168.1.10/digital/4/0" command_state : " /usr/bin/curl -X GET http://192.168.1.10/digital/4" value_template : ' {{ value == "1" }}' name : Kitchen Lightswitch
Given this example, in the UI one would see the friendly_name of
“Kitchen Light”. However, the identifier is arest_pin_four , making the
entity_id switch.arest_pin_four , which is what one would use in
automation or in API calls .
This switch will shutdown your system that is hosting Home Assistant.
Warning
This switch will shutdown your host immediately, there will be no confirmation.
# Example configuration.yaml entry command_line : - switch : name : Home Assistant System Shutdown command_off : " /usr/sbin/poweroff"
This switch will control a local VLC media player
( Source ).
# Example configuration.yaml entry command_line : - switch : name : VLC command_on : " cvlc 1.mp3 vlc://quit &" command_off : " pkill vlc"
This switch will control the motion sensor of Foscam Webcams which Support CGI
Commands ( Source ).
This switch supports statecmd,
which checks the current state of motion detection.
# Example configuration.yaml entry command_line : - switch : name : Foscam Motion command_on : ' curl -k "https://ipaddress:443/cgi-bin/CGIProxy.fcgi?cmd=setMotionDetectConfig&isEnable=1&usr=admin&pwd=password"' command_off : ' curl -k "https://ipaddress:443/cgi-bin/CGIProxy.fcgi?cmd=setMotionDetectConfig&isEnable=0&usr=admin&pwd=password"' command_state : ' curl -k --silent "https://ipaddress:443/cgi-bin/CGIProxy.fcgi?cmd=getMotionDetectConfig&usr=admin&pwd=password" | grep -oP "(?<=isEnable>).*?(?=</isEnable>)"' value_template : ' {{ value == "1" }}'
Replace admin and password with an “Admin” privileged Foscam user
Replace ipaddress with the local IP address of your Foscam
The Command line integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload Command Line ( command_line.reload )
Reloads the Command Line configuration from your YAML configuration.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Command line integration was introduced in Home Assistant 0.12, and it's used by
4.6% of the active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Notifications
Utility
Back to top
