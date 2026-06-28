# Shortcut card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/shortcut
- Final URL: https://www.home-assistant.io/dashboards/shortcut
- Canonical URL: https://www.home-assistant.io/dashboards/shortcut/
- Fetched at: 2026-06-28T02:20:13Z
- Content type: text/html; charset=UTF-8

## Description

The shortcut card gives you a quick way to trigger an action from your dashboard, such as navigating to a page, opening a URL, launching the voice assistant, or performing an action.

## Extracted Text

On this page
Adding the shortcut card to a dashboard
Card settings
YAML configuration
Examples
Available colors
Related topics
The shortcut card gives you a quick way to trigger an action from your dashboard. You can use it to navigate to another page, open a URL, launch the voice assistant, or perform an action. It renders as a tile, so it fits nicely alongside other tile cards on your dashboard.
The label, icon, and color are automatically resolved from the action you configure. For example, if you navigate to a dashboard view, the shortcut picks up the view’s title and icon. You can override any of these values if you want something different.
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
Most options can be configured in the UI.
Label
The text displayed on the card. If left empty, the label is resolved automatically from the action. For example, the view title for a navigation action, or Assist for an assist action.
Description
An optional secondary line displayed under the label.
Icon
The icon displayed on the card. If left empty, the icon is resolved automatically from the action.
Color
The color of the icon and background accent. Accepts a color token or a hex color code. Defaults to the primary color of your theme.
Vertical
Displays the icon above the label instead of next to it.
Tap action
The action taken when the card is tapped. For more information, see the action documentation .
Hold action
The action taken when the card is tapped and held. For more information, see the action documentation .
Double tap action
The action taken when the card is double-tapped. For more information, see the action documentation .
The following YAML options are available when you use YAML mode or prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
shortcut
label string ( Optional )
The text displayed on the card. If not set, the label is resolved automatically from the configured tap_action .
description string ( Optional )
icon string ( Optional )
The icon displayed on the card. If not set, the icon is resolved automatically from the configured tap_action .
color string ( Optional , default: primary )
The color of the icon and background accent. Accepts a color token or hex color code.
vertical boolean ( Optional , default: false )
tap_action map Required
The action taken on card tap. For more information, see the action documentation .
hold_action map ( Optional )
The action taken on card tap and hold. For more information, see the action documentation .
double_tap_action map ( Optional )
The action taken on card double tap. For more information, see the action documentation .
Navigate to a dashboard view. The label and icon are taken from the view:
type : shortcut tap_action : action : navigate navigation_path : /lovelace/kitchen
Open an external URL with a custom label and icon:
type : shortcut label : " Home Assistant docs" icon : mdi:book-open-variant tap_action : action : url url_path : https://www.home-assistant.io
Launch the voice assistant:
type : shortcut tap_action : action : assist
Perform an action, with a custom color and a description:
type : shortcut label : " Good night" description : " Turn off all lights" color : indigo tap_action : action : perform-action perform_action : script.good_night
Vertical layout:
type : shortcut label : " Kitchen" vertical : true tap_action : action : navigate navigation_path : /lovelace/kitchen
The following colors are available to colorize the shortcut card: primary , accent , disabled , red , pink , purple , deep-purple , indigo , blue , light-blue , cyan , teal , green , light-green , lime , yellow , amber , orange , deep-orange , brown , grey , blue-grey , black , white , or any hex color code (for example, #93c47d ).
Card actions
Tile card
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
