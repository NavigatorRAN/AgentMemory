# Lock - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lock
- Final URL: https://www.home-assistant.io/integrations/lock
- Canonical URL: https://www.home-assistant.io/integrations/lock/
- Fetched at: 2026-06-28T02:57:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up your locks with Home Assistant.

## Extracted Text

On this page
The state of a lock entity
List of triggers
List of conditions
List of actions
Lock automation examples
Automation: turn on the hallway light when the front door unlocks
Automation: send a bedtime reminder if the front door is still unlocked
Keeps track of the locks in your environment, their state, and lets you control them.
Maintains a state per lock and a combined state all_locks .
Lets you use lock states in automations with built-in triggers, conditions, and actions.
Note
Building block integration
This lock is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this lock building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the lock building block offers.
A lock entity can have the following states:
Jammed : The lock is currently jammed.
Open : Indication of whether the lock is currently open.
Opening : Indication of whether the lock is currently opening.
Locked : The lock is currently locked.
Locking : The lock is in the process of being locked.
Unlocked : The lock is currently unlocked.
Unlocking : The lock is in the process of being unlocked.
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Lock integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Lock jammed ( lock.jammed )
Triggers when one or more locks jam.
Lock locked ( lock.locked )
Triggers when one or more locks lock.
Lock opened ( lock.opened )
Triggers when one or more locks open.
Lock unlocked ( lock.unlocked )
Triggers when one or more locks unlock.
For an overview of every trigger across all integrations, see the triggers reference .
The Lock integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Lock is jammed ( lock.is_jammed )
Tests if one or more locks are jammed.
Lock is locked ( lock.is_locked )
Tests if one or more locks are locked.
Lock is open ( lock.is_open )
Tests if one or more locks are open.
Lock is unlocked ( lock.is_unlocked )
Tests if one or more locks are unlocked.
For an overview of every condition across all integrations, see the conditions reference .
The Lock integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Lock lock ( lock.lock )
Locks one or more locks.
Open lock ( lock.open )
Unlatches one or more locks that support opening.
Unlock lock ( lock.unlock )
Unlocks one or more locks.
For an overview of every action across all integrations, see the actions reference .
The real power of the Lock integration is using your locks in automations.
Here are a few ideas to get you started.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If you often arrive home with your hands full, it helps when the light is already on. This automation turns on the hallway light when the front door unlocks.
Trigger : Lock unlocked
Target : Front door lock
Trigger when : Each
For at least : 00:00:00
Action : Turn on
YAML example for turning on the hallway light
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Turn on the hallway light when the front door unlocks"
triggers:
- trigger: lock.unlocked
target:
entity_id: lock.front_door
options:
behavior: each
for: "00:00:00"
actions:
- action: light.turn_on
entity_id: light.hallway
If you sometimes forget to lock the door before bed, a gentle reminder can help. This automation runs at night and sends a phone notification if the front door has stayed unlocked for 10 minutes.
Trigger : Time: 22:00
Condition : Lock is unlocked
Condition passes if : Any
For at least : 00:10:00
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for a bedtime lock reminder
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Remind me if the front door is unlocked at night"
- trigger: time
at: "22:00:00"
conditions:
- condition: lock.is_unlocked
behavior: any
for: "00:10:00"
- action: notify.send_message
entity_id: notify.my_device
data:
title: "Front door still unlocked"
message: "The front door has stayed unlocked for 10 minutes."
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Lock entity was introduced in Home Assistant 0.9.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Lock
Back to top
