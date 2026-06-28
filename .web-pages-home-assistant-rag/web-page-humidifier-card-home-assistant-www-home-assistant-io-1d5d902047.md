---
source_url: "https://www.home-assistant.io/dashboards/humidifier"
final_url: "https://www.home-assistant.io/dashboards/humidifier"
canonical_url: "https://www.home-assistant.io/dashboards/humidifier/"
source_handle: "web:www-home-assistant-io:1d5d90204771"
source_section: "dashboards-humidifier"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b82f366fb710b7fe5641a7528d927bc474eebbd0560dd348b864d99c4e4f801a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Humidifier card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/humidifier
- Final URL: https://www.home-assistant.io/dashboards/humidifier
- Canonical URL: https://www.home-assistant.io/dashboards/humidifier/
- Fetched at: 2026-06-28T02:19:26Z
- Content type: text/html; charset=UTF-8

## Description

The humidifier card gives control of your humidifier entity, allowing you to change the target humidity and mode of the entity.

## Extracted Text

On this page
Adding the humidifier card to a dashboard
YAML configuration
Example
Related topics
The humidifier card lets you control and monitor humidifiers, dehumidifiers, and hygrostat devices.
Screenshot of the humidifier card.
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
humidifier
entity string Required
Entity ID of humidifier domain.
name string | map | list ( Optional , default: Entity name )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
show_current_as_primary boolean ( Optional , default: false )
Show current humidity as primary information instead of target humidity. The target humidity will be displayed as secondary information.
features list ( Optional )
Additional widgets to control your entity. See available features . Only humidifier related features are supported.
type : humidifier entity : humidifier.bedroom name : Bedroom Humidifier
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
