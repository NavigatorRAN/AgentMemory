---
source_url: "https://www.home-assistant.io/dashboards/conditional"
final_url: "https://www.home-assistant.io/dashboards/conditional"
canonical_url: "https://www.home-assistant.io/dashboards/conditional/"
source_handle: "web:www-home-assistant-io:4673e0bd571a"
source_section: "dashboards-conditional"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e67459f23317f85598f7d86bf04a376214bafdcb861a6ef7494ab61494d45fee"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Conditional card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/conditional
- Final URL: https://www.home-assistant.io/dashboards/conditional
- Canonical URL: https://www.home-assistant.io/dashboards/conditional/
- Fetched at: 2026-06-28T02:18:47Z
- Content type: text/html; charset=UTF-8

## Description

The Conditional card displays another card based on conditions.

## Extracted Text

On this page
Adding the conditional card to a dashboard
YAML configuration
Examples
Conditions options
State
Numeric state
Screen
User
Location
Time
And
Or
Not
Related topics
The conditional card displays another card based on conditions.
Most options for this card can be configured via the user interface.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
Note that while editing the dashboard, the card will always be shown, so be sure to exit editing mode to test the conditions.
The conditional card can still be used. However, it is now possible to define a setting to show or hide a card conditionally directly on each card type, on its Visibility tab.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
conditional
conditions list Required
List of conditions to check. See available conditions .
card map Required
Card to display if all conditions match.
Only show when all the conditions are met:
type : conditional conditions : - condition : state entity : light.bed_light state : " on" - condition : state entity : light.bed_light state_not : " off" - condition : user users : - 581fca7fdc014b8b894519cc531f9a04 card : type : entities entities : - device_tracker.demo_paulus - cover.kitchen_window - group.kitchen - lock.kitchen_door - light.bed_light
Example condition where only one of the conditions needs to be met:
type : conditional conditions : - condition : or conditions : - condition : state entity : binary_sensor.co_alert state : ' on' - condition : state entity : binary_sensor.rookmelder state : ' on' card : type : entities entities : - binary_sensor.co_alert - binary_sensor.rookmelder
Tests if an entity has a specified state.
condition : state entity : climate.thermostat state : heat
condition : state entity : climate.thermostat state_not : " off"
condition string Required
state
entity string Required
Entity ID.
state list | string ( Optional )
Entity state or ID to be equal to this value. Can contain an array of states.*
state_not list | string ( Optional )
Entity state or ID to not be equal to this value. Can contain an array of states.*
*one is required ( state or state_not )
Tests if an entity state matches the thresholds.
condition : numeric_state entity : sensor.outside_temperature above : 10 below : 20
numeric_state
above string ( Optional )
Entity state or ID to be above this value.*
below string ( Optional )
Entity state or ID to be below this value.*
*at least one is required ( above or below ), both are also possible for values between.
Specify the visibility of the card per screen size. Some screen size presets are available in the UI but you can use any CSS media query you want in YAML.
condition : screen media_query : " (min-width: 1280px)"
screen
media_query string Required
Media query to check which screen size are allowed to display the card.
Specify the visibility of the card per user.
condition : user users : - 581fca7fdc014b8b894519cc531f9a04
user
users list Required
User ID that can see the card (unique hex value found on the Users configuration page).
Specify the visibility of the card based on the current user’s current location. The location is based on the state of the person entity associated with the current user. If the current user does not have a person entity, this condition will always resolve to false.
condition : location locations : - home - Home Neigborhood
location
locations list Required
A list of zones, which if any match the current state of the person , will cause this condition to be true.
Specify the visibility of the card based on the current time and day of the week.
condition : time after : " 08:00" before : " 17:00" weekdays : - mon - tue - wed - thu - fri
time
after string ( Optional )
Time in 24-hour format (HH:MM) after which the card should be visible.*
before string ( Optional )
Time in 24-hour format (HH:MM) before which the card should be visible.*
weekdays list ( Optional )
List of weekdays on which the card should be visible. Valid values are mon , tue , wed , thu , fri , sat , sun .
At least one of after or before must be used for this condition to be valid. Both can be used together to define a time range as in the example above.
Specify that all conditions must be met.
condition : and conditions : - condition : numeric_state above : 0 - condition : user users : - 581fca7fdc014b8b894519cc531f9a04
and
conditions list ( Optional )
Specify that at least one of the conditions must be met.
condition : or conditions : - condition : numeric_state above : 0 - condition : user users : - 581fca7fdc014b8b894519cc531f9a04
or
Specify that at least one of the conditions must not be met.
condition : not conditions : - condition : numeric_state above : 0 - condition : user users : - 581fca7fdc014b8b894519cc531f9a04
not
Dashboard cards
Conditional settings on the card's visibility tab
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
