---
source_url: "https://www.home-assistant.io/integrations/gate"
final_url: "https://www.home-assistant.io/integrations/gate"
canonical_url: "https://www.home-assistant.io/integrations/gate/"
source_handle: "web:www-home-assistant-io:820db585624a"
source_section: "integrations-gate"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7e41fe21886b8e7ff8a41ad9a74a7cd4409f511ece7486b0f8d867e7810c4824"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Gate - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/gate
- Final URL: https://www.home-assistant.io/integrations/gate
- Canonical URL: https://www.home-assistant.io/integrations/gate/
- Fetched at: 2026-06-28T02:45:14Z
- Content type: text/html; charset=UTF-8

## Description

Use gate triggers and conditions in Home Assistant automations.

## Extracted Text

On this page
Supported entities
Configuration
List of triggers
List of conditions
Gate automation examples
Automation: turn on the driveway lights when the gate opens after dark
Automation: remind you at bedtime if the gate is still open
Known limitations
The Gate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides dedicated triggers and conditions for gates in Home Assistant. It works with cover entities that use the gate device class, so you can react when a gate opens or closes, or check whether one is open before running an automation.
The Gate integration works with the following entity type when it uses the gate device class:
cover , like driveway or courtyard gates that report whether they are open or closed
The Gate integration does not require any configuration. It becomes available automatically when another integration provides a supported gate entity.
The Gate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Gate closed ( gate.closed )
Triggers when one or more gates close.
Gate opened ( gate.opened )
Triggers when one or more gates open.
For an overview of every trigger across all integrations, see the triggers reference .
The Gate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Gate is closed ( gate.is_closed )
Tests if one or more gates are closed.
Gate is open ( gate.is_open )
Tests if one or more gates are open.
For an overview of every condition across all integrations, see the conditions reference .
You can use these triggers and conditions to light your way, confirm that your property is secure, and get reminders when a gate is left open.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If you come home after sunset, this automation turns on the driveway lights as soon as the gate opens. That gives you light where you need it without leaving the lights on all evening.
Trigger : Gate opened
Target : Driveway gate
Action : Light: Turn on light
YAML example for driveway lights when the gate opens
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Turn on driveway lights when the gate opens after dark"
triggers:
- trigger: gate.opened
target:
entity_id: cover.driveway_gate
conditions:
- condition: sun
after: sunset
actions:
- action: light.turn_on
entity_id: light.driveway
At the end of the day, this automation checks whether the gate is still open before you settle in for the night. If it is, Home Assistant sends a reminder so you can close it.
Trigger : Time
Condition : Gate is open
Condition passes if : Any
Action : Send a notification message
Target : Mobile app
YAML example for a bedtime gate reminder
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Remind me if the gate is still open at bedtime"
- trigger: time
at: "22:30:00"
- condition: gate.is_open
options:
behavior: any
- action: notify.send_message
entity_id: notify.my_mobile_app
data:
title: "Gate still open"
message: "The driveway gate is still open. Close it before bed."
Only cover entities that use the gate device class appear in these triggers and conditions. If your device uses a different entity type or device class, it will not be available here.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Gate system was introduced in Home Assistant 2026.4, and it's used by
0 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Back to top
