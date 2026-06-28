# Group - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/group
- Final URL: https://www.home-assistant.io/integrations/group
- Canonical URL: https://www.home-assistant.io/integrations/group/
- Fetched at: 2026-06-28T02:47:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up groups within Home Assistant.

## Extracted Text

On this page
Configuration
Group behavior
Binary sensor, light, and switch groups
Button groups
Cover and valve groups
Event groups
Fan groups
Lock groups
Notify entity groups
Media player groups
Sensor, number, and input_number groups
Managing groups
Group options
Group attributes
YAML configuration
Notify groups
Old style groups
Attributes
List of actions
The Group integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you combine multiple entities into a single entity. Entities that are members of a group can be controlled and monitored as a whole.
This can be useful, for example, in cases where you want to control multiple bulbs in a light fixture as a single light in Home Assistant. You also have the option of hiding the individual member entities in a group.
The following entities can be grouped:
binary sensor (binary sensors)
button (buttons)
cover (covers)
event (events)
fan (fans)
input_number (input_numbers)
light (lights)
lock (locks)
media player (media players)
notify (notifications)
number (numbers)
sensor (sensors)
switch (switches)
valve (valves)
To add the Group helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Group .
Follow the instructions on screen to complete the setup.
Note
Notification entities can only be grouped via the UI.
The older notification actions can only be grouped via YAML configuration.
In short, when any group member entity is on , the group will also be on . A complete overview of how groups behave:
The group state is unavailable if all group members are unavailable .
Otherwise, the group state is unknown if all group members are unknown or unavailable .
Otherwise, the group state is on if at least one group member is on .
Otherwise, the group state is off .
Binary sensor, light, and switch groups allow you set the “All entities” option. When enabled, the group behavior is inverted, and all members of the group have to be on for the group to turn on as well. A complete overview of how groups behave when the “All entities” option is enabled:
Otherwise, the group state is unknown if at least one group member is unknown or unavailable .
Otherwise, the group state is off if at least one group member is off .
Otherwise, the group state is on .
For light groups using HS color mode: When a light group contains two or more lights, whose colors are evenly spaced (180° apart for two, 120° apart for three, and so on), the light group’s average color may default to either 0° (red) or 180° (light blue). This occurs because averaging opposite hues on the color wheel can mathematically result in unexpected colors due to how hue values wrap around. To avoid this, consider using RGB color mode for your lights, or avoid grouping lights with perfectly opposite colors.
The group state is the last time the grouped button was pressed.
Otherwise, the group state is the last time the grouped button was pressed.
In short, when any group member entity is open , the group will also be open . A complete overview of how cover and valve groups behave:
Otherwise, the group state is opening if at least one group member is opening .
Otherwise, the group state is closing if at least one group member is closing .
Otherwise, the group state is open if at least one group member is open .
Otherwise, the group state is closed .
Otherwise, the group state is the last event received from any group member.
In short, when any group member entity is on , the group will also be on . A complete overview of how fan groups behave:
Otherwise, The group state is on if at least one group member is on .
In short, when any group member entity is unlocked , the group will also be unlocked . A complete overview of how lock groups behave:
Otherwise, the group state is jammed if at least one group member is jammed .
Otherwise, the group state is locking if at least one group member is locking .
Otherwise, the group state is unlocking if at least one group member is unlocking .
Otherwise, the group state is locked if all group members are locked .
Otherwise, the group state is unlocked .
Otherwise, the group state is the last notification sent to the group.
Otherwise, the group state is buffering if all group members are buffering .
Otherwise, the group state is idle if all group members are idle .
Otherwise, the group state is paused if all group members are paused .
Otherwise, the group state is playing if all group members are playing .
Otherwise, the group state is on if at least one group member is not off , unavailable or unknown .
The group state is combined / calculated based on type selected to determine the minimum, maximum, latest (last), first available, mean, median, range, product, standard deviation, or sum of the collected states.
Members can be any sensor , number or input_number holding numeric states.
The group state is unavailable if all group members are either unavailable or missing
The configuration variable ignore_non_numeric controls the behavior of the group when the group is not unavailable :
When set to false (the default), the group state is calculated as follows:
if all members are in the state machine and have a numeric state: calculated according to the type
otherwise: set to unknown
When set to true , the group state is calculated as follows:
if at least one member has a numeric state: calculated according to the type
The variable ignore_non_numeric can be combined with the type first_available to always take the first available numeric state from a group.
To edit a group, Settings > Devices & services > Helpers . Find and select the group from the list.
To add or remove entities from an existing group, click on Group options , all the existing entities are listed in the members section where you add and remove entities.
These are the attributes available for a group.
Attribute Data entity_id List of all the entity_id ’s in the group.
Alternatively, this integration can be configured and set up manually via YAML
instead. Here are example of how to configure groups when using the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
Example YAML configuration of a binary sensor group:
# Example configuration.yaml entry binary_sensor : - platform : group name : " Patio Doors" device_class : opening entities : - binary_sensor.door_left_contact - binary_sensor.door_right_contact
Example YAML configuration of a button group:
# Example configuration.yaml entry button : - platform : group name : " Restart all ESPHome devices" entities : - button.device_1_restart - button.device_2_restart
Example YAML configuration of a cover group:
# Example configuration.yaml entry cover : - platform : group name : " Window Covers" entities : - cover.hall_window - cover.living_room_window
Example YAML configuration of an event group:
# Example configuration.yaml entry event : - platform : group name : " Remote events" entities : - event.remote_button_1 - event.remote_button_2 - event.remote_button_3 - event.remote_button_4
Example YAML configuration of a fan group:
# Example configuration.yaml entry fan : - platform : group name : " Downstairs Fans" entities : - fan.lanai_west - fan.lanai_south - fan.lanai_east
Example YAML configuration of a light group:
# Example configuration.yaml entry light : - platform : group name : " Kitchen Lights" entities : - light.kitchen_ceiling_lights - light.kitchen_under_cabinet_lights - light.kitchen_spot_lights - light.pendant_lights
Example YAML configuration of a lock group:
# Example configuration.yaml entry lock : - platform : group name : " House Locks" entities : - lock.front_door - lock.back_door
Example YAML configuration of a media_player group:
# Example configuration.yaml entry media_player : - platform : group entities : - media_player.kitchen_tv - media_player.living_room_tv
Example YAML configuration of a sensor group:
# Example configuration.yaml entry sensor : - platform : group type : mean entities : - sensor.temperature_kitchen - sensor.temperature_hallway
Example YAML configuration of a switch group:
# Example configuration.yaml entry switch : - platform : group entities : - switch.tv - switch.soundbar
Example YAML configuration of a valve group:
# Example configuration.yaml entry valve : - platform : group name : " Garden Valves" entities : - valve.front_garden - valve.back_garden
Configuration Variables
Looking for your configuration file?
entities string | list Required
A list of entities to be included in the group.
name string ( Optional )
The name of the group.
unique_id string ( Optional )
An ID that uniquely identifies this group. If two groups have the same unique ID, Home Assistant will raise an error. Giving the group a unique ID allows the group name, icon and area to be customized via the UI.
all boolean ( Optional , default: false )
Only available for binary_sensor , light and switch groups. Set this to true if the group state should only turn on if all grouped entities are on .
type string Required
Only available for sensor group. The type of sensor: min , max , last , first_available , mean , median , range , product , stdev , or sum .
ignore_non_numeric boolean ( Optional , default: false )
Only available for sensor group. Controls how the state is calculated when group members have non-numeric state .
unit_of_measurement string ( Optional )
Only available for sensor group. Set the unit of measurement for the sensor.
device_class string ( Optional )
Only available for binary-sensor or sensor group. Set the device class according to available options for binary sensors or sensors respectively.
state_class string ( Optional )
Only available for sensor group. Set the state class for the sensor according to available options .
This group is a special case of groups currently only available via YAML configuration.
Notify groups are used to combine multiple notification actions into a single action. This allows you to send notification to multiple devices by performing a single action.
# Example configuration.yaml entry notify : - platform : group name : " My notification group" services : - action : html5 data : target : " macbook" - action : mobile_app_pauluus
name string Required
Setting the parameter name sets the name of the group.
services list Required
A list of all the actions to be included in the group.
action string Required
The name part of an entity ID, e.g., if you use notify.html5 normally, just put html5 . Note that you must put everything in lower case here. Although you might have capitals written in the actual notification actions!
data string ( Optional )
A dictionary containing parameters to add to all notify payloads. This can be anything that is valid to use in a payload, such as data , message , target or title . Parameters specified by the action will override the values configured here.
This group is a special case of groups only available via YAML configuration.
We don’t recommend using these old-style groups anymore. They are still supported, but we recommend using the groups as described above.
Back in the day, Home Assistant used groups to visually groups entities in the Home Assistant UI; it was the only way to tell which entities would show up in a single card on your Dashboard. This is no longer the case, as we now have fantastic UI editors and Dashboarding.
However, the old-style groups are still there in the roots of Home Assistant.
On the one hand, they are more versatile (they can use more entity types right now); but on the other hand, they are also more limited and complicated to use.
The limited use is that these old-style groups are written to be universal, while the new style groups described above are designed to be a full replacement of their members (e.g., a light group, as described above, has all light features). Besides being only available via manual YAML configuration, they also have limited UI support in terms of customizing.
Example old-style groups YAML configuration:
# Example configuration.yaml entry group : kitchen : name : " Kitchen Group" entities : - switch.kitchen_pin_3 climate : name : " Climate Group" entities : - sensor.bedroom_temp - sensor.porch_temp awesome_people : name : " Awesome People" entities : - device_tracker.dad_smith - device_tracker.mom_smith
Name of the group.
entities list Required
A list of entities to group.
Set this to true if the group state should only turn on if all grouped entities are on .
icon string ( Optional )
The icon that shows in the front end.
Old style groups can calculate group state with entities from the following domains:
alert
alarm_control_panel
automation
binary_sensor
calendar
climate
cover
device_tracker
fan
humidifier
input_boolean
light
lock
media_player
person
plant
remote
script
switch
vacuum
water_heater
Platform domains other than these are not supported to be used with old style groups, nor will other domains be supported in the future.
When member entities all have a single on and off state, the group state will be calculated as follows:
Domain on off device_tracker home not_home cover open closed lock unlocked locked person home not_home media_player ok problem
When a group contains entities from domains that have multiple on states or only use on and off , the group state will be on or off .
It is possible to create a group that the system cannot calculate a group state. Groups with entities from unsupported domains will always have an unknown state.
These groups can still be in templates with the expand() function, called using the homeassistant.turn_on and homeassistant.turn_off actions, and so on.
These are the attributes available for an old-style group.
Attribute Data entity_id List of all the entity_id ’s in the group. order Integer representing the order in which the entity was created, starting with 0 . auto Boolean that will always be set to true . Only appears in groups that were created with the set action.
The Group integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload groups ( group.reload )
Reloads the groups from the YAML configuration.
Remove group ( group.remove )
Removes an old-style group.
Set group ( group.set )
Creates or updates an old-style group.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Group helper was introduced in Home Assistant pre 0.7, and it's used by
31% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Binary sensor
Button
Cover
Event
Fan
Helper
Light
Lock
Media player
Notifications
Organization
Sensor
Switch
Valve
Back to top
