---
source_url: "https://www.home-assistant.io/dashboards/todo-list"
final_url: "https://www.home-assistant.io/dashboards/todo-list"
canonical_url: "https://www.home-assistant.io/dashboards/todo-list/"
source_handle: "web:www-home-assistant-io:4ffea8812902"
source_section: "dashboards-todo-list"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c004e5e45f76f2f4e41b8554846f22e86dc5142fd503af32ebb224944ea3ad59"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# To-do list card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/todo-list
- Final URL: https://www.home-assistant.io/dashboards/todo-list
- Canonical URL: https://www.home-assistant.io/dashboards/todo-list/
- Fetched at: 2026-06-28T02:20:28Z
- Content type: text/html; charset=UTF-8

## Description

The to-do list card allows you to add, edit, check-off, and clear items from your to-do list.

## Extracted Text

On this page
Adding the to-do list card to a dashboard
YAML configuration
Options for due date period
Calendar
Related topics
The to-do list card allows you to add, edit, check-off, and clear items from your to-do list.
Screenshot of the to-do list card.
Add the card using the Add card button .
In the By card dialog, select the To-do list card.
In the Entity dropdown menu, select your list type.
If it is your first time working with to-do lists, there is only Shopping list in the menu.
This comes from the shopping list integration , which is installed by default.
This is the same Shopping list as the one on the To-do list dashboard (accessible via sidebar).
.
The to-do list card can display lists from different to-do list integrations, such as Bring! or Todoist .
If you don’t see your desired to-do list entity, you need to add its integration first.
Once you’ve added a to-do list integration, the lists are also available on the to-do list dashboard.
All options for this card can be configured via the user interface.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
todo-list
entity string Required
The to-do entity to show
title string ( Optional )
Title of to-do list.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
hide_completed boolean ( Optional , default: false )
Hide the completed items section in the card.
hide_create boolean ( Optional , default: false )
Hide the textbox for creating new tasks at the top of the card.
hide_section_headers boolean ( Optional , default: false )
Hide the ‘Active’ and ‘Completed’ sections with the overflow menus.
display_order string ( Optional , default: none )
Optionally sorts the items in the to-do list for display. Options are: none : Show the list in its original order. alpha_asc : Sort the list in alphabetical order. alpha_desc : Sort the list in reverse alphabetical order. duedate_asc : Sort the list by due date (soonest first). duedate_desc : Sort the list by reverse due date (soonest last).
item_tap_action string ( Optional , default: edit )
Defines the behavior when an item’s body is clicked. Options are: edit (opens the edit dialog), toggle (marks or unmarks the item as completed, hiding the edit dialog).
due_date_period map ( Optional )
Filters tasks based on their due date. See below .
Due date filtering can be configured with a calendar object:
Use a fixed period with an offset from the current period.
period string Required
The period to use. day , week , month , year
offset integer ( Optional )
The offset of the current period, so 0 means the current period, 1 is the next period.
Example, show all tasks due before the end of the current month:
type : todo-list entity : todo.todo_list due_date_period : calendar : period : month
Example, show all tasks due before the end of next week:
type : todo-list entity : todo.todo_list due_date_period : calendar : period : week offset : 1
Example, show all tasks due in the next 7 days:
type : todo-list entity : todo.todo_list due_date_period : calendar : period : day offset : 6 ## Examples Title example : ``` yaml type : todo-list entity : todo.todo_list title : Todo List
Dashboards
Themes
Dashboard cards
List of to do list integrations
Local to do integration
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
Dashboard basics
Introduction
Dashboard types
Views
Cards
Badges
View types
Masonry
Panel
Sections (default)
Sidebar
Card types
Activity
Alarm panel
Area
Button
Clock
Conditional
Distribution
Energy cards
Entities
Entity
Entity filter
Gauge
Glance
Grid
Heading
History graph
Horizontal stack
Humidifier
Light
Map
Markdown
Media control
Picture
Picture elements
Picture entity
Picture glance
Plant status
Sensor
Shortcut
Statistic
Statistics graph
Thermostat
Tile
To-do list
Vertical stack
Weather forecast
Webpage
Dashboard configuration
Card features
Card headers & footers
Dashboard actions
Developing custom cards
Voice assistants
Organization
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
