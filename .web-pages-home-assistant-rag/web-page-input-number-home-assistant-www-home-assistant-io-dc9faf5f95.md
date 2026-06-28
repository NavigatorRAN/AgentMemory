---
source_url: "https://www.home-assistant.io/integrations/input_number"
final_url: "https://www.home-assistant.io/integrations/input_number"
canonical_url: "https://www.home-assistant.io/integrations/input_number/"
source_handle: "web:www-home-assistant-io:dc9faf5f9528"
source_section: "integrations-input-number"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1ed58103236134257547ff7407ce655bf0009b77d3e02e34d1771c371bb1780b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Input number - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/input_number
- Final URL: https://www.home-assistant.io/integrations/input_number
- Canonical URL: https://www.home-assistant.io/integrations/input_number/
- Fetched at: 2026-06-28T02:52:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the input number integration into Home Assistant.

## Extracted Text

On this page
List of actions
Restore state
Scenes
Automation examples
The Input number integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to define values that can be controlled via the frontend and can be used within conditions of automation. The frontend can display a slider, or a numeric input box. Changes to the slider or numeric input box generate state events. These state events can be utilized as automation triggers as well.
The preferred way to configure an input number is via the user interface at Settings > Devices & services > Helpers . Click the add button and then choose the Number option.
To be able to add Helpers via the user interface you should have default_config: in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] , it should already be there by default unless you removed it.
If you removed default_config: from you configuration, you must add input_number: to your configuration.yaml first, then you can use the UI.
Input numbers can also be configured via configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry input_number : slider1 : name : Slider initial : 30 min : -20 max : 35 step : 1 box1 : name : Numeric Input Box initial : 30 min : -20 max : 35 step : 1 mode : box
Configuration Variables
Looking for your configuration file?
input_number map Required
Alias for the input. Multiple entries are allowed.
min float Required
Minimum value.
max float Required
Maximum value.
name string ( Optional )
Friendly name of the input.
initial float ( Optional , default: The value at shutdown )
Initial value when Home Assistant starts.
step float ( Optional , default: 1 )
Step value. Smallest value 0.001 .
mode string ( Optional , default: slider )
Can specify box or slider .
unit_of_measurement string ( Optional )
Unit of measurement in which the value of the slider is expressed in.
icon icon ( Optional )
Icon to display in front of the input element in the frontend.
The Input number integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Decrement input number ( input_number.decrement )
Decrements the value of an input number by 1 step.
Increment input number ( input_number.increment )
Increments the value of an input number by 1 step.
Reload input numbers ( input_number.reload )
Reloads the input number helpers from the YAML configuration.
Set input number value ( input_number.set_value )
Sets the value of an input number.
For an overview of every action across all integrations, see the actions reference .
If you set a valid value for initial this integration will start with the state set to that value. Otherwise, it will restore the state it had before Home Assistant stopping. initial is only available in a YAML configuration and not via the Home Assistant user interface.
To set the value of an input_number in a Scene :
# Example configuration.yaml entry scene : - name : Example Scene entities : input_number.example_number : 13
Here’s an example of input_number being used as a trigger in an automation.
# Example configuration.yaml entry using 'input_number' as a trigger in an automation input_number : bedroom_brightness : name : Brightness initial : 254 min : 0 max : 254 step : 1 automation : - alias : " Bedroom Light - Adjust Brightness" triggers : - trigger : state entity_id : input_number.bedroom_brightness actions : - action : light.turn_on target : entity_id : light.bedroom data : brightness : " {{ trigger.to_state.state | int }}"
Another code example using input_number , this time being used in an action in an automation.
# Example configuration.yaml entry using 'input_number' in an action in an automation input_select : scene_bedroom : name : Scene options : - Select - Concentrate - Energize - Reading - Relax - ' OFF' initial : " Select" input_number : bedroom_brightness : name : Brightness initial : 254 min : 0 max : 254 step : 1 automation : - alias : " Bedroom Light - Custom" triggers : - trigger : state entity_id : input_select.scene_bedroom to : " CUSTOM" actions : - action : light.turn_on target : entity_id : light.bedroom data : brightness : " {{ states('input_number.bedroom_brightness') | int }}"
Example of input_number being used in a bidirectional manner, both being set by and controlled by an MQTT action in an automation.
# Example configuration.yaml entry using 'input_number' in an action in an automation input_number : target_temp : name : Target Heater Temperature Slider min : 1 max : 30 step : 1 unit_of_measurement : step icon : mdi:target # This automation script runs when a value is received via MQTT on retained topic: setTemperature # It sets the value slider on the GUI. This slides also had its own automation when the value is changed. automation : - alias : " Set temp slider" triggers : - trigger : mqtt topic : " setTemperature" actions : - action : input_number.set_value target : entity_id : input_number.target_temp data : value : " {{ trigger.payload }}" # This second automation script runs when the target temperature slider is moved. # It publishes its value to the same MQTT topic it is also subscribed to. - alias : " Temp slider moved" triggers : - trigger : state entity_id : input_number.target_temp actions : - action : mqtt.publish data : topic : " setTemperature" retain : true payload : " {{ states('input_number.target_temp') | int }}"
Here’s an example of input_number being used as a delay in an automation.
# Example configuration.yaml entry using 'input_number' as a delay in an automation input_number : minutes : name : minutes icon : mdi:clock-start initial : 3 min : 0 max : 6 step : 1 seconds : name : seconds icon : mdi:clock-start initial : 30 min : 0 max : 59 step : 10 automation : - alias : " turn something off after x time after turning it on" triggers : - trigger : state entity_id : switch.something to : " on" actions : - delay : " 00:{{ states('input_number.minutes') | int }}:{{ states('input_number.seconds') | int }}" - action : switch.turn_off target : entity_id : switch.something
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Input number helper was introduced in Home Assistant 0.55, and it's used by
22.6% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Helper
Back to top
