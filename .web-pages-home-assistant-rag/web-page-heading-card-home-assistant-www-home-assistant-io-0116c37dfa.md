# Heading card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/heading
- Final URL: https://www.home-assistant.io/dashboards/heading
- Canonical URL: https://www.home-assistant.io/dashboards/heading/
- Fetched at: 2026-06-28T02:19:19Z
- Content type: text/html; charset=UTF-8

## Description

The Heading card structures your dashboard by providing title, icon, navigation and badges.

## Extracted Text

On this page
Heading badges
Entity badge
Button badge
Related topics
The Heading card structures your dashboard by providing title, icon and navigation. This card supports actions .
Screenshot of heading cards with entity badges and a button badge.
type : heading heading : Kitchen icon : mdi:fridge badges : - type : entity entity : sensor.kitchen_temperature - type : entity entity : sensor.kitchen_humidity
Configuration Variables
Looking for your configuration file?
type string Required
heading
heading string ( Optional )
Heading text
heading_style string ( Optional , default: title )
Style of the heading. Can be either title or subtitle .
icon string ( Optional )
Icon displayed before the heading text.
tap_action map ( Optional )
Action taken on card tap. See action documentation . By default, it will do nothing. If an action is configured, a chevron will appear next to the heading text.
badges list ( Optional )
Additional small badges to display entity information. See heading badges .
In addition to the heading text, each heading card can show small badges. They are smaller than regular badges and don’t have a background. The heading badges can display sensor information or action buttons in a compact and minimal style. Heading badges also support actions .
The following badge types are available for heading cards:
The Entity badge allows you to display the state of an entity in the heading card.
type : entity entity : light.living_room
entity
entity string Required
Entity ID.
name string ( Optional )
Overwrites the entity name. The name will be only displayed if state_content includes name token.
Overwrites the entity icon.
color string ( Optional , default: none )
Set the color when the entity is active. By default, it will not be colored. It can be set to the state special token to dynamically color the icon based on state , domain , and device_class of your entity. It also accepts color token or hex color code.
show_icon boolean ( Optional , default: true )
Show the icon
show_state boolean ( Optional , default: false )
Show the state.
state_content string | list ( Optional )
Content to display for the state. Can be state , name , last_changed , last_updated , or any attribute of the entity. Can be either a string with a single item, or a list of string items. Default depends on the entity domain.
Action taken on card tap. See action documentation . By default, it will do nothing.
hold_action map ( Optional )
Action taken on card hold. See action documentation . By default, it will do nothing.
double_tap_action map ( Optional )
Action taken on card double tap. See action documentation . By default, it will do nothing.
The Button badge allows you to display a customizable button with an icon and/or text. This is useful for quick actions like turning off lights, triggering automations, or opening dashboards.
type : button icon : mdi:lightbulb-off text : Turn off lights color : yellow
You can also create icon-only buttons or text-only buttons:
badges : - type : button icon : mdi:play color : green - type : button text : Run automation color : blue
button
Icon to display.
text string ( Optional )
Text label to display on the button.
color string ( Optional )
Color of the badge. It accepts color token or hex color code.
Card actions
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
