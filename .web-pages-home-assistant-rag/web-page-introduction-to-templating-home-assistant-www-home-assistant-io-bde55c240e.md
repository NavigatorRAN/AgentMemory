# Introduction to templating - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/introduction
- Final URL: https://www.home-assistant.io/docs/templating/introduction
- Canonical URL: https://www.home-assistant.io/docs/templating/introduction/
- Fetched at: 2026-06-28T02:23:00Z
- Content type: text/html; charset=UTF-8

## Description

Understand what templates are, when you need them, and why they are useful in Home Assistant.

## Extracted Text

On this page
You probably don’t need templates
An example
What you can do with templates
How templates are written
Try it yourself
Next steps
Related topics
When you want a notification that reads “It is 22°C in the living room” instead of a fixed message, or an automation that fires only when more than three doors are open, you write a template.
A template is a short snippet of code that Home Assistant runs every time it needs a value. Instead of writing a fixed piece of text or a fixed number, you write instructions for how the value should be computed from your home’s current data.
Home Assistant’s templating is powered by Jinja2 , a widely used template engine in the Python world. That means you can search the web for Jinja2 examples and most of what you find will work in Home Assistant too. We add many of our own functions on top for reading states, finding entities, working with areas, and similar tasks specific to smart homes.
Because templates are code, this is one of the more technical corners of Home Assistant. It is fair to think of it as a light form of programming. You will write small calculations, learn how to handle text and numbers together, and sometimes run into puzzling error messages. Don’t worry, the Debugging templates page has your back when that happens.
Home Assistant is designed to be used through its interface. You can set up devices A device is a model representing a physical or logical unit that contains entities. , build automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] , create dashboards, and manage your whole smart home without ever looking at a configuration file or writing a single line of code. The automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] editor is powerful enough to handle nearly every real-world scenario, and it is getting better with every release.
So before you invest any time on this page: templates are not required to use Home Assistant. If the visual editors do what you need, you are done. Skip this section with a clear conscience.
Templates are for when you want to go further than the interface alone allows. You might reach for them when:
You want a notification to say something dynamic, like “The living room is 22°C and the basement is 14°C”, using live values from your sensors.
You need an automation condition that depends on a calculation across several entities, such as “only run if more than three doors are open”.
You are creating a template entity , a sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] whose value is computed from other entities.
You are processing raw data from a REST API, MQTT topic, or command-line output, and need to reshape it into something Home Assistant can use.
If any of those sound like problems you actually have, keep reading. If not, bookmark this page and come back when you need it.
Imagine you want your phone to tell you the temperature when you come home. A plain notification can only say one thing:
It is warm outside.
With a template, you can include the actual temperature from your outdoor sensor:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] It is {{ states('sensor.outdoor_temperature') }}°C outside.
Home Assistant replaces the bit between {{ and }} with the current value every time the notification is sent. You might get:
Result It is 22.5°C outside.
Later that day, when it is cooler, the same template produces:
Result It is 14.8°C outside.
Once you are comfortable with the basics, templates can help you:
Read your home’s data . Get the state of any entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , its attributes, or information about devices A device is a model representing a physical or logical unit that contains entities. , areas An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. [Learn more] , and floors A floor in Home Assistant is a logical grouping of areas that are meant to match the physical floors in your home. Devices & entities are not assigned to floors but to areas. Floors can be used in automations and scripts as a target for actions. For example, to turn off all the lights on the downstairs floor when you go to bed. [Learn more] .
Make decisions . Show one message when someone is home and a different one when nobody is. Trigger an automation only when several conditions line up.
Do calculations . Average values from multiple sensors, convert units, count how many lights are on, or format a number the way you want to see it.
Shape text . Turn raw values into friendly sentences, lists, or table-like summaries for notifications and dashboards.
Process incoming data . Parse JSON from a web API, clean up messy sensor readings, or extract only the bits you need.
Every template mixes normal text with small pieces of code inside special markers:
{{ ... }} calculates something and inserts the result in the output.
{% ... %} runs logic like if and for without adding to the output.
{# ... #} is a note for yourself that does not appear anywhere.
The Template syntax page explains these markers in detail.
Home Assistant has a built-in Template editor that shows the result of a template while you type. It is the fastest way to experiment.
Open it from Settings > Developer tools > Template . Try pasting this in:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] It is {{ now().strftime("%A") }}, and the time is {{
now().strftime("%H:%M") }}.
Result It is Saturday, and the time is 14:32.
You should see a sentence with the current day of the week and time. Change what is inside the quotes to experiment with different formats, and watch the result update as you type.
Pick up from whichever topic is most useful to you:
Curious where templates show up? Read Where to use templates .
Want to understand the building blocks? Start with Template syntax .
Looking for ready-made examples? Head to Common template patterns .
Stuck on something? The Debugging templates page can help.
Where to use templates
Template syntax
Template functions reference
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
