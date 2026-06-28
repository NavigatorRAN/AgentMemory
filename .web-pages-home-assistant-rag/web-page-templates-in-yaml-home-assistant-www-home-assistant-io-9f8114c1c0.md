---
source_url: "https://www.home-assistant.io/docs/templating/yaml"
final_url: "https://www.home-assistant.io/docs/templating/yaml"
canonical_url: "https://www.home-assistant.io/docs/templating/yaml/"
source_handle: "web:www-home-assistant-io:9f8114c1c090"
source_section: "docs-templating"
collection: "home-assistant-docs"
doc_type: "web-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "229112112370ef0b8a147ba6fbd61bdf4d0f98fa5f3b8048db191687777e103d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "web-docs"
---

# Templates in YAML - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/yaml
- Final URL: https://www.home-assistant.io/docs/templating/yaml
- Canonical URL: https://www.home-assistant.io/docs/templating/yaml/
- Fetched at: 2026-06-28T02:23:22Z
- Content type: text/html; charset=UTF-8

## Description

Quoting rules, multi-line strings, and escaping templates inside YAML.

## Extracted Text

On this page
The quoting rule
Quotes inside the template
Multi-line templates
The >- and |- variants
Indentation inside multi-line blocks
Common mistakes
Next steps
Still stuck?
Related topics
Most of the time, templates live inside YAML files. YAML has its own rules about quoting and multi-line text, and those rules interact with templates in ways that trip everyone up at least once. This page covers the traps and the patterns that get around them.
Don’t feel bad when YAML bites you. It bites everyone. Come back to this page whenever Home Assistant refuses to load your config and the error message makes no sense.
A single-line template must be wrapped in quotes. Either single ( ' ) or double ( " ) will do.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] # Correct: template is quoted
value_template: "{{ states('sensor.temp') | float > 20 }}"
Result True (when the sensor reports a value above 20)
Without the quotes, YAML tries to interpret {{ as the start of a flow-style mapping and fails. The error message you get in that case can be confusing, so if something refuses to load, check your quotes first.
There is no difference in behavior between single and double quotes as far as Home Assistant is concerned. Pick one style and stick with it.
If the template itself contains quotes, wrap it in the other kind to avoid clashes.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] # Template contains single quotes, so wrap in double quotes
value_template: "{{ is_state('light.kitchen', 'on') }}"
Template contains double quotes, so wrap in single quotes
value_template: '{{ states["sensor.temp"] }}'
Result Both templates evaluate correctly without quote conflicts
If you need both kinds of quotes in the same template, switch to a multi-line string (see below).
When a template grows beyond a single line, quoting gets painful. YAML has two styles for writing text across multiple lines without needing quotes at all: the > style and the | style. Pick whichever matches what you want the output to look like.
The > style (folded) joins your lines back into one, with a single space between them. Use this when your template is really one long piece of code that you broke into multiple lines to fit on the page nicely.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] value_template: >
{{
states('sensor.temp') | float(0) > 20
and states('sensor.humidity') | float(0) < 60
}}
Result True (when both conditions are true)
The | style (literal) keeps every line break exactly as you wrote it. Use this when your template output needs the line breaks preserved, like a multi-line notification message.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] message: |
Today's summary:
Temperature: {{ states('sensor.temp') }}°C
Humidity: {{ states('sensor.humidity') }}%
Result Today's summary:
Temperature: 22.5°C
Humidity: 54%
A trailing - strips the final newline. You will see this used often for value_template where you do not want a trailing blank line.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] value_template: >-
{% if states('sensor.outdoor_temp') | float(0) < 0 %}
freezing
{% else %}
not freezing
{% endif %}
Result not freezing
Inside a | or > block, YAML figures out the indentation from the first non-empty line. Every following line must be indented at least as far. If you mix indents, YAML will cut the block off at the less-indented line, and the rest will look like a new key to YAML.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] # Wrong: second line is less indented than the first
message: |
Status Report
Temperature: 22
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] # Correct: all lines share the same base indent
Result Status Report
If you need more indentation on specific lines (for example, centered text), add it with the template itself rather than with extra YAML indentation.
Unquoted single-line template . YAML will complain about the {{ . Add quotes.
Starting with a quote but forgetting to close it . A common slip with long templates. Switch to a >- multi-line block when in doubt.
Using > when you need line breaks preserved . The output becomes one long line. Use | instead.
Inconsistent indentation inside | or > blocks . YAML truncates the block at the lowest indent.
When a template refuses to work, the Debugging templates page walks through how to narrow the problem down.
For the core language itself, see Template syntax .
When a template does not behave, the Debugging templates page walks through the process.
For ready-made examples you can adapt, see Common template patterns .
The Home Assistant community is quick to help: join Discord for real-time chat, post on the community forum with your template and expected result, or share on our subreddit /r/homeassistant .
Tip
AI assistants like ChatGPT or Claude can also explain or fix templates when you describe what you want in plain language.
Template syntax
Debugging templates
Yaml configuration
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
