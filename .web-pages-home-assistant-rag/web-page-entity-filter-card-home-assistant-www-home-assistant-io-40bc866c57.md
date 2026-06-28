# Entity filter card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/entity-filter
- Final URL: https://www.home-assistant.io/dashboards/entity-filter
- Canonical URL: https://www.home-assistant.io/dashboards/entity-filter/
- Fetched at: 2026-06-28T02:19:03Z
- Content type: text/html; charset=UTF-8

## Description

The entity filter card allows you to define a list of entities that you want to track only when in a certain state. Very useful for showing lights that you forgot to turn off or show a list of peop...

## Extracted Text

On this page
Adding the entity filter card to a dashboard
YAML configuration
Options for entities
Conditions options
State
Numeric state
Screen
User
And
Or
Legacy state filters
String filter
Operator filter
The entity filter card allows you to define a list of entities that you want to track only when in a certain state. Very useful for showing lights that you forgot to turn off or show a list of people only when they’re at home.
Screenshot of the entity filter card.
This type of card can also be used together with other cards that allow multiple entities, allowing you to use glance or picture-glance . By default, it uses the entities card model.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
This card can only be configured in YAML.
Configuration Variables
Looking for your configuration file?
type string Required
entity-filter
entities list Required
A list of entity IDs or entity objects, see below.
conditions list ( Optional )
List of conditions to check. See available conditions .*
state_filter list ( Optional )
(legacy) List of strings representing states or filters to check. See available legacy filters .*
card map ( Optional , default: entities card )
Extra options to pass down to the card rendering the result.
show_empty boolean ( Optional , default: true )
Allows hiding of card when no entities returned by filter.
*one is required ( conditions or state_filter )
If you define entities as objects instead of strings (by adding entity: before entity ID), you can add more customization and configurations:
entity string Required
Entity ID.
type string ( Optional )
Sets a custom card type: custom:my-custom-card .
name string ( Optional )
Overwrites friendly name.
icon string ( Optional , default: Entity domain icon )
Overwrites icon or entity picture. You can use any icon from Material Design Icons . Prefix the icon name with mdi: , ie mdi:home .
secondary_info string ( Optional )
Show additional info. Values: entity-id , last-changed .
format string ( Optional )
How the state should be formatted. Currently only used for timestamp sensors. Valid values are: relative , total , date , time and datetime .
*only one filter will be applied: conditions or state_filter if conditions is not present
You can specify multiple conditions , in which case the entity will be displayed if it matches every condition.
Tests if an entity has a specified state.
type : entity-filter entities : - climate.thermostat_living_room - climate.thermostat_bed_room conditions : - condition : state state : heat
type : entity-filter entities : - climate.thermostat_living_room - climate.thermostat_bed_room conditions : - condition : state state_not : " off"
type : entity-filter entities : - sensor.gas_station_1 - sensor.gas_station_2 - sensor.gas_station_3 conditions : - condition : state state : sensor.gas_station_lowest_price
condition string Required
state
state list | string ( Optional )
Entity state or ID to be equal to this value. Can contain an array of states.*
state_not list | string ( Optional )
Entity state or ID to not be equal to this value. Can contain an array of states.*
entity string ( Optional )
An optional entity ID to be used for testing the state condition. If not provided, the state of the entity being displayed is tested.
*one is required ( state or state_not )
Tests if an entity state matches the thresholds.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : numeric_state above : 10 below : 20
numeric_state
above string ( Optional )
Entity state or ID to be above this value.*
below string ( Optional )
Entity state or ID to be below this value.*
An optional entity ID to be used for testing the numeric state condition. If not provided, the numeric state of the entity being displayed is tested.
*at least one is required ( above or below ), both are also possible for values between.
Specify the visibility of the entity per screen size. Some screen size presets are available in the UI but you can use any CSS media query you want in YAML.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : screen media_query : " (min-width: 1280px)"
screen
media_query string Required
Media query to check which screen size are allowed to display the entity.
Specify the visibility of the entity per user.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : user users : - 581fca7fdc014b8b894519cc531f9a04
user
users list Required
User ID that can see the entity (unique hex value found on the Users configuration page).
Specify that both conditions must be met.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : and conditions : - condition : numeric_state above : 0 - condition : user users : - 581fca7fdc014b8b894519cc531f9a04
and
List of conditions to check. See available conditions .
Specify that at least one of the conditions must be met.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : or conditions : - condition : numeric_state above : 0 - condition : user users : - 581fca7fdc014b8b894519cc531f9a04
or
Show only active switches or lights in the house.
type : entity-filter entities : - entity : light.bed_light name : Bed - light.kitchen_lights - light.ceiling_lights state_filter : - " on"
Show only people that are at home using glance :
type : entity-filter entities : - device_tracker.demo_paulus - device_tracker.demo_anne_therese - device_tracker.demo_home_boy state_filter : - home card : type : glance title : People at home
Entity filter combined with glance card.
You can also specify multiple state_filter conditions, in which case the entity will be displayed if it matches any condition.
If you define state_filter as objects instead of strings, you can add more customization to your filter, as described below.
Tests if an entity state correspond to the applied operator .
value string Required
String representing the state.
operator string Required
Operator to use in the comparison. Can be == , <= , < , >= , > , != , in , not in , or regex .
attribute string ( Optional )
Attribute of the entity to use instead of the state.
Examples
Displays everyone who is at home or at work.
type : entity-filter entities : - device_tracker.demo_paulus - device_tracker.demo_anne_therese - device_tracker.demo_home_boy state_filter : - operator : " ==" value : home - operator : " ==" value : work card : type : glance title : Who's at work or home
Specify filter for a single entity.
type : entity-filter state_filter : - " on" - operator : " >" value : 90 entities : - sensor.water_leak - sensor.outside_temp - entity : sensor.humidity_and_temp state_filter : - operator : " >" value : 50 attribute : humidity
Use a regex filter against entity attributes. This regex filter below looks for expressions that are 1 digit in length and where the number is between 0-7 (so show holidays today or in the next 7 days) and displays those holidays as entities in the Entity Filter card.
type : entity-filter card : title : " Upcoming Holidays In Next 7 Days" show_header_toggle : false state_filter : - operator : regex value : " ^([0-7]{1})$" attribute : eta entities : - entity : sensor.upcoming_ical_holidays_0 - entity : sensor.upcoming_ical_holidays_1 - entity : sensor.upcoming_ical_holidays_2 - entity : sensor.upcoming_ical_holidays_3 - entity : sensor.upcoming_ical_holidays_4 show_empty : false
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
