# Card naming - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/naming
- Final URL: https://www.home-assistant.io/dashboards/naming
- Canonical URL: https://www.home-assistant.io/dashboards/naming/
- Fetched at: 2026-06-28T02:19:48Z
- Content type: text/html; charset=UTF-8

## Description

Customize how entity names are displayed on dashboard cards.

## Extracted Text

All dashboard cards and badges that use an entity support flexible name configuration. This allows you to display custom text, show contextual information like area or device names, or use the entity name instead of its friendly name.
The name configuration helps you avoid redundant information (like repeating device names on every card) and create more contextual, easier-to-understand dashboards.
Simple string name
The simplest way to set a custom name is to use a string to override the entity’s display name.
name : " My custom name"
Configuration Variables
Looking for your configuration file?
name string ( Optional )
A custom string to display as the name.
Name object
The name can also be configured as an object with a type property to display contextual information about the entity.
Entity name
Displays the entity name instead of the friendly name. The entity name is the specific function or data point the entity represents, without the device or area prefix.
name : type : entity
This is useful when you want to avoid repeating device or area names that are already included in the friendly name.
name map ( Optional )
Name configuration object.
type string Required
Type of name to display. Use entity to show the entity name.
Device name
Displays the name of the device the entity belongs to.
name : type : device
Type of name to display. Use device to show the device name.
Area name
Displays the name of the area the entity is assigned to.
name : type : area
Type of name to display. Use area to show the area name.
Floor name
Displays the name of the floor where the entity’s area is located.
name : type : floor
Type of name to display. Use floor to show the floor name.
Custom text
Displays custom static text using the object syntax. This is useful when combining with other name types in a list.
name : type : text text : " My label"
Type of name to display. Use text to show custom text.
text string Required
The custom text to display.
Combining multiple name parts
You can combine multiple name components by using a list. This allows you to create hybrid names with contextual information. A space is automatically added between each component.
If a name component does not have a value, like when an entity has no area assigned, Home Assistant will automatically skip that component. This means only the components with values will be shown, and you will not see empty spaces or errors in the card name.
name : - type : area - type : device
This example would display something like “Living Room Light Switch”.
name list ( Optional )
A list of names to combine. Each item must be a name object.
Examples
type : tile entity : light.living_room_ceiling_light name : " Ceiling light"
This is the simplest way to set a custom name, overriding the entity’s display name with a static string.
Using entity name to avoid repetition
type : tile entity : sensor.living_room_sensor_temperature name : type : entity
This displays the entity name “Temperature” instead of the full friendly name “Living room sensor Temperature”, avoiding repetition when the card is already grouped by area.
Combining device and area
type : tile entity : media_player.living_room_tv name : - type : area - type : device
This combines the area name with the device name, displaying something like “Living room TV”.
Using custom text with other name types
type : button entity : switch.kitchen_lights name : - type : area - type : text text : " lights"
This would display “Kitchen lights” by combining the area name with custom text.
Related topics
Tile card
Button card
Entities card
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
