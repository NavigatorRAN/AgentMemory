# Picture glance card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/picture-glance
- Final URL: https://www.home-assistant.io/dashboards/picture-glance
- Canonical URL: https://www.home-assistant.io/dashboards/picture-glance/
- Fetched at: 2026-06-28T02:20:00Z
- Content type: text/html; charset=UTF-8

## Description

The picture glance card shows an image and corresponding entity states as an icon. The entities on the right side allow toggle actions, others show the more information dialog.

## Extracted Text

On this page
Adding a picture glance card to your dashboard
YAML configuration
Options for entities
How to use state_filter
Examples
Creating a card to control the camera
More examples
Related topics
The picture glance card shows an image and lets you place small icons of entity states on top of that card to control those entities from there. In the image below: the entities on the right allow toggle actions, the others show the more information dialog.
Picture glance card for a living room.
To add a card, follow steps 1-4 on adding a card from a view .
In step 2, on the By card tab, select picture glance card.
Add a picture:
Upload picture lets you pick an image from the system used to show your Home Assistant UI.
Local path lets you pick an image stored on Home Assistant. For example: /homeassistant/images/lights_view_background_image.jpg .
To store an image on Home Assistant, you need to configure access to files , for example via Samba or the Studio Code Server app (formerly known as add-on).
web URL let you use an image from the web. For example https://www.home-assistant.io/images/frontpage/assist_wake_word.png .
Define the parameters that are specific to the picture glance card.
For a description of the specific settings, refer to the description under YAML configuration.
They also apply to the UI.
Save your changes.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
picture-glance
entities list Required
List of entities or entity objects.
title string ( Optional )
The card title.
image string ( Optional )
Background image URL (local, web, or media-source:// )
image_entity string ( Optional )
Image or person entity to display.
camera_image string ( Optional )
Camera entity as Background image.
camera_view string ( Optional , default: auto )
“live” will show the live view if stream is enabled.
state_image map ( Optional )
Background image based on entity state.
state string ( Optional )
state: image-url , check the example below.
state_filter map ( Optional )
State-based CSS filters
aspect_ratio string ( Optional )
Forces the height of the image to be a ratio of the width. Valid formats: Height percentage value ( 23% ) or ratio expressed with colon or “x” separator ( 16:9 or 16x9 ). For a ratio, the second element can be omitted and will default to “1” ( 1.78 equals 1.78:1 ).
fit_mode string ( Optional , default: cover )
Defines the manner in which the image is stretched/clipped to fit the card area. cover : The image keeps its aspect ratio and fills the given dimension. The image will be clipped to fit. contain : The image keeps its aspect ratio, but is resized to fit within the given dimension. fill : The image is resized to fill the given dimension. If necessary, the image will be stretched or squished to fit.
entity string ( Optional )
Entity to use for state_image and state_filter .
show_state boolean ( Optional , default: false )
Show entity state text.
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
tap_action map ( Optional )
Action taken on card tap. See action documentation .
hold_action map ( Optional )
Action taken on card tap and hold. See action documentation .
double_tap_action map ( Optional )
Action taken on card double tap. See action documentation .
If you define entities as objects instead of strings, you can add more customization and configuration:
entity string Required
Entity ID.
attribute string ( Optional )
Attribute of the entity to display instead of the state.
prefix string ( Optional )
Prefix to display before the attribute’s value.
suffix string ( Optional )
Suffix to display after the attribute’s value.
icon string ( Optional )
Overwrites default icon.
show_state boolean ( Optional , default: true )
Specify different CSS filters
state_filter : " on" : brightness(110%) saturate(1.2) "off" : brightness(50%) hue-rotate(45deg) entity : switch.decorative_lights
This section lists a few examples of how the picture glance card can be used.
If your camera supports PTZ (can be moved in different directions), you can use the picture glance card to control the camera.
Picture glance card to control the camera.
Select your camera entity.
Image path and Image entity are not required.
If you want something to happen when you tap the card itself, define a tap action.
Here, we toggle a light.
Select the entities to move the camera left, right, up, or down.
Select Show code editor .
For each of the entities, specify an icon, as indicated in the YAML example.
For the buttons to react on press (instead of bringing up the dialog):
For each of the entities, under tap_action , use a button.press action.
camera_view : live type : picture-glance title : Desk entities : - entity : button.camera1_ptz_left icon : mdi:pan-left tap_action : action : perform-action perform_action : button.press data : entity_id : button.camera1_ptz_left - entity : button.camera1_ptz_right icon : mdi:pan-right tap_action : action : perform-action perform_action : button.press data : entity_id : button.camera1_ptz_right - entity : button.camera1_ptz_up icon : mdi:pan-up tap_action : action : perform-action perform_action : button.press data : entity_id : button.camera1_ptz_up - entity : button.camera1_ptz_down icon : mdi:pan-down tap_action : action : perform-action perform_action : button.press data : entity_id : button.camera1_ptz_down camera_image : camera.camera1_sub tap_action : action : perform-action perform_action : light.toggle target : entity_id : light.philips_929003052501_01_huelight
That’s it. You can now control your camera from the picture glance card on your dashboard.
type : picture-glance title : Living room entities : - switch.decorative_lights - light.ceiling_lights - lock.front_door - binary_sensor.movement_backyard - binary_sensor.basement_floor_wet image : /local/living_room.png
Display a camera image as background:
type : picture-glance title : Living room entities : - switch.decorative_lights - light.ceiling_lights camera_image : camera.demo_camera
Display a camera image without additional entities:
type : picture-glance title : Front garden entities : [] camera_image : camera.front_garden_camera
Use different images based on entity state (supports local, web, or media-source:// URLs):
type : picture-glance title : Living room entities : - switch.decorative_lights - light.ceiling_lights state_image : " on" : /local/living_room_on.png "off" : https://demo.home-assistant.io/stub_config/living_room.png "unavailable" : media-source://image_upload/123456789 entity : group.living.room
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
