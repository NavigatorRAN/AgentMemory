# Custom templates and macros - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/custom-templates
- Final URL: https://www.home-assistant.io/docs/templating/custom-templates
- Canonical URL: https://www.home-assistant.io/docs/templating/custom-templates/
- Fetched at: 2026-06-28T02:22:50Z
- Content type: text/html; charset=UTF-8

## Description

Share templates across your configuration with a custom_templates folder and macros.

## Extracted Text

On this page
Setting up the folder
Reloading without a restart
Sharing a macro
Importing vs including
Macros that return values
When to use custom templates
Next steps
Still stuck?
Related topics
Related links
When you find yourself writing the same template in two or three places, it is time to save it once and reuse it. Home Assistant has a feature for that: the custom_templates folder. Drop a template file in there, and every automation, script, and template entity in your configuration can call it.
This page is optional. If you are starting out with templates, you can skip it. Come back when you notice yourself copy-pasting the same logic around.
Create a folder called custom_templates inside your Home Assistant configuration directory (the one that holds configuration.yaml ). Inside it, create files with the .jinja extension. The name before the extension is what you will import by.
config/
├── configuration.yaml
├── automations.yaml
└── custom_templates/
└── formatter.jinja
Each file must be under 5 MiB. Home Assistant loads everything in this folder at startup.
When you edit a file in custom_templates , Home Assistant does not pick up the change automatically. You need to tell it to reload in one of two ways:
Call the homeassistant.reload_custom_templates action.
Go to Developer tools > Actions and run the homeassistant.reload_custom_templates action.
Home Assistant does not need a restart for custom template changes.
A macro is a reusable piece of template that takes arguments and produces a result. Macros are perfect for recipes you apply over and over, like formatting an entity in a consistent way.
Define the macro in a file under custom_templates . For example, config/custom_templates/formatter.jinja :
{% macro format_entity(entity_id) %}
{{ state_attr(entity_id, 'friendly_name') }}: {{ states(entity_id) }}
{% endmacro %}
Then, in any template elsewhere in your configuration, import the macro and use it:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% from 'formatter.jinja' import format_entity %}
{{ format_entity('sensor.outdoor_temperature') }}
{{ format_entity('sensor.indoor_temperature') }}
Result Outdoor temperature: 22.5
Indoor temperature: 21.0
If you change the format (say, you want to put the state first), you only update formatter.jinja , and every automation that imports it picks up the new format on the next reload.
Home Assistant supports both of the usual ways to pull in a template file:
{% from 'file.jinja' import thing %} loads a specific macro from a file. Use this when you want to call a macro by name.
{% include 'file.jinja' %} runs the entire file as if its contents were at the current spot. Use this for drop-in content.
For most reuse cases, import is cleaner because it keeps the macro names explicit.
A regular macro produces text as its result. When you call it, you get back whatever the macro writes. That is fine for formatting strings, but sometimes you want a macro that hands back a number, a list, or a yes-or-no answer.
The trick is to define a macro that takes a special argument called returns , then call it through the as_function filter. That makes the macro behave like a normal function call.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% macro macro_is_switch(entity_name, returns) -%}
{% do returns(entity_name.startswith('switch.')) %}
{% endmacro -%}
{% set is_switch = macro_is_switch | as_function -%}
{% set result = "It's a switch!" if is_switch('switch.my_switch')
else "Not a switch!" -%}
{{ result }}
Result It's a switch!
Read that out loud: “define a macro that answers whether an entity ID starts with switch. , then turn it into a function, then use that function inside an if ”. This pattern lets you build up your own library of small utility functions that return actual values.
Reach for the custom_templates folder when:
You have a formatting snippet you repeat across notifications, dashboards, or template entities.
You have a calculation (like a complicated condition check) that shows up in many automations.
You want your own library of helper macros that do specific things.
For one-off templates, this is overkill. Write the template inline where you need it.
Review the template functions reference for existing filters and functions that might already do what you need.
See as_function for details on macros that return values.
For the conceptual basics of templates, see Template syntax and Loops and conditions .
The Home Assistant community is quick to help: join Discord for real-time chat, post on the community forum with your template and expected result, or share on our subreddit /r/homeassistant .
Tip
AI assistants like ChatGPT or Claude can also explain or fix templates when you describe what you want in plain language.
`as_function` filter
Loops and conditions
Jinja2 macros documentation
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
