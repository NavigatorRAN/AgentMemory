# Badges - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/badges
- Final URL: https://www.home-assistant.io/dashboards/badges
- Canonical URL: https://www.home-assistant.io/dashboards/badges/
- Fetched at: 2026-06-28T02:18:32Z
- Content type: text/html; charset=UTF-8

## Description

Badges display entity states at the top of a dashboard view. Learn how to add, configure, and filter badges in Home Assistant.

## Extracted Text

Badges are small widgets that sit at the top of a dashboard view, above all the cards. They give you an at-a-glance overview of entity states. This is perfect for things like temperatures, open windows, or who is home.
Badges at the top of a panel.
Adding a badge to your dashboard
Go to Settings > Dashboards .
If you have multiple views , open the view to which you want to add a badge.
In the top right of the screen, select the edit button.
To add a badge, select the plus button.
Select the entity for which you want to display a badge.
Configure your badge.
The available options depend on the entity.
Add the states you want to see.
If you want, add a Name .
Under Interactions , you can define the tap behavior.
If you want this badge to be visible only to specific users or under a certain condition, open the Visibility tab to define those conditions .
The available conditions are the same as the ones for the conditional card.
Select Save .
Adding a badge to a dashboard.
Removing a badge
Go to the dashboard and follow steps 1–3 in adding a badge .
Hover over the badge to reveal the three dots menu.
Select the three dots menu and select Delete .
Entity badge
The Entity badge allows you to display the state of an entity. This badge supports actions .
type : entity entity : light.living_room
Configuration Variables
Looking for your configuration file?
type string Required
entity
entity string Required
Entity ID.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
icon string ( Optional )
Overwrites the entity icon.
color string ( Optional , default: state )
Set the color when the entity is active. By default, the color is based on state , domain , and device_class of your entity. It accepts color token or hex color code.
show_entity_picture boolean ( Optional , default: false )
If your entity has a picture, it will replace the icon.
show_name boolean ( Optional , default: false )
Show the name.
show_icon boolean ( Optional , default: true )
Show the icon.
show_state boolean ( Optional , default: true )
Show the state.
state_content string | list ( Optional )
Content to display for the state. Can be state , last_changed , last_updated , or any attribute of the entity. Can be either a string with a single item, or a list of string items. Default depends on the entity domain.
tap_action map ( Optional )
Action taken on card tap. See action documentation . By default, it will show the “more-info” dialog.
hold_action map ( Optional )
Action taken on tap-and-hold. See action documentation .
double_tap_action map ( Optional )
Action taken on double tap. See action documentation .
Shortcut badge
The shortcut badge gives you a quick way to trigger an action from your dashboard. You can use it to navigate to another page, open a URL, launch the voice assistant, or perform an action.
The label, icon, and color are automatically resolved from the action you configure. For example, if you navigate to a dashboard view, the shortcut picks up the view’s title and icon. You can override any of these values if you want something different.
type : shortcut tap_action : action : navigate navigation_path : " /lovelace/kitchen"
shortcut
text string ( Optional )
The text displayed on the badge. If not set, the text is resolved automatically from the configured tap_action .
The icon displayed on the badge. If not set, the icon is resolved automatically from the configured tap_action .
color string ( Optional , default: primary )
The color of the icon and background accent. Accepts a color token or hex color code.
tap_action map Required
The action taken on badge tap. For more information, see the action documentation .
The action taken on badge tap-and-hold. For more information, see the action documentation .
The action taken on badge double tap. For more information, see the action documentation .
Examples
Open an external URL with a custom label and icon:
type : shortcut text : " Home Assistant docs" icon : mdi:book-open-variant tap_action : action : url url_path : " https://www.home-assistant.io"
Launch the voice assistant:
type : shortcut tap_action : action : assist
Perform an action with a custom color:
type : shortcut text : " Good night" color : indigo tap_action : action : perform-action perform_action : script.good_night
Entity filter badge
This badge allows you to define a list of entities that you want to track only when in a certain state. It’s great for showing lights that you forgot to turn off, or for displaying a list of people only when they’re at home.
entity-filter
entities list Required
A list of entity IDs or entity objects, see below.
conditions list ( Optional )
List of conditions to check. See available conditions .*
state_filter list ( Optional )
(legacy) List of strings representing states or filters to check. See available legacy filters .*
*one is required ( conditions or state_filter )
Options for entities
If you define entities as objects instead of strings (by adding entity: before entity ID), you can add more customization and configurations:
type string ( Optional )
Sets a custom badge type: custom:my-custom-badge
Overwrites icon or entity picture. You can use any icon from Material Design Icons (MDI) . Prefix the icon name with mdi: , for example mdi:home .
image string ( Optional )
URL of an image to display instead of the icon.
*only one filter will be applied: conditions or state_filter if conditions is not present
You may also add any additional configuration options to an entity which are supported by the chosen badge type ( Entity badge type if no type is chosen).
Conditions options
You can specify multiple conditions , in which case the entity will be displayed if it matches all conditions.
State
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
*one is required ( state or state_not )
Numeric state
Tests if an entity state matches the thresholds.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : numeric_state above : 10 below : 20
numeric_state
above string ( Optional )
Entity state or ID to be above this value.*
below string ( Optional )
Entity state or ID to be below this value.*
*at least one is required ( above or below ), both are also possible for values between.
Screen
Specify the visibility of the entity per screen size. Some screen size presets are available in the UI, but you can use any CSS media query you want in YAML.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : screen media_query : " (min-width: 1280px)"
screen
media_query string Required
Media query to check which screen size are allowed to display the entity.
User
Specify the visibility of the entity per user.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : user users : - 581fca7fdc014b8b894519cc531f9a04
user
users list Required
User ID that can see the entity (unique hex value found on the Users configuration page).
And
Specify that both conditions must be met.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : and conditions : - condition : numeric_state above : 0 - condition : user users : - 581fca7fdc014b8b894519cc531f9a04
and
List of conditions to check. See available conditions .
Or
Specify that at least one of the conditions must be met.
type : entity-filter entities : - sensor.outside_temperature - sensor.living_room_temperature - sensor.bed_room_temperature conditions : - condition : or conditions : - condition : numeric_state above : 0 - condition : user users : - 581fca7fdc014b8b894519cc531f9a04
or
Legacy state filters
String filter
Show only active switches or lights in the house.
type : entity-filter entities : - entity : light.bed_light name : Bed - light.kitchen_lights - light.ceiling_lights state_filter : - " on"
You can also specify multiple state_filter conditions, in which case the entity will be displayed if it matches any condition.
If you define state_filter as objects instead of strings, you can add more customization to your filter, as described below.
Operator filter
Tests if an entity state corresponds to the applied operator .
value string Required
String representing the state.
operator string Required
Operator to use in the comparison. Can be == , <= , < , >= , > , != , in , not in , or regex .
attribute string ( Optional )
Attribute of the entity to use instead of the state.
Displays everyone who is at home or at work.
type : entity-filter entities : - device_tracker.demo_paulus - device_tracker.demo_anne_therese - device_tracker.demo_home_boy state_filter : - operator : " ==" value : home - operator : " ==" value : work
You can also specify a filter for a single entity.
type : entity-filter state_filter : - " on" - operator : " >" value : 90 entities : - sensor.water_leak - sensor.outside_temp - entity : sensor.humidity_and_temp state_filter : - operator : " >" value : 50 attribute : humidity
You can also use a regex filter against entity attributes. The example below looks for expressions that are 1 digit in length and where the number is between 0–7. This shows holidays occurring today or within the next 7 days as entities in the Entity filter badge.
type : entity-filter state_filter : - operator : regex value : " ^([0-7]{1})$" attribute : eta entities : - entity : sensor.upcoming_ical_holidays_0 - entity : sensor.upcoming_ical_holidays_1 - entity : sensor.upcoming_ical_holidays_2 - entity : sensor.upcoming_ical_holidays_3 - entity : sensor.upcoming_ical_holidays_4
Related topics
Introduction to dashboards
Dashboard views
Badge actions
Showing or hiding a badge conditionally
Heading card badges
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
