# Tile card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/tile
- Final URL: https://www.home-assistant.io/dashboards/tile
- Canonical URL: https://www.home-assistant.io/dashboards/tile/
- Fetched at: 2026-06-28T02:20:26Z
- Content type: text/html; charset=UTF-8

## Description

The tile card gives you a quick overview of an entity. The card allows you to toggle the entity, show the more-info dialog, or custom actions.

## Extracted Text

On this page
Adding the tile card to a dashboard
Examples
Available colors
Related topics
The tile card gives you a quick overview of an entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . The card allows you to add tap actions, and features to control the entity. You can also select the entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] to open the More info dialog. A badge is shown for some entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] like the climate or person entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] .
The circular background behind an icon indicates that there is a tap action.
The "Downstairs" and "Upstairs" climate entities have a badge and a feature that is bottom-aligned.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
Configuration Variables
Looking for your configuration file?
type string Required
tile
entity string Required
Entity ID.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
icon string ( Optional )
Overwrites the entity icon.
color string ( Optional , default: state )
Set the color when the entity is active. By default, the color is based on state , domain , and device_class of your entity. It accepts color token or hex color code.
show_entity_picture boolean ( Optional , default: false )
If your entity has a picture, it will replace the icon.
vertical boolean ( Optional , default: false )
Displays the icon above the name and state.
hide_state boolean ( Optional , default: false )
Hide the entity state.
state_content string | list ( Optional )
Content to display for the state. Can be state , last_changed , last_updated , or any attribute of the entity. Can be either a string with a single item, or a list of string items. Default depends on the entity domain.
tap_action map ( Optional )
Action taken on card tap. See action documentation . By default, it will show the “more-info” dialog.
hold_action map ( Optional )
Action taken on tap-and-hold. See action documentation .
double_tap_action map ( Optional )
Action taken on double tap. See action documentation .
icon_tap_action map ( Optional )
Action taken on icon card tap. See action documentation . By default, it will toggle the entity (if possible), otherwise, show the “more-info” dialog.
icon_hold_action map ( Optional )
Action taken on icon tap-and-hold. See action documentation .
icon_double_tap_action map ( Optional )
Action taken on icon double tap. See action documentation .
features list ( Optional )
Additional widgets to control your entity. See available features .
features_position string ( Optional , default: bottom )
Position of the features on the tile card. Can be bottom or inline . Only the first feature will be displayed when the option is set to inline . inline is not compatible with the vertical option.
Alternatively, the card can be configured using YAML:
type : tile entity : cover.kitchen_window
type : tile entity : light.bedroom icon : mdi:lamp color : yellow
type : tile entity : person.anne_therese show_entity_picture : true
type : tile entity : person.anne_therese vertical : true hide_state : true
type : tile entity : light.living_room state_content : - state - brightness - last-changed
type : tile entity : vacuum.ground_floor features : - type : vacuum-commands commands : - start_pause - return_home
The following colors are available to colorize the tile card: primary , accent , disabled , red , pink , purple , deep-purple , indigo , blue , light-blue , cyan , teal , green , light-green , lime , yellow , amber , orange , deep-orange , brown , grey , blue-grey , black , white , or any hex color code (for example, #93c47d ).
Card actions
Card naming
Card features
Dashboard cards
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
