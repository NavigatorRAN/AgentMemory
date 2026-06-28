# Floors - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/organizing/floors
- Final URL: https://www.home-assistant.io/docs/organizing/floors
- Canonical URL: https://www.home-assistant.io/docs/organizing/floors/
- Fetched at: 2026-06-28T02:22:24Z
- Content type: text/html; charset=UTF-8

## Description

Group your areas per floor

## Extracted Text

On this page
Creating a floor
Reordering floors on built-in dashboards
Deleting a floor
Related topics
A floor in Home Assistant is a logical grouping of areas An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. [Learn more] meant to match your home’s physical floors.
Devices and entities cannot be assigned to floors directly but to areas. Floors can be used in automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] and scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] as a target for actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . For example, to turn off all the lights on the downstairs floor when you go to bed.
Follow these steps to create a new floor.
Go to Settings > Areas, labels & zones and select Create floor .
In the dialog, enter the floor details:
Give the floor a Name (required).
Add a floor Level .
The number can be negative. For example for underground floors.
This number can later be used for sorting.
Add an icon (We use Material icons ).
Add an Alias .
Aliases are alternative names used in voice assistants to refer to an entity, area, or floor.
Select Add .
Result: A new floor is created.
You can now assign areas to that floor .
Follow these steps to rearrange floors and areas on the built-in dashboards (such as Overview , Lights , and Security ).
Go to Settings > Areas, labels & zones .
There are 2 options to rearrange items:
Option 1 : Use drag-and-drop.
Option 2 : In the top-right corner, select the three dots menu and select Reorder floors and areas .
In the dialog, move the floors or areas you want to rearrange:
Follow these steps to delete a floor. Areas that are assigned to a floor will become unassigned. Automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] and scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] or voice assistants that used a floor as a target will no longer work as they no longer have a target.
Next to the floor, select the three dots menu and select Delete floor .
If you have automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] , scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] , or voice assistants that used floors as a target, you will need to update these.
Areas
Grouping your assets
Labels
Using floors in templates
Using floor alias for voice assistants
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Working with tables
Floors
Categories
Icons
Home energy management
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
