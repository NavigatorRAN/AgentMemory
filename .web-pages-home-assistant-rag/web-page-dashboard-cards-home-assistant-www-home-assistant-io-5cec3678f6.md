---
source_url: "https://www.home-assistant.io/dashboards/cards"
final_url: "https://www.home-assistant.io/dashboards/cards"
canonical_url: "https://www.home-assistant.io/dashboards/cards/"
source_handle: "web:www-home-assistant-io:5cec3678f6eb"
source_section: "dashboards-cards"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c1f992493fa3a2fa0db4140adf5855dac5bcb811ffe0286ba1af7663525d27ca"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Dashboard cards - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/cards
- Final URL: https://www.home-assistant.io/dashboards/cards
- Canonical URL: https://www.home-assistant.io/dashboards/cards/
- Fetched at: 2026-06-28T02:18:41Z
- Content type: text/html; charset=UTF-8

## Description

Cards are the building blocks of a Home Assistant dashboard. Each card shows information from your home or lets you control a device, and you add them with a single tap.

## Extracted Text

Each dashboard is made up of cards. Cards display information and let you control your devices. You can arrange them freely across views, resize them in the Sections view layout, and configure actions, features, and conditional visibility.
Screenshot of the masonry view with different types of cards.
Card categories
There are several different card types, each with their own configuration options. They can be categorized in terms of their function:
Specific to a device type or service : alarm , light , humidifier , thermostat , plant status , media control , weather forecast , to-do list , shopping list , map , activity , calendar
Grouping other cards : vertical stack , horizontal stack , grid
Logic function : conditional , entity filter
Display generic data : sensor , history graph , statistic , statistics graph , energy , gauge , clock , Markdown , webpage
Control devices and entities : button , entity , shortcut
Display data and control entities : tile , heading , entities , glance , area , picture , picture entity , picture elements , picture glance
Adding cards to your dashboard
A card can be added to a dashboard directly from the view where you want to add it, or from the device page .
To add a card from a view
Depending on your dashboard view layout:
For Sections layout, select in the section (bottom left).
For other layout types (such as Masonry, Panel, or Sidebar), in the bottom right of the view, select Add card .
There are two methods to add a card:
By entity .
Select the entities from the list.
Then, select the card you want from the preview.
If you can’t see your entity, check the Unassigned section. Entities that are not assigend to an area are listed there.
By card :
Browse the list of available cards.
If you are using the Sections view, try the Tile card in the Suggested cards section.
If you want this card to be visible only to specific users or under a certain condition, you can define those conditions .
If you are adding this card to a sections view , on the Layout tab, you can resize the card .
Customize your card:
define card actions .
define header and footer
customize features .
Not all cards support these elements. Refer to the documentation of the specific card type.
Select Add to dashboard .
To add a card from the device page
This method is useful if you are on the Device page and want to create a card directly from there.
Go to Settings > Devices & services .
On the integration card of interest, select Devices .
If there are multiple devices, select the device from the list.
Add the card:
Find the area of interest, for example Sensors , or Events and select Add to Dashboard .
In the dialog, select the target dashboard and if you have multiple views, select the view.
Select Next .
If you like the card proposal, select Add to dashboard .
If you want to change the card, Pick different card and choose your card type.
Result : The card is added to the selected view.
To edit the card configuration, open the view to which you added the card.
Select Edit card .
define card actions or header and footer widgets .
Showing or hiding a card or badge conditionally
You can choose to show or hide certain cards or badges based on different conditions. The available conditions are the same as the ones for the conditional card.
On the Visibility tab, select Add condition .
Troubleshooting: Don’t see a Visibility tab?
It is not available inside nested cards: vertical stack, horizontal stack, and grid card
Select the type of condition, and enter the parameters.
The available conditions are the same as the ones for the conditional card.
If you define multiple conditions, the card or badge is only shown when all conditions are met.
If you did not define any conditions, the card or badge is always shown to all users.
Select Save .
Resizing a card
In sections view , you can resize cards. Follow these steps:
On the Layout tab, use the grid size picker to adjust the number of columns and rows the card occupies.
Troubleshooting: Don’t see a Layout tab?
It is not available on the picture elements card.
To make the card span the full width of the section, regardless of section size, enable Full width card .
If you want a finer grid to size your card, enable Precise mode . The last row was done using precise mode.
Revert resizing of a card
If you previously resized a card in the sections view , and you don’t like the new size, you can revert back to the card’s default size. Follow these steps:
On the Layout tab, select the icon.
Card actions, features, header and footer widgets
Some cards have support for tap actions . These actions define what will happen when you tap or hold on an object within a card.
Some cards have support for features . These widgets add quick controls to the card. Supported features depend on the card and entity capabilities. Multiple features can be added to a single card.
Screenshot of tile cards with features.
Some cards have support for header and footer widgets . These widgets fill up the entire available space in a card.
Screenshot of an entities card with a picture header and buttons footer.
Related topics
Card tap actions
Card features
Card header and footer widgets
Views
Introduction to dashboards
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
