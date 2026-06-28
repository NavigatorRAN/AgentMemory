---
source_url: "https://www.home-assistant.io/dashboards/light"
final_url: "https://www.home-assistant.io/dashboards/light"
canonical_url: "https://www.home-assistant.io/dashboards/light/"
source_handle: "web:www-home-assistant-io:376f58a2182d"
source_section: "dashboards-light"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4863b70d6eac985ed4b60016ade03f7c96667398f36d381b9009c57837c15cdf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Light card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/light
- Final URL: https://www.home-assistant.io/dashboards/light
- Canonical URL: https://www.home-assistant.io/dashboards/light/
- Fetched at: 2026-06-28T02:19:32Z
- Content type: text/html; charset=UTF-8

## Description

The light card allows you to change the brightness of a light.

## Extracted Text

On this page
Adding the light card to a dashboard
YAML configuration
Examples
Related topics
The light card allows you to change the brightness of a light.
Screenshot of the light card.
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
light
entity string Required
Entity ID of light domain.
name string | map | list ( Optional , default: Name of entity )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
icon string ( Optional , default: Entity domain icon )
Overwrites icon.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
hold_action map ( Optional )
Action taken on card tap and hold. See action documentation .
double_tap_action map ( Optional )
Action taken on card double tap. See action documentation .
Basic example:
type : light entity : light.bedroom
Overwriting names example:
type : light entity : light.bedroom name : Kids Bedroom
type : light entity : light.office name : My Office
Screenshot of the Light card names.
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
