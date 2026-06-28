---
source_url: "https://www.home-assistant.io/dashboards/header-footer"
final_url: "https://www.home-assistant.io/dashboards/header-footer"
canonical_url: "https://www.home-assistant.io/dashboards/header-footer/"
source_handle: "web:www-home-assistant-io:1cdebd3074ae"
source_section: "dashboards-header-footer"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4c11aab04f795e96202329291dd3e8885dc1dc2f1aa7915022f84bd87d2a3cda"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Card headers and footers - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/header-footer
- Final URL: https://www.home-assistant.io/dashboards/header-footer
- Canonical URL: https://www.home-assistant.io/dashboards/header-footer/
- Fetched at: 2026-06-28T02:19:16Z
- Content type: text/html; charset=UTF-8

## Description

Add a header or footer to a dashboard card to show extra information such as a graph, a weather forecast, or a list of buttons.

## Extracted Text

Some dashboard cards have support for header and footer widgets. These widgets fill up the whole available space in a card.
Screenshot of an entities card with a picture header and buttons footer.
Header and footer can be used on the following cards:
Entity
Entities
Statistic
Picture header & footer
Widget to show a picture as a header or a footer. A picture can have touch actions associated with it.
header : type : picture image : " https://www.home-assistant.io/images/dashboards/header-footer/balloons-header.png"
Configuration Variables
Looking for your configuration file?
type string Required
picture
image string Required
The URL of an image.
alt_text string ( Optional )
Alternative text for the image. This is necessary for users of assistive technology. The W3C images tutorial provides simple guidance for writing alternative text.
tap_action map ( Optional )
Action taken on card tap. See action documentation .
hold_action map ( Optional )
Action taken on tap-and-hold. See action documentation .
double_tap_action map ( Optional )
Action taken on double tap. See action documentation .
Buttons header & footer
Widget to show entities as buttons in the header or footer.
footer : type : buttons entities : - script.launch_confetti - entity : script.swirl_lights icon : " mdi:track-light" - entity : script.run_siren icon : " mdi:alarm-light"
entities list Required
A list of entities to show. Each entry is either an entity ID or a map.
entity string Required
The entity ID to render.
icon string ( Optional )
Override the entity icon. You can use any icon from Material Design Icons . Prefix the icon name with mdi: , ie mdi:home .
image string ( Optional )
Override the entity image.
name string ( Optional )
Label for the button.
show_icon boolean ( Optional , default: true )
Show entity icon.
show_name boolean ( Optional , default: false )
Show entity name.
Action taken on button tap. See action documentation .
Graph header & footer
Widget to show an entity in the sensor domain as a graph in the header or footer.
Screenshot of an entities card with a graph footer.
footer : type : graph entity : sensor.outside_temperature hours_to_show : 24 detail : 1
Entity ID of sensor domain.
detail integer ( Optional , default: 1 )
Detail level of the graph: 1 or 2 ( 1 = one point/hour, 2 = six points/hour)
hours_to_show integer ( Optional , default: 24 )
Hours to show in graph. Minimum is 1 hour. Big values can result in delayed rendering, especially if the selected entities have a lot of state changes.
Note
The hours_to_show option controls the time range of historical data shown in the graph. The amount of history available depends on the Recorder’s purge_keep_days setting. By default, the Recorder purges data older than 10 days. See the Recorder integration documentation for more information.
Related topics
Statistics
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
