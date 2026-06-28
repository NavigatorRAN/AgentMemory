# Automation actions - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/automation/services
- Final URL: https://www.home-assistant.io/docs/automation/services
- Canonical URL: https://www.home-assistant.io/docs/automation/services/
- Fetched at: 2026-06-28T02:20:54Z
- Content type: text/html; charset=UTF-8

## Description

Reference for the actions you can call from an automation, including how to pass data, target a specific entity, and chain multiple actions together.

## Extracted Text

On this page
Action automation.turn_on
Action automation.turn_off
Action automation.toggle
Action automation.trigger
Action automation.reload
The automation integration has actions to control automations, like turning automations on and off. This can be useful if you want to disable an automation from another automation.
This action enables the automation’s triggers A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] .
Data attribute Optional Description entity_id no Entity ID of automation to turn on. Can be a list. none or all are also accepted.
This action disables the automation’s triggers A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] , and optionally stops any currently active actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] .
Data attribute Optional Description entity_id no Entity ID of automation to turn off. Can be a list. none or all are also accepted. stop_actions yes Stop any currently active actions (defaults to true).
This action enables the automation’s triggers if they were disabled, or disables the automation’s triggers, and stops any currently active actions, if the triggers were enabled.
This action will trigger the action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] of an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] . By default it bypasses any conditions, though that can be changed via the skip_condition attribute.
Data attribute Optional Description entity_id no Entity ID of automation to trigger. Can be a list. none or all are also accepted. skip_condition yes Whether or not the condition will be skipped (defaults to true).
This action is only required if you create/edit automations in YAML. Automations via the UI do this automatically.
This action reloads all automations, stopping all currently active automation actions.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Basic automations
Using automation blueprints
Editor
Triggers
Conditions
Actions
Run modes
Automation actions
Templates
YAML
Testing and troubleshooting automations
Scenes
Blueprints
Scripts
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
