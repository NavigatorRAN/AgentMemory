---
source_url: "https://www.home-assistant.io/dashboards/history-graph"
final_url: "https://www.home-assistant.io/dashboards/history-graph"
canonical_url: "https://www.home-assistant.io/dashboards/history-graph/"
source_handle: "web:www-home-assistant-io:2a2dfd12af2d"
source_section: "dashboards-history-graph"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3b1175fc6c75a1811d5ff89aee9dcc1bf90a7bfe1ec2dac62279bde1a2bb2af5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# History graph card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/history-graph
- Final URL: https://www.home-assistant.io/dashboards/history-graph
- Canonical URL: https://www.home-assistant.io/dashboards/history-graph/
- Fetched at: 2026-06-28T02:19:21Z
- Content type: text/html; charset=UTF-8

## Description

The history graph card allows you to display a graph for each of the entities listed.

## Extracted Text

On this page
Adding the history graph card to a dashboard
YAML configuration
Options for entities
Long term statistics
Examples
Related topics
The history graph card allows you to display a graph for each of up to eight entities.
Screenshot of the history graph card, when the sensor has no `unit_of_measurement` defined.
Screenshot of the history graph card, when the sensor has a `unit_of_measurement` defined.
Only the y-axis and logarithmic scale settings can be configured via the user interface. To configure the other options for this card, you need to edit the YAML configuration.
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
history-graph
entities list Required
A list of entity IDs or entity objects, see below.
hours_to_show integer ( Optional , default: 24 )
Hours to show in graph. Minimum is 1 hour. Big values can result in delayed rendering, especially if the selected entities have a lot of state changes.
title string ( Optional )
The card title.
show_names boolean ( Optional , default: true )
If false, no entity names are shown in the card.
logarithmic_scale boolean ( Optional , default: false )
If true, numerical values on the Y-axis will be displayed with a logarithmic scale.
min_y_axis float ( Optional )
Lower bound for the Y-axis range.
max_y_axis float ( Optional )
Upper bound for the Y-axis range.
fit_y_data boolean ( Optional , default: false )
If true, configured Y-axis bounds would automatically extend (but not shrink) to fit the data.
expand_legend boolean ( Optional , default: false )
If true, the legend will show all items initially
If you define entities as objects instead of strings, you can add more customization and configuration:
entity string Required
Entity ID.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
color string ( Optional )
Custom color. Can be defined as red (named color), '#ff0000' (hex format), rgb(255, 0, 0) (RGB format).
Home Assistant saves long-term statistics for a sensor if the entity has a state_class of measurement, total, or total_increasing. For long-term statistics, an hourly aggregate is stored from the sensor history. Long-term statistics are never purged.
In the history graph card, if the hours to show variable is set to a figure higher than the recorder retention period, long-term statistics will backfill the older parts of the history graph, with more recent actual sensor values from the recorder shown in bold.
type : history-graph title : ' My Graph' entities : - sensor.outside_temperature - entity : media_player.lounge_room name : Main player
Or with longer time frame, and multiple entities (as long as they share the same unit_of_measurement) in one graph:
type : history-graph title : " Temperatures in the last 48 hours" hours_to_show : 48 entities : - sensor.outside_temperature - entity : sensor.lounge_temperature name : " Lounge" - entity : sensor.attic_temperature name : " Attic"
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
