# Python Scripts - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/python_script
- Final URL: https://www.home-assistant.io/integrations/python_script
- Canonical URL: https://www.home-assistant.io/integrations/python_script/
- Fetched at: 2026-06-28T03:10:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Python scripts within Home Assistant.

## Extracted Text

On this page
Writing your first script, reading input and logging the activity
Triggering events
Calling services
Returning data
Documenting your Python scripts
List of actions
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to write Python scripts that are exposed as actions in Home Assistant. Each Python file created in the <config>/python_scripts/ folder will be exposed as an action. The content is not cached so you can easily develop: edit file, save changes, perform action. The scripts are run in a sandboxed environment. The following variables are available in the sandbox:
Name Description hass The Home Assistant object. Access is only allowed to perform actions, set/remove states and fire events. API reference data The data passed to the Python Script action. logger A logger to allow you to log messages: logger.info() , logger.warning() , logger.error() . API reference time The stdlib time available as limited access. datetime The stdlib datetime available as limited access. dt_util The homeassistant.util.dt module. output An empty dictionary. Add items to return data as response_variable .
Other imports like min , max are available as builtins. See the python_script source code for up-to-date information on the available objects inside the script.
Note
It is not possible to use Python imports with this integration. If you want to do more advanced scripts, you can take a look at AppDaemon or pyscript
It is not possible to include your script as a button on the dashboard. A workaround is to create a helper button and create automation to run your script when the button state changes.
This is a simplified example that does no real work.
It is created as a first step, to help with:
Demonstrating how to set up the script
How to process the input data
How to log the script activity
How to troubleshoot / manually call the script.
Start by enabling the Python Scripts integration and create the first script.
Add to configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] : python_script:
Create the folder <config>/python_scripts
Create a file <config>/python_scripts/hello_world.py in the folder and give it this content:
# `data` is available as builtin and is a dictionary with the input data.
name = data . get ( " name " , " world " ) # `logger` and `time` are available as builtin without the need of explicit import.
logger . info ( " Hello {} at {} " . format ( name , time . time ()))
Start Home Assistant to reload the script configuration.
Call your new python_script.hello_world action (with parameters) from the Actions , using the YAML mode.
action : python_script.hello_world data : name : " Input-Text"
Tip
Running this script show absolutely no output on the screen, but it logs with level info . You must have the Logger enabled at least for level info .
Your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] should include something like this.
logger : default : info
The following example shows how to trigger a custom event over the hass.bus .
This example uses the hello_world.py from the previous example.
Edit the file adding the code listed below to the end of the file.
There is no need to reload the configuration or restart Home Assistant.
hass . bus . fire ( " hello_world_event " , { " wow " : " from a Python script! " })
This script doesn’t output anything. However, you can view the events being fired in the Developer tools.
From a separate browser window or tab, go to Developer tools -> Events and at Listen to events type hello_world_event and then press Start listening . You should see something like this:
event_type : hello_world_event data : wow : from a Python script! origin : LOCAL time_fired : " 2022-09-19T16:15:39.613378+00:00" context : id : 01GDB8H9JXJ1N23Q62SHX6PTBK parent_id : null user_id : null
The following example shows how to call a service from python_script . This script takes two parameters: entity_id (required), rgb_color (optional) and calls light.turn_on service by setting the brightness value to 255 .
# turn_on_light.py
entity_id = data . get ( " entity_id " ) rgb_color = data . get ( " rgb_color " , [ 255 , 255 , 255 ]) if entity_id is not None : service_data = { " entity_id " : entity_id , " rgb_color " : rgb_color , " brightness " : 255 } hass . services . call ( " light " , " turn_on " , service_data , False )
The above python_script can be called using the following YAML as an input.
- action : python_script.turn_on_light target : entity_id : light.bedroom data : rgb_color : [ 255 , 0 , 0 ]
Services can also respond with data. Retrieve this data in your Python script by setting the blocking and return_response arguments of the hass.services.call function to True . The example below retrieves the weather forecast and assigns it to the current_forecast variable:
# get_forecast.py
service_data = { " type " : " daily " , " entity_id " : [ " weather.YOUR_HOME " , " weather.YOUR_SCHOOL " ]} current_forecast = hass . services . call ( " weather " , " get_forecasts " , service_data , blocking = True , return_response = True )
Python script itself can respond with data. Just add items to the output variable in your python_script and the whole dictionary will be returned. These can be used in automations to act upon the command results using response_variable .
# hello_world.py
output [ " hello " ] = f " hello { data . get ( ' name ' , ' world ' ) } "
The above python_script can be called using the following YAML and return a result to later steps.
- action : python_script.hello_world response_variable : python_script_output - action : notify.send_message target : entity_id : notify.my_device data : message : " {{ python_script_output['hello'] }}"
You can add names and descriptions for your Python scripts that will be shown in the frontend. To do so, simply create a services.yaml file in your <config>/python_scripts folder. Using the above Python script as an example, the services.yaml file would look like:
# services.yaml turn_on_light : name : Turn on light description : Turn on a specific light and set its color. fields : entity_id : description : The light that will be turned on. example : light.bedroom rgb_color : description : The color to which the light will be set. example : [ 255 , 0 , 0 ]
For more examples, visit the Scripts section in our forum.
The Python Scripts integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload Python scripts ( python_script.reload )
Reloads the available Python scripts from the <config>/python_scripts folder.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Python Scripts integration was introduced in Home Assistant 0.47, and it's used by
2.3% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Automation
Back to top
