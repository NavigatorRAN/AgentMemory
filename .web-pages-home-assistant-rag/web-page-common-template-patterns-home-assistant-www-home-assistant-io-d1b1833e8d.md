# Common template patterns - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/patterns
- Final URL: https://www.home-assistant.io/docs/templating/patterns
- Canonical URL: https://www.home-assistant.io/docs/templating/patterns/
- Fetched at: 2026-06-28T02:23:04Z
- Content type: text/html; charset=UTF-8

## Description

Cookbook-style recipes for the things you'll actually want to do with templates.

## Extracted Text

On this page
Counting entities
Finding the highest or lowest value
Safe numbers from a sensor
Building a sentence from a list of names
Picking the right word: pluralization
Time differences
Formatting timestamps
Summing values across sensors
Parsing JSON
Handling missing values
Finding entities by device class
Aggregating entities by label
Which entity changed most recently
Hold-last-value (ignore intermittent dropouts)
Latch: keep a condition on until another clears it
Loop over a dictionary
Data navigation cheat sheet
Next steps
Still stuck?
Related topics
Templates are most useful when you can reach for an example that already does what you need. This page collects recipes for the situations that come up again and again: counting things, summarizing data, building nice-sounding sentences, and dealing with values that might be missing.
Each recipe explains what it does, shows you a working template, and links to the reference pages for the functions it uses. Copy the template you need, swap in your own entity IDs, and adjust the wording.
Counting is one of the most common things you do with templates. “How many lights are on?” “How many windows are open?” These templates follow the same shape every time: list the entities, filter them, count the result.
Tip
If all you need is a count on a dashboard, a Group helper can gather the entities and its state shows how many are active. No template needed.
Count how many lights are on:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ states.light | selectattr('state', 'eq', 'on') | list | count }}
Result 3
Read the template left to right: take every light, keep only the ones whose state is on , turn that into a list, count the items in the list.
Count how many doors are open:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{
states.binary_sensor
| selectattr('attributes.device_class', 'eq', 'door')
| selectattr('state', 'eq', 'on')
| list | count
}}
Result 2
Here the filter is stricter. First keep only binary sensors whose device class is door , then only the ones that are on (binary sensors that represent doors report on when the door is open).
See selectattr , list , and count .
When you have several sensors of the same kind, you often want to pick out the extreme. The warmest room. The coldest fridge. The lowest battery. The heaviest power draw.
A Group helper can pick the minimum, maximum, or mean from a group of sensors and expose it as a regular sensor. No template needed if you only need the value.
The lowest battery:
states.sensor
| selectattr('attributes.device_class', 'eq', 'battery')
| selectattr('entity_id', 'has_value')
| map(attribute='state')
| map('float')
| min
| round(0)
}}%
Result 18%
We gather all battery sensors, use has_value to remove any that are unknown or unavailable , convert their states to numbers, then min picks the smallest. The | float conversion is important because sensor states are text, and comparing text alphabetically gives wrong results ( "9" would beat "23" because "9" comes after "2" ).
The warmest room (with the room name):
The previous example gives you the value but not which sensor it came from. When you need both, loop through the sensors and track the winner in a namespace :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set temps = states.sensor
| selectattr('attributes.device_class', 'eq', 'temperature')
| list %}
{% set ns = namespace(warmest=temps[0]) %}
{% for sensor in temps %}
{% if sensor.state | float > ns.warmest.state | float %}
{% set ns.warmest = sensor %}
{% endif %}
{% endfor %}
{{ ns.warmest.name }}: {{ ns.warmest.state }}°C
Result Kitchen: 23.5°C
Same filtering as before, but instead of extracting the values and losing track of which entity they belong to, we keep the full entity reference. The loop compares each sensor’s state as a number and remembers the winner. At the end, we can show both the name and the value.
See also map and namespace .
This one deserves its own section because it comes up constantly. Sensors return their state as text, even when the content looks like a number. If you try to do math on that text directly, you get errors. The fix is always the same: convert with a fallback.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set temp = states('sensor.outdoor_temperature') | float(0) %}
{{ temp | round(1) }}°C
Result 22.5°C
Use float(0) for decimals and int(0) for whole numbers. The 0 inside the parentheses is the fallback value: if the sensor is offline or reports something that cannot be converted to a number, the template uses 0 instead of crashing.
Pick a fallback value that makes sense for your situation. For a temperature, 0 might be misleading. For a counter, 0 is fine. For a power draw, 0 is accurate. Think about what should happen when things go wrong.
When you’re sending a notification, writing “Kitchen, Hallway, Desk” looks robotic. “Kitchen, Hallway, and Desk are on.” reads much better. Here is a template that does that formatting with a proper Oxford comma:
All lights that are on, in one sentence:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set lights = states.light
| map(attribute='name') | list %}
{% if lights | count == 0 %}
No lights are on.
{% elif lights | count == 1 %}
{{ lights[0] }} is on.
{% elif lights | count == 2 %}
{{ lights[0] }} and {{ lights[1] }} are on.
{% else %}
{{ lights[:-1] | join(', ') }}, and {{ lights[-1] }} are on.
Result Kitchen, Hallway, and Desk are on.
The template handles three cases: nothing, exactly one thing, or more than one. The tricky part is lights[:-1] which means “all items except the last”, and lights[-1] which means “the last item”. That lets us put “and” before the final name.
See join and map .
“1 door is open” and “3 doors are open” both need to sound right. Templates handle this with a small inline if .
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set count = states.binary_sensor
| selectattr('state', 'eq', 'on') | list | count %}
{{ count }} door{{ 's' if count != 1 }}
{{- ' is' if count == 1 else ' are' }} open.
Result 2 doors are open.
Two small tricks there: {{ 's' if count != 1 }} adds an s when the count is not 1 (so “doors” instead of “door”), and {{ 'is' if count == 1 else 'are' }} picks the right verb.
Home Assistant records when each state last changed, and you can reach that timestamp from any state in a template. That opens up “how long ago” questions.
How long ago did the front door change?
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] The front door changed {{
time_since(states.binary_sensor.front_door.last_changed)
}} ago.
Result The front door changed 15 minutes ago.
time_since produces nice human-readable text like “15 minutes” or “2 hours”.
Has it been more than 10 minutes?
(now() - states.binary_sensor.front_door.last_changed)
.total_seconds() > 600
Result True
now() gives you the current moment. Subtracting two moments gives you the duration between them. .total_seconds() turns that duration into a number of seconds, and 600 is ten minutes. This pattern is handy for conditions like “only notify me if the door has been open for more than 10 minutes”.
See now and time_since .
Humans read dates and times in all sorts of ways. Templates use strftime (the standard date-formatting tool) to turn a timestamp into whichever shape you want.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ now().strftime('%A %B %-d at %H:%M') }}
Result Saturday April 4 at 14:30
The mysterious characters ( %A , %B , %H , %M ) are format codes. Each one stands for a piece of the date or time. You can mix them freely with plain text.
Common codes:
%H:%M for 24-hour time ( 14:30 ).
%I:%M %p for 12-hour time with AM/PM ( 02:30 PM ).
%A for the full weekday name ( Saturday ).
%B for the full month name ( April ).
%Y-%m-%d for ISO-style dates ( 2026-04-04 ).
The Python documentation has the full list of format codes if you need something unusual.
When you have several sensors measuring the same thing, summing them gives you a household total. Total power draw, total water usage, total number of people home.
A Group helper with a sum type adds up its members and exposes the result as a sensor. For energy specifically, the Energy dashboard handles totals automatically.
Total power draw across all power sensors:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ states.sensor
| selectattr('attributes.device_class', 'eq', 'power')
| map(attribute='state') | map('float') | sum | round(1) }} W
Result 427.3 W
The steps: keep only power sensors, skip offline ones, pull out their states, convert to numbers, add them up, round the total. See sum .
REST sensors, MQTT topics, and command-line sensors often return their data as JSON. from_json turns JSON text into something you can read with dots and brackets.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set data = '{"temp": 22.5, "humidity": 60}' | from_json %}
Temperature: {{ data.temp }}°C
Humidity: {{ data.humidity }}%
Result Temperature: 22.5°C
Humidity: 60%
In real use, you’d pass a variable (like value from an MQTT payload) instead of a hardcoded piece of text.
Home Assistant entities can go missing, go offline, or report unknown . Templates that don’t handle these cases produce noisy output or outright errors. Add a safety net.
With default :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ states('sensor.might_not_exist') | default('not available') }}
Result not available
The default filter replaces a missing value with one you choose.
With has_value :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% if has_value('sensor.outdoor_temperature') %}
{{ states('sensor.outdoor_temperature') }}°C
Temperature is not available.
Use has_value when you want a completely different branch for missing data, not only a replacement word.
The device class tells Home Assistant what kind of thing a sensor measures: temperature, humidity, battery, power, door, motion, and many others. Filtering by device class is the most reliable way to pick out “all the X sensors” without listing them by name.
On dashboards, a grid of Tile cards shows individual entities cleanly. Templates are the right tool when you need the result as text inside an automation or notification.
All temperature sensors in the house:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% for sensor in states.sensor
| selectattr('entity_id', 'has_value') %}
{{ sensor.name }}: {{ sensor.state }}°C
Result Living room: 22.5°C
Kitchen: 23.5°C
Bedroom: 20.1°C
All open doors and windows:
| selectattr('attributes.device_class', 'in', ['door', 'window'])
| map(attribute='name') | join(', ')
Result Front door, Kitchen window
The pattern is always the same: take a list of entities, keep only those with the device class you care about, drop the offline ones, then do whatever you need with the remaining list. Swap temperature for humidity , battery , power , or any other device class to cover a different kind of sensor.
All temperature sensors on a specific floor:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set floor_sensors = floor_entities('first_floor') %}
{% for entity in floor_sensors %}
{% if entity.startswith('sensor.')
and is_state_attr(entity, 'device_class', 'temperature') %}
{{ state_attr(entity, 'friendly_name') }}: {{ states(entity) }}°C
This combines floor_entities with a device-class check. Use area_entities or label_entities in the same shape when you want to filter by area or label instead.
Labels Labels in Home Assistant allow grouping elements irrespective of their physical location or type. Labels can be assigned to areas, devices, entities, automations, scenes, scripts, and helpers. Labels can be used in automations and scripts as a target for actions. Labels can also be used to filter data. [Learn more] let you group entities in ways that don’t match your area/floor structure. A classic use is collecting everything you want to control together, like all TRVs or all radiators in a “Heating Zone”.
Any radiator calling for heat (boiler demand signal):
label_entities('Heating Zone')
| select('is_state_attr', 'hvac_action', 'heating')
| list | count > 0
This template returns True whenever at least one climate entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] with the Heating Zone label has its hvac_action attribute set to heating . Drop this into a template binary sensor with device_class: heat and you have a boiler demand signal. Add it as a template trigger and you can turn the boiler on exactly when heat is needed.
When you have a group of similar sensors (doors, motion, windows), you sometimes want to know which one was active last. Every state tracks a last_changed timestamp, so you can sort by it.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set doors = states.binary_sensor
{% set latest = doors | max(attribute='last_changed') %}
{{ latest.name }} changed {{ time_since(latest.last_changed) }} ago.
Result Front door changed 3 minutes ago.
A sensor that goes unknown or unavailable for a moment can wreck your automations. A trigger-based template sensor lets you freeze the value during dropouts so downstream templates see a stable number.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] template:
- triggers:
- trigger: state
entity_id: sensor.outdoor_temperature
not_to:
- unknown
- unavailable
sensor:
- name: "Outdoor temperature (held)"
unique_id: outdoor_temperature_held
state: "{{ states('sensor.outdoor_temperature') }}"
device_class: temperature
state_class: measurement
unit_of_measurement: "°C"
Result 22.5 (even when the original sensor briefly goes unavailable)
The trigger uses not_to so the sensor only updates when the source reports a real value. Between updates, the held sensor keeps whatever it had last. Pair this with a long-term alarm on the original sensor if you want to be notified about extended outages.
Sometimes a condition needs to “latch” on: once it becomes true, it stays true until a different condition clears it. Heating control with hysteresis is a common example. Turn the heater on when the temperature drops below 18°, keep it on until the temperature rises above 20°.
For heating specifically, the Generic thermostat integration has hysteresis built in. For a generic two-threshold switch, see the Threshold helper .
states('sensor.temperature') | float(20) < 18
or (this.state == 'on'
and states('sensor.temperature') | float(20) < 20)
Reading it aloud: “the heater is on if the temperature is below 18, OR if the heater is already on AND the temperature is still below 20”. Put this in a template binary sensor; the this.state reference reads the binary sensor’s own previous value, creating the latching behavior.
Dictionaries come from JSON responses, entity attributes, action responses, and many other places. Iterate through one with .items() :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set data = {"temperature": 22.5, "humidity": 54, "pressure": 1013} %}
{% for key, value in data.items() %}
{{ key }}: {{ value }}
Result temperature: 22.5
humidity: 54
pressure: 1013
To list all attributes of an entity, call .items() on its attributes :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% for name, value in states.sensor.outdoor_temperature.attributes.items() %}
{{ name }}: {{ value }}
Result unit_of_measurement: °C
friendly_name: Outdoor temperature
Templates read data using three tools: dots, brackets, and iteration. Here are the common shapes you will run into.
Attribute with a dot:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ states.sensor.outdoor_temperature.state }}
Result 22.5
Dictionary key with a bracket:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set data = {"temp": 22.5, "unit": "°C"} %}
{{ data['temp'] }}{{ data['unit'] }}
List item by position (starting at 0):
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set sources = ["Spotify", "Bluetooth", "TV"] %}
First: {{ sources[0] }}
Last: {{ sources[-1] }}
Result First: Spotify
Last: TV
Nested access:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set payload = {"sensor": {"readings": [22.5, 23.0, 22.8]}} %}
First reading: {{ payload['sensor']['readings'][0] }}
Via dots: {{ payload.sensor.readings[0] }}
Result First reading: 22.5
Via dots: 22.5
List of dicts (common in action responses):
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set events = [
{"name": "Meeting", "start": "09:00"},
{"name": "Lunch", "start": "12:00"}
] %}
{% for event in events %}
{{ event.start }}: {{ event.name }}
Result 09:00: Meeting
12:00: Lunch
When you don’t know the shape of your data, pipe it through tojson in the template editor. That gives you a JSON view of exactly what you’re working with.
If you need to understand a pattern better, look up its functions in the template functions reference .
When a template does not work, see Debugging templates .
The Home Assistant community is quick to help: join Discord for real-time chat, post on the community forum with your template and expected result, or share on our subreddit . The forum has thousands of community templates for all kinds of situations.
AI assistants like ChatGPT or Claude can also explain or fix templates when you describe what you want in plain language.
Types and conversion
`selectattr` filter
`rejectattr` filter
`map` filter
`namespace` function
`from_json` filter
Debugging templates
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
Voice assistants
Organization
Home energy management
Templating
Introduction
Where to use templates
Template syntax
Loops and conditions
Templates in YAML
Working with states
Dates and times
Python methods
Common patterns
Error messages
Custom templates and macros
Tutorial: Low battery alerts
Tutorial: Average temperature
Template functions reference
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
