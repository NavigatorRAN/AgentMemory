---
source_url: "https://www.home-assistant.io/dashboards/statistics-graph"
final_url: "https://www.home-assistant.io/dashboards/statistics-graph"
canonical_url: "https://www.home-assistant.io/dashboards/statistics-graph/"
source_handle: "web:www-home-assistant-io:4312e8db0760"
source_section: "dashboards-statistics-graph"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "22c291cd68e43a315808ce9d407acc6f84a8d933ef38bddcea9279547d620c90"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Statistics graph card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/statistics-graph
- Final URL: https://www.home-assistant.io/dashboards/statistics-graph
- Canonical URL: https://www.home-assistant.io/dashboards/statistics-graph/
- Fetched at: 2026-06-28T02:20:21Z
- Content type: text/html; charset=UTF-8

## Description

The statistics graph card allows you to display a graph with statistics data for each of the entities listed.

## Extracted Text

On this page
Adding the statistics graph card to a dashboard
YAML configuration
Options for entities
Example
Related topics
The statistics graph card allows you to display a graph of statistics data for each of the entities listed.
Screenshot of the statistics graph card with no metered entities and `chart_type` `line`.
Screenshot of the statistics graph card with a metered entity and `chart_type` `bar`.
Screenshot of the statistics graph card with values stacked using `chart_type` `bar-stack`.
Statistics are gathered every 5 minutes and also hourly for sensors with a state_class of measurement, total or total_increasing. The 5-minute statistics will be retained for the duration set in the recorder configuration , and hourly statistics will be retained indefinitely. It will either keep the min , max , and mean of a sensor’s value for a specific hour or the sum for a metered entity.
If your sensor doesn’t work with statistics, check this .
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
statistics-graph
entities list Required
A list of entity IDs or entity objects (see below), or an external statistic id
days_to_show integer ( Optional , default: 30 )
Days to show in graph. Minimum is 1 day.
chart_type string ( Optional )
If the graph should be rendered as a bar or a line chart. Alternatively, using bar-stack or line-stack select stacked versions of the chart.
stat_types list ( Optional )
The statistics types to render. min , max , mean , sum , state , change . When using stacked charts, it is recommended to select only one option.
title string ( Optional )
The card title.
period string ( Optional )
The period of the rendered graph. 5minute , hour , day , week , month or year . If energy_date_selection is true, and period is not defined or set to auto , the chart period will auto-select between month/day/hour based on the selected date range.
hide_legend boolean ( Optional , default: false )
If true, the legend will be hidden.
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
energy_date_selection boolean ( Optional , default: false )
If true, chart date range will follow the date selected on an energy-date-selection card on the same view, similar to energy cards.
collection_key string ( Optional )
If using energy_date_selection , you can set a custom key to match the optional key of an energy-date-selection card. This is not typically required, but can be useful if multiple date selection cards are used on the same view.
If you define entities as objects instead of strings, you can add more customization and configuration:
entity string Required
Entity ID.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
color string ( Optional )
Custom color. Can be defined as red (named color), '#ff0000' (hex format), rgb(255, 0, 0) (RGB format).
type : statistics-graph title : ' My Graph' entities : - sensor.outside_temperature - entity : sensor.inside_temperature name : Inside
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
