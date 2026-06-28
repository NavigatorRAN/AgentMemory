# Garage door - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/garage_door
- Final URL: https://www.home-assistant.io/integrations/garage_door
- Canonical URL: https://www.home-assistant.io/integrations/garage_door/
- Fetched at: 2026-06-28T02:45:05Z
- Content type: text/html; charset=UTF-8

## Description

This integration provides garage door automation triggers and conditions.

## Extracted Text

On this page
Supported entities
Configuration
Supported functionality
List of triggers
List of conditions
Garage door automation examples
Automation: turn on the garage entry light when the garage door opens after dark
Automation: arm the garage alarm only when the garage door has been closed for 10 minutes
The Garage door integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides automation triggers and conditions for binary sensors with device class garage_door and covers with device class garage .
The Garage door integration supports the following entity types:
Binary sensors with device class garage_door .
Covers with device class garage .
The Garage door integration does not require any configuration.
The Garage door integration provides the following automation building blocks for supported garage door entities.
The Garage door integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Garage door closed ( garage_door.closed )
Triggers when one or more garage doors close.
Garage door opened ( garage_door.opened )
Triggers when one or more garage doors open.
For an overview of every trigger across all integrations, see the triggers reference .
The Garage door integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Garage door is closed ( garage_door.is_closed )
Tests if one or more garage doors are closed.
Garage door is open ( garage_door.is_open )
Tests if one or more garage doors are open.
For an overview of every condition across all integrations, see the conditions reference .
You can use these triggers and conditions to react when a garage door opens, confirm that it is closed before another automation continues, or remind yourself when it has been left open.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If you come home after sunset, this automation turns on the light near the garage entry as soon as the garage door opens.
Trigger : Garage door opened
Target : Garage door
Action : Turn on light
YAML example for turning on the garage entry light
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Turn on the garage entry light when the garage door opens after dark"
triggers:
- trigger: garage_door.opened
target:
entity_id: cover.garage_door
conditions:
- condition: numeric_state
entity_id: sun.sun
attribute: elevation
below: 0
actions:
- action: light.turn_on
entity_id: light.garage_entry
If you have created a bedtime helper A helper is a virtual entity you create inside Home Assistant. It is not backed by a physical device. Helpers store values, track state, or do calculations that your automations and dashboards need. [Learn more] separately, this automation waits for that helper to turn on, then checks that the garage door has stayed closed for 10 minutes before it arms the alarm.
Trigger : User-created bedtime helper turns on
Condition : Garage door is closed
For at least : 00:10:00
Action : Arm alarm away
YAML example for arming the garage alarm after the door stays closed
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Arm the garage alarm only when the garage door has been closed for 10 minutes"
- trigger: state
entity_id: input_boolean.bedtime_mode
to: "on"
- condition: garage_door.is_closed
options:
for: "00:10:00"
- action: alarm_control_panel.alarm_arm_away
entity_id: alarm_control_panel.garage_alarm
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Garage door system was introduced in Home Assistant 2026.4, and it's used by
1 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Back to top
