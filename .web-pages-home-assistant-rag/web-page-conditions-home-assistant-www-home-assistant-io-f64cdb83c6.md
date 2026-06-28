---
source_url: "https://www.home-assistant.io/docs/scripts/conditions"
final_url: "https://www.home-assistant.io/docs/scripts/conditions"
canonical_url: "https://www.home-assistant.io/docs/scripts/conditions/"
source_handle: "web:www-home-assistant-io:f64cdb83c692"
source_section: "docs-scripts"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f24ab5fd71a0da5fc7d945c078200a3117bcbd7fd8af452f5099b12fc8946255"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Conditions - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/scripts/conditions
- Final URL: https://www.home-assistant.io/docs/scripts/conditions
- Canonical URL: https://www.home-assistant.io/docs/scripts/conditions/
- Fetched at: 2026-06-28T02:22:42Z
- Content type: text/html; charset=UTF-8

## Description

Documentation about all available conditions.

## Extracted Text

On this page
Logical conditions
AND condition
OR condition
Mixed AND and OR conditions
NOT condition
Numeric state condition
State condition
Sun condition
Sun elevation condition
Sunset/sunrise condition
Template condition
Template condition shorthand notation
Time condition
Trigger condition
Zone condition
Examples
Disabling a condition
Conditions can be used within a script Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] or automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] to prevent further execution. When a condition evaluates true, the script or automation will be executed. If any other value is returned, the script or automation stops executing. A condition will look at the system at that moment. For example, a condition can test if a switch is currently turned on or off.
Unlike a trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] , which is always or , conditions are and by default - all conditions have to be true.
All conditions support an optional alias .
Test multiple conditions in one condition statement. Passes if all embedded conditions are true.
conditions : - alias : " Paulus home AND temperature below 20" condition : and conditions : - condition : state entity_id : " device_tracker.paulus" state : " home" - condition : numeric_state entity_id : " sensor.temperature" below : 20
If you do not want to combine AND and OR conditions, you can list them sequentially.
The following configuration works the same as the one listed above:
conditions : - condition : state entity_id : " device_tracker.paulus" state : " home" - condition : numeric_state entity_id : " sensor.temperature" below : 20
Currently you need to format your conditions like this to be able to edit them using the automations editor .
The AND condition also has a shorthand form. The following configuration works the same as the ones listed above:
conditions : alias : " Paulus home AND temperature below 20" - and : - condition : state entity_id : " device_tracker.paulus" state : " home" - condition : numeric_state entity_id : " sensor.temperature" below : 20
Test multiple conditions in one condition statement. Passes if any embedded condition is true.
conditions : - alias : " Paulus home OR temperature below 20" condition : or conditions : - condition : state entity_id : " device_tracker.paulus" state : " home" - condition : numeric_state entity_id : " sensor.temperature" below : 20
The OR condition also has a shorthand form. The following configuration works the same as the one listed above:
conditions : - alias : " Paulus home OR temperature below 20" or : - condition : state entity_id : " device_tracker.paulus" state : " home" - condition : numeric_state entity_id : " sensor.temperature" below : 20
Test multiple AND and OR conditions in one condition statement. Passes if any embedded condition is true.
This allows you to mix several AND and OR conditions together.
conditions : - condition : and conditions : - condition : state entity_id : " device_tracker.paulus" state : " home" - condition : or conditions : - condition : state entity_id : sensor.weather_precip state : " rain" - condition : numeric_state entity_id : " sensor.temperature" below : 20
Or in shorthand form:
conditions : - and : - condition : state entity_id : " device_tracker.paulus" state : " home" - or : - condition : state entity_id : sensor.weather_precip state : " rain" - condition : numeric_state entity_id : " sensor.temperature" below : 20
Test multiple conditions in one condition statement. Passes if all embedded conditions are not true.
conditions : - alias : " Paulus not home AND alarm not disarmed" condition : not conditions : - condition : state entity_id : device_tracker.paulus state : " home" - condition : state entity_id : alarm_control_panel.home_alarm state : " disarmed"
The NOT condition also has a shorthand form. The following configuration works the same as the one listed above:
conditions : alias : " Paulus not home AND alarm not disarmed" not : - condition : state entity_id : device_tracker.paulus state : " home" - condition : state entity_id : alarm_control_panel.home_alarm state : disarmed
This type of condition attempts to parse the state of the specified entity or the attribute of an entity as a number, and triggers if the value matches the thresholds (strictly below/above, so equal excluded).
If both below and above are specified, both tests have to pass.
conditions : - alias : " Temperature between 17 and 25 degrees" condition : numeric_state entity_id : sensor.temperature above : 17 below : 25
You can optionally use a value_template to process the value of the state before testing it.
conditions : - condition : numeric_state entity_id : sensor.temperature above : 17 below : 25 # If your sensor value needs to be adjusted value_template : " {{ float(state.state) + 2 }}"
It is also possible to test the condition against multiple entities at once.
The condition will pass if all entities match the thresholds.
conditions : - condition : numeric_state entity_id : - sensor.kitchen_temperature - sensor.living_room_temperature below : 18
Alternatively, the condition can test against a state attribute.
The condition will pass if the attribute value of the entity matches the thresholds.
conditions : - condition : numeric_state entity_id : climate.living_room_thermostat attribute : temperature above : 17 below : 25
Number helpers ( input_number entities), number , sensor , and zone entities
that contain a numeric value, can be used in the above and below
options to make the condition more dynamic.
conditions : - condition : numeric_state entity_id : climate.living_room_thermostat attribute : temperature above : input_number.temperature_threshold_low below : input_number.temperature_threshold_high
Tests if an entity has a specified state.
conditions : - alias : " Paulus not home for an hour and a bit" condition : state entity_id : device_tracker.paulus state : " not_home" # optional: Evaluates to true only if state was this for last X time. for : hours : 1 minutes : 10 seconds : 5
The condition will pass if all entities match the state.
conditions : - condition : state entity_id : - light.kitchen - light.living_room state : " on"
Instead of matching all, it is also possible if one of the entities matches.
In the following example the condition will pass if any entity matches the state.
conditions : - condition : state entity_id : - binary_sensor.motion_sensor_left - binary_sensor.motion_sensor_right match : any state : " on"
Testing if an entity is matching a set of possible conditions;
The condition will pass if the entity matches one of the states given.
conditions : - condition : state entity_id : alarm_control_panel.home state : - " armed_away" - " armed_home"
Or, combine multiple entities with multiple states. In the following example,
both media players need to be either paused or playing for the condition to pass.
conditions : - condition : state entity_id : - media_player.living_room - media_player.kitchen state : - " playing" - " paused"
The condition will pass if the attribute matches the given state.
conditions : - condition : state entity_id : climate.living_room_thermostat attribute : fan_mode state : " auto"
Just like the main state, the state option accepts a list of possible values
when matching an attribute, and the condition passes if the attribute matches
any value in the list. If the attribute value is itself a list, wrap it in
another list so the whole list is treated as a single value to match. The
following condition passes only when the fan_modes attribute equals exactly
["auto", "low"] .
conditions : - condition : state entity_id : climate.living_room_thermostat attribute : fan_modes state : - - " auto" - " low"
Finally, the state option accepts helper entities (also known as input_*
entities). The condition will pass if the state of the entity matches the state
of the given helper entity.
conditions : - condition : state entity_id : alarm_control_panel.home state : input_select.guest_mode
Note
The for option only works with a single, fixed state on the entity’s main
state. You cannot combine for with an attribute , a list of states, or a
state that references a helper entity.
You can also use templates in the for option.
conditions : - condition : state entity_id : device_tracker.paulus state : " home" for : minutes : " {{ states('input_number.lock_min')|int }}" seconds : " {{ states('input_number.lock_sec')|int }}"
The for template(s) will be evaluated when the condition is tested.
Sun state condition
The sun state can be used to test if the sun has set or risen.
conditions : - alias : " Sun up" condition : state # 'day' condition: from sunrise until sunset entity_id : sun.sun state : " above_horizon"
conditions : - alias : " Sun down" condition : state # from sunset until sunrise entity_id : sun.sun state : " below_horizon"
The sun elevation can be used to test if the sun has set or risen, it is dusk, or it is night when a trigger occurs.
For an in-depth explanation of sun elevation, see sun elevation trigger .
conditions : - condition : and # 'twilight' condition: dusk and dawn, in typical locations conditions : - condition : template value_template : " {{ state_attr('sun.sun', 'elevation') < 0 }}" - condition : template value_template : " {{ state_attr('sun.sun', 'elevation') > -6 }}"
conditions : condition : template # 'night' condition: from dusk to dawn, in typical locations value_template : " {{ state_attr('sun.sun', 'elevation') < -6 }}"
The sun condition can also test if the sun has already set or risen when a trigger occurs. The before and after keys can only be set to sunset or sunrise . They have a corresponding optional offset value ( before_offset , after_offset ) that can be added, similar to the sun trigger .
Note that if only before key is used, the condition will be true from midnight until sunrise/sunset. If only after key is used, the condition will be true from sunset/sunrise until midnight . If both before: sunrise and after: sunset keys are used, the condition will be true from midnight until sunrise and from sunset until midnight . If both after: sunrise and before: sunset keys are used, the condition will be true from sunrise until sunset.
Tip
The sunset/sunrise conditions do not work in locations inside the polar circles, and also not in locations with a highly skewed local time zone. In those cases it is advised to use conditions evaluating the solar elevation instead of the before/after sunset/sunrise conditions.
This is an example of 1 hour offset before sunset:
conditions : - condition : sun after : sunset after_offset : " -01:00:00"
This is ‘when dark’ - equivalent to a state condition on sun.sun of below_horizon :
conditions : - condition : sun after : sunset before : sunrise
This is ‘when light’ - equivalent to a state condition on sun.sun of above_horizon :
conditions : - condition : sun after : sunrise before : sunset
A visual timeline is provided below, showing an example of when these conditions are true. In this chart, sunrise is at 6:00, and sunset is at 18:00 (6:00 PM). The green areas of the chart indicate when the specified conditions are true.
The template condition tests if the given template renders a value equal to true. This is achieved by having the template result in a true boolean expression or by having the template render True .
conditions : - alias : " Iphone battery above 50%" condition : template value_template : " {{ (state_attr('device_tracker.iphone', 'battery_level')|int) > 50 }}"
Within an automation, template conditions also have access to the trigger variable as described here .
The template condition has a shorthand notation that can be used to make your scripts and automations shorter.
For example:
conditions : " {{ (state_attr('device_tracker.iphone', 'battery_level')|int) > 50 }}"
Or in a list of conditions, allowing to use existing conditions as described in this
chapter and one or more shorthand template conditions
conditions : - " {{ (state_attr('device_tracker.iphone', 'battery_level')|int) > 50 }}" - condition : state entity_id : alarm_control_panel.home state : armed_away - " {{ is_state('device_tracker.iphone', 'away') }}"
This shorthand notation can be used everywhere in Home Assistant where
conditions are accepted. For example, in and , or
and not conditions:
conditions : - condition : or conditions : - " {{ is_state('device_tracker.iphone', 'away') }}" - condition : numeric_state entity_id : " sensor.temperature" below : 20
It’s also supported in the repeat action’s while or until option, or in a choose action’s conditions option:
- while : " {{ is_state('sensor.mode', 'Home') and repeat.index < 10 }}" sequence : - ...
- choose : - conditions : " {{ is_state('sensor.mode', 'Home') and repeat.index < 10 }}" sequence : - ...
It’s also supported in script or automation condition actions:
- condition : " {{ is_state('device_tracker.iphone', 'away') }}"
The time condition can test if it is after a specified time, before a specified time or if it is a certain day of the week.
conditions : - alias : " Time 15~02" condition : time # At least one of the following is required. after : " 15:00:00" before : " 02:00:00" weekday : - mon - wed - fri
Valid values for weekday are mon , tue , wed , thu , fri , sat , sun .
Note that if only before key is used, the condition will be true from midnight until the specified time.
If only after key is used, the condition will be true from the specified time until midnight .
Time condition windows can span across the midnight threshold if both after and before keys are used. In the example above, the condition window is from 3pm to 2am.
The after times are inclusive while before are exclusive. In the example above, if the time was at 3pm (15:00:00) then it meets the after time condition. If the time was at 2am (2:00:00), it would fail the condition because it will only be valid up to 1:59:59.
A better weekday condition could be by using the Workday Binary Sensor .
For the after and before options a time helper ( input_datetime entity), a time entity, or another sensor entity containing a timestamp with the “timestamp” device class, can be used instead.
conditions : - alias : " Example referencing a time helper" condition : time after : input_datetime.house_silent_hours_start before : input_datetime.house_silent_hours_end - alias : " Example referencing a time entity" before : time.dnd_start - alias : " Example referencing another sensor" after : sensor.groceries_delivery_time
Note that the time condition only takes the time into account. If
a referenced sensor or helper entity contains a timestamp with a date, the
date part is fully ignored.
The trigger condition can test if an automation was triggered by a certain trigger, identified by the trigger’s id .
conditions : - condition : trigger id : event_trigger
For a trigger identified by its index, both a string and integer is allowed:
conditions : - condition : trigger id : " 0"
conditions : - condition : trigger id : 0
It is possible to give a list of triggers:
conditions : - condition : trigger id : - event_1_trigger - event_2_trigger
Zone conditions test if an entity is in a certain zone. For zone automation to work, you need to have set up a device tracker platform that supports reporting GPS coordinates.
conditions : - alias : " Paulus at home" condition : zone entity_id : device_tracker.paulus zone : zone.home
The condition will pass if all entities are in the specified zone.
conditions : - condition : zone entity_id : - device_tracker.frenck - device_tracker.daphne zone : zone.home
Testing if an entity is matching a set of possible zones;
The condition will pass if the entity is in one of the zones.
conditions : - condition : zone entity_id : device_tracker.paulus state : - zone.home - zone.work
Or, combine multiple entities with multiple zones. In the following example,
both entities need to be either in the home or the work zone for the condition
to pass.
conditions : condition : zone entity_id : - device_tracker.frenck - device_tracker.daphne state : - zone.home - zone.work
conditions : - condition : numeric_state entity_id : sun.sun value_template : " {{ state.attributes.elevation }}" below : 1 - condition : state entity_id : light.living_room state : " off" - condition : time before : " 23:00:00" after : " 14:00:00" - condition : state entity_id : script.light_turned_off_5min state : " off"
Every individual condition can be disabled, without removing it.
To do so, add enabled: false to the condition configuration.
This can be useful if you want to temporarily disable a condition, for example,
for testing. A disabled condition will behave as if it were removed.
# This condition will always pass, as it is disabled. conditions : - enabled : false condition : state entity_id : sun.sun state : " above_horizon"
Conditions can also be disabled based on limited templates or blueprint inputs.
blueprint : input : input_boolean : name : Boolean selector : boolean : input_number : name : Number selector : number : min : 0 max : 100 trigger_variables : _enable_number : !input input_number conditions : - condition : state entity_id : sun.sun state : " above_horizon" enabled : !input input_boolean - condition : state entity_id : sun.sun state : " below_horizon" enabled : " {{ _enable_number < 50 }}"
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
Basic automations
Scenes
Blueprints
Scripts
Actions
Conditions
Dashboards
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
