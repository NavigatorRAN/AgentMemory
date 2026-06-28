# Shopping list - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/shopping_list
- Final URL: https://www.home-assistant.io/integrations/shopping_list
- Canonical URL: https://www.home-assistant.io/integrations/shopping_list/
- Fetched at: 2026-06-28T03:15:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Shopping list into Home Assistant using Intent.

## Extracted Text

On this page
Configuration
List of actions
Using in automations
The Shopping list integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to keep track of shopping list items.
Your shopping list will be accessible from the sidebar, and you can optionally add the To-do list card to your dashboard. With the conversation integration , you can add items to your shopping list using voice commands like “Add eggs to my shopping list.”
To add the Shopping list integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Shopping list .
Follow the instructions on screen to complete the setup.
The Shopping list integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add shopping list item ( shopping_list.add_item )
Adds an item to the shopping list.
Clear completed shopping list items ( shopping_list.clear_completed_items )
Removes completed items from the shopping list.
Complete all shopping list items ( shopping_list.complete_all )
Marks all items as completed in the shopping list.
Complete shopping list item ( shopping_list.complete_item )
Marks the first item with matching name as completed in the shopping list.
Incomplete all shopping list items ( shopping_list.incomplete_all )
Marks all items as incomplete in the shopping list.
Incomplete shopping list item ( shopping_list.incomplete_item )
Marks the first item with matching name as incomplete in the shopping list.
Remove shopping list item ( shopping_list.remove_item )
Removes the first item with matching name from the shopping list.
Sort shopping list items ( shopping_list.sort )
Sorts all items by name in the shopping list.
For an overview of every action across all integrations, see the actions reference .
A shopping_list_updated event is triggered when items in the list are modified, with the following data payload attached to it. This can be used to trigger automations such as sending a push notification when someone adds an item to the shopping list, which when clicked, will open the list.
Data payload attribute Description action What action was taken on the item. Either add for a new item being added, update for an item being updated, or remove for an item being removed. item A dictionary containing details of the item that was updated. item.id A unique ID for this item item.name The text attached to the item, for example Milk item.complete A boolean indicated whether the item has been marked as complete.
alias : " Notify on new shopping list item" triggers : - trigger : event event_type : shopping_list_updated event_data : action : " add" actions : - action : notify.notify data : message : " {{ trigger.event.data.item.name }} has been added to the shopping list" data : clickAction : " /shopping-list" url : " /shopping-list"
You can also trigger an automation when a shopping_list_updated event was triggered by any of the following actions:
clear : A completed item was cleared from the list.
sorted : The items in the list were sorted by name.
reorder : An item has been reordered in the list.
update_list : All items have been updated.
In these cases, the event does not return a list item.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Shopping list integration was introduced in Home Assistant 0.50, and it's used by
74.1% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Intent
To-do list
Back to top
