# Input boolean - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/input_boolean
- Final URL: https://www.home-assistant.io/integrations/input_boolean
- Canonical URL: https://www.home-assistant.io/integrations/input_boolean/
- Fetched at: 2026-06-28T02:52:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use the input boolean helper with Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Restore state
Automation examples
The Input boolean helper integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to define boolean values that
can be controlled via the user interface and can be used within conditions of
an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] . This can for example be used to disable or enable certain
automations by using them in their conditions Conditions are an optional part of an automation that will prevent an action from firing if they are not met. [Learn more] .
The preferred way to configure input boolean helpers is via the user interface,
in which they are known as Toggle Helpers. To add one, go to
Settings > Devices & services > Helpers and click the add button;
next choose the Toggle option.
To be able to add Helpers via the user interface you should have
default_config: in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] , it should already be there by
default unless you removed it. If you removed default_config: from your
configuration, you must add input_boolean: to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] first,
then you can use the UI.
Input booleans can also be configured via configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
Configuration Variables
Looking for your configuration file?
input_boolean map Required
Alias for the input. Multiple entries are allowed.
name string ( Optional )
Friendly name of the input.
initial boolean ( Optional )
Initial value when Home Assistant starts.
Default:
a previous value is restored if available
icon icon ( Optional )
Icon to display in front of the input element in the frontend.
# Example configuration.yaml entry input_boolean : notify_home : name : Notify when someone arrives home icon : mdi:car
The Input boolean integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload input booleans ( input_boolean.reload )
Reloads the input boolean helpers from the YAML configuration.
Toggle input boolean ( input_boolean.toggle )
Toggles an input boolean between on and off.
Turn off input boolean ( input_boolean.turn_off )
Turns an input boolean off.
Turn on input boolean ( input_boolean.turn_on )
Turns an input boolean on.
For an overview of every action across all integrations, see the actions reference .
If you set a valid value for initial this integration will start with the state
set to that value. Otherwise, it will restore the state it had before
Home Assistant stopping; if there is no state to restore - an off value is set.
Here’s an example of an automation using the above input_boolean . This action
will only occur if the input_boolean is on.
automation : alias : " Arriving home" triggers : - trigger : state entity_id : binary_sensor.motion_garage to : " on" conditions : - condition : state entity_id : input_boolean.notify_home state : " on" actions : - action : notify.pushbullet data : title : " " message : " Honey, I'm home!"
You can also set or change the status of an input_boolean by using
input_boolean.turn_on , input_boolean.turn_off or input_boolean.toggle in
your automation action.
action : input_boolean.turn_on target : entity_id : input_boolean.notify_home
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Input boolean helper was introduced in Home Assistant 0.11, and it's used by
33.2% of the active installations.
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
