# Lawn mower - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lawn_mower
- Final URL: https://www.home-assistant.io/integrations/lawn_mower
- Canonical URL: https://www.home-assistant.io/integrations/lawn_mower/
- Fetched at: 2026-06-28T02:55:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up and use lawn mowers in Home Assistant.

## Extracted Text

On this page
The state of a lawn mower entity
List of triggers
List of conditions
List of actions
Lawn mower automation examples
Automation: Send a notification when mowing is done
Automation: Return the mower to dock when rain starts
The Lawn mower integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you bring compatible robotic lawn mowers into Home Assistant.
Use it to monitor whether your mower is mowing, paused, returning to dock, docked, or reporting an error, and build automations around those states.
Note
Building block integration
This lawn mower is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this lawn mower building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the lawn mower building block offers.
A lawn mower entity can have the following states:
Mowing : The lawn mower is currently mowing.
Docked : The lawn mower is done mowing and is currently docked.
Paused : The lawn mower was active and is now paused.
Returning : The lawn mower is returning to the dock.
Error : The lawn mower encountered an error while active and needs assistance.
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Lawn mower integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Lawn mower returned to dock ( lawn_mower.docked )
Triggers after one or more lawn mowers have returned to dock.
Lawn mower encountered an error ( lawn_mower.errored )
Triggers when one or more lawn mowers encounter an error.
Lawn mower paused mowing ( lawn_mower.paused_mowing )
Triggers when one or more lawn mowers pause mowing.
Lawn mower started mowing ( lawn_mower.started_mowing )
Triggers when one or more lawn mowers start mowing.
Lawn mower started returning to dock ( lawn_mower.started_returning )
Triggers when one or more lawn mowers start returning to dock.
For an overview of every trigger across all integrations, see the triggers reference .
The Lawn mower integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Lawn mower is docked ( lawn_mower.is_docked )
Tests if one or more lawn mowers are docked.
Lawn mower is encountering an error ( lawn_mower.is_encountering_an_error )
Tests if one or more lawn mowers are encountering an error.
Lawn mower is mowing ( lawn_mower.is_mowing )
Tests if one or more lawn mowers are mowing.
Lawn mower is paused ( lawn_mower.is_paused )
Tests if one or more lawn mowers are paused.
Lawn mower is returning ( lawn_mower.is_returning )
Tests if one or more lawn mowers are returning to the dock.
For an overview of every condition across all integrations, see the conditions reference .
The Lawn mower integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Return lawn mower to dock ( lawn_mower.dock )
Returns a lawn mower to its dock.
Pause lawn mower ( lawn_mower.pause )
Pauses a lawn mower’s current task.
Start lawn mower ( lawn_mower.start_mowing )
Starts or resumes a lawn mower’s mowing task.
For an overview of every action across all integrations, see the actions reference .
You can use lawn mower triggers and conditions to react when mowing starts, pauses, or finishes.
You can also combine them with weather, time, and notifications to keep your yard routine simple.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
When the mower returns to dock, send a message so you know the job is finished without checking the app.
Trigger : Lawn mower returned to dock
Target : Backyard mower
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for notifying when mowing is done
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Notify when the mower is done"
triggers:
- trigger: lawn_mower.docked
target:
entity_id: lawn_mower.backyard
actions:
- action: notify.send_message
entity_id: notify.my_device
data:
message: "The backyard mower is back at the dock."
If rain starts while the mower is active, you can stop the run early and send it back to the dock.
Trigger : State: Rain sensor turned on
Condition : Lawn mower is mowing
Action : Return lawn mower to dock
YAML example for docking the mower when rain starts
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Dock the mower when it starts raining"
- trigger: state
entity_id: binary_sensor.rain_detected
to: "on"
conditions:
- condition: lawn_mower.is_mowing
- action: lawn_mower.dock
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Lawn mower entity was introduced in Home Assistant 2023.9.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Lawn mower
Back to top
