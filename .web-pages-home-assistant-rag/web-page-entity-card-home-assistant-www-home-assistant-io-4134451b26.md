# Entity card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/entity
- Final URL: https://www.home-assistant.io/dashboards/entity
- Canonical URL: https://www.home-assistant.io/dashboards/entity/
- Fetched at: 2026-06-28T02:19:01Z
- Content type: text/html; charset=UTF-8

## Description

The entity card gives you a quick overview of your entity's state

## Extracted Text

On this page
Adding the entity card to a dashboard
YAML configuration
Example
Related topics
The entity card gives you a quick overview of your entity’s state.
Screenshot of the Entity card.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
All options for this card can be configured via the user interface.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
entity
entity string Required
Entity ID.
name string | map | list ( Optional , default: Entity name. )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
icon string ( Optional )
Overwrites icon.
state_color boolean ( Optional , default: false )
Set to true to have icon colored when entity is active.
attribute string ( Optional )
An attribute associated with the entity .
unit string ( Optional )
Unit of measurement given to data.
Default:
Unit of measurement given by entity.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
tap_action map ( Optional )
Action taken on card tap. See action documentation .
hold_action map ( Optional )
Action taken on card tap and hold. See action documentation .
double_tap_action map ( Optional )
Action taken on card double tap. See action documentation .
footer map ( Optional )
Footer widget to render. See footer documentation .
- type : entity entity : cover.kitchen_window - type : entity entity : light.bedroom attribute : brightness unit : " %" - type : entity entity : vacuum.downstairs name : Vacuum icon : " mdi:battery" attribute : battery_level unit : " %"
Themes
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
