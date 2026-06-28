# Statistic card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/statistic
- Final URL: https://www.home-assistant.io/dashboards/statistic
- Canonical URL: https://www.home-assistant.io/dashboards/statistic/
- Fetched at: 2026-06-28T02:20:19Z
- Content type: text/html; charset=UTF-8

## Description

The statistic card allows you to display a statistical value for an entity.

## Extracted Text

On this page
Adding the statistic card to a dashboard
Example
Options for period
Calendar
Fixed period
Rolling window
Dynamic date selection
Related topics
The statistic card allows you to display a statistical value for an entity.
Statistics are gathered every 5 minutes for sensors that support it. It will either keep the min , max and mean of a sensors value for a specific period, or the sum for a metered entity.
If your sensor doesn’t work with statistics, check this .
Screenshot of the statistic card for a temperature sensor.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
All options for this card can be configured via the user interface, but if you want more options for the period, you will have to define them in yaml .
Configuration Variables
Looking for your configuration file?
type string Required
statistic
entity string Required
An entity ID of a sensor with statistics, or an external statistic id
stat_type string Required
The statistics types to render. min , max , mean , change
name string | map | list ( Optional , default: Entity name. )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
icon string ( Optional )
Overwrites icon.
unit string ( Optional )
Unit of measurement given to data.
Default:
Unit of measurement given by entity.
period map Required
The period to use for the calculation. See below .
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
footer map ( Optional )
Footer widget to render. See footer documentation .
collection_key string ( Optional )
If using period: energy_date_selection , you can set a custom key to match the optional key of an energy-date-selection card. This is not typically required, but can be useful if multiple date selection cards are used on the same view. See energy documentation .
Alternatively, the card can be configured using YAML:
type : statistic entity : sensor.energy_consumption period : calendar : period : month stat_type : change
Periods can be configured in 4 different ways:
Use a fixed period with an offset from the current period.
period string Required
The period to use. day , week , month , year
offset integer ( Optional )
The offset of the current period, so 0 means the current period, -1 is the previous period.
Example, the change of the energy consumption during last month:
type : statistic entity : sensor.energy_consumption period : calendar : period : month offset : -1 stat_type : change
Specify a fixed period, the start and end are optional.
start string ( Optional )
The start of the period
end string ( Optional )
The end of the period
Example, the change in 2022:
type : statistic entity : sensor.energy_consumption period : fixed_period : start : 2022-01-01 end : 2022-12-31 stat_type : change
Example, all time change, without a start or end:
type : statistic entity : sensor.energy_consumption period : fixed_period : stat_type : change
duration map Required
The duration of the period
offset map ( Optional )
The offset of the current time, 0 means the current period, -1 is the previous period.
Example, a period of 1 hour, 10 minutes and 5 seconds ending 2 hours, 20 minutes and 10 seconds before now:
type : statistic entity : sensor.energy_consumption period : rolling_window : duration : hours : 1 minutes : 10 seconds : 5 offset : hours : -2 minutes : -20 seconds : -10 stat_type : change
When placed on a view with an Energy date selection card, the statistic card can be linked to show data from the period selected on the date selection card.
Example of a period from the date selector:
type : statistic entity : sensor.energy_consumption period : energy_date_selection stat_type : change
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
