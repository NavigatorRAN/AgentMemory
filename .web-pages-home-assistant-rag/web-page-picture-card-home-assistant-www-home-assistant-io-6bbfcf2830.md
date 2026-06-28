---
source_url: "https://www.home-assistant.io/dashboards/picture"
final_url: "https://www.home-assistant.io/dashboards/picture"
canonical_url: "https://www.home-assistant.io/dashboards/picture/"
source_handle: "web:www-home-assistant-io:6bbfcf2830a2"
source_section: "dashboards-picture"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d7a6e4a8924dfd6a06af3199dd3847b7611ee2af8f95f823bbe25fc3fca5766e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Picture card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/picture
- Final URL: https://www.home-assistant.io/dashboards/picture
- Canonical URL: https://www.home-assistant.io/dashboards/picture/
- Fetched at: 2026-06-28T02:19:53Z
- Content type: text/html; charset=UTF-8

## Description

The picture card allows you to set an image to use for navigation to various paths in your interface or to perform an action.

## Extracted Text

On this page
Adding a picture card to your dashboard
YAML configuration
Examples
Related topics
The picture card allows you to set an image to use for navigation to various paths in your interface or to perform an action.
Screenshot of the picture card.
To add a card, follow steps 1-4 on adding a card from a view .
In step 2, on the By card tab, select picture card.
Add a picture:
Upload picture lets you pick an image from the system used to show your Home Assistant UI.
Local path lets you pick an image stored on Home Assistant. For example: /homeassistant/images/lights_view_background_image.jpg .
To store an image on Home Assistant, you need to configure access to files , for example via Samba or the Studio Code Server app (formerly known as add-on).
web URL let you use an image from the web. For example https://www.home-assistant.io/images/frontpage/assist_wake_word.png .
Define the parameters that are specific to the picture card.
For a description of the specific settings, refer to the description under YAML configuration.
They also apply to the UI.
Save your changes.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
picture
image string Required
The URL of an image. When you want to store images in your Home Assistant installation use the hosting files documentation . After storing your files, use the /local path, for example, /local/filename.jpg . To use an image from an existing media directory, provide the full media-source identifier (see examples).
image_entity string ( Optional )
Image or person entity to display.
alt_text string ( Optional )
Alternative text for the image. This is necessary for users of assistive technology. The W3C images tutorial provides simple guidance for writing alternative text.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
tap_action map ( Optional )
Action taken on card tap. See action documentation .
hold_action map ( Optional )
Action taken on card tap and hold. See action documentation .
double_tap_action map ( Optional )
Action taken on card double tap. See action documentation .
Go to another view:
type : picture image : /local/home.jpg tap_action : action : navigate navigation_path : /lovelace/home
Check the views setup on how to setup custom IDs.
Toggle entity using an action:
type : picture image : /local/light.png tap_action : action : perform-action perform_action : light.toggle data : entity_id : light.ceiling_lights
Show an image from a media directory:
type : picture image : media-source://media_source/local/test.jpg
Card actions
Themes
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
