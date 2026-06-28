---
source_url: "https://www.home-assistant.io/integrations/switch"
final_url: "https://www.home-assistant.io/integrations/switch"
canonical_url: "https://www.home-assistant.io/integrations/switch/"
source_handle: "web:www-home-assistant-io:794c45c65452"
source_section: "integrations-switch"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "44eb5b6379ae1b8331ef89980cca96524ea17a5feb61c3c4b97596c4ffeca9f0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Switch - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/switch
- Final URL: https://www.home-assistant.io/integrations/switch
- Canonical URL: https://www.home-assistant.io/integrations/switch/
- Fetched at: 2026-06-28T03:19:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up your switches with Home Assistant.

## Extracted Text

On this page
The state of a switch entity
Device class
List of triggers
List of conditions
Using the actions
Related topics
The Switch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] manages the state of the switch entities and allows you to control them.
Maintains a state per switch and a combined state all_switches .
Registers actions switch.turn_on , switch.turn_off , and switch.toggle to control switches.
Note
Building block integration
This switch is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this switch building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the switch building block offers.
The state of a switch entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] can be either On or Off .
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
A device class is a measurement categorization in Home Assistant. It influences how the entity is represented in the dashboard . This can be modified in the customize section . For example, different states may be represented by different icons, colors, or text.
The following device classes are supported for switches:
None : Generic switch. This is the default and doesn’t need to be set.
outlet : A switch for a power outlet.
switch : A generic switch.
The Switch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Switch turned off ( switch.turned_off )
Triggers when one or more switches turn off.
Switch turned on ( switch.turned_on )
Triggers when one or more switches turn on.
For an overview of every trigger across all integrations, see the triggers reference .
The Switch integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Switch is off ( switch.is_off )
Tests if one or more switches are off.
Switch is on ( switch.is_on )
Tests if one or more switches are on.
For an overview of every condition across all integrations, see the conditions reference .
In the frontend open Settings . Select Developer tools , click Actions . From the Action dropdown menu choose switch.turn_on or switch.turn_off from the list of available actions. In the Entity dropdown menu choose or enter the entity ID you want to work with. This will enter something like the sample below into the data field. Now select Perform action .
{ "entity_id" : "switch.livingroom_pin2" }
Data attribute Optional Description entity_id no String or list of strings that point at entity_id s of switches. To target all switches, set entity_id to all .
Customizing devices
Dashboard
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Switch entity was introduced in Home Assistant 0.7.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Switch
Back to top
