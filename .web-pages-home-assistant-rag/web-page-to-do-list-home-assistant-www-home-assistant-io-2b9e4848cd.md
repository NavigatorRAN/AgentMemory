# To-do list - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/todo
- Final URL: https://www.home-assistant.io/integrations/todo
- Canonical URL: https://www.home-assistant.io/integrations/todo/
- Fetched at: 2026-06-28T03:22:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use to-do lists within Home Assistant.

## Extracted Text

On this page
Viewing and managing to-do lists
The state of a to-do list entity
Blueprint to add an item to a dedicated list
List of triggers
List of conditions
List of actions
To-do list automation examples
Automation: send a notification when someone adds a shopping item
Automation: lock the front door when the evening checklist is finished
Related topics
The To-do list integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides to-do list entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , allowing other integrations
to integrate to-do lists into Home Assistant. To-do lists are shown on the To-do lists
dashboard for tracking items and whether they have been completed.
Note
Building block integration
This to-do list is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this to-do list building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the to-do list building block offers.
For example, Local to-do is a fully local integration to create to-do lists and tasks within your Home Assistant instance, Shopping list specifically for shopping that can be added to with Assist, or other integrations work with online services providing to-do list data.
Each to-do list is represented as its own entity in Home Assistant and can be
viewed and managed on a to-do list dashboard. You can find the to-do list dashboard
in the main sidebar of your Home Assistant instance.
The state of a to-do list entity is a number, which represents the number of
incomplete items in the list.
Screenshot showing the state of a to-do list entity in the developer tools.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
This blueprint allows you to create a script to add an
item to a pre-configured to-do list.
The To-do list integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
To-do item added ( todo.item_added )
Triggers when one or more to-do items are added to a list.
To-do item completed ( todo.item_completed )
Triggers when one or more to-do items are marked as done.
To-do item removed ( todo.item_removed )
Triggers when one or more to-do items are removed from a list.
For an overview of every trigger across all integrations, see the triggers reference .
The To-do list integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
All to-do items completed ( todo.all_completed )
Tests if all to-do items are completed in one or more to-do lists.
Incomplete to-do items ( todo.incomplete )
Tests the number of incomplete to-do items in one or more to-do lists.
For an overview of every condition across all integrations, see the conditions reference .
The To-do list integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add to-do list item ( todo.add_item )
Adds a new item to a to-do list.
Get to-do list items ( todo.get_items )
Gets the items on a to-do list.
Remove completed to-do list items ( todo.remove_completed_items )
Removes all completed items from a to-do list.
Remove to-do list item ( todo.remove_item )
Removes an item from a to-do list.
Update to-do list item ( todo.update_item )
Updates an existing item on a to-do list.
For an overview of every action across all integrations, see the actions reference .
To-do list triggers and conditions make it easier to react to changes in a list or check whether a list still needs attention.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If you share a shopping list with your household, this automation lets you know right away when someone adds a new item.
Trigger : To-do item added
Target : Shopping list
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for a shopping list notification
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Notify me when a shopping item is added"
triggers:
- trigger: todo.item_added
target:
entity_id: todo.shopping_list
actions:
- action: notify.send_message
entity_id: notify.my_device
data:
message: >
A new item was added to the shopping list.
If you keep an evening checklist in Home Assistant, this automation locks the front door after the last task is marked complete.
Trigger : To-do item completed
Condition : All to-do items completed
Target : Evening checklist
Action : Lock lock
YAML example for locking up after the evening checklist is done
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Lock the front door when the evening checklist is done"
- trigger: todo.item_completed
entity_id: todo.evening_checklist
conditions:
- condition: todo.all_completed
- action: lock.lock
entity_id: lock.front_door
To do list card
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The To-do list entity was introduced in Home Assistant 2023.11.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
To-do list
Back to top
