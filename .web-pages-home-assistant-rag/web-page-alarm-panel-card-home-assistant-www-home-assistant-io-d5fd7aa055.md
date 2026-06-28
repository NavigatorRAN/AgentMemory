---
source_url: "https://www.home-assistant.io/dashboards/alarm-panel"
final_url: "https://www.home-assistant.io/dashboards/alarm-panel"
canonical_url: "https://www.home-assistant.io/dashboards/alarm-panel/"
source_handle: "web:www-home-assistant-io:d5fd7aa05596"
source_section: "dashboards-alarm-panel"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "24a96387d4900e0749ff28b4f319e80b4b822258a60101096d438aa6a3b55f87"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Alarm panel card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/alarm-panel
- Final URL: https://www.home-assistant.io/dashboards/alarm-panel
- Canonical URL: https://www.home-assistant.io/dashboards/alarm-panel/
- Fetched at: 2026-06-28T02:18:26Z
- Content type: text/html; charset=UTF-8

## Description

The alarm panel card allows you to arm and disarm your alarm control panel integrations.

## Extracted Text

On this page
Adding the alarm panel card to a dashboard
YAML configuration
Examples
Related topics
The alarm panel card allows you to arm and disarm your alarm control panel integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] .
Screenshot of the alarm panel card.
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
alarm-panel
entity string Required
Entity ID of alarm_control_panel domain.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
Default:
Current state of the alarm entity.
states list ( Optional )
Controls which states to have available.
arm_home, arm_away
arm_home
Arm Home
arm_away
Arm Away
arm_night
Arm Night
arm_custom_bypass
Arm Custom Bypass
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
Title example:
type : alarm-panel name : House Alarm entity : alarm_control_panel.alarm
Define the state list:
type : alarm-panel name : House Alarm entity : alarm_control_panel.alarm states : - arm_home - arm_away - arm_night - armed_custom_bypass
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
