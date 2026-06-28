---
source_url: "https://www.home-assistant.io/docs/templating/where-to-use"
final_url: "https://www.home-assistant.io/docs/templating/where-to-use"
canonical_url: "https://www.home-assistant.io/docs/templating/where-to-use/"
source_handle: "web:www-home-assistant-io:6c3886267d7c"
source_section: "docs-templating"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4d92f70bccc92233f816acd6eedba3a49c66f085db28427886b3d453b0177e50"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Where to use templates - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/where-to-use
- Final URL: https://www.home-assistant.io/docs/templating/where-to-use
- Canonical URL: https://www.home-assistant.io/docs/templating/where-to-use/
- Fetched at: 2026-06-28T02:23:20Z
- Content type: text/html; charset=UTF-8

## Description

Learn the places in Home Assistant where you can use templates.

## Extracted Text

On this page
Automation and script actions
Automation conditions
Automation triggers
Template entities
Notifications
REST and command-line sensors
MQTT
Processing incoming data
Nested JSON
JSON arrays
When the data is not JSON
Testing an incoming-data template
Dashboards
Not everywhere
Next steps
Related topics
Once you know what templates are, the next question is usually “where do I actually put one?”. You’ll reach for a template when you write a notification with live sensor values, trigger an automation based on the current state of your home, or build a dashboard number from several entities at once. Templates show up in a lot of places in Home Assistant, and this page walks through the most common ones so you can recognize each spot when you meet it.
You don’t need to memorize this. Come back when you’re building something and need to remember which field accepts a template.
Most actions accept templates for their data values. You can use them to compose messages, pick targets, or tailor behavior based on the current state of your home.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] - alias: "Goodnight message"
triggers:
- trigger: time
at: "23:00:00"
actions:
- action: notify.send_message
target:
entity_id: notify.my_device
data:
message: >
Goodnight.
{{ states('sensor.front_door') | capitalize }} front door, and
{{ states.light | selectattr('state', 'eq', 'on') | list | count }}
lights still on.
Result Goodnight. Closed front door, and 3 lights still on.
A template condition lets an automation decide whether to continue based on any test you can write. The template needs to end up either True or False , and the automation only continues when the answer is True .
Condition Conditions are an optional part of an automation that will prevent an action from firing if they are not met. [Learn more] conditions:
- condition: template
value_template: >
{{ states('sensor.outdoor_temperature') | float(0) < 5 }}
Result True (when the outdoor temperature is below 5°C)
A template trigger fires when the template changes from false to true. This lets you react to conditions that no single entity represents.
Trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] triggers:
- trigger: template
{{
states('sensor.washing_machine_power') | float(0) < 5
and states('sensor.washing_machine_power') | float(0) > 0
}}
Result True (fires when the washing machine power drops between 0 and 5 W)
Note
Limited templates. Some trigger types, and the trigger_variables section of an automation, only support a reduced set of template features. This is called a “limited template”. Most of Home Assistant’s state-reading functions (like states() , state_attr() , and the area/device/label helpers) are not available there. If a template works in the editor but fails in a trigger configuration, the limited-template scope is a likely cause. Check the specific trigger’s documentation for the details.
The Template integration lets you create entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] whose value is computed from other entities. Template sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] , binary sensors, switches, and more are defined entirely with templates.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] template:
- sensor:
- name: "Lights on"
state: >
Result 5 (the sensor reports the number of lights currently on)
The notify actions accept templates for the title, message, and often other fields. This is one of the most popular places to use templates, because it turns fixed notifications into personal, context-aware messages.
Action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called *sequence*. [Learn more] - action: notify.send_message
title: "Door alert"
{{ trigger.to_state.name }} was opened at
{{ now().strftime('%H:%M') }}.
Result Front door was opened at 14:32.
The rest and command_line sensors use templates to pull values out of the raw response they receive. This is how you turn a JSON reply or a command’s output into a usable sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] .
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] sensor:
- platform: rest
resource: https://api.example.com/weather
name: "Outside humidity"
value_template: "{{ value_json.current.humidity }}"
unit_of_measurement: "%"
Result 72 (extracted from the JSON field current.humidity)
The MQTT integration accepts templates for topics, payloads, and value extraction. Incoming payloads are often JSON, so a template extracts the field you need.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] mqtt:
sensor:
- name: "Garden moisture"
state_topic: "garden/sensor/moisture"
value_template: "{{ value_json.moisture }}"
Result 45 (extracted from an MQTT payload like {"moisture": 45})
MQTT uses two kinds of templates. A value template transforms an incoming payload into an entity state or attribute. A command template turns an action into the outgoing payload that the device expects. Both get the usual value and value_json variables, plus three extras specific to MQTT:
entity_id : the entity ID that the template belongs to.
name : the friendly name of the entity.
this : the entity’s own state object (the same one you meet in template entities).
The MQTT integration documentation has the full list of where each template type applies and which fields on each entity support templating.
The REST, MQTT, and command-line examples above use two special variables that need a word of introduction: value and value_json . You will run into them anywhere Home Assistant pulls data from an outside source and hands it to a template for shaping.
When raw data comes in, the template that processes it has these extras available:
value holds the raw incoming data as text. It is always there.
value_json holds the same data parsed as JSON. It is only there when the data actually is valid JSON.
So when an MQTT payload arrives like this:
{ "state" : "ON" , "temperature" : 21.9 , "humidity" : 54 }
You can reach the fields with dot notation:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] Temperature: {{ value_json.temperature }}
Humidity: {{ value_json.humidity }}
State: {{ value_json.state }}
Result Temperature: 21.9
Humidity: 54
State: ON
Real-world payloads often have nested structures. Use square brackets or more dots to reach deeper:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set value_json = {
"sensor": {"type": "air", "id": "12345"},
"values": {"temp": 26.09, "hum": 56.73}
} %}
Sensor ID: {{ value_json['sensor']['id'] }}
Temperature: {{ value_json.values.temp }}
Result Sensor ID: 12345
Temperature: 26.09
Square brackets become necessary when a field name contains characters that dots don’t handle, like a dash or a space.
If the data is a list, index into it with square brackets (starting at zero):
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set value_json = {"primes": [2, 3, 5, 7, 11, 13]} %}
First prime: {{ value_json.primes[0] }}
Third prime: {{ value_json.primes[2] }}
Result First prime: 2
Third prime: 5
If the incoming data is plain text or a number (say, from a command-line sensor that outputs 42.5 ), use value directly:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set value = "42.5" %}
{{ value | float(0) + 1 }}
Result 43.5
Remember: value is always text, so convert with | float(0) or | int(0) before doing math.
The template editor does not know what value_json or value would be in a real incoming payload, because there is no live payload at that moment. To test a template that uses these variables, define them yourself at the top with {% set %} :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set value_json = {"name": "Outside",
"data": {"temp": "24C", "hum": "35%"}} %}
Humidity reading: {{ value_json.data.hum[:-1] }}%
Result Humidity reading: 35%
This lets you work out the right template in the editor, then paste the finished version into your REST sensor, MQTT entity, or command-line sensor without needing the real device to send data.
Most dashboard cards accept templates for titles, names, and other text fields. Support varies by card, and some cards need state_template or similar fields to make templates work. The Markdown card is the most flexible, as its entire content is a template.
Not every field accepts templates. As a rule:
Text, numbers, and lists in automation actions, conditions, triggers, and scripts can usually be templated.
Entity IDs and structural YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] keys usually cannot.
Dashboards support templates in specific fields only. Check the card’s documentation.
If a template is not being evaluated, it is most likely in a field that does not support templating. The Debugging templates page has more tips.
Now that you know where templates live, learn how to write them:
Start with Template syntax for the building blocks.
Read Templates in YAML for the quoting rules that trip everyone up.
Browse Common template patterns for recipes you can copy.
When something does not work, head to Debugging templates .
`states` function
`from_json` function
Templates in yaml
Template integration
Mqtt integration
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
