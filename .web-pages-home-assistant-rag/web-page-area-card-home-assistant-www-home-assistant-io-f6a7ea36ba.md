# Area card - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/area
- Final URL: https://www.home-assistant.io/dashboards/area
- Canonical URL: https://www.home-assistant.io/dashboards/area/
- Fetched at: 2026-06-28T02:18:30Z
- Content type: text/html; charset=UTF-8

## Description

The area card gives control of your entities in a specified area.

## Extracted Text

On this page
Adding the area card to a dashboard
Adding buttons to the area card for controlling devices
YAML configuration
Example
Available colors
Related topics
The area card lets you control and monitor an individual area An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. [Learn more] .
Screenshot of the area cards.
All options for this card can be configured via the user interface.
As shown in the screenshot of the area cards, they can display values and buttons of entities and devices that you have assigned the area to, such as:
Buttons for entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] such as fan, light, and switch that are in the area of the card.
The measured value of a sensor, if the sensor is in the area of the card or if the sensor is assigned to the area in Settings > Areas, labels & zones .
The median of the values measured by temperature sensors, if more than one temperature sensor is in the area of the card.
The median of the values measured by humidity sensors, if more than one humidity sensor is in the area of the card.
A motion sensor in the top left of the card, if a motion sensor is in the area of the card.
The camera feed instead of the area picture, if a camera is added to the area An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. [Learn more] of the card.
Note
The device is in an area if you have previously assigned the area to the device .
In the top right of the screen, select the edit button.
If this is your first time editing a dashboard, the Edit dashboard dialog appears.
By editing the dashboard, you are taking over control of this dashboard.
This means that it is no longer automatically updated when new dashboard elements become available.
Once you’ve taken control, you can’t get this specific dashboard back to update automatically. However, you can create a new default dashboard.
To continue, in the dialog, select the three dots menu, then select Take control .
Add a card and customize actions and features to your dashboard.
You can add buttons to the area card that will allow you to control different devices in that area.
Depending on your goal, do one of the following:
Assign the area of the card to the device by following the steps in Assigning an area to a device .
Assign the area of the card to a group of devices by following the steps in Assigning an area to multiple items .
Go to your dashboard and, in the top-right corner, select the button.
In the area card that you have previously created, select Edit .
Expand the Features section and select Add feature > Area controls .
You can also:
Define the Features position by selecting Bottom or Inline .
Customize controls to add a button for each device or entity, for example.
Select the button next to Area controls .
Turn on Customize controls .
Select Controls and then select the entity from the list.
Select Save .
If you want to control only certain devices that are assigned to an area altogether, you can still use an area card. Create a new area and then follow the previous steps using the new area.
The following YAML options are available when you use YAML mode or just prefer to use YAML in the code editor in the UI.
Configuration Variables
Looking for your configuration file?
type string Required
area
area string Required
ID of the area .
color string ( Optional )
Set the color for the icon and the hover/focus state. It accepts color token or hex color code.
display_type string ( Optional , default: picture )
Defines the card’s display style. Options include compact (a minimal layout), icon (shows an area icon), picture (displays an image of the area), or camera (shows the live camera feed).
camera_view string ( Optional , default: auto )
If showing a camera, live will show the live view if stream is enabled.
aspect_ratio string ( Optional , default: 16:9 )
Forces the height of the image to be a ratio of the width. Valid formats: Height percentage value ( 23% ) or ratio expressed with colon or “x” separator ( 16:9 or 16x9 ). For a ratio, the second element can be omitted and will default to “1” ( 1.78 equals 1.78:1 ).
tap_action map ( Optional , default: none )
Action taken on card tap. See action documentation .
image_tap_action map ( Optional )
Action taken on image tap (only available when display_type is icon , picture or camera ). When not configured, image taps use the card’s tap_action . See action documentation .
Default:
more-info for camera display type, none otherwise
alert_classes list ( Optional , default: moisture, motion )
A list of binary sensor device classes which will populate alert icons in the card when the state is on. If the display type is set to compact , only the first alert icon will be displayed.
sensor_classes list ( Optional , default: temperature, humidity )
A list of sensor device classes to display for the area. Most classes (such as temperature, humidity, or pressure) show the median value when multiple sensors are present. Sensors representing cumulative measurements (such as power, energy, gas, or water) show the sum instead.
features list ( Optional )
Additional widgets to control entities in the area. See available features .
features_position string ( Optional , default: bottom )
Position of the features on the area card. Can be bottom or inline . Only the first feature will be displayed when the option is set to inline .
exclude_entities list ( Optional )
A list of entities that will be excluded from the card. It will affect sensor_classes, alert_classes, and features.
Basic example:
type : area area : bedroom
Complex example
type : area area : bedroom display_type : picture tap_action : action : navigate navigation_path : /lovelace/my_bedroom sensor_classes : - temperature - humidity alert_classes : - moisture - motion features : - type : area-controls
The following colors are available to colorize the area card: primary , accent , disabled , red , pink , purple , deep-purple , indigo , blue , light-blue , cyan , teal , green , light-green , lime , yellow , amber , orange , deep-orange , brown , grey , blue-grey , black , white , or any hex color code (for example, #93c47d ).
Card actions
Dashboard cards
Home dashboard
About areas
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
