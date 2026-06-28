---
source_url: "https://www.home-assistant.io/dashboards/glance"
final_url: "https://www.home-assistant.io/dashboards/glance"
canonical_url: "https://www.home-assistant.io/dashboards/glance/"
source_handle: "web:www-home-assistant-io:9afb81627824"
source_section: "dashboards-glance"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b635c2a2008511f300961a98106b3b83554984d3c0d0198d5951905bd28f2557"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Glance card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/glance
- Final URL: https://www.home-assistant.io/dashboards/glance
- Canonical URL: https://www.home-assistant.io/dashboards/glance/
- Fetched at: 2026-06-28T02:19:10Z
- Content type: text/html; charset=UTF-8

## Description

The glance card is useful to group multiple sensors in a compact overview.

## Extracted Text

On this page
Adding the glance card to a dashboard
YAML configuration
Options for entities
Examples
Related topics
The glance card is useful to group multiple sensors in a compact overview. Keep in mind that this can be used together with entity-filter cards to create dynamic cards.
Screenshot of the glance card.
All options for this card can be configured via the user interface.
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
glance
entities list Required
A list of entity IDs or entity objects, see below.
title string ( Optional )
Card title.
show_name boolean ( Optional , default: true )
Show entity name.
show_icon boolean ( Optional , default: true )
Show entity icon.
show_state boolean ( Optional , default: true )
Show entity state text.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
columns integer ( Optional )
Number of columns to show. If not specified the number will be set automatically.
state_color boolean ( Optional , default: true )
Set to true to have icons colored when entity is active.
If you define entities as objects instead of strings, you can add more customization and configuration:
entity string Required
Entity ID.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
icon string ( Optional )
Overwrites icon.
image string ( Optional )
Overwrites entity picture.
show_last_changed boolean ( Optional , default: false )
Overwrites the state display with the relative time since last changed.
tap_action map ( Optional )
Action taken on card tap. See action documentation .
hold_action map ( Optional )
Action taken on card tap and hold. See action documentation .
double_tap_action map ( Optional )
Action taken on card double tap. See action documentation .
Basic example:
type : glance title : Glance card sample entities : - binary_sensor.movement_backyard - light.bed_light - binary_sensor.basement_floor_wet - sensor.outside_temperature - light.ceiling_lights - switch.ac - lock.kitchen_door
Screenshot of the glance card with custom title.
Define entities as objects and apply a custom name:
type : glance title : Better names entities : - entity : binary_sensor.movement_backyard name : Movement? - light.bed_light - binary_sensor.basement_floor_wet - sensor.outside_temperature - light.ceiling_lights - switch.ac - lock.kitchen_door - entity : switch.wall_plug_switch tap_action : action : toggle
Card actions
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
