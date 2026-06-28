---
source_url: "https://www.home-assistant.io/integrations/input_text"
final_url: "https://www.home-assistant.io/integrations/input_text"
canonical_url: "https://www.home-assistant.io/integrations/input_text/"
source_handle: "web:www-home-assistant-io:116244d3f206"
source_section: "integrations-input-text"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fa2eede926a48fe3ca6cdfadcca153a5a2c0bafa4dc0ac59e03f1ddd06287c81"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Input text - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/input_text
- Final URL: https://www.home-assistant.io/integrations/input_text
- Canonical URL: https://www.home-assistant.io/integrations/input_text/
- Fetched at: 2026-06-28T02:52:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Input text integration into Home Assistant.

## Extracted Text

On this page
List of actions
Restore state
Scenes
Automation examples
List of triggers
List of conditions
The Input text integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to define values that can be controlled via the frontend and can be used within conditions of automation. Changes to the value stored in the text box generate state events. These state events can be utilized as automation triggers as well. It can also be configured in password mode (obscured text).
The preferred way to configure an input text is via the user interface at Settings > Devices & services > Helpers . Click the add button and then choose the Text option.
To be able to add Helpers via the user interface you should have default_config: in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] , it should already be there by default unless you removed it.
If you removed default_config: from your configuration, you must add input_text: to your configuration.yaml first, then you can use the UI.
It can also be configured via configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entries input_text : text1 : name : Text 1 initial : Some Text text2 : name : Text 2 min : 8 max : 40 text3 : name : Text 3 pattern : " [a-fA-F0-9]*" text4 : name : Text 4 mode : password
Configuration Variables
Looking for your configuration file?
input_text map Required
Alias for the input. Multiple entries are allowed.
name string ( Optional )
Friendly name of the text input.
min integer ( Optional , default: 0 )
Minimum length for the text value.
max integer ( Optional , default: 100 )
Maximum length for the text value. 255 is the maximum number of characters allowed in an entity state.
initial string ( Optional )
Initial value when Home Assistant starts.
icon icon ( Optional )
Icon to display in front of the input element in the frontend.
pattern string ( Optional , default: empty )
Regex pattern for client-side validation.
mode string ( Optional , default: text )
Can specify text or password . Elements of type “password” provide a way for the user to securely enter a value.
The Input text integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload input texts ( input_text.reload )
Reloads the input text helpers from the YAML configuration.
Set input text value ( input_text.set_value )
Sets the value of an input text.
For an overview of every action across all integrations, see the actions reference .
If you set a valid value for initial this integration will start with state set to that value. Otherwise, it will restore the state it had before Home Assistant stopping.
To set the state of the input_text in a Scene :
# Example configuration.yaml entry scene : - name : Example1 entities : input_text.example : Hello!
Here’s an example using input_text in an action in an automation.
# Example configuration.yaml entry using 'input_text' in an action in an automation input_select : scene_bedroom : name : Scene options : - Select - Concentrate - Energize - Reading - Relax - ' OFF' initial : " Select" input_text : bedroom : name : Brightness automation : - alias : " Bedroom Light - Custom" triggers : - trigger : state entity_id : input_select.scene_bedroom actions : - action : input_text.set_value target : entity_id : input_text.bedroom data : value : " {{ states('input_select.scene_bedroom') }}"
The Input text integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Text changed ( text.changed )
Triggers when the value of one or more text entities changes.
For an overview of every trigger across all integrations, see the triggers reference .
The Input text integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Text is equal to ( text.is_equal_to )
Tests if one or more text entities are equal to a specified value.
For an overview of every condition across all integrations, see the conditions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Input text helper was introduced in Home Assistant 0.53, and it's used by
14.4% of the active installations.
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
