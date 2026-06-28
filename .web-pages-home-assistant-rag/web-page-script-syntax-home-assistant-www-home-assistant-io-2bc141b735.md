---
source_url: "https://www.home-assistant.io/docs/scripts"
final_url: "https://www.home-assistant.io/docs/scripts"
canonical_url: "https://www.home-assistant.io/docs/scripts/"
source_handle: "web:www-home-assistant-io:2bc141b73501"
source_section: "docs-scripts"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "12a7da8234d95d8e805b1c586392414a40da48125d7efde1eba8af5bb21b627d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Script syntax - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/scripts
- Final URL: https://www.home-assistant.io/docs/scripts
- Canonical URL: https://www.home-assistant.io/docs/scripts/
- Fetched at: 2026-06-28T02:22:40Z
- Content type: text/html; charset=UTF-8

## Description

How to write Home Assistant scripts in YAML: the available actions, their structure, and how to use them inside automations.

## Extracted Text

On this page
Script syntax
Perform an action
Activate a scene
Variables
Scope of variables
Test a condition
Wait for time to pass (delay)
Wait
Wait for a template
Wait for a trigger
Wait timeout
Wait variable
Fire an event
Raise and consume custom events
Repeat a group of actions
Counted repeat
For each
While loop
Repeat until
Repeat loop variable
If-then
Choose a group of actions
Grouping actions
Parallelizing actions
Stopping a script sequence
Continuing on error
Disabling an action
Respond to a conversation
A script is a sequence of steps that Home Assistant runs from top to bottom whenever you call it. Think of it as a small recipe: “turn on the porch light, wait 30 seconds, then send me a notification”. Once you have written a script, you can run it from a button on your dashboard, from Assist, from inside an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] , or from anywhere else that calls actions.
Scripts and automations are very closely related. The only real difference is that an automation runs by itself when something triggers it, and a script runs when you call it.
When the script runs as part of an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] , the trigger variable is also available. See Available-Trigger-Data .
The script syntax basic structure is a list of key/value maps that contain actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . If a script contains only 1 action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] , the wrapping list can be omitted.
All actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] support an optional alias .
# Example script integration containing script syntax script : example_script : sequence : # This is written using the Script Syntax - alias : " Turn on ceiling light" action : light.turn_on target : entity_id : light.ceiling - alias : " Notify that ceiling light is turned on" action : notify.notify data : message : " Turned on the ceiling light!"
Performing an action can be done in various ways. For all the different possibilities, have a look at the actions page .
- alias : " Bedroom lights on" action : light.turn_on target : entity_id : group.bedroom data : brightness : 100
Scripts may also use a shortcut syntax for activating scenes Scenes capture the states you want certain entities to be. For example, a scene can specify that light A should be turned on and light B should be bright red. [Learn more] instead of calling the scene.turn_on action.
- scene : scene.morning_living_room
The variables action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allows you to set/override variables that will be accessible by templates in action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] after it. See also script variables for how to define variables accessible in the entire script.
- alias : " Set variables" variables : entities : - light.kitchen - light.living_room brightness : 100 - alias : " Control lights" action : light.turn_on target : entity_id : " {{ entities }}" data : brightness : " {{ brightness }}"
Variables can be templated.
- alias : " Set a templated variable" variables : blind_state_message : " The blind is {{ states('cover.blind') }}." - alias : " Notify about the state of the blind" action : notify.send_message target : entity_id : notify.my_device data : message : " {{ blind_state_message }}"
The variables action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] assigns the values to previously defined variables with the same name. If a variable was not previously defined, it is assigned in the top-level (script run) scope.
sequence : # Set the people variable to a default value - variables : people : 0 # Try to increment people if Paulus is home - if : - condition : state entity_id : device_tracker.paulus state : " home" then : - variables : people : " {{ people + 1 }}" paulus_home : true - action : notify.notify data : message : " There are {{ people }} people home" # "There are 1 people home" # Variable value is now updated - action : notify.notify data : message : " There are {{ people }} people home {% if paulus_home is defined %}(including Paulus){% endif %}" # "There are 1 people home (including Paulus)"
While executing a script you can add a condition in the main sequence to stop further execution. When a condition does not return true , the script will stop executing. For documentation on the many different conditions refer to the conditions page .
Note
The condition action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] only stops executing the current sequence block. When it is used inside a repeat action, only the current iteration of the repeat loop will stop. When it is used inside a choose action, only the actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] within that choose will stop.
# If paulus is home, continue to execute the script below these lines - alias : " Check if Paulus is home" condition : state entity_id : device_tracker.paulus state : " home"
condition can also be a list of conditions and execution will then only continue if ALL conditions return true .
- alias : " Check if Paulus ishome AND temperature is below 20" conditions : - condition : state entity_id : " device_tracker.paulus" state : " home" - condition : numeric_state entity_id : " sensor.temperature" below : 20
Delays are useful for temporarily suspending your script and start it at a later moment. We support different syntaxes for a delay as shown below.
# Seconds # Waits 5 seconds - alias : " Wait 5s" delay : 5
# HH:MM # Waits 1 hour - delay : " 01:00"
# HH:MM:SS # Waits 1.5 minutes - delay : " 00:01:30"
# Supports milliseconds, seconds, minutes, hours, days # Can be used in combination, at least one required # When using milliseconds, consider that delay as *at least* X milliseconds. It won´t be exact. # Waits 1 minute - delay : minutes : 1
All forms accept templates.
# Waits however many minutes input_number.minute_delay is set to - delay : " {{ states('input_number.minute_delay') | multiply(60) | int }}"
These actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allow a script to wait for entities in the system to be in a certain state as specified by a template, or some event to happen as expressed by one or more triggers.
This action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] evaluates the template, and if true, the script will continue. If not, then it will wait until it is true.
The template is re-evaluated whenever an entity ID that it references changes state. If you use non-deterministic functions like now() in the template it will not be continuously re-evaluated, but only when an entity ID that is referenced is changed. If you need to periodically re-evaluate the template, reference a sensor from the Time and Date integration that will update minutely or daily.
# Wait until media player is stopped - alias : " Wait until media player is stopped" wait_template : " {{ is_state('media_player.floor', 'stop') }}"
This action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] can use the same triggers that are available in an automation’s trigger section. See Automation Trigger . The script will continue whenever any of the triggers fires. All previously defined trigger variables , variables and script variables are passed to the trigger.
# Wait for a custom event or light to turn on and stay on for 10 sec - alias : " Wait for MY_EVENT or light on" wait_for_trigger : - trigger : event event_type : MY_EVENT id : my_trigger - trigger : state entity_id : light.LIGHT to : " on" for : 10
You can assign an id to each trigger, just like you would do in an automation’s trigger section, but you won’t find it inside the trigger condition, which only lists the main automation triggers. You can however find it in a template as wait.trigger.id :
- if : - condition : template value_template : " {{ wait.trigger.id == 'my_trigger' }}" then : - action : light.turn_on target : entity_id : light.living_room_table
With both types of waits it is possible to set a timeout after which the script will continue its execution if the condition/event is not satisfied. Timeout has the same syntax as delay , and like delay , also accepts templates.
# Wait for sensor to change to 'on' up to 1 minute before continuing to execute. - wait_template : " {{ is_state('binary_sensor.entrance', 'on') }}" timeout : " 00:01:00"
You can also get the script to abort after the timeout by using optional continue_on_timeout: false .
# Wait for IFTTT event or abort after specified timeout. - wait_for_trigger : - trigger : event event_type : ifttt_webhook_received event_data : action : connected_to_network timeout : minutes : " {{ timeout_minutes }}" continue_on_timeout : false
Without continue_on_timeout: false the script will always continue since the default for continue_on_timeout is true .
After each time a wait completes, either because the condition was met, the event happened, or the timeout expired, the variable wait will be created/updated to indicate the result.
Variable Description wait.completed true if the condition was met, false otherwise wait.remaining Timeout remaining, or none if a timeout was not specified wait.trigger Exists only after wait_for_trigger . Contains information about which trigger fired. (See Available-Trigger-Data .) Will be none if no trigger happened before timeout expired
This can be used to take different actions based on whether or not the condition was met, or to use more than one wait sequentially while implementing a single timeout overall.
# Take different actions depending on if condition was met. - wait_template : " {{ is_state('binary_sensor.door', 'on') }}" timeout : 10 - if : - " {{ not wait.completed }}" then : - action : script.door_did_not_open else : - action : script.turn_on target : entity_id : - script.door_did_open - script.play_fanfare # Wait a total of 10 seconds. - wait_template : " {{ is_state('binary_sensor.door_1', 'on') }}" timeout : 10 continue_on_timeout : false - action : switch.turn_on target : entity_id : switch.some_light - wait_for_trigger : - trigger : state entity_id : binary_sensor.door_2 to : " on" for : 2 timeout : " {{ wait.remaining }}" continue_on_timeout : false - action : switch.turn_off target : entity_id : switch.some_light
This action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allows you to fire an event. In the GUI (Graphical User Interface) for actions it is found under “Fire Manual Event”. Events can be used for many things. It could trigger an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] or indicate to another integration that something is happening. For instance, in the below example it is used to create an entry in the Activity panel.
- alias : " Fire LOGBOOK_ENTRY event" event : LOGBOOK_ENTRY event_data : name : Paulus message : is waking up entity_id : device_tracker.paulus domain : light
You can also use event_data to fire an event with custom data. This could be used to pass data to another script awaiting
an event trigger.
The event_data accepts templates.
- event : MY_EVENT event_data : name : myEvent customData : " {{ myCustomVariable }}"
The following automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] example shows how to raise a custom event called event_light_state_changed with entity_id as the event data. The action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] part could be inside a script or an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] .
- alias : " Fire Event" triggers : - trigger : state entity_id : switch.kitchen to : " on" actions : - event : event_light_state_changed event_data : state : " on"
The following automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] example shows how to capture the custom event event_light_state_changed with an Event Automation Trigger , and retrieve corresponding entity_id that was passed as the event trigger data, see Available-Trigger-Data for more details.
- alias : " Capture Event" triggers : - trigger : event event_type : event_light_state_changed actions : - action : notify.notify data : message : " kitchen light is turned {{ trigger.event.data.state }}"
This action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allows you to repeat a sequence of other actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . Nesting is fully supported.
There are three ways to control how many times the sequence will be run.
This form accepts a count value. The value may be specified by a template, in which case
the template is rendered when the repeat step is reached.
script : flash_light : mode : restart sequence : - action : light.turn_on target : entity_id : " light.{{ light }}" - alias : " Cycle light 'count' times" repeat : count : " {{ count|int * 2 - 1 }}" sequence : - delay : 2 - action : light.toggle target : entity_id : " light.{{ light }}" flash_hallway_light : sequence : - alias : " Flash hallway light 3 times" action : script.flash_light data : light : hallway count : 3
This repeat form accepts a list of items to iterate over. The list of items
can be a pre-defined list, or a list created by a template.
The sequence is run for each item in the list, and current item in the
iteration is available as repeat.item .
The following example will turn a list of lights:
repeat : for_each : - " living_room" - " kitchen" - " office" sequence : - action : light.turn_off target : entity_id : " light.{{ repeat.item }}"
Other types are accepted as list items, for example, each item can be a
template, or even a mapping of key/value pairs.
repeat : for_each : - language : English message : Hello World - language : Dutch message : Hallo Wereld sequence : - action : notify.phone data : title : " Message in {{ repeat.item.language }}" message : " {{ repeat.item.message }}!"
This form accepts a list of conditions (see conditions page for available options) that are evaluated before each time the sequence
is run. The sequence will be run as long as the condition(s) evaluate to true.
script : do_something : sequence : - action : script.get_ready_for_something - alias : " Repeat the sequence AS LONG AS the conditions are true" repeat : while : - condition : state entity_id : input_boolean.do_something state : " on" # Don't do it too many times - condition : template value_template : " {{ repeat.index <= 20 }}" sequence : - action : script.something
The while also accepts a shorthand notation of a template condition .
For example:
- repeat : while : " {{ is_state('sensor.mode', 'Home') and repeat.index < 10 }}" sequence : - ...
This form accepts a list of conditions that are evaluated after each time the sequence
is run. Therefore the sequence will always run at least once. The sequence will be run
until the condition(s) evaluate to true.
automation : - triggers : - trigger : state entity_id : binary_sensor.xyz to : " on" conditions : - condition : state entity_id : binary_sensor.something state : " off" actions : - alias : " Repeat the sequence UNTIL the conditions are true" repeat : sequence : # Run command that for some reason doesn't always work - action : shell_command.turn_something_on # Give it time to complete - delay : milliseconds : 200 until : # Did it work? - condition : state entity_id : binary_sensor.something state : " on"
until also accepts a shorthand notation of a template condition .
- repeat : until : " {{ is_state('device_tracker.iphone', 'home') }}" sequence : - ...
A variable named repeat is defined within the repeat action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] , meaning it is available inside sequence , while , and until .
It contains the following fields:
field description first True during the first iteration of the repeat sequence index The iteration number of the loop: 1, 2, 3, … last True during the last iteration of the repeat sequence, which is only valid for counted loops
This action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allows you to conditionally ( if ), based on or more conditions (which are and combined),
run a sequence of actions ( then ) and optionally supports running other sequence when the condition didn’t pass ( else ).
script : - if : - alias : " If no one is home" condition : state entity_id : zone.home state : 0 then : - alias : " Then start cleaning already!" action : vacuum.start target : area_id : living_room # The `else` is fully optional and can be omitted else : - action : notify.notify data : message : " Skipped cleaning, someone is home!"
This action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] supports nesting, however, if you find yourself using nested if-then
actions in the else part, you may want to consider using
choose instead.
This action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allows you to select a sequence of other actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] from a list of sequences.
Nesting is fully supported.
Each sequence is paired with a list of conditions. (See the conditions page for available options and how multiple conditions are handled.) The first sequence whose conditions are all true will be run.
An optional default sequence can be included which will be run only if none of the sequences from the list are run.
An optional alias can be added to each of the sequences, excluding the default sequence.
The choose action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] can be used like an “if/then/elseif/then…/else” statement. The first conditions / sequence pair is like the “if/then”, and can be used just by itself. Or additional pairs can be added, each of which is like an “elif/then”. And lastly, a default can be added, which would be like the “else.”
# Example with "if", "elif" and "else" automation : - triggers : - trigger : state entity_id : input_boolean.simulate to : " on" mode : restart actions : - choose : # IF morning - conditions : - condition : template value_template : " {{ now().hour < 9 }}" sequence : - action : script.sim_morning # ELIF day - conditions : - condition : template value_template : " {{ now().hour < 18 }}" sequence : - action : light.turn_off target : entity_id : light.living_room - action : script.sim_day # ELSE night default : - action : light.turn_off target : entity_id : light.kitchen - delay : minutes : " {{ range(1, 11)|random }}" - action : light.turn_off target : entity_id : all
conditions also accepts a shorthand notation of a template condition .
automation : - triggers : - trigger : state entity_id : input_select.home_mode actions : - choose : - conditions : > {{ trigger.to_state.state == 'Home' and is_state('binary_sensor.all_clear', 'on') }} sequence : - action : script.arrive_home data : ok : true - conditions : > {{ trigger.to_state.state == 'Home' and is_state('binary_sensor.all_clear', 'off') }} sequence : - action : script.turn_on target : entity_id : script.flash_lights - action : script.arrive_home data : ok : false - conditions : " {{ trigger.to_state.state == 'Away' }}" sequence : - action : script.left_home
More choose can be used together. This is the case of an IF-IF.
The following example shows how a single automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] can control entities that aren’t related to each other but have in common the same trigger.
When the sun goes below the horizon, the porch and garden lights must turn on. If someone is watching the TV in the living room, there is a high chance that someone is in that room, therefore the living room lights have to turn on too. The same concept applies to the studio room.
# Example with "if" and "if" automation : - alias : " Turn lights on when the sun gets dim and if some room is occupied" triggers : - trigger : numeric_state entity_id : sun.sun attribute : elevation below : 4 actions : # This must always apply - action : light.turn_on data : brightness : 255 color_temp : 366 target : entity_id : - light.porch - light.garden # IF a entity is ON - choose : - conditions : - condition : state entity_id : binary_sensor.livingroom_tv state : " on" sequence : - action : light.turn_on data : brightness : 255 color_temp : 366 target : entity_id : light.livingroom # IF another entity not related to the previous, is ON - choose : - conditions : - condition : state entity_id : binary_sensor.studio_pc state : " on" sequence : - action : light.turn_on data : brightness : 255 color_temp : 366 target : entity_id : light.studio
The sequence action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allows you to group multiple actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more]
together. Each action will be executed in order, meaning the next action will
only be executed after the previous action has been completed.
Grouping actions in a sequence can be useful when you want to be able to
collapse related groups in the user interface for organizational purposes.
Combined with the parallel action, it can also be
used to run multiple groups of actions in a sequence in parallel.
In the example below, two separate groups of actions are executed in sequence,
one for turning on devices, the other for sending notifications. Each group of
actions is executed in order, this includes the actions in each group and the
groups themselves. In total, four actions are executed, one after the other.
automation : - triggers : - trigger : state entity_id : binary_sensor.motion to : " on" actions : - alias : " Turn on devices" sequence : - action : light.turn_on target : entity_id : light.ceiling - action : siren.turn_on target : entity_id : siren.noise_maker - alias : " Send notifications" sequence : - action : notify.person1 data : message : " The motion sensor was triggered!" - action : notify.person2 data : message : " Oh oh, someone triggered the motion sensor..."
By default, all sequences of actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] in Home Assistant run sequentially. This
means the next action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] is started after the current action has been completed.
This is not always needed, for example, if the sequence of actions doesn’t rely
on each other and order doesn’t matter. For those cases, the parallel action
can be used to run the actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] in the sequence in parallel, meaning all
the actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] are started at the same time.
The following example shows sending messages out at the same time (in parallel):
automation : - triggers : - trigger : state entity_id : binary_sensor.motion to : " on" actions : - parallel : - action : notify.person1 data : message : " These messages are sent at the same time!" - action : notify.person2 data : message : " These messages are sent at the same time!"
It is also possible to run a group of actions sequentially inside the parallel
actions. The example below demonstrates that:
script : example_script : sequence : - parallel : - sequence : - wait_for_trigger : - trigger : state entity_id : binary_sensor.motion to : " on" - action : notify.person1 data : message : " This message awaited the motion trigger" - action : notify.person2 data : message : " I am sent immediately and do not await the above action!"
Warning
Running actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] in parallel can be helpful in many cases, but use it with
caution and only if you need it.
There are some caveats (see below) when using parallel actions.
While it sounds attractive to parallelize, most of the time, just the regular
sequential actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] will work just fine.
Some of the caveats of running actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] in parallel:
There is no order guarantee. The actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] will be started in parallel, but
there is no guarantee that they will be completed in the same order.
If one action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] fails or errors, the other actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] will keep running until
they too have finished or errored.
Variables created/modified in one parallelized action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] can conflict with variables
from another parallelized action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . Make sure to give them distinct names to prevent that.
It is possible to halt a script sequence at any point and return script responses
using the stop action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] .
The stop action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] takes a text as input explaining the reason for halting the
sequence. This text will be logged and shows up in the automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] and
script traces.
stop can be useful to halt a script halfway through a sequence when,
for example, a condition is not met.
- stop : " Stop running the rest of the sequence"
To return a response from a script, use the response_variable option. This
option expects the name of the variable that contains the data to return. The
response data must contains a mapping of key/value pairs.
- stop : " Stop running the rest of the sequence" response_variable : " my_response_variable"
There is also an error option, to indicate we are stopping because of
an unexpected error. It stops the sequence as well, but marks the automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more]
or script as failed to run.
- stop : " Well, that was unexpected!" error : true
By default, a sequence of actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] will be halted when one of the actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] in
that sequence encounters an error. The automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] or script will be halted,
an error is logged, and the automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] or script run is marked as errored.
Sometimes these errors are expected, for example, because you know the action
you perform can be problematic at times, and it doesn’t matter if it fails.
You can set continue_on_error for those cases on such an action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] .
The continue_on_error is available on all actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] and is set to
false . You can set it to true if you’d like to continue the action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more]
sequence, regardless of whether that action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] encounters an error.
The example below shows the continue_on_error set on the first action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . If
it encounters an error; it will continue to the next action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] .
- alias : " If this one fails..." continue_on_error : true action : notify.super_unreliable_service_provider data : message : " I'm going to error out..." - alias : " This one will still run!" action : persistent_notification.create data : title : " Hi there!" message : " I'm fine..."
Please note that continue_on_error will not suppress/ignore misconfiguration
or errors that Home Assistant does not handle.
Every individual action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] in a sequence can be disabled, without removing it.
To do so, add enabled: false to the action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . For example:
# Example script with a disabled action script : example_script : sequence : # This action will not run, as it is disabled. # The message will not be sent. - enabled : false alias : " Notify that the ceiling light is being turned on" action : notify.notify data : message : " Turning on the ceiling light!" # This action will run, as it is not disabled - alias : " Turn on the ceiling light" action : light.turn_on target : entity_id : light.ceiling
Actions can also be disabled based on limited templates or blueprint inputs.
blueprint : input : input_boolean : name : Boolean selector : boolean : actions : - delay : 0:35 enabled : !input input_boolean
The set_conversation_response script action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] allows returning a custom response
when an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] is triggered by a conversation engine, for example a voice
assistant. The conversation response can be templated.
# Example of a templated conversation response resulting in "Testing 123" - variables : my_var : " 123" - set_conversation_response : " {{ 'Testing ' ~ my_var }}"
The response is handed to the conversation engine when the automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] finishes. If
the set_conversation_response is executed multiple times, the most recent
response will be handed to the conversation engine. To clear the response, set it
to None :
# Example of a clearing a conversation response set_conversation_response : ~
If the automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] was not triggered by a conversation engine, the response
will not be used by anything.
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
