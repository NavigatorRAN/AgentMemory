# Sensor card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/sensor
- Final URL: https://www.home-assistant.io/dashboards/sensor
- Canonical URL: https://www.home-assistant.io/dashboards/sensor/
- Fetched at: 2026-06-28T02:20:09Z
- Content type: text/html; charset=UTF-8

## Description

The sensor card gives you a quick overview of a sensor's state with an optional graph to visualize change over time.

## Extracted Text

On this page
Adding the sensor card to a dashboard
YAML configuration
Examples
Related topics
The sensor card gives you a quick overview of a sensor’s state with an optional graph to visualize change over time.
Screenshot of the sensor card.
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
sensor
entity string Required
Entity ID of sensor domain.
icon string ( Optional )
The card icon.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
graph string ( Optional )
Type of graph ( none or line ).
unit string ( Optional )
The unit of measurement.
detail integer ( Optional , default: 1 )
Detail of the graph 1 or 2 ( 1 = one point/hour, 2 = six points/hour).
hours_to_show integer ( Optional , default: 24 )
Hours to show in graph. Minimum is 1 hour. Big values can result in delayed rendering, especially if the selected entities have a lot of state changes.
limits map ( Optional )
Limits of the graph Y-axis.
min float ( Optional )
Minimum value of the graph Y-axis.
Default:
The minimum sample among the displayed values.
max float ( Optional )
Maximum value of the graph Y-axis.
The maximum sample among the displayed values.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
Note
The hours_to_show option controls the time range of historical data shown in the graph. The amount of history available depends on the Recorder’s purge_keep_days setting. By default, the Recorder purges data older than 10 days. See the Recorder integration documentation for more information.
Basic sensor card:
type : sensor entity : sensor.illumination name : Illumination
Sensor card with historical data graph:
type : sensor entity : sensor.my_temperature graph : line hours_to_show : 720 # shows 30 days of history only if history exists for this sensor
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
