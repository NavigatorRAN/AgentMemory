---
source_url: "https://www.home-assistant.io/dashboards/button"
final_url: "https://www.home-assistant.io/dashboards/button"
canonical_url: "https://www.home-assistant.io/dashboards/button/"
source_handle: "web:www-home-assistant-io:866daf2f04bd"
source_section: "dashboards-button"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e2f9a480baa9acf60822671a0ec86267956f66bfb9ffdfb35d4beeff4d307e50"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Button card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/button
- Final URL: https://www.home-assistant.io/dashboards/button
- Canonical URL: https://www.home-assistant.io/dashboards/button/
- Fetched at: 2026-06-28T02:18:35Z
- Content type: text/html; charset=UTF-8

## Description

The Button card allows you to add buttons to perform tasks.

## Extracted Text

On this page
Adding the button card to a dashboard
Card settings
YAML configuration
Examples
Available colors
Related topics
The button card allows you to add buttons to perform tasks.
Screenshot of three button cards.
All options for this card can be configured via the user interface.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
Entity
The entity ID the card interacts with, for example, light.living_room .
Name
The button name that is displayed on the card. If this field is left blank and the card interacts with an entity, the button name defaults to the entity name. Otherwise, no name is displayed.
Icon
The icon that is displayed on the card. If this field is left blank and the card interacts with an entity, the icon defaults to the entity domain icon. Otherwise, no icon is displayed.
Icon Height
The height of the icon, in pixels.
Color
The color of the icon.
Theme
Name of any loaded theme to be used for this card. For more information about themes, see the frontend documentation .
Show Name
A toggle to show or hide the button name.
Show State
A toggle to show or hide the state of the entity.
Show Icon
A toggle to show or hide the icon.
Tap Action
The action taken on card tap. For more information, see the action documentation .
Hold Action
The action taken on card tap and hold. For more information, see the action documentation .
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
button
entity string ( Optional )
name string | map | list ( Optional , default: Entity name )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation . It defaults to the entity name only if the card interacts with an entity. Otherwise, if not configured, no name is displayed.
icon string ( Optional , default: Entity domain icon )
The icon that is displayed on the card. It defaults to the entity domain icon only if the card interacts with an entity. Otherwise, if not configured, no icon is displayed.
show_name boolean ( Optional , default: true )
If false, the button name is not shown on the card.
show_icon boolean ( Optional , default: true )
If false, the icon is not shown on the card.
show_state boolean ( Optional , default: false )
Show state.
icon_height string ( Optional , default: auto )
The height of the icon. Any CSS value may be used.
color string ( Optional , default: state )
Set the color for the icon. By default, the color is based on state , domain , and device_class of your entity. It accepts color token or hex color code.
tap_action map ( Optional )
hold_action map ( Optional )
double_tap_action map ( Optional )
The action taken on card double-tap. For more information, see the action documentation .
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
action_name string ( Optional , default: Run )
Override the default action name for a button row.
Basic example:
type : button entity : light.living_room
Button card with a button name and a script that runs when card is tapped:
Screenshot of the button card with script action.
type : button name : Turn Off Lights show_state : false tap_action : action : perform-action perform_action : script.turn_on data : entity_id : script.turn_off_lights
Example of 4 buttons on a vertical stack card:
Screenshot of a vertical stack card with 4 buttons and an entity selector.
The image shows a vertical stack card with 4 buttons arranged in a horizontal stack card and an entity selector. The buttons use the toggle action to run a script, for example, the Netflix script, which starts up the TV and opens Netflix. To learn how to create scripts, refer to scripts .
type : vertical-stack cards : - entities : - entity : input_select.living_room_scene name : Scene show_header_toggle : false type : entities - type : horizontal-stack cards : - name : Watch Netflix entity : script.netflix type : button tap_action : action : toggle hold_action : action : more-info show_name : true show_icon : true - name : Watch YouTube entity : script.youtube type : button tap_action : action : toggle hold_action : action : more-info show_name : true show_icon : true - name : Wake PC entity : script.wake_on_lan type : button tap_action : action : toggle icon : mdi:desktop-tower show_name : true show_icon : true show_state : false - name : Go to sleep entity : script.sleep type : button tap_action : action : toggle icon : mdi:sleep hold_action : action : more-info show_name : true show_icon : true
The following colors are available to colorize the button card: primary , accent , disabled , red , pink , purple , deep-purple , indigo , blue , light-blue , cyan , teal , green , light-green , lime , yellow , amber , orange , deep-orange , brown , grey , blue-grey , black , white , or any hex color code (for example, #93c47d ).
Card actions
Scripts
Themes
Dashboard cards
Card naming
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
Calendar
Clock
Conditional
Distribution
Energy cards
Entities
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
