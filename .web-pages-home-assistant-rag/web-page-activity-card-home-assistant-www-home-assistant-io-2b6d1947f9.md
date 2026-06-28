# Activity card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/logbook
- Final URL: https://www.home-assistant.io/dashboards/logbook
- Canonical URL: https://www.home-assistant.io/dashboards/logbook/
- Fetched at: 2026-06-28T02:19:34Z
- Content type: text/html; charset=UTF-8

## Description

The activity card displays the activity of specific entities, devices, areas, and/or labels.

## Extracted Text

On this page
Adding the activity card to a dashboard
Card settings
YAML configuration
Examples
Related topics
The activity card displays entries from the activity for specific entities, devices, areas, and/or labels.
Screenshot of the activity card.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
Target
The entities, devices, areas and labels whose activity entries will show in the card. See target selector for more information.
Title
The title that shows on the top of the card.
Hours to show
The number of hours in the past that will be tracked in the card.
Theme
Name of any loaded theme to be used for this card. For more information about themes, see the frontend documentation .
State filter
Limit the displayed logbook entries to only the specified states.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI. Activity used to be called “logbook” in the past, and is still called logbook in YAML.
Configuration Variables
Looking for your configuration file?
type string Required
logbook
target map Required
The target to use for the card.
title string ( Optional )
Title of the card.
hours_to_show integer ( Optional , default: 24 )
Number of hours in the past to track. Minimum is 1 hour. Big values can result in delayed rendering, especially if the selected entities have a lot of state changes.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
state_filter list ( Optional )
Limit the displayed logbook entries to only the selected states. For example a list of ['on'] will display entries when targeted entities turn on, but not when they turn off.
type : logbook target : entity_id : - fan.ceiling_fan - fan.living_room_fan - light.ceiling_lights hours_to_show : 24
type : logbook target : area_id : living_room device_id : - ff22a1889a6149c5ab6327a8236ae704 - 52c050ca1a744e238ad94d170651f96b entity_id : - light.hallway - light.landing label_id : - lights
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
