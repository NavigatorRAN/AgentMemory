# Input button - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/input_button
- Final URL: https://www.home-assistant.io/integrations/input_button
- Canonical URL: https://www.home-assistant.io/integrations/input_button/
- Fetched at: 2026-06-28T02:52:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use the input button helper with Home Assistant.

## Extracted Text

On this page
Configuration
Automation examples
List of actions
The Input button helper integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to define buttons that
can be pressed via the user interface, and can be used to trigger things,
like an automation.
The preferred way to configure button helpers is via the user interface.
To add one, go to Settings > Devices & services > Helpers
and click the add button; next choose the Button option.
To be able to add Helpers via the user interface you should have
default_config: in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] , it should already be there by
default unless you removed it. If you removed default_config: from your
configuration, you must add input_button: to your configuration.yaml first,
then you can use the UI.
Input buttons can also be configured via configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry input_button : ring_bell : name : Ring bell icon : mdi:bell
Configuration Variables
Looking for your configuration file?
input_button map Required
Alias for the input. Multiple entries are allowed.
name string ( Optional )
Friendly name of the input.
icon icon ( Optional )
Icon to display in front of the input element in the frontend.
The input_button entity is stateless, as in, it cannot have a state like the
on or off state that, for example, a normal switch entity has.
Every input button entity does keep track of the timestamp of when the last time
the input button entity has been pressed in the Home Assistant UI or pressed via
an action.
Because the state of a input button entity in Home Assistant is a timestamp, it
means we can use it in our automations. For example:
triggers : - trigger : state entity_id : input_button.my_button actions : - action : notify.frenck data : message : " My button has been pressed!"
The Input button integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Press input button ( input_button.press )
Presses an input button.
Reload input buttons ( input_button.reload )
Reloads the input button helpers from the YAML configuration.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Input button helper was introduced in Home Assistant 2022.2, and it's used by
13.6% of the active installations.
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
