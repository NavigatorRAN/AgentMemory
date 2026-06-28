# Sidebar view - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/sidebar
- Final URL: https://www.home-assistant.io/dashboards/sidebar
- Canonical URL: https://www.home-assistant.io/dashboards/sidebar/
- Fetched at: 2026-06-28T02:20:15Z
- Content type: text/html; charset=UTF-8

## Description

The sidebar view has 2 columns, a wide one and a smaller one on the right.

## Extracted Text

On this page
View configuration
Cards configuration
Example
Related topics
The sidebar view has 2 columns, a wide one and a smaller one on the right.
Screenshot of the sidebar view used for the energy dashboard.
To move the card from the main column into the sidebar (right) (and vice versa), select the arrow button on the card.
Screenshot showing the arrow buttons to move a card.
On mobile, all cards are rendered in 1 column and kept in the order indicated in the YAML configuration.
To view the YAML configuration, on the view tab, select the icon to open the edit view.
In the configuration dialog, select the three dots menu, and Edit in YAML .
Screenshot showing where to edit the view configuration.
Configuration Variables
Looking for your configuration file?
type string Required
sidebar
view_layout.position string ( Optional )
The position of the card, main or sidebar
The position of the card is configured using YAML with the view_layout option:
type : sidebar cards : - type : entities entities : - media_player.lounge_room view_layout : position : sidebar
Masonry view
Panel view
Sections view (default)
About views
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
