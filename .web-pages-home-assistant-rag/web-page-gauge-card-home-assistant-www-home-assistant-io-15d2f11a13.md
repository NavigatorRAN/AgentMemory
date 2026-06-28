# Gauge card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/gauge
- Final URL: https://www.home-assistant.io/dashboards/gauge
- Canonical URL: https://www.home-assistant.io/dashboards/gauge/
- Fetched at: 2026-06-28T02:19:08Z
- Content type: text/html; charset=UTF-8

## Description

The gauge card is a basic card that allows visually seeing sensor data.

## Extracted Text

On this page
Adding the gauge card to a dashboard
YAML configuration
Examples
Related topics
The gauge card is a basic card that allows visually seeing sensor data.
Screenshot of the gauge card.
Screenshot of the gauge card in needle mode.
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
gauge
entity string Required
Entity ID to show.
attribute string ( Optional )
Attribute from the selected entity to display
name string | map | list ( Optional , default: Entity name )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
unit string ( Optional )
Unit of measurement given to data.
Default:
Unit of measurement given by entity
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
min integer ( Optional , default: 0 )
Minimum value for graph.
max integer ( Optional , default: 100 )
Maximum value for graph.
needle boolean ( Optional , default: false )
Show the gauge as a needle gauge. Required to be set to true, if using segments.
severity map ( Optional )
Allows setting of colors for different numbers.
green integer Required
Value from which to start green color.
yellow integer Required
Value from which to start yellow color.
red integer Required
Value from which to start red color.
segments list ( Optional )
List of colors and their corresponding start values. Segments will override the severity settings. Needle required to be true.
from integer Required
Value from which to start the color.
color string Required
Color of the segment, may be any CSS color declaration like “red”, “#0000FF” or “rgb(255, 120, 0)”.
label string ( Optional )
Label of the segment. This will be shown instead of the value.
tap_action map ( Optional )
Action taken on card tap. See action documentation .
hold_action map ( Optional )
Action taken on card tap and hold. See action documentation .
double_tap_action map ( Optional )
Action taken on card double tap. See action documentation .
Title and unit of measurement:
type : gauge name : CPU Usage unit : ' %' entity : sensor.cpu_usage
Screenshot of the gauge card with custom title and unit of measurement.
Define the severity map:
type : gauge name : With Severity unit : ' %' entity : sensor.cpu_usage severity : green : 0 yellow : 45 red : 85
Multiple segments:
Screenshot of the gauge card with multiple colored segments.
type : gauge entity : sensor.kitchen_humidity needle : true min : 20 max : 80 segments : - from : 0 color : ' #db4437' - from : 35 color : ' #ffa600' - from : 40 color : ' #43a047' - from : 60 color : ' #ffa600' - from : 65 color : ' #db4437'
CSS variables can be used (instead of CSS ‘#rrggbb’) for default gauge segment colors:
var(--success-color) for green color
var(--warning-color) for yellow color
var(--error-color) for red color
var(--info-color) for blue color
Therefore, the previous example can be defined also as:
type : gauge entity : sensor.kitchen_humidity needle : true min : 20 max : 80 segments : - from : 0 color : var(--error-color) - from : 35 color : var(--warning-color) - from : 40 color : var(--success-color) - from : 60 color : var(--warning-color) - from : 65 color : var(--error-color)
Display attribute of an entity instead of its state:
type : gauge entity : sensor.back_door_info attribute : battery_level unit : ' %' max : 100
In this example, the card displays the battery_level attribute of the sensor.back_door_info entity.
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
