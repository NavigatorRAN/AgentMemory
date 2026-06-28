---
source_url: "https://www.home-assistant.io/dashboards/sections"
final_url: "https://www.home-assistant.io/dashboards/sections"
canonical_url: "https://www.home-assistant.io/dashboards/sections/"
source_handle: "web:www-home-assistant-io:214aea2a7944"
source_section: "dashboards-sections"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6f4658b22f6eaa13c4af029a670bf9eea535cdabd756d27a8a8603a62fddd8a5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Sections - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/sections
- Final URL: https://www.home-assistant.io/dashboards/sections
- Canonical URL: https://www.home-assistant.io/dashboards/sections/
- Fetched at: 2026-06-28T02:20:06Z
- Content type: text/html; charset=UTF-8

## Description

The panel view shows a single card in the full width of the screen.

## Extracted Text

On this page
Creating a sections view
Editing the header
Adding sections and cards to a sections view
Adding a section background
Deleting a section
Rearranging sections and cards
Setting a section theme
Prerequisites
To set a section theme via the UI
To set a section theme via YAML
YAML example
Show or hide section conditionally
Editing the footer
Check out the demo
About the sections view layout
YAML configuration
Header YAML configuration
Section YAML configuration
Examples
Footer YAML configuration
Related topics
The sections view lets you organize your cards in sections on a grid.
You can group cards without using horizontal or vertical stack cards.
A fully populated dashboard in Sections view layout
If you have multiple dashboards, in the left sidebar, select the dashboard to which you want to add the sections view.
Follow the steps on adding a new view .
Under View type , select Sections .
Under Max number of sections wide , select the maximum number of columns you want to see in the new sections view.
Under Dense section placement , select if you want to allow the cards to be arranged automatically in order to fill gaps between cards.
This will remove some gaps, but it also means you have less control over the order of the cards.
Note that this only applies to horizontal gaps if you used sections more than one column wide.
When you are done, select Save .
You are now presented with a new, empty view.
If you chose a background image, the page is filled with that image.
Once you have created a sections view, you can start curating it:
Add sections and cards .
Rearrange and show or hide sections conditionally .
Add a dashboard header with a title and badges .
To add a title, select the Add title button. The title supports Markdown and templating .
To add badges, select the Add badge button. Follow steps on adding badges to see the different possible options.
To change the title and badges disposition, select the edit button to access header settings.
The view comes with one section to which you can directly add a card.
To add a card, select the Add card button.
Follow the steps on adding cards .
To add a new section, select the Create section button.
A heading card will be automatically added to the top of the section.
To edit it, select the card.
If you don’t want a heading title at the top of the section, delete this card.
The title can be added again later, like any other card.
If you want this section to be visible only to specific users or under a certain condition, you can define those conditions:
On the Visibility tab, select Add condition .
Select the type of condition, and enter the parameters.
If you define multiple conditions, the section is only shown when all conditions are met.
If you did not define any conditions, the section is always shown, to all users.
You can add a colored background to individual sections. This is a great way to visually group related cards or highlight important sections on your dashboard.
To edit your dashboard, in the top right corner, select the edit button.
Select the edit button on the section you want to customize.
Enable the Background toggle.
To change the background color and opacity, expand Background options .
Pick a color from the predefined list, or enter a custom hex color code.
Use the Opacity slider to adjust the transparency of the background.
To delete a section, go to the dashboard and in the top right corner, select the edit button.
Open the view with the section you want to delete.
Select the delete button.
In the sections view, you can rearrange sections and cards by dragging them to a new location. This is not yet possible in other views.
To rearrange sections, hold the move button and move the card.
Rearranging sections by dragging
To rearrange cards, tap and hold the card and move it to your desired location.
Rearranging cards by dragging
You can apply different themes to individual sections within a view. This allows you to visually distinguish different areas of your dashboard, such as using warm colors for alerts or cool colors for general information.
Before setting a section theme, you must create your custom themes in YAML configuration .
Open your dashboard in edit mode: in the top right of the screen, select the edit button.
On the section you want to theme, select the edit button.
Select Edit Section .
Go to the Settings tab.
Use the Theme dropdown to select a theme for this section.
Select Save .
Add the theme property to a section configuration:
views : - title : Dashboard # View theme theme : default-theme type : sections sections : - type : grid # Section overrides view theme theme : custom-theme cards : - type : weather-forecast entity : weather.home - type : grid # No theme specified - inherits view theme cards : - type : sensor entity : sensor.temperature
views : - title : Home Status theme : main_view type : sections sections : # System alerts section with orange theme - type : grid title : System Alerts theme : alert_section cards : - type : tile entity : update.home_assistant_core_update - type : tile entity : sensor.processor_use - type : tile entity : sensor.memory_use_percent # General info section inherits blue theme - type : grid title : Status & Info cards : - type : tile entity : sun.sun - type : tile entity : weather.home
Dashboard with section themes in light mode
Dashboard with section themes in dark mode
You can choose to show or hide certain sections based on different conditions. The available conditions are the same as that for the conditional card.
To edit the section visibility conditions, select the edit button and then select the Visibility tab.
The footer lets you choose one card to show at the bottom of the view. This card stays on top of other cards while you scroll and only moves out of the way when you reach the bottom of the view.
To add a footer, select the Add footer button.
Select a card type to be used as the footer.
To change the maximum width of the footer, select the edit button to access footer settings.
Check out the demo from the March live stream on dashboards.
To learn all about the design decisions and the grid layout used for the sections view, refer to the Dashboard chapter 1 blog post .
Configuration Variables
Looking for your configuration file?
type string ( Optional )
sections
layout string ( Optional , default: center )
Layout of the different elements. Can be start , center , or responsive . responsive is the same as start on mobile devices. It places badges and title side by side on desktop.
badges_position string ( Optional , default: bottom )
Badges position. Can be bottom or top .
card map Required
Card to be used as title. If you are configuring the view using the visual editor, the configuration of the Markdown card is used.
background boolean | map ( Optional , default: false )
Adds a colored background behind the section. Use true for the default color and opacity, or provide a map with color and opacity options.
color string ( Optional )
The background color. Accepts a predefined color name or a hex color code.
opacity integer ( Optional , default: 50 )
The opacity of the background, from fully transparent to fully opaque.
theme string ( Optional )
Theme to apply to this section. Overrides the view theme for this section only. See themes .
# Section with default background background : true
# Section with custom background color and opacity background : color : " red" opacity : 80
max_width integer ( Optional , default: 600 )
Maximum width of the footer.
Masonry view
Sidebar view
Panel view
Dashboard chapter 1 blog post
Adding cards to a view
Adding a new view
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
