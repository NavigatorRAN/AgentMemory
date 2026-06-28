# Card features - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/dashboards/features
- Final URL: https://www.home-assistant.io/dashboards/features
- Canonical URL: https://www.home-assistant.io/dashboards/features/
- Fetched at: 2026-06-28T02:19:06Z
- Content type: text/html; charset=UTF-8

## Description

Add quick controls to your dashboard cards, such as a brightness slider for a light, a fan speed selector, or a temperature setpoint.

## Extracted Text

Some dashboard cards have support for features. These widgets add quick controls to the card. Supported features depend on the card and entity capabilities. Multiple features can be added to a single card.
Screenshot of tile cards with features.
Features can be enabled on the following cards:
Humidifier
Thermostat
Tile
Area
Customizing features
Edit the card and open the Features section.
To add an additional feature to your card, select Add feature .
Info : The available options for a feature depend on the entity and type of feature.
For example, not all entities have a toggle or a counter-action .
On tile cards, you can adjust the feature position.
Under Features > Feature position , select Bottom or Inline :
Reordering features:
Some features of the tile card, such as the presets or the HVAC modes of a thermostat, can show buttons.
To reorder the buttons, enable Customize and drag and drop the buttons into position.
If you don’t like the buttons, you can replace them by a Dropdown instead.
Under Style , select the Dropdown option.
Alarm modes
Widget that displays buttons to arm and disarm an alarm .
Screenshot of the tile card with alarm modes feature
features : - type : " alarm-modes" modes : - armed_home - armed_away - armed_night - armed_vacation - armed_custom_bypass - disarmed
Configuration Variables
Looking for your configuration file?
type string Required
alarm-modes
modes list ( Optional )
List of modes to show on the card. The list can contain armed_home , armed_away , armed_night , armed_vacation , armed_custom_bypass , and disarmed . If not set, all modes supported by the entity are shown.
Bar gauge
Widget that displays the state of a numeric sensor as a horizontal bar.
Screenshots of the tile card with the bar gauge feature
features : - type : " bar-gauge" min : 0 max : 100
bar-gauge
min integer ( Optional , default: 0 )
Minimum value for the gauge range.
max integer ( Optional , default: 100 )
Maximum value for the gauge range.
Button
Widget that displays buttons to control button , input_button , scene , or script .
Screenshot of the tile card with the button feature
features : - type : " button" action_name : " Press" data : variable : some_value
button
action_name string ( Optional )
Text inside the button.
data map ( Optional )
Additional data to be passed when the action is executed. Only applies to script.
Climate fan modes
Widget that displays buttons or icons to control the fan mode for a climate device.
Screenshot of the tile card with the climate fan modes feature
features : - type : " climate-fan-modes" style : " icons" fan_modes : - " off" - low - medium - high
climate-fan-modes
style string ( Optional , default: dropdown )
How the fan modes should be displayed. It can be either dropdown or icons .
fan_modes list ( Optional )
List of fan modes to show on the card. The list can contain on , off , auto , low , medium , high , middle , focus and diffuse or any other custom fan mode. If not set, all fan modes supported by the entity are shown.
Climate HVAC modes
Widget that displays buttons to control the HVAC mode for a climate .
Screenshot of the tile card with the climate HVAC modes feature
features : - type : " climate-hvac-modes" hvac_modes : - auto - heat_cool - heat - cool - dry - fan_only - " off"
climate-hvac-modes
style string ( Optional , default: icons )
How the modes should be displayed. It can be either dropdown or icons .
hvac_modes list ( Optional )
List of modes to show on the card. The list can contain auto , heat_cool , heat , cool , dry , fan_only , and off . If not set, all HVAC modes supported by the entity are shown.
Climate preset modes
Widget that displays buttons or icons to control the preset mode for a climate .
Screenshot of the tile card with the climate preset modes feature
features : - type : " climate-preset-modes" style : " icons" preset_modes : - home - eco
climate-preset-modes
How the preset modes should be displayed. It can be either dropdown or icons .
preset_modes list ( Optional )
List of preset modes to show on the card. The list can contain eco , away , boost , comfort , home , sleep , and activity or any other custom preset mode. If not set, all preset modes supported by the entity are shown.
Climate swing modes
Widget that displays a dropdown or icons to control the swing mode for a climate .
Screenshot of the tile card with the climate swing modes feature
features : - type : " climate-swing-modes" style : " icons" swing_modes : - " on" - " off"
climate-swing-modes
How the swing modes should be displayed. It can be either dropdown or icons .
swing_modes list ( Optional )
List of swing modes to show on the card. The list can contain on , off , or any other custom swing mode supported by your climate device. If not set, all swing modes supported by the entity are shown.
Climate swing horizontal modes
Widget that displays a dropdown or icons to control the horizontal swing mode for a climate .
Screenshot of the tile card with the climate swing horizontal modes feature
features : - type : " climate-swing-horizontal-modes" style : " dropdown" swing_horizontal_modes : - " on" - " off"
climate-swing-horizontal-modes
How the horizontal swing modes should be displayed. It can be either dropdown or icons .
swing_horizontal_modes list ( Optional )
List of horizontal swing modes to show on the card. The list can contain on , off , or any other custom horizontal swing mode supported by your climate device. If not set, all horizontal swing modes supported by the entity are shown.
Counter actions
Widget that displays buttons to increment, decrement, and reset a counter .
Screenshot of the tile card with counter actions feature
features : - type : " counter-actions" actions : - increment - decrement - reset
counter-actions
actions list ( Optional )
List of actions to show on the card. The list can contain increment , decrement , and reset . If not set, all actions supported by the entity are shown.
Cover open/close
Widget that displays buttons to open, close, or stop a cover .
Screenshot of the tile card with cover open/close feature
features : - type : " cover-open-close"
cover-open-close
Cover position
Widget that displays a slider to control the position for a cover .
Screenshot of the tile card with the cover position feature
features : - type : " cover-position"
cover-position
Cover favorite positions
Widget that displays a dropdown with favorite positions for a cover .
You can customize favorites in a cover’s More info dialog. To edit them, press and hold a favorite.
Screenshot of the tile card with the cover favorite positions feature
features : - type : " cover-position-favorite"
cover-position-favorite
Cover tilt
Screenshot of the tile card with cover tilt feature
features : - type : " cover-tilt"
cover-tilt
Cover favorite tilt positions
Widget that displays a dropdown with favorite tilt positions for a cover .
Screenshot of the tile card with the cover favorite tilt positions feature
features : - type : " cover-tilt-favorite"
cover-tilt-favorite
Cover tilt position
Widget that displays a slider to control the tilt position for a cover .
Screenshot of the tile card with the cover tilt position feature
features : - type : " cover-tilt-position"
cover-tilt-position
Date
Widget that displays a button to select a date using the date picker dialog for the date , datetime , and input datetime entities.
Screenshot of the tile card with the date feature
features : - type : " date-set"
date-set
Fan direction
Widget that displays controls to change direction for a fan .
Screenshot of the tile card with the fan direction feature
features : - type : " fan-direction"
fan-direction
Fan oscillate
Widget that displays controls to change oscillation state for a fan .
Screenshot of the tile card with the fan oscillate feature
features : - type : " fan-oscillate"
fan-oscillate
Fan preset modes
Widget that displays buttons or icons to control the preset mode for a fan .
Screenshot of the tile card with the fan preset modes feature
features : - type : " fan-preset-modes" style : " icons" preset_modes : - auto - smart - sleep - ' on'
fan-preset-modes
List of preset modes to show on the card. The list can contain any supported preset modes. If not set, all preset modes supported by the entity are shown.
Fan speed
Widget that displays speed controls for a fan .
Screenshot of the tile card with fan speed feature
features : - type : " fan-speed"
fan-speed
Humidifier modes
Widget that displays buttons or icons to control the mode for a humidifier .
Screenshot of the tile card with the humidifier modes feature
features : - type : " humidifier-modes" style : " icons" modes : - home - eco
humidifier-modes
List of modes to show on the card. The list can contain normal , eco , away , boost , comfort , home , sleep , auto , and baby or any other custom mode. If not set, all modes supported by the entity are shown.
Humidifier toggle
Widget that displays buttons to turn on or off a humidifier .
Screenshot of the tile card with the humidifier toggle feature
features : - type : " humidifier-toggle"
humidifier-toggle
Lawn mower commands
Widget that displays buttons to control a lawn mower .
Screenshot of the tile card with the lawn mower commands feature
features : - type : " lawn-mower-commands" commands : - start_pause - dock
lawn-mower-commands
commands list Required
List of commands to show on the card. The list can contain start_pause and dock .
Light brightness
Widget that displays a slider to select the brightness for a light .
Screenshot of the tile card with light brightness feature
features : - type : " light-brightness"
light-brightness
Light color favorites
Widget that displays a set of buttons to select a color for a light from a list of favorites.
You can customize favorites in a light’s more-info dialog. The feature shows as many favorites as fit in the available width, following the favorites’ sort order.
Screenshot of the tile card with the light color favorites feature
features : - type : " light-color-favorites"
light-color-favorites
Light color temp
Widget that displays a slider to select the color temperature for a light .
Screenshot of the tile card with the light color temperature feature
features : - type : " light-color-temp"
light-color-temp
Lock commands
Widget that displays buttons to lock or unlock a lock .
Screenshot of the tile card with the lock commands feature
features : - type : " lock-commands"
lock-commands
Lock open door
Widget that displays a button to open a door .
Screenshot of the tile card with the lock open door feature
features : - type : " lock-open-door"
lock-open-door
Media player playback controls
Widget that displays playback controls for a media player .
Screenshot of the tile card with media player playback feature
features : - type : " media-player-playback" controls : - media_play_pause - media_previous_track - media_next_track - volume_mute
media-player-playback
controls list ( Optional )
List of controls to show on the card. The list can contain turn_on , turn_off , media_play , media_pause , media_play_pause , media_stop , media_previous_track , media_next_track , volume_down , volume_up , volume_mute , shuffle , and repeat . When not specified, the controls are determined automatically based on the capabilities of the media player entity.
Media player sound mode
Widget that displays a dropdown to select the sound mode for a media player .
Screenshot of the tile card with media player sound mode feature
features : - type : " media-player-sound-mode" sound_modes : - " movie" - " music" - " game"
media-player-sound-mode
sound_modes list ( Optional )
List of sound modes to show in the dropdown. Use this to filter or reorder the available sound modes. The sound mode names depend on your device and can be found in the sound_mode_list attribute of the entity in Settings > Developer tools > States . When not specified, all available sound modes are shown.
Media player source
Widget that displays a dropdown to select the source for a media player .
Screenshot of the tile card with media player source feature
features : - type : " media-player-source" sources : - " AirPlay" - " SHIELD" - " NET RADIO"
media-player-source
sources list ( Optional )
List of sources to show in the dropdown. Use this to filter or reorder the available sources. The source names depend on your device. When not specified, all available sources are shown.
Media player volume buttons
Widget that displays buttons to control the volume for a media player .
Screenshot of the tile card with media player volume buttons feature
features : - type : " media-player-volume-buttons"
media-player-volume-buttons
step integer ( Optional , default: 5 )
The step size of the volume. The default is 5%.
show_mute_button boolean ( Optional , default: true )
Show a button to mute or unmute the volume.
Media player volume slider
Widget that displays a slider to control the volume for a media player .
Screenshot of the tile card with media player volume slider feature
features : - type : " media-player-volume-slider"
media-player-volume-slider
Numeric input
Widget that displays a slider or buttons to set the value for a number or input number .
Screenshot of the tile card with the numeric input feature
features : - type : " numeric-input" style : " buttons"
numeric-input
style string ( Optional , default: slider )
Which style of control to display. It can be either buttons or slider .
Select options
Widget that displays a dropdown to select an option for a select or input select .
Screenshot of the tile card with the select options feature
features : - type : " select-options"
select-options
options list ( Optional )
List of options to show on the card. If not specified, all available options from the entity are displayed.
Target humidity
Widget that displays a slider to select the target humidity for a humidifier .
Screenshot of the tile card with the target humidity feature
features : - type : " target-humidity"
target-humidity
Target temperature
Widget that displays buttons to select the target temperature for a climate or a water heater .
Screenshot of the tile card with the target temperature feature
features : - type : " target-temperature"
target-temperature
Toggle
Widget that displays a button to toggle a switch or input boolean entity on or off.
Screenshot of the tile card with the toggle feature
features : - type : " toggle"
toggle
Trend graph
Widget that displays a trend of the history for a numeric sensor .
Screenshot of the tile card with the trend graph feature
features : - type : " trend-graph" hours_to_show : 24 detail : true
trend-graph
hours_to_show integer ( Optional , default: 24 )
Hours to show in graph. Minimum is 1 hour. Big values can result in delayed rendering, especially if the selected entities have a lot of state changes.
detail boolean ( Optional , default: true )
Show more detail in the graph. When enabled, samples to 1 point per 5 pixels. When disabled, samples to 1 point per hour using mean values for a smoother graph.
Note
The hours_to_show option controls the time range of historical data shown in the graph. The amount of history available depends on the Recorder’s purge_keep_days setting. By default, the Recorder purges data older than 10 days. See the Recorder integration documentation for more information.
Update actions
Widget that displays actions to install or skip an update .
Screenshot of the tile card with update actions feature
features : - type : " update-actions" backup : " ask"
update-actions
backup list ( Optional , default: ask )
Whether a backup should be done before updating. The value can be ask , yes , or no . ask will open a dialog to ask if a backup should be done.
Vacuum commands
Widget that displays buttons to control a vacuum .
Screenshot of the tile card with vacuum commands feature
features : - type : " vacuum-commands" commands : - start_pause - stop - clean_spot - locate - return_home
vacuum-commands
List of commands to show on the card. The list can contain start_pause , stop , clean_spot , locate , and return_home .
Valve open/close
Widget that displays buttons to open, close, or stop a valve .
Screenshot of the tile card with valve open/close feature
features : - type : " valve-open-close"
valve-open-close
Valve position
Widget that displays a slider to control the position for a valve .
Screenshot of the tile card with the valve position feature
features : - type : " valve-position"
valve-position
Valve favorite positions
Widget that displays a dropdown with favorite positions for a valve .
You can customize favorites in a valve’s More info dialog. To edit them, press and hold a favorite.
Screenshot of the tile card with the valve favorite positions feature
features : - type : " valve-position-favorite"
valve-position-favorite
Water heater operation modes
Widget that displays buttons to control the operation mode of a water heater .
Screenshot of the tile card with the water heater operation modes feature
features : - type : " water-heater-operation-modes" operation_modes : - electric - gas - heat_pump - eco - performance - high_demand - " off"
water-heater-operation-modes
operation_modes list ( Optional )
List of modes to show on the card. The list can contain electric , gas , heat_pump , eco , performance , high_demand , and off . If not set, all operation modes supported by the entity are shown.
Area control
Widget that displays buttons to control different types of entities in your area. You can control all entities of a specific domain or select individual entities.
Screenshot of the area card with the area controls feature
features : - type : " area-controls" controls : - light - fan - switch - entity_id : light.kitchen_counter
area-controls
List of controls to show on the card. The list can contain domain names like light , fan , and switch , or mappings that specify a particular entity by using the entity_id key, as shown in the example above. If not set, the default set of controls supported in the area is shown.
Temperature forecast
Widget that displays a bar chart of the upcoming high and low temperatures for a weather entity. When the forecast type is set to hourly, a filled curve is shown instead. By default, the bars use a temperature-aware gradient with cool blues for the lowest values and warm reds for the highest values.
Screenshot of the tile card with the temperature forecast feature
features : - type : " temperature-forecast" forecast_type : daily days_to_show : 7
temperature-forecast
forecast_type string ( Optional )
The forecast resolution to display. The value can be daily , twice_daily , or hourly . When not specified, the best resolution supported by the entity is used, in this order: daily , twice_daily , hourly .
days_to_show integer ( Optional , default: 7 )
Number of days to show in the chart. Used when forecast_type is daily or twice_daily .
Number of hours to show in the chart. Used when forecast_type is hourly .
color string ( Optional )
Color to use for the bars or curve. Accepts any Home Assistant color token or CSS color value. When not specified, a temperature-aware gradient is used.
show_labels boolean ( Optional , default: true )
Show day or hour labels under the chart.
Precipitation forecast
Widget that displays a bar chart of the upcoming precipitation for a weather entity. You can choose between showing the precipitation amount or the precipitation probability. Empty slots are shown as a small dot to keep the timeline easy to read.
Screenshot of the tile card with the precipitation forecast feature
features : - type : " precipitation-forecast" forecast_type : daily days_to_show : 7 precipitation_type : amount
precipitation-forecast
precipitation_type string ( Optional , default: amount )
What to display on the chart. The value can be amount to show the precipitation amount, or probability to show the chance of precipitation.
Color to use for the bars. Accepts any Home Assistant color token or CSS color value. Defaults to the rainy weather state color.
Related topics
Humidifier card
Thermostat card
Tile card
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
