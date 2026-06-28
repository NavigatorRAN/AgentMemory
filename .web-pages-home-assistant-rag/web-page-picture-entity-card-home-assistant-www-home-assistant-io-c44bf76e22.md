---
source_url: "https://www.home-assistant.io/dashboards/picture-entity"
final_url: "https://www.home-assistant.io/dashboards/picture-entity"
canonical_url: "https://www.home-assistant.io/dashboards/picture-entity/"
source_handle: "web:www-home-assistant-io:c44bf76e220b"
source_section: "dashboards-picture-entity"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ef3df6730a5056e9c73cbe0b7178e8650b6fd1b5ad69ceb70061eba9645a26b3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Picture entity card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/picture-entity
- Final URL: https://www.home-assistant.io/dashboards/picture-entity
- Canonical URL: https://www.home-assistant.io/dashboards/picture-entity/
- Fetched at: 2026-06-28T02:19:58Z
- Content type: text/html; charset=UTF-8

## Description

The picture entity card displays an entity in the form of an image. Instead of images from URL, it can also show the picture of camera entities.

## Extracted Text

On this page
Adding a picture entity card to your dashboard
YAML configuration
How to use state_filter
Examples
Related topics
The picture entity card displays an entity in the form of an image. Instead of images from URL, it can also show the picture of camera entities.
Background changes according to the entity state.
To add a card, follow steps 1-4 on adding a card from a view .
In step 2, on the By card tab, select picture entity card.
Add a picture:
Upload picture lets you pick an image from the system used to show your Home Assistant UI.
Local path lets you pick an image stored on Home Assistant. For example: /homeassistant/images/lights_view_background_image.jpg .
To store an image on Home Assistant, you need to configure access to files , for example via Samba or the Studio Code Server app (formerly known as add-on).
web URL let you use an image from the web. For example https://www.home-assistant.io/images/frontpage/assist_wake_word.png .
Define the parameters that are specific to the picture entity card.
For a description of the specific settings, refer to the description under YAML configuration.
They also apply to the UI.
Save your changes.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
picture-entity
entity string Required
A camera, image, or person entity_id used for the picture.
camera_image string ( Optional )
Camera entity_id to use. (not required if entity is already a camera-entity).
camera_view string ( Optional , default: auto )
“live” will show the live view if stream is enabled.
image string ( Optional )
URL of an image. To use a locally hosted image, see Hosting , or use a media-source:// URL for Media content.
state_image map ( Optional )
Map entity states to images ( state: image URL , check the example below).
state_filter map ( Optional )
State-based CSS filters
aspect_ratio string ( Optional )
Forces the height of the image to be a ratio of the width. Valid formats: Height percentage value ( 23% ) or ratio expressed with colon or “x” separator ( 16:9 or 16x9 ). For a ratio, the second element can be omitted and will default to “1” ( 1.78 equals 1.78:1 ).
fit_mode string ( Optional , default: cover )
Defines the manner in which the image is stretched/clipped to fit the card area. cover : The image keeps its aspect ratio and fills the given dimension. The image will be clipped to fit. contain : The image keeps its aspect ratio, but is resized to fit within the given dimension. fill : The image is resized to fill the given dimension. If necessary, the image will be stretched or squished to fit.
name string | map | list ( Optional )
Overwrites friendly name. Can be a string, or a name configuration object. See naming documentation .
show_name boolean ( Optional , default: true )
Shows name in footer.
show_state boolean ( Optional , default: true )
Shows state in footer.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
tap_action map ( Optional )
Action taken on card tap. See action documentation .
hold_action map ( Optional )
Action taken on card tap and hold. See action documentation .
double_tap_action map ( Optional )
Action taken on card double tap. See action documentation .
Specify different CSS filters
state_filter : " on" : brightness(110%) saturate(1.2) "off" : brightness(50%) hue-rotate(45deg)
Basic example:
type : picture-entity entity : light.bed_light image : /local/bed_light.png
Different images for each state (supports local, web, or media-source:// URLs):
type : picture-entity entity : light.bed_light state_image : " on" : /local/bed_light_on.png "off" : https://demo.home-assistant.io/stub_config/bedroom.png "unavailable" : media-source://image_upload/123456789
Displaying a live feed from an FFmpeg camera:
type : picture-entity entity : camera.backdoor camera_view : live tap_action : action : perform-action perform_action : camera.snapshot data : entity_id : camera.backdoor filename : ' /shared/backdoor-{{ now().strftime("%Y-%m-%d-%H%M%S") }}.jpg'
The filename needs to be a path that is writable by Home Assistant in your system. You may need to configure allowlist_external_dirs ( documentation ).
Card actions
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
