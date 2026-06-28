---
source_url: "https://www.home-assistant.io/integrations/fan"
final_url: "https://www.home-assistant.io/integrations/fan"
canonical_url: "https://www.home-assistant.io/integrations/fan/"
source_handle: "web:www-home-assistant-io:6b6bb141f114"
source_section: "integrations-fan"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a8ec7b1af88a146c3d5efdeb097174b5796ca0f62bb9aa371e3cb70a318131d9"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Fan - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fan
- Final URL: https://www.home-assistant.io/integrations/fan
- Canonical URL: https://www.home-assistant.io/integrations/fan/
- Fetched at: 2026-06-28T02:42:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Fan devices within Home Assistant.

## Extracted Text

On this page
The state of a fan entity
Supported functionality
List of triggers
List of conditions
List of actions
Fan automation examples
Automation: Turn on the bedroom fan at bedtime
Automation: Notify when the bathroom fan has been left on
The Fan integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor fan devices.
Note
Building block integration
This fan is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this fan building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the fan building block offers.
The state of a fan entity can be either On or Off .
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Fan integration provides fan entities with these common features:
Turning a fan on and off.
Setting the speed as a percentage.
Setting a preset mode.
Turning oscillation on or off.
Changing the rotation direction.
Increasing or decreasing the speed in steps.
Not every fan supports every action. The actions available for a specific fan depend on the features exposed by that device.
The Fan integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Fan turned off ( fan.turned_off )
Triggers when one or more fans turn off.
Fan turned on ( fan.turned_on )
Triggers when one or more fans turn on.
For an overview of every trigger across all integrations, see the triggers reference .
The Fan integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Fan is off ( fan.is_off )
Tests if one or more fans are off.
Fan is on ( fan.is_on )
Tests if one or more fans are on.
For an overview of every condition across all integrations, see the conditions reference .
The Fan integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Decrease fan speed ( fan.decrease_speed )
Decrease the speed of a fan.
Increase fan speed ( fan.increase_speed )
Increase the speed of a fan.
Oscillate fan ( fan.oscillate )
Control the oscillation of a fan.
Set fan direction ( fan.set_direction )
Set a fan’s rotation direction.
Set fan speed ( fan.set_percentage )
Set the speed of a fan.
Set fan preset mode ( fan.set_preset_mode )
Set the preset mode of a fan.
Toggle fan ( fan.toggle )
Toggle a fan on or off.
Turn off fan ( fan.turn_off )
Turn off a fan.
Turn on fan ( fan.turn_on )
Turn on a fan. Optionally set the speed or preset mode at the same time.
For an overview of every action across all integrations, see the actions reference .
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
Start the bedroom fan automatically when you usually go to bed.
automation : - alias : " Turn on bedroom fan at bedtime" triggers : - trigger : time at : " 22:00:00" actions : - action : fan.turn_on target : entity_id : fan.bedroom
If the bathroom fan has been running for a while, send a reminder to turn it off after the room has cleared.
automation : - alias : " Bathroom fan reminder" triggers : - trigger : fan.turned_on target : entity_id : fan.bathroom options : behavior : each for : " 00:20:00" actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " The bathroom fan has been on for 20 minutes."
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fan entity was introduced in Home Assistant 0.27.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Fan
Back to top
