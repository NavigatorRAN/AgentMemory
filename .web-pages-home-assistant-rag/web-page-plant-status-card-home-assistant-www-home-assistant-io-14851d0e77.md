---
source_url: "https://www.home-assistant.io/dashboards/plant-status"
final_url: "https://www.home-assistant.io/dashboards/plant-status"
canonical_url: "https://www.home-assistant.io/dashboards/plant-status/"
source_handle: "web:www-home-assistant-io:14851d0e779f"
source_section: "dashboards-plant-status"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "72874aaf39428e54c865a8f8dd5a4efe11482a8f38b4d1ed37e3b836825ed267"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Plant status card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/plant-status
- Final URL: https://www.home-assistant.io/dashboards/plant-status
- Canonical URL: https://www.home-assistant.io/dashboards/plant-status/
- Fetched at: 2026-06-28T02:20:03Z
- Content type: text/html; charset=UTF-8

## Description

The plant status card is for all the lovely botanists out there.

## Extracted Text

On this page
Adding the plant status card to a dashboard
YAML configuration
Example
Related topics
The plant status card is for all the lovely botanists out there.
Screenshot of the plant status card.
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
plant-status
entity string Required
Entity ID of plant domain. For more information, see the plant integration .
name string | map | list ( Optional , default: Entity name )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
Basic example:
type : plant-status entity : plant.bonsai
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
