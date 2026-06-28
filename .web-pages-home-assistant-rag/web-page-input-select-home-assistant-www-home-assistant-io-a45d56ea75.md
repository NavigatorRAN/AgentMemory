---
source_url: "https://www.home-assistant.io/integrations/input_select"
final_url: "https://www.home-assistant.io/integrations/input_select"
canonical_url: "https://www.home-assistant.io/integrations/input_select/"
source_handle: "web:www-home-assistant-io:a45d56ea7532"
source_section: "integrations-input-select"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d8520b7ab0bfc13c6122814635ca9f383107a84660e5f2b1c2a2cdd3d8359682"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Input select - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/input_select
- Final URL: https://www.home-assistant.io/integrations/input_select
- Canonical URL: https://www.home-assistant.io/integrations/input_select/
- Fetched at: 2026-06-28T02:52:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the input select integration into Home Assistant.

## Extracted Text

On this page
Restore state
List of actions
Scenes
Automation examples
List of triggers
List of conditions
The Input select integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to define a list of values that can be selected via the frontend and can be used within conditions of an automation. When you select a new item, a state transition event is generated. This state event can be used in an automation trigger.
The preferred way to configure an input select is via the user interface at Settings > Devices & services > Helpers . Click the add button and then choose the Dropdown option.
To be able to add Helpers via the user interface you should have default_config: in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] , it should already be there by default unless you removed it.
If you removed default_config: from you configuration, you must add input_select: to your configuration.yaml first, then you can use the UI.
Input selects can also be configured via configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry input_select : who_cooks : name : Who cooks today options : - Paulus - Anne Therese initial : Anne Therese icon : mdi:panda living_room_preset : options : - Visitors - Visitors with kids - Home Alone
Configuration Variables
Looking for your configuration file?
input_select map Required
Alias for the input. Multiple entries are allowed.
options list Required
List of options to choose from.
name string ( Optional )
Friendly name of the input.
initial map ( Optional )
Initial value when Home Assistant starts.
Default:
First element of options
icon icon ( Optional )
Icon to display in front of the input element in the frontend.
Note
Because YAML defines booleans as equivalent, any variations of ‘On’, ‘Yes’, ‘Y’, ‘Off’, ‘No’, or ‘N’ (regardless of case) used as option names will be replaced by True and False unless they are defined in quotation marks.
If you set a valid value for initial this integration will start with the state set to that value. Otherwise, it will restore the state it had before Home Assistant stopping.
The Input select integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload input selects ( input_select.reload )
Reloads the input select helpers from the YAML configuration.
Select first input select option ( input_select.select_first )
Selects the first option of an input select.
Select last input select option ( input_select.select_last )
Selects the last option of an input select.
Select next input select option ( input_select.select_next )
Selects the next option of an input select.
Select input select option ( input_select.select_option )
Selects an option of an input select.
Select previous input select option ( input_select.select_previous )
Selects the previous option of an input select.
Set input select options ( input_select.set_options )
Sets the options of an input select.
For an overview of every action across all integrations, see the actions reference .
Specifying a target option in a Scene is simple:
# Example configuration.yaml entry scene : - name : Example1 entities : input_select.who_cooks : Paulus
The list of options can also be set in a Scene . In that case, you also need to specify what the new state will be.
# Example configuration.yaml entry scene : - name : Example2 entities : input_select.who_cooks : options : - Alice - Bob - Paulus state : Bob
The following example shows the usage of the input_select.select_option action in an automation:
# Example configuration.yaml entry automation : - alias : " example automation" triggers : - trigger : event event_type : MY_CUSTOM_EVENT actions : - action : input_select.select_option target : entity_id : input_select.who_cooks data : option : " Paulus"
To dynamically set the input_select options you can call input_select.set_options in an automation:
# Example configuration.yaml entry automation : - alias : " example automation" triggers : - trigger : event event_type : MY_CUSTOM_EVENT actions : - action : input_select.set_options target : entity_id : input_select.who_cooks data : options : [ " Item A" , " Item B" , " Item C" ]
Example of input_select being used in a bidirectional manner, both being set by and controlled by an MQTT action in an automation.
# Example configuration.yaml entry using 'input_select' in an action in an automation # Define input_select input_select : thermostat_mode : name : Thermostat Mode options : - " auto" - " off" - " cool" - " heat" icon : mdi:target # Automation. # This automation script runs when a value is received via MQTT on retained topic: thermostatMode # It sets the value selector on the GUI. This selector also had its own automation when the value is changed. - alias : " Set Thermostat Mode Selector" triggers : - trigger : mqtt topic : " thermostatMode" # entity_id: input_select.thermostat_mode actions : - action : input_select.select_option target : entity_id : input_select.thermostat_mode data : option : " {{ trigger.payload }}" # This automation script runs when the thermostat mode selector is changed. # It publishes its value to the same MQTT topic it is also subscribed to. - alias : " Set Thermostat Mode" triggers : - trigger : state entity_id : input_select.thermostat_mode actions : - action : mqtt.publish data : topic : " thermostatMode" retain : true payload : " {{ states('input_select.thermostat_mode') }}"
The Input select integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Dropdown selection changed ( select.selection_changed )
Triggers when the selected option of one or more dropdowns changes.
For an overview of every trigger across all integrations, see the triggers reference .
The Input select integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Dropdown option is selected ( select.is_option_selected )
Tests if one or more dropdowns have a specific option selected.
For an overview of every condition across all integrations, see the conditions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Input select helper was introduced in Home Assistant 0.13, and it's used by
15.6% of the active installations.
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
