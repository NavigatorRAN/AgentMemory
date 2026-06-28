# Automation actions - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/automation/action
- Final URL: https://www.home-assistant.io/docs/automation/action
- Canonical URL: https://www.home-assistant.io/docs/automation/action/
- Fetched at: 2026-06-28T02:20:43Z
- Content type: text/html; charset=UTF-8

## Description

Automations result in action.

## Extracted Text

The action of an automation is what is being executed when an automation fires. The action part follows the script syntax which can be used to interact with anything via other actions or events.
For actions, you can specify the entity_id that it should apply to and optional parameters (to specify for example the brightness).
You can also perform the action to activate a scene which will allow you to define how you want your devices to be and have Home Assistant perform the right action.
automation : # Change the light in the kitchen and living room to 150 brightness and color red. triggers : - trigger : sun event : sunset actions : - action : light.turn_on target : entity_id : - light.kitchen - light.living_room data : brightness : 150 rgb_color : [ 255 , 0 , 0 ] automation 2 : # Notify me on my mobile phone of an event triggers : - trigger : sun event : sunset offset : -00:30 variables : notification_action : notify.paulus_iphone actions : # Actions are scripts so can also be a list of actions - action : " {{ notification_action }}" data : message : " Beautiful sunset!" - delay : 0:35 - action : notify.notify data : message : " Oh wow you really missed something great."
Conditions can also be part of an action. You can combine multiple actions and conditions in a single action, and they will be processed in the order you put them in. If the result of a condition is false, the action will stop there so any action after that condition will not be executed.
automation : - alias : " Office at evening" triggers : - trigger : state entity_id : sensor.office_occupancy to : " on" actions : - action : notify.notify data : message : " Testing conditional actions" - condition : or conditions : - condition : numeric_state entity_id : sun.sun attribute : elevation below : 4 - condition : numeric_state entity_id : sensor.office_illuminance below : 10 - action : scene.turn_on target : entity_id : scene.office_at_evening - action : light.turn_on target : " {{ {'entity_id': ['light.office', 'light.office_2']} }}" - action : switch.turn_on target : label_id : " {{ ['office_evening', 'office_after_15'] }}"
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
