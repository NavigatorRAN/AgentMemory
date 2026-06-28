# Working with states - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/states
- Final URL: https://www.home-assistant.io/docs/templating/states
- Canonical URL: https://www.home-assistant.io/docs/templating/states/
- Fetched at: 2026-06-28T02:23:07Z
- Content type: text/html; charset=UTF-8

## Description

Read states, attributes, and entity information in your templates.

## Extracted Text

On this page
First, go look at your states
Reading a state
Every state is text
States have a 255 character limit
When an entity is missing or unavailable
Reading an attribute
Checking a state
Getting a list of entities
Finding entities by area, device, label, or floor
The this variable (in template entities)
The trigger variable (in automations)
Next steps
Related topics
Home Assistant keeps track of everything in your home as a collection of entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . Each entity has a state (its current value) and often a few attributes (extra details about it). When you write a template, you are almost always reading state or attributes from one or more entities.
This page explains how to get at that information inside a template.
Before you write a single line of template, spend five minutes at Settings > Developer tools > States . This is where Home Assistant shows you every entity it knows about, its current state, and all of its attributes.
For example, you might see something like this for your outdoor thermometer:
Entity: sensor.outdoor_temperature
State: 22.5
Attributes:
unit_of_measurement: °C
device_class: temperature
friendly_name: Outdoor temperature
This one entity has:
An entity ID ( sensor.outdoor_temperature ). This is the name you use to look it up.
A state ( 22.5 ). That is the entity’s main value.
Several attributes (unit of measurement, device class, friendly name). These are extra pieces of information that go along with the state.
When you write {{ states('sensor.outdoor_temperature') }} , Home Assistant looks up that exact entity ID and gives you back its state. It is that direct.
Tip
Keep the Developer Tools > States page open in a separate browser tab while you write templates. You can search for entities, see exactly what state and attributes they have, and make sure you are spelling entity IDs correctly. It is the single most useful debugging habit you can build.
The states function gives you the current state of an entity. You pass it the entity ID as text.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] The kitchen light is {{ states('light.kitchen') }}.
Result The kitchen light is on.
Here is something that catches everyone at least once. Home Assistant stores every entity state as text. Even when a sensor looks like it’s giving you a number, states() hands it back as a piece of text. So states('sensor.outdoor_temperature') returns the text '22.5' , not the number 22.5 .
Why does that matter? Because you can’t do math with text, and comparing text to a number gives surprising results. For example, '6' < '10' is False (text is sorted alphabetically, so '6' comes after '1' ). If you try to do math directly, you will get an error or the wrong answer.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ states('sensor.outdoor_temperature') | float(0) + 5 }}
Result 27.5
The | float(0) part converts the text to a number. The 0 is a fallback: if the conversion fails (maybe the sensor is offline), the template uses 0 instead of crashing.
Rule of thumb: whenever you do math or number comparisons on a sensor state, add | float(0) or | int(0) first. It is not optional, it is how templates work.
The text stored in an entity’s state can be at most 255 characters long. Home Assistant enforces this limit so the state can fit in the database and dashboards. If your template sensor needs to produce something longer (say, a list of names, a formatted table, or a long paragraph), store it in an attribute instead. Attributes don’t have the same limit.
Home Assistant has two special state values for when things go wrong:
unknown means the entity exists but Home Assistant does not know its value right now.
unavailable means the entity cannot be reached at all. Maybe a device is offline or an integration failed to load.
And if you ask for an entity that does not exist at all, you get the text unknown back as well.
Templates that depend on live values should handle these cases gracefully. Adding a number fallback ( | float(0) ) fixes most math problems. For decisions, use has_value (covered below).
Attributes carry extra details about an entity. A light has attributes for brightness and color. A weather entity has attributes for forecast data. A media player has attributes for the current track.
To read one, use state_attr :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] The kitchen light is at {{ state_attr('light.kitchen', 'brightness') }}.
Result The kitchen light is at 192.
Like with states, if the entity does not exist or the attribute is not set, you get nothing back ( none ). For math, add a fallback:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ state_attr('light.kitchen', 'brightness') | int(0) }}
Result 192
You can find an entity’s attribute names by looking at Developer Tools > States.
You can compare a state with == , but there is a dedicated function that is cleaner and handles missing entities without surprises: is_state .
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ is_state('light.kitchen', 'on') }}
Result True
This reads naturally: “is the state of light.kitchen equal to on ?”. The answer is True or False .
There is a matching function for attributes, is_state_attr :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ is_state_attr('media_player.living_room', 'source', 'Spotify') }}
And has_value checks whether an entity has a usable state at all (not unknown or unavailable ):
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% if has_value('sensor.outdoor_temperature') %}
It is {{ states('sensor.outdoor_temperature') }}°C outside.
{% else %}
The outdoor sensor is unavailable.
{% endif %}
Result It is 22.5°C outside.
Use has_value whenever you want to fall back to a friendly message instead of showing “unavailable” on a dashboard or in a notification.
states.domain gives you every entity in that domain Each integration in Home Assistant has a unique identifier: The domain. It is often shown as the first part (before the dot) of entity IDs. (the first part of an entity ID, like light. or sensor. ). This is how you count, filter, and iterate over groups of entities.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] There are {{ states.light | count }} lights in total.
Result There are 12 lights in total.
Combine it with selectattr to filter the list down to what you care about. selectattr reads as “select entities where this attribute equals this value”:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] Lights that are on:
{% for light in states.light | selectattr('state', 'eq', 'on') %}
- {{ light.name }}
{% endfor %}
Result Lights that are on:
- Kitchen
- Hallway
- Desk
Home Assistant comes with a family of functions for finding entities grouped by how you’ve organized them:
area_entities returns every entity in an area An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. [Learn more] .
device_entities returns every entity tied to a device A device is a model representing a physical or logical unit that contains entities. .
label_entities returns every entity carrying a given label Labels in Home Assistant allow grouping elements irrespective of their physical location or type. Labels can be assigned to areas, devices, entities, automations, scenes, scripts, and helpers. Labels can be used in automations and scripts as a target for actions. Labels can also be used to filter data. [Learn more] .
floor_entities returns every entity on a floor A floor in Home Assistant is a logical grouping of areas that are meant to match the physical floors in your home. Devices & entities are not assigned to floors but to areas. Floors can be used in automations and scripts as a target for actions. For example, to turn off all the lights on the downstairs floor when you go to bed. [Learn more] .
integration_entities returns every entity created by a given integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] .
Each has matching functions for going the other way (for example, area_devices lists the devices in an area). Browse the Areas , Devices , Floors , and Labels categories in the reference for the full set.
Here is how you’d list the bedroom lights that are on:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] Bedroom lights on:
{% for entity in area_entities('bedroom') %}
{% if entity.startswith('light.') and is_state(entity, 'on') %}
- {{ state_attr(entity, 'friendly_name') }}
Result Bedroom lights on:
- Bedroom ceiling
- Bedside lamp
When you write a template that defines a template entity , this refers to the entity itself. That is useful when the entity needs to read its own state or attributes without hardcoding its entity ID.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] template:
- sensor:
- name: "Kitchen helper"
state: "{{ this.attributes.get('counter', 0) + 1 }}"
attributes:
counter: "{{ this.state | int(0) + 1 }}"
Result 1 (the sensor increments its own value each time it updates)
this only exists where Home Assistant knows which entity the template belongs to. That means template entities and some automation contexts, but not the Developer Tools template editor.
When an automation runs, it receives a trigger variable with details about what caused it. The fields depend on the trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] type; the Automation trigger variables page lists them all.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] - trigger: state
entity_id: binary_sensor.front_door
to: "on"
action:
- action: notify.send_message
target:
entity_id: notify.my_device
data:
message: >
{{ trigger.to_state.name }} was opened at
{{ trigger.to_state.last_changed.strftime('%H:%M') }}.
Result Front door was opened at 14:32.
Ready-made examples that combine these tools live on the Common template patterns page.
The full list of state and entity functions is in the template functions reference .
When a template does not give you what you expected, see Debugging templates .
Types and conversion
`states` function
`state_attr` function
`is_state` function
`has_value` function
All state functions
All entity functions
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
