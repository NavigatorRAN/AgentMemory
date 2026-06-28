# Entities card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/entities
- Final URL: https://www.home-assistant.io/dashboards/entities
- Canonical URL: https://www.home-assistant.io/dashboards/entities/
- Fetched at: 2026-06-28T02:18:58Z
- Content type: text/html; charset=UTF-8

## Description

The entities card is the most common type of card. It groups items together into lists.

## Extracted Text

On this page
Adding the entities card to a dashboard
YAML configuration
Options for entities
Special row elements
Attribute
Button
Buttons
Cast
Conditional
Divider
Section
Weblink
Examples
Related topics
The entities card is the most common type of card. It groups items together into lists. It can be used to display an entity’s state or attribute, but also contain buttons, web links, and more.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
entities
entities list Required
A list of entity IDs or entity objects or special row objects (see below).
title string ( Optional )
Card title.
icon string ( Optional )
An icon to display to the left of the title.
show_header_toggle boolean ( Optional , default: true )
Button to turn on/off all entities.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
state_color boolean ( Optional , default: false )
Set to true to have icons colored when entity is active.
header map ( Optional )
Header widget to render. See header documentation .
footer map ( Optional )
Footer widget to render. See footer documentation .
If you define entities as objects instead of strings (by adding entity: before entity ID), you can add more customization and configuration.
entity string Required
Entity ID.
type string ( Optional )
Sets a custom card type: custom:my-custom-card . It also can be used to force entities with a default special row format to render as a simple state. You can do this by setting the type: simple-entity . This can be used, for example, to replace a helper with an editable control with a read-only value.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
Overwrites icon or entity picture.
image string ( Optional )
Overwrites entity picture.
secondary_info string ( Optional )
Show additional info. Values: entity-id , last-changed , last-updated , area , last-triggered (only for automations and scripts), position or tilt-position (only for supported covers), brightness (only for lights).
format string ( Optional )
How the state should be formatted. Currently only used for timestamp sensors. Valid values are: relative , total , date , time and datetime .
action_name string ( Optional )
Button label (only applies to script and scene rows).
tap_action map ( Optional )
Action taken on row tap. See action documentation .
hold_action map ( Optional )
Action taken on row tap and hold. See action documentation .
double_tap_action map ( Optional )
Action taken on row double tap. See action documentation .
confirmation map ( Optional )
For entities that display a button element in the row (for example, button, lock, script), this option adds a confirmation dialog to the press of the button. See options for confirmation for configuration options.
Rather than only displaying an entity’s state as a text output, the entities card supports multiple special rows for buttons, attributes, web links, dividers, sections, and more.
attribute
attribute string Required
Attribute to display from the entity.
prefix string ( Optional )
Text before entity state.
suffix string ( Optional )
Text after entity state.
Icon to use. Defaults to icon of entity.
How the attribute value should be formatted. Currently only supported for timestamp attributes. Valid values are: relative , total , date , time and datetime .
Row with an (optional) icon, label and a single text button at the end of the row that can trigger a defined action.
button
entity string ( Optional )
Entity ID. Either entity or name (or both) needs to be provided.
name string ( Optional )
Row label. Either entity or name (or both) needs to be provided.
Default:
Friendly name of entity if specified.
An icon to display to the left of the main label.
action_name string ( Optional , default: Run )
Button label.
tap_action map Required
Action taken on button tap. See action documentation .
Action taken on button tap and hold. See action documentation .
Action taken on button double tap. See action documentation .
Multiple buttons displayed in a single row next to each other. See examples further below.
buttons
A list of entities to show. Each entry is either an entity ID or a map.
Override the entity icon.
Override the entity image.
name string | map | list ( Optional , default: Entity name )
show_name boolean ( Optional , default: false )
If false, the button name is not shown.
show_icon boolean ( Optional , default: true )
If false, the icon is not shown.
Special row to start Home Assistant Cast.
cast
dashboard string ( Optional )
Path to the dashboard of the view that needs to be shown.
view string Required
Path to the view that needs to be shown.
name string ( Optional , default: Home Assistant Cast )
Name to show in the row.
Icon to use.
hass:television
hide_if_unavailable boolean ( Optional , default: false )
Hide this row if casting is not available in the browser.
Special row that displays based on entity states.
conditional
conditions list Required
List of conditions to check. See available conditions .
row map Required
Row to display if all conditions match. Can be any of the various supported rows described on this page.
divider
style map ( Optional )
Style the element using CSS.
height: 1px, background-color: var(–divider-color)
section
label string ( Optional )
Section label.
weblink
url string Required
Website URL, or internal URL such as /hassio/dashboard or /panel_custom_name .
name string ( Optional , default: URL path )
Link label.
icon string ( Optional , default: mdi:link )
Icon to display, for example mdi:home .
new_tab boolean ( Optional , default: false )
Open link in new tab. If link is external URL or a download link, this will automatically be true. Use if internal URL should be opened in new tab.
download boolean ( Optional , default: false )
Is link a download?
Entity rows
type : entities title : Entities card sample show_header_toggle : true header : image : " https://www.home-assistant.io/images/dashboards/header-footer/balloons-header.png" type : picture entities : - entity : alarm_control_panel.alarm name : Alarm Panel - device_tracker.demo_paulus - switch.decorative_lights - group.all_lights - group.all_locks
Buttons row
Above the divider are regular entity rows, below one of type buttons . Note that regular entity rows automatically show the entity name, whereas for buttons you have to explicitly specify a label / name.
Screenshot of buttons row.
type : entities entities : - entity : light.office_ceiling - entity : light.dining_ceiling - type : divider - type : buttons entities : - entity : light.office_ceiling name : Office Ceiling - entity : light.dining_ceiling name : Dining Ceiling
Other special rows
Screenshot of other special rows.
type : entities title : Entities card sample entities : - type : button icon : mdi:power name : Bed light transition action_name : Toggle light tap_action : action : perform-action perform_action : light.toggle data : entity_id : light.bed_light transition : 10 - type : divider - type : attribute entity : sun.sun attribute : elevation name : Sun elevation prefix : " ~" suffix : Units - type : conditional conditions : - entity : sun.sun state : above_horizon row : entity : sun.sun type : attribute attribute : azimuth icon : mdi:angle-acute name : Sun azimuth - type : section label : Section example - type : weblink name : Home Assistant url : https://www.home-assistant.io/ icon : mdi:home-assistant - type : button name : Power cycle LibreELEC icon : mdi:power-cycle tap_action : action : perform-action confirmation : text : Are you sure you want to restart? perform_action : script.libreelec_power_cycle
Card actions
Card header and footer
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
Calendar
Clock
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
