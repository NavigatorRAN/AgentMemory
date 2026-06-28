# Vertical stack card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/vertical-stack
- Final URL: https://www.home-assistant.io/dashboards/vertical-stack
- Canonical URL: https://www.home-assistant.io/dashboards/vertical-stack/
- Fetched at: 2026-06-28T02:20:31Z
- Content type: text/html; charset=UTF-8

## Description

The vertical stack card allows you to group multiple cards so they always sit in the same column.

## Extracted Text

On this page
Adding the vertical stack card to a dashboard
YAML configuration
Examples
Related topics
The vertical stack card allows you to group multiple cards so they always sit in the same column.
Screencast showing how to edit a dashboard and customize a vertical stack card.
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
vertical-stack
title string ( Optional )
Title of stack.
cards list Required
List of cards.
Basic example:
type : vertical-stack title : Backyard cards : - type : picture-entity entity : camera.demo_camera show_info : false - type : entities entities : - binary_sensor.movement_backyard
Picture and entities-card in a stack.
Combination of vertical and horizontal stack card:
type : vertical-stack cards : - type : picture-entity entity : group.all_lights image : /local/house.png - type : horizontal-stack cards : - type : picture-entity entity : light.ceiling_lights image : /local/bed_1.png - type : picture-entity entity : light.bed_light image : /local/bed_2.png
Create a grid layout using vertical and horizontal stack.
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
