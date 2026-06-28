---
source_url: "https://www.home-assistant.io/integrations/window"
final_url: "https://www.home-assistant.io/integrations/window"
canonical_url: "https://www.home-assistant.io/integrations/window/"
source_handle: "web:www-home-assistant-io:b963e8c2d63c"
source_section: "integrations-window"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ee20f3e90a905c2a5198d108201aa306ba59bdb2e1d188aa52362d33a7c1e96d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Window - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/window
- Final URL: https://www.home-assistant.io/integrations/window
- Canonical URL: https://www.home-assistant.io/integrations/window/
- Fetched at: 2026-06-28T03:28:45Z
- Content type: text/html; charset=UTF-8

## Description

Use window triggers and conditions in Home Assistant automations.

## Extracted Text

On this page
List of triggers
List of conditions
List of actions
Window automation examples
Automation: send a reminder if a window opens after sunset
Automation: turn heating back on after bedroom window is closed
The Window integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides dedicated triggers and conditions for windows in Home Assistant. It works with binary sensors and covers that use the window device class, so you can react when a window opens or closes, or check whether one is open before running an automation.
Note
Building block integration
This window is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this window building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the window building block offers.
The Window integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Window closed ( window.closed )
Triggers when one or more windows close.
Window opened ( window.opened )
Triggers when one or more windows open.
For an overview of every trigger across all integrations, see the triggers reference .
The Window integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Window is closed ( window.is_closed )
Tests if one or more windows are closed.
Window is open ( window.is_open )
Tests if one or more windows are open.
For an overview of every condition across all integrations, see the conditions reference .
This integration does not provide any documented actions yet. See the actions reference for actions from other integrations.
You can use these triggers and conditions to protect your home, avoid wasting energy, and get timely reminders.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If a kitchen window opens after dark, you might want a quick reminder so you can check whether everything is fine before going to bed.
Trigger : Window opened
Target : Kitchen window sensor
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for an evening window reminder
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Notify when the kitchen window opens after sunset"
triggers:
- trigger: window.opened
target:
entity_id: binary_sensor.kitchen_window
options:
behavior: each
for: "00:00:00"
conditions:
- condition: sun
after: sunset
actions:
- action: notify.send_message
entity_id: notify.my_device
data:
title: "Kitchen window opened"
message: "The kitchen window was opened after sunset."
If you open a bedroom window to air out the room, you can wait until it is closed again before turning the heating back on.
Trigger : Window closed
Target : Bedroom window sensor
Action : Climate: Set HVAC mode to heat
YAML example for restoring heating after a window closes
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Resume bedroom heating when the window closes"
- trigger: window.closed
entity_id: binary_sensor.bedroom_window
for: "00:02:00"
- action: climate.set_hvac_mode
entity_id: climate.bedroom
hvac_mode: heat
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Window system was introduced in Home Assistant 2026.4, and it's used by
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
