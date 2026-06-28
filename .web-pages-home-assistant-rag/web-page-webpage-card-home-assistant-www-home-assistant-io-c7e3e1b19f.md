# Webpage card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/iframe
- Final URL: https://www.home-assistant.io/dashboards/iframe
- Canonical URL: https://www.home-assistant.io/dashboards/iframe/
- Fetched at: 2026-06-28T02:19:29Z
- Content type: text/html; charset=UTF-8

## Description

The webpage card allows you to embed your favorite webpage right into Home Assistant.

## Extracted Text

On this page
Adding the webpage card to a dashboard
YAML configuration
Examples
Related topics
The webpage card allows you to embed your favorite webpage right into Home Assistant. You can also embed files stored in your <config-directory>/www folder and reference them using /local/<file> .
The webpage card is used on the Webpage dashboard .
Windy weather radar as webpage.
All options for this card can be configured via the user interface.
Note that not every webpage can be embedded due to security restrictions that some sites have in place. These restrictions are enforced by your browser and prevent embedding them into a Home Assistant dashboard.
Important
You can’t embed sites using HTTP if you are using HTTPS for your Home Assistant.
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
iframe
url string Required
Website URL.
aspect_ratio string ( Optional , default: 50% )
Forces the height of the image to be a ratio of the width. Valid formats: Height percentage value ( 23% ) or ratio expressed with colon or “x” separator ( 16:9 or 16x9 ). For a ratio, the second element can be omitted and will default to “1” ( 1.78 equals 1.78:1 ).
allow_open_top_navigation boolean ( Optional , default: false )
Allow the user to open iframe content links by opening the default browser in the Home Assistant mobile app. It is false by default because it adds allow-top-navigation-by-user-activation on the iframe sandbox attribute which is less secure. So set it to true if you need it and are confident with the iframe content.
hide_background boolean ( Optional , default: false )
Hide the card background, making it transparent. This removes the background color, box-shadow, and border. Useful for pages which allow transparent backgrounds so the iframe can blend into the dashboard view.
title string ( Optional )
The card title.
allow string ( Optional , default: fullscreen )
The Permissions Policy of the iframe, that is, the value of the allow attribute.
disable_sandbox boolean ( Optional , default: false )
Disables the sandbox attribute of the iframe, for example when viewing PDFs in Chrome. This is less secure and should only be used if you trust the content of the iframe.
type : iframe url : https://www.home-assistant.io aspect_ratio : 75%
Webpage dashboard
Dashboard cards
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
