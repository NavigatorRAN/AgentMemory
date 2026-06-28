---
source_url: "https://www.home-assistant.io/dashboards/grid"
final_url: "https://www.home-assistant.io/dashboards/grid"
canonical_url: "https://www.home-assistant.io/dashboards/grid/"
source_handle: "web:www-home-assistant-io:d6fb514ab674"
source_section: "dashboards-grid"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c458519fa21e4ff05adac2fe0a9372032c078f35dc397a480d5d95bb7c79556f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Grid card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/grid
- Final URL: https://www.home-assistant.io/dashboards/grid
- Canonical URL: https://www.home-assistant.io/dashboards/grid/
- Fetched at: 2026-06-28T02:19:13Z
- Content type: text/html; charset=UTF-8

## Description

The grid card allows you to show multiple cards in a grid.

## Extracted Text

On this page
Adding the grid card to a dashboard
YAML configuration
Examples
Related topics
The grid card allows you to show multiple cards in a grid. It will first fill the columns, automatically adding new rows as needed.
Screenshot of the grid card.
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
grid
title string ( Optional )
Title of grid.
square boolean ( Optional , default: true )
Should the cards be shown square.
columns integer ( Optional , default: 3 )
Number of columns in the grid.
cards list Required
List of cards.
Basic example:
type : grid cards : - type : picture-entity entity : camera.demo_camera show_info : false - type : entities entities : - binary_sensor.movement_backyard
Defining columns and disabling the square option:
type : grid title : Backyard columns : 2 square : false cards : - type : picture-entity entity : group.all_lights image : /local/house.png - type : horizontal-stack cards : - type : picture-entity entity : light.ceiling_lights image : /local/bed_1.png - type : picture-entity entity : light.bed_light image : /local/bed_2.png
Themes
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
