# Picture elements card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/picture-elements
- Final URL: https://www.home-assistant.io/dashboards/picture-elements
- Canonical URL: https://www.home-assistant.io/dashboards/picture-elements/
- Fetched at: 2026-06-28T02:19:56Z
- Content type: text/html; charset=UTF-8

## Description

The picture elements card is one of the most versatile types of cards. The cards allow you to position icons or text and even buttons! On an image based on coordinates.

## Extracted Text

On this page
Adding the picture elements card to a dashboard
YAML configuration
Elements
State badge
State icon
State label
Perform action button
Icon element
Image element
Conditional element
Custom elements
Notes on element attributes
How to use the style object
How to use state_image
How to use state_filter
How to use click-and-hold
Examples
Example of icons, labels and buttons
Images example
Conditional example
Related topics
The picture elements card is one of the most versatile types of cards.
A functional floorplan powered by picture elements.
The cards allow you to position icons or text and even buttons on an image based on coordinates. Imagine floor plan, imagine picture-glance with no restrictions!
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
picture-elements
image string Required
The URL of an image.
To use a locally hosted image, see Hosting , or use a media-source:// URL for Media content.
image_entity string ( Optional )
Image or person entity to display.
camera_image string ( Optional )
A camera entity.
camera_view string ( Optional , default: auto )
“live” will show the live view if stream is enabled.
elements list Required
List of elements.
title string ( Optional )
Card title.
state_filter map ( Optional )
State-based CSS filters
theme string ( Optional )
Override the used theme for this card with any loaded theme. For more information about themes, see the frontend documentation .
dark_mode_image string ( Optional )
This image is used when the dark mode is activated and no state image is set.
dark_mode_filter string ( Optional )
This CSS filter is used when the dark mode is activated.
Elements are the active components (icons, badges, buttons, text, and more) that overlay the image.
There are several different element types that can be added to a Picture Elements card:
State Icon
State Label
Icon
Image
Conditional
Custom
This element creates a badge representing the state of an entity.
state-badge
entity string Required
Entity ID.
style map Required
Position and style the element using CSS.
Default:
position: absolute, transform: translate(-50%, -50%)
name string ( Optional )
An optional alternative name displayed below the state badge. Defaults to the entity name if not provided. Set to null to hide.
State badge tooltip. Defaults to the entity name if not provided. Set to null to hide.
tap_action map ( Optional )
Action taken on card tap. See action documentation .
hold_action map ( Optional )
Action taken on card tap and hold. See action documentation .
double_tap_action map ( Optional )
Action taken on card double tap. See action documentation .
This element represents an entity state using an icon.
state-icon
The entity ID to use.
icon string ( Optional )
Overwrites icon.
Icon tooltip. Set to null to hide.
state_color boolean ( Optional , default: true )
Set to true to have icons colored when entity is active.
style string Required
This element represents an entity’s state via text.
state-label
attribute string ( Optional )
If present, the corresponding attribute will be shown, instead of the entity’s state.
prefix string ( Optional )
Text before entity state.
suffix string ( Optional )
Text after entity state.
Label tooltip. Set to null to hide.
This entity creates a button (with arbitrary text) that can be used to perform an action.
action-button
title string Required
Button label.
action string Required
light.turn_on
target map ( Optional )
The target to use for the action.
data map ( Optional )
The data to use for the action.
This element creates a static icon that is not linked to the state of an entity.
icon
icon string Required
Icon to display, for example mdi:home .
entity string ( Optional )
Entity to use for more-info/toggle.
This creates an image element that overlays the background image.
image
Entity to use for state_image and state_filter and also target for actions.
Image tooltip. Set to null to hide.
image string ( Optional )
The image to display.
state_image map ( Optional )
State-based images
filter string ( Optional )
Default: grayscale(100%) when entity state is off . Set to none to remove this.
aspect_ratio string ( Optional , default: 50% )
Forces the height of the image to be a ratio of the width. Valid formats: Height percentage value ( 23% ) or ratio expressed with colon or “x” separator ( 16:9 or 16x9 ). For a ratio, the second element can be omitted and will default to “1” ( 1.78 equals 1.78:1 ).
Much like the Conditional card, this element will let you show its sub-elements based on entity states.
conditional
conditions list Required
List of entity IDs and matching states.
state string ( Optional )
Entity state is equal to this value.*
state_not string ( Optional )
Entity state is unequal to this value.*
One or more elements of any of the listed types to show when conditions are met. See below for an example.
The process for creating and referencing custom elements is the same as for custom cards.
Please see the developer documentation
for more information.
Card name with custom: prefix, for example custom:my-custom-card .
Position and style your elements using CSS . More/other keys are also possible.
Note, the default style for most elements includes translate (-50%, -50%), which means that the coordinates you provide will set the position of the center of the element. Use transform: none to disable this behavior.
style : # Positioning of the element left : 50% top : 50%
Specify a different image to display based on the state of the entity (supports local, web, or media-source:// URLs):
state_image : " on" : /local/bed_light_on.png "off" : https://demo.home-assistant.io/stub_config/bedroom.png "unavailable" : media-source://image_upload/123456789
Specify different CSS filters
state_filter : " on" : brightness(110%) saturate(1.2) "off" : brightness(50%) hue-rotate(45deg)
If the option hold_action is specified, that action will be performed when the entity is clicked and held for half a second or more.
tap_action : action : toggle hold_action : action : perform-action perform_action : light.turn_on data : entity_id : light.bed_light brightness_pct : 100
type : picture-elements image : /local/floorplan.png elements : - type : state-icon tap_action : action : toggle entity : light.ceiling_lights style : top : 47% left : 42% - type : state-icon tap_action : action : toggle entity : light.kitchen_lights style : top : 30% left : 15% - type : state-label entity : sensor.outside_temperature style : top : 82% left : 79% - type : state-label entity : climate.kitchen attribute : current_temperature suffix : " °C" style : top : 33% left : 15% - type : action-button title : Turn lights off style : top : 95% left : 60% action : homeassistant.turn_off target : entity_id : group.all_lights - type : icon icon : mdi:home tap_action : action : navigate navigation_path : /lovelace/0 style : top : 10% left : 10%
type : picture-elements image : /local/floorplan.png elements : # state_image & state_filter - toggle on click - type : image entity : light.living_room tap_action : action : toggle image : /local/living_room.png state_image : " off" : /local/living_room_off.png filter : saturate(.8) state_filter : " on" : brightness(120%) saturate(1.2) style : top : 25% left : 75% width : 15% # Camera, red border, rounded-rectangle - show more-info on click - type : image entity : camera.driveway_camera camera_image : camera.driveway_camera style : top : 5% left : 10% width : 10% border : 2px solid red border-radius : 10% # Single image, state_filter - perform action on click - type : image entity : media_player.living_room tap_action : action : perform-action perform_action : media_player.media_play_pause target : entity_id : media_player.living_room image : /local/television.jpg filter : brightness(5%) state_filter : playing : brightness(100%) style : top : 40% left : 75% width : 5%
type : picture-elements image : /local/House.png elements : # conditionally show TV off button shortcut when dad's away and daughter is home - type : conditional conditions : - entity : sensor.presence_daughter state : " home" - entity : sensor.presence_dad state : " not_home" elements : - type : state-icon entity : switch.tv tap_action : action : toggle style : top : 47% left : 42%
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
