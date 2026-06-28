# Distribution card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/distribution
- Final URL: https://www.home-assistant.io/dashboards/distribution
- Canonical URL: https://www.home-assistant.io/dashboards/distribution/
- Fetched at: 2026-06-28T02:18:53Z
- Content type: text/html; charset=UTF-8

## Description

The distribution card displays the values of multiple entities as a segmented bar.

## Extracted Text

On this page
Adding the distribution card to a dashboard
YAML configuration
Options for entities
Examples
Related topics
The distribution card displays the values of multiple entities as a segmented bar. Each entity is shown as a colored segment and listed in a legend below the bar.
Use this card to compare the current values of related entities, for example power sensors from different sources or loads.
Screenshot of the distribution card.
Selecting a segment in the bar opens the more-info dialog for that entity. You can also select legend items to hide or show individual segments.
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
distribution
entities list Required
A list of entity IDs or entity objects, see below.
title string ( Optional )
The card title.
If you define entities as objects instead of strings, you can add more customization and configuration:
entity string Required
Entity ID.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
color string ( Optional )
Overrides the color of the entity segment and legend marker.
Basic example:
type : distribution entities : - sensor.grid_power - sensor.solar_power - sensor.home_battery_power
With custom names and colors:
type : distribution title : Power distribution entities : - entity : sensor.grid_power name : Grid color : blue - entity : sensor.solar_power name : Solar color : " #ff9800" - entity : sensor.home_battery_power name : Battery color : " #4caf50"
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
