# Siren - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/siren
- Final URL: https://www.home-assistant.io/integrations/siren
- Canonical URL: https://www.home-assistant.io/integrations/siren/
- Fetched at: 2026-06-28T03:16:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up siren devices within Home Assistant.

## Extracted Text

On this page
The state of a siren entity
List of triggers
List of conditions
List of actions
Siren automation examples
Automation: get a phone alert when the siren starts
Automation: turn off a siren after it has been on for 5 minutes
The Siren integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control siren and chime devices and build automations around when they turn on or off.
Note
Building block integration
This siren is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this siren building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the siren building block offers.
The state of a siren entity can be either On or Off .
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Siren integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Siren turned off ( siren.turned_off )
Triggers when one or more sirens turn off.
Siren turned on ( siren.turned_on )
Triggers when one or more sirens turn on.
For an overview of every trigger across all integrations, see the triggers reference .
The Siren integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Siren is off ( siren.is_off )
Tests if one or more sirens are off.
Siren is on ( siren.is_on )
Tests if one or more sirens are on.
For an overview of every condition across all integrations, see the conditions reference .
The Siren integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Toggle siren ( siren.toggle )
Toggles a siren on or off.
Turn off siren ( siren.turn_off )
Turns off a siren.
Turn on siren ( siren.turn_on )
Turns on a siren.
For an overview of every action across all integrations, see the actions reference .
You can use siren triggers and conditions in automations to stay informed, light a path, or silence a siren at the right time.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If a siren turns on while you are in another part of the building, you may want a notification right away. This automation sends a message to your phone as soon as the entry siren starts.
Trigger : Siren turned on
Target : Entry siren
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for a siren start notification
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Notify when the siren turns on"
triggers:
- trigger: siren.turned_on
target:
entity_id: siren.entry
actions:
- action: notify.send_message
entity_id: notify.my_device
data:
title: "Siren started"
message: >
The entry siren just turned on.
If you want a siren to stop after a set time, you can check whether it is still on before turning it off. This automation checks every minute and turns off the patio siren after it has stayed on for 5 minutes.
Trigger : Time pattern: Every minute
Condition : Siren is on
Target : Patio siren
For at least : 00:05:00
Action : Turn off siren
YAML example for turning off a siren after 5 minutes
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Turn off the patio siren after 5 minutes"
- trigger: time_pattern
minutes: "/1"
conditions:
- condition: siren.is_on
entity_id: siren.patio
options:
for: "00:05:00"
- action: siren.turn_off
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Siren entity was introduced in Home Assistant 2021.8.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Siren
Back to top
