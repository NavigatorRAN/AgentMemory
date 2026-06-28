---
source_url: "https://www.home-assistant.io/dashboards/map"
final_url: "https://www.home-assistant.io/dashboards/map"
canonical_url: "https://www.home-assistant.io/dashboards/map/"
source_handle: "web:www-home-assistant-io:3b97bf049d80"
source_section: "dashboards-map"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ea07e4526c2b10446498d5ac1d1a045dfab99b204925923482cf35f2d086549c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Map card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/map
- Final URL: https://www.home-assistant.io/dashboards/map
- Canonical URL: https://www.home-assistant.io/dashboards/map/
- Fetched at: 2026-06-28T02:19:37Z
- Content type: text/html; charset=UTF-8

## Description

The map card that allows you to display entities on a map

## Extracted Text

On this page
Adding the map card to a dashboard
Configuration options
YAML configuration
Conditions options
Examples
Options for entities
Options for geolocation sources
Related topics
The map card allows you to display your home zone, entities, and other predefined zones on a map. This card is used on the Map dashboard , which is one of the default dashboards.
Screenshot of the map card.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t set this dashboard to update automatically anymore. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add the map card to your dashboard.
By default, you see the house icon on your map. It represents your home zone .
To change the location of your home, you need to edit your home’s location in the home information .
To learn how to show additional zones on your map, follow the steps on adding a new zone .
To show other elements on the map, either add them under Entities , or use the Geolocation sources .
For a description of the options, refer to the YAML configuration section. It also applies to the options shown in the UI.
Info : The list of entities shows the device trackers available for your home, such as a mobile phone with the companion app.
If you want to see a trace of the past locations of your entities, you need to define a time frame under Hours to show .
For more information about presence detection, refer to the getting started tutorial on presence detection .
All options for this card can be configured via the user interface. For a detailed description of the options, refer to the YAML configuration section. It also applies to the options shown in the UI.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
map
entities list ( Optional )
List of entity IDs or entity objects (see below ). Either this, show_all , or the geo_location_sources configuration option is required.
geo_location_sources list ( Optional )
List of geolocation sources or source objects (see below ). All current entities with that source will be displayed on the map. See Geolocation platform for valid sources. Set to all to use all available sources. Either this, show_all , or the entities configuration option is required.
show_all boolean ( Optional , default: false )
Automatically add all entities with coordinates to the map card. (Default behavior of Map panel)
auto_fit boolean ( Optional , default: false )
The map will follow moving entities by adjusting the viewport of the map each time an entity is updated.
fit_zones boolean ( Optional , default: false )
Whether the map should consider the zones in the list of specified entities when fitting its viewport.
title string ( Optional )
The card title.
aspect_ratio string ( Optional )
Forces the height of the image to be a ratio of the width. Valid formats: Height percentage value ( 23% ) or ratio expressed with colon or “x” separator ( 16:9 or 16x9 ). For a ratio, the second element can be omitted and will default to “1” ( 1.78 equals 1.78:1 ).
default_zoom integer ( Optional )
The default zoom level of the map. Use a lower number to zoom out and a higher number to zoom in.
Default:
14 (or whatever zoom level is required to fit all visible markers)
theme_mode string ( Optional , default: auto )
Override the theme to force the map to display in either a light mode ( theme_mode: light ) or a dark mode ( theme_mode: dark ). Default ( theme_mode: auto ) will follow the theme settings.
hours_to_show integer ( Optional , default: 0 )
Shows a path of previous locations. Hours to show as path on the map.
cluster boolean ( Optional , default: true )
When set to false , the map will not cluster the markers. This is useful when you want to see all markers at once, but it may cause performance issues with a large number of markers.
conditions list ( Optional )
List of conditions to check for entity visibility. See description .
Important
Only entities that have latitude and longitude attributes will be displayed on the map.
Note
The default_zoom value will be ignored if it is set higher than the current zoom level
after fitting all visible entity markers in the map window. In other words, this can only
be used to zoom the map out by default.
You can specify one or more conditions , in which case every selected entity will be tested against each condition and shown if it passes every condition. See available conditions . For conditions which accept an entity id, this will be automatically set to the entity being tested.
Map all locatable entities, except hiding those that have a state of home .
type : map auto_fit : true show_all : true conditions : - condition : state state_not : home
If you define entities as objects instead of strings (by adding entity: before entity ID), you can add more customization and configuration.
entity string Required
Entity ID.
name string ( Optional )
Replace the default label for the marker.
label_mode string ( Optional , default: name )
When set to icon , renders the entity’s icon in the marker instead of text. When set to state or attribute , renders the entity’s state or attribute as the label for the map marker instead of the entity’s name. This option doesn’t apply to zone entities because they don’t use a label but an icon.
attribute string ( Optional )
An entity’s attribute when label_mode set to attribute .
unit string ( Optional )
A unit for a value of an attribute when label_mode set to attribute .
focus boolean ( Optional , default: true )
When set to false , this entity will not be considered for determining the default zoom or fit of the map.
If you define geolocation sources as objects instead of strings (by adding source: before the ID), you can add more customization and configuration.
source string Required
Name of a geolocation source, or all .
When set to icon , renders the entity’s icon in the marker instead of text. When set to state or attribute , renders the entity’s state or attribute as the label for the map marker instead of the entity’s name.
When set to false , the entities of this source will not be considered for determining the default zoom or fit of the map.
type : map aspect_ratio : 16:9 default_zoom : 8 auto_fit : true entities : - device_tracker.demo_paulus - zone.home
type : map geo_location_sources : - nsw_rural_fire_service_feed - source : gdacs focus : false entities : - zone.home
type : map entities : - device_tracker.demo_paulus - entity : sensor.gas_station_gas_price label_mode : state focus : false hours_to_show : 48
Map dashboard
Themes
Dashboard cards
Edit your home location
Getting started tutorial on presence detection
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
