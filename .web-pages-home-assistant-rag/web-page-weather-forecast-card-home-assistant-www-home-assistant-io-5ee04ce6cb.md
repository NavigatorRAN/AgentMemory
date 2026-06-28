---
source_url: "https://www.home-assistant.io/dashboards/weather-forecast"
final_url: "https://www.home-assistant.io/dashboards/weather-forecast"
canonical_url: "https://www.home-assistant.io/dashboards/weather-forecast/"
source_handle: "web:www-home-assistant-io:5ee04ce6cb37"
source_section: "dashboards-weather-forecast"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f674c5056c8ff439c45420b0229651bb0d64e58541dcc9979e244811a11c4883"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Weather forecast card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/weather-forecast
- Final URL: https://www.home-assistant.io/dashboards/weather-forecast
- Canonical URL: https://www.home-assistant.io/dashboards/weather-forecast/
- Fetched at: 2026-06-28T02:20:37Z
- Content type: text/html; charset=UTF-8

## Description

The weather forecast card displays the weather. Very useful to include on interfaces that people display on the wall.

## Extracted Text

On this page
Adding the weather forecast card to a dashboard
Card settings
YAML configuration
Example
Using icons
Related topics
The weather forecast card displays the weather. This card is particularly useful on wall-mounted displays.
Screenshot of the weather card.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
Entity
The entity of the weather platform to use.
Name
The name of the location where the weather platform is located. If not set, the name will be the name set on the weather entity
Show Forecast
Check this if you would like to show the upcoming forecast under the current weather.
Forecast type
Select the forecast to display between Daily , Hourly , and Twice daily .
Secondary Info Attribute
Here you can specify a secondary attribute to show under the current temperature. Ex. Extrema, Precipitation, Humidity. If not set, it will default to Extrema (High/Low) if available, if not available then Precipitation and if precipitation isn’t available then Humidity.
Round temperature
Check this if you would like to round all temperature values in the card to its nearest integer.
Theme
Name of any loaded theme to be used for this card. For more information about themes, see the frontend documentation .
Important
This card works only with platforms that define a weather entity.
E.g., it works with OpenWeatherMap but not OpenWeatherMap Sensor
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
weather-forecast
entity string Required
Entity ID of weather domain.
name string | map | list ( Optional , default: Entity name )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
show_current boolean ( Optional , default: true )
Show the current weather conditions above the forecast.
show_forecast boolean ( Optional , default: true )
Show next hours/days forecast.
forecast_type string Required
Type of forecast to display, one of daily , hourly or twice_daily .
secondary_info_attribute string ( Optional )
Which attribute to display under the temperature.
Default:
Defaults to extrema if available, if not available then precipitation and if precipitation isn’t available then humidity .
round_temperature boolean ( Optional , default: false )
Round temperature values to the closest integer.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
tap_action map ( Optional )
The action taken on card tap. For more information, see the action documentation .
hold_action map ( Optional )
The action taken on card tap and hold. For more information, see the action documentation .
double_tap_action map ( Optional )
The action taken on card double-tap. For more information, see the action documentation .
show_current : true show_forecast : true type : weather-forecast entity : weather.openweathermap forecast_type : daily
Themeable icons
The default weather icons are themable via a theme . Theme variables include:
--weather-icon-cloud-front-color --weather-icon-cloud-back-color --weather-icon-sun-color --weather-icon-rain-color --weather-icon-moon-color
Example theme configuration:
--weather-icon-cloud-front-color : white --weather-icon-cloud-back-color : blue --weather-icon-sun-color : orange --weather-icon-rain-color : purple
Personal icons
Weather icons can be overwritten with your own personal images via a theme . Theme variables include:
--weather-icon-clear-night --weather-icon-cloudy --weather-icon-fog --weather-icon-lightning --weather-icon-lightning-rainy --weather-icon-partlycloudy --weather-icon-pouring --weather-icon-rainy --weather-icon-hail --weather-icon-snowy --weather-icon-snowy-rainy --weather-icon-sunny --weather-icon-windy --weather-icon-windy-variant --weather-icon-exceptional // If your state is not above, use this format --weather-icon-<state>
--weather-icon-sunny : url("/local/sunny.png")
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
