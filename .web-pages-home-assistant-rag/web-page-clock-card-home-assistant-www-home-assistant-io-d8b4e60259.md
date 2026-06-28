---
source_url: "https://www.home-assistant.io/dashboards/clock"
final_url: "https://www.home-assistant.io/dashboards/clock"
canonical_url: "https://www.home-assistant.io/dashboards/clock/"
source_handle: "web:www-home-assistant-io:d8b4e602598a"
source_section: "dashboards-clock"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "345d66a8d23dc173aa0ad78a027d3610feac8bfcb5923c0d13e5ff60eaffa657"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Clock card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/clock
- Final URL: https://www.home-assistant.io/dashboards/clock
- Canonical URL: https://www.home-assistant.io/dashboards/clock/
- Fetched at: 2026-06-28T02:18:44Z
- Content type: text/html; charset=UTF-8

## Description

The Clock card shows the current time in a variety of formats and sizes.

## Extracted Text

On this page
Adding the clock card to a dashboard
Card settings
Examples
Related topics
The Clock card shows the current time in a variety of formats, sizes and time zones.
Screenshot of the clock card
All options for this card can be configured via the user interface.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
Configuration Variables
Looking for your configuration file?
title string ( Optional )
Adds a title to the top of the card
clock_style list ( Optional , default: digital )
Allows the clock to be displayed in a digital or analog style. Defaults to digital.
digital
Digital clock style.
analog
Analog clock style.
clock_size list ( Optional , default: small )
Adjusts the size of the text allowing a wider range of use with different types of dashboards. Defaults to small.
small
Small clock size.
medium
Medium clock size.
large
Large clock size.
show_seconds boolean ( Optional , default: false )
Shows seconds alongside the clock, providing the time format is in a 12-hour format.
no_background boolean ( Optional , default: false )
Removes the background of the clock card.
time_format string ( Optional )
Allows the time format to be changed on a per-card level. Defaults to the user profile setting.
time_zone string ( Optional )
Change the timezone used for the time on a per-card level. Defaults to the user profile setting.
analog_options map ( Optional )
When using the analog clock style, this allows you to configure the appearance of the clock.
border boolean ( Optional , default: false )
Shows a border around the clock face. Defaults to false.
ticks list ( Optional , default: hour )
Shows ticks (indices) on the clock face. Defaults to hour.
none
No ticks are shown.
quarter
Quarter hour ticks are shown.
hour
Hour ticks are shown.
minute
Minute ticks are shown.
Basic example:
type : clock
Screenshot of the basic clock card
Example of a larger clock card for tablet dashboards:
type : clock clock_size : large time_format : " 12" show_seconds : true
Screenshot of a large sized, 12 hour clock card showing am/pm and seconds
A medium-sized clock card better suited for desktop dashboards:
type : clock clock_size : medium time_format : " 12" show_seconds : false
Screenshot of a medium sized, 12 hour clock showing am/pm
A medium-sized, 24 hour clock using the London timezone with a title
type : clock clock_size : medium time_zone : Europe/London title : London 💂
Screenshot of a medium sized, 24 hour clock showing seconds based in London along with a title
A medium-sized, 12 hour clock using the New York timezone with a title
type : clock clock_size : medium time_format : " 12" time_zone : America/New_York title : New York 🦅
Screenshot of a medium sized, 12 hour clock showing am/pm and seconds based in New York along with a title
Analog clock with no border and hour ticks:
type : clock clock_style : analog clock_size : medium analog_options : border : false ticks : hour
Screenshot of a medium sized, analog clock and hour ticks
Analog clock with border and minute ticks showing seconds:
type : clock clock_style : analog clock_size : medium show_seconds : true analog_options : border : true ticks : minute
Screenshot of a medium sized, analog clock and minute ticks showing seconds
Analog clock with a title, no ticks and border with seconds:
type : clock clock_style : analog clock_size : medium show_seconds : true analog_options : border : true ticks : none title : Mountain Time
Screenshot of a medium sized, analog clock with a title, no ticks and border showing seconds
Set your time zone
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
