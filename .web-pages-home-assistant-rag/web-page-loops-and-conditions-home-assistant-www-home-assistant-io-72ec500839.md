# Loops and conditions - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/loops-and-conditions
- Final URL: https://www.home-assistant.io/docs/templating/loops-and-conditions
- Canonical URL: https://www.home-assistant.io/docs/templating/loops-and-conditions/
- Fetched at: 2026-06-28T02:23:02Z
- Content type: text/html; charset=UTF-8

## Description

Make decisions and repeat work in your templates with if, for, and set.

## Extracted Text

On this page
Conditions with if
Multiple paths with elif
Inline if for one-liners
Loops with for
Filtering with if inside a for
Knowing where you are: the loop variable
Variables with set
A common gotcha: variables and loops
Breaking out of loops early
The do statement
Next steps
Related topics
So far, the templates we’ve looked at have been straightforward: read a value, show it, maybe do a small calculation. But the moment your template needs to decide something (“is it cold outside?”) or go through a list of things (“show me every light that is on”), you need a couple more tools.
That is what this page is about. We will cover two ideas that work together to make templates much more useful:
A condition is a question with a yes-or-no answer that decides what happens next. “Is the front door open?” “Is the temperature below zero?”
A loop is a way to do the same thing once for each item in a list. “For every light in the house, show its name and state.”
Both live inside {% ... %} markers, because they run logic without adding anything to the output by themselves. And both will feel familiar if you’ve ever written a shopping list (“if I’m out of milk, add it to the list”) or followed a recipe (“for each onion, chop it finely”).
The if statement runs the text inside it only when its condition is true. When the condition is false, that text is skipped.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% if is_state('sun.sun', 'above_horizon') %}
The sun is up.
{% else %}
The sun is down.
{% endif %}
Result The sun is up.
Read that out loud: “If the sun is above the horizon, show ‘The sun is up’. Otherwise, show ‘The sun is down’.” That is exactly what the template does.
Every if must be closed with {% endif %} . The {% else %} part is optional but often useful.
When you have more than two outcomes, use {% elif %} (“else if”) to chain conditions together. Home Assistant checks them in order and runs the first one that is true.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set temp = states('sensor.outdoor_temperature') | float(0) %}
{% if temp < 0 %}
Freezing.
{% elif temp < 15 %}
Cold.
{% elif temp < 25 %}
Comfortable.
Warm.
Result Comfortable.
You can add as many elif branches as you need.
If you only need to pick between two values, you can write the if on one line. This is often handier inside {{ ... }} than writing a whole if/else block.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set temp = 22 %}
It is {{ 'warm' if temp > 20 else 'cool' }}.
Result It is warm.
Read it left to right: “warm, if the temperature is over 20, otherwise cool”. Natural English.
A for loop repeats whatever is inside it once for each item in a list. The word right after for is a name you pick; each time the loop runs, it holds the current item.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% for light in states.light %}
{{ light.name }}: {{ light.state }}
{% endfor %}
Result Kitchen: on
Living Room: off
Bedroom: off
In plain English: “for each light in the list of lights, show its name and state”. The name light is only a label; you could call it x or item or thingy and it would still work.
Every for must be closed with {% endfor %} .
You can tell a for loop to skip items that don’t match a condition by adding if at the end:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] Lights that are on:
{% for light in states.light if light.state == 'on' %}
- {{ light.name }}
Result Lights that are on:
- Kitchen
- Hallway
That reads as: “for each light in the list of lights, where its state is ‘on’, show a bullet with the name”. Items that don’t match are skipped.
Inside a loop, templates give you a special variable called loop that tells you where you are. These are the fields you’ll use most:
loop.first : True on the first time through, False otherwise.
loop.last : True on the last time through.
loop.index : the current position, starting at 1.
loop.index0 : the current position, starting at 0 (handy if you’re used to programming).
loop.length : the total number of items.
That last-item check is useful when you want to format a list neatly:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% for person in states.person %}
{{ loop.index }}. {{ person.name }}{% if not loop.last %},{% endif %}
Result 1. Frenck,
2. Paulus,
3. Zack
The comma is added for every item except the last one.
Templates can get long, and typing the same thing twice makes them harder to read. set lets you give a value a name so you can reuse it.
{% set unit = state_attr('sensor.outdoor_temperature',
'unit_of_measurement') %}
It is {{ temp | round(1) }} {{ unit }} outside.
Result It is 22.5 °C outside.
Now temp and unit can be used anywhere in the template. If the name of the sensor changes, you only need to update it once.
Here is something that catches everyone at least once. A variable changed inside a loop does not stick around after the loop ends.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set count = 0 %}
{% set count = count + 1 %}
{{ count }}
Result 0
You’d think count would end up at 3 (or however many lights are on), but it doesn’t. The set count = count + 1 inside the loop creates a brand new count each time, one that only exists inside that loop iteration. The outer count never changes.
The fix is to use a namespace . Think of a namespace as a small box that holds values. Changes to what’s inside the box persist, because you’re updating the box, not replacing it.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set ns = namespace(count=0) %}
{% set ns.count = ns.count + 1 %}
{{ ns.count }}
Result 3
This looks weird the first time, but it becomes natural quickly. Whenever you need to count something or build up a result inside a loop, reach for namespace .
Sometimes you want a loop to stop before reaching the end of the list. Home Assistant has two extra statements for that:
{% break %} stops the loop right away.
{% continue %} skips to the next item without finishing the current one.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {# Show the first three lights that are on #}
{% set ns = namespace(shown=0) %}
{% for light in states.light %}
{% if light.state != 'on' %}
{% continue %}
{% if ns.shown >= 3 %}
{% break %}
{{ light.name }}
{% set ns.shown = ns.shown + 1 %}
Result Kitchen
Hallway
Desk
This one skips lights that are off (with continue ), and stops entirely once three have been shown (with break ).
You may see {% do %} mentioned in Jinja documentation elsewhere. It runs an expression without printing anything, which in plain Jinja is useful for things like {% do items.append(value) %} to mutate a list.
Home Assistant’s template environment is sandboxed. Mutation methods like .append() , .pop() , and .update() are blocked for safety, so {% do %} is rarely needed in Home Assistant templates. To build up a list or counter across loop iterations, use a namespace with {% set %} instead.
For the full list of filters and tests you can use inside if conditions, see the template functions reference .
Common counting and aggregation patterns live on the Common template patterns page.
When using these statements inside YAML, keep the Templates in YAML page handy for quoting rules.
`namespace` function
`range` function
`iif` function
Common template patterns
Template syntax
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
Loops and conditions
Templates in YAML
Working with states
Types and conversion
Dates and times
Python methods
Common patterns
Debugging templates
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
