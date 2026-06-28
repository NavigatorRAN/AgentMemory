# Template error messages and fixes - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/errors
- Final URL: https://www.home-assistant.io/docs/templating/errors
- Canonical URL: https://www.home-assistant.io/docs/templating/errors/
- Fetched at: 2026-06-28T02:22:58Z
- Content type: text/html; charset=UTF-8

## Description

Common template error messages with plain-language explanations and fixes.

## Extracted Text

On this page
UndefinedError: ‘foo’ is undefined
UndefinedError: ‘dict object’ has no attribute ‘foo’
TypeError: unsupported operand type(s) for +: ‘str’ and ‘int’
TypeError: float() argument must be a string or a real number, not ‘NoneType’
TypeError: object of type ‘generator’ has no len()
TemplateSyntaxError: expected token ‘end of statement block’, got ‘X’
TemplateSyntaxError: Unexpected end of template
TemplateSyntaxError: tag name expected
TemplateAssertionError: no test named ‘foo’
UndefinedError: ‘states’ has no attribute ‘sensor’
No first item, sequence was empty
YAML error: could not find expected ‘:’
Next steps
Still stuck?
Related topics
This page lists template error messages you might run into, what each one means in plain language, and how to fix it. If the message you are seeing does not match exactly, look for the closest one. The names of types and variables change, but the shape of each error stays the same.
For a general debugging workflow, see Debugging templates .
What it means. The template is trying to use a variable named foo that does not exist. Either the name is misspelled, or the variable was never set.
How to fix it.
Check the spelling of every name in the template. states and state are different; trigger.to_state and trigger.tostate are different.
If you use a variable with {% set name = value %} , make sure the set runs before the variable is used.
If you expect the variable to come from an automation trigger ( trigger.* ) or a template entity ( this.* ), remember these only exist in those contexts. They are not available in the Template editor .
What it means. You tried to read a key named foo from a dictionary, but that key does not exist.
Use .get("foo", default_value) to return a default when the key is missing: data.get("foo", 0) .
Or check for the key first with if "foo" in data .
If the dictionary comes from a JSON response, print it with {{ data | tojson }} to see exactly which keys are there.
What it means. You are trying to do math between a piece of text and a number. This happens most often with entity states, because every state is stored as text. "22.5" + 5 does not work.
How to fix it. Convert the text to a number first with | float(0) or | int(0) :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ states('sensor.temperature') | float(0) + 5 }}
Result 27.5
The 0 is a fallback used when the conversion fails (for example, when the sensor is unavailable ). See Types and conversion .
What it means. You tried to convert None to a number, and None is not a number. This usually comes from reading an attribute that does not exist, or calling state_attr for an entity that has not been set up yet.
How to fix it. Add a default value to float or int :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ state_attr('light.kitchen', 'brightness') | float(0) }}
Result 0
Or skip the calculation when the value is missing using has_value .
What it means. You tried to count or measure an iterable directly. Filters like map , select , reject , selectattr , and rejectattr return iterables, not lists. Iterables cannot be counted until you materialize them.
How to fix it. Add | list to turn the iterable into a list first:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ states.light | selectattr('state', 'eq', 'on') | list | count }}
Result 3
See Types and conversion for more on iterables.
What it means. There is a typo or an unexpected character inside a {% ... %} block. Something is written that the template engine doesn’t recognize.
Look at the template line number in the error.
Check for missing commas, brackets, or quotes.
Verify that operators are spelled right ( == , != , and , or , not , in ).
Python comparisons like is not None work; make sure you used is not , not not is .
What it means. A {% if %} , {% for %} , {% set %} , or {% macro %} block was opened but not closed. Every block tag needs a matching {% endif %} , {% endfor %} , {% endset %} , or {% endmacro %} .
Count the opening and closing tags. If you have two {% if %} , you need two {% endif %} .
Indent the template in the editor so you can see the structure.
What it means. You have a {% %} block with nothing inside, or with something the engine cannot parse as a statement.
How to fix it. Check the line. Remove empty {% %} markers. If you intended a comment, use {# ... #} instead.
What it means. After is , you used a test name the engine does not know.
How to fix it. Check the test name against the template functions reference . Common tests are defined , none , number , string , boolean , iterable , mapping , even , odd , eq , gt , lt , and in . Aliases like equalto , greaterthan , and lessthan also work.
What it means. When using dot notation like states.sensor.temperature.state , one of the pieces in the chain does not exist. Usually this means the entity ID is wrong, or the entity has not been set up yet.
Use states('sensor.temperature') instead. The function version returns the text 'unknown' for missing entities instead of raising an error, which is safer.
Verify the entity ID in Settings > Developer tools > States .
What it means. You used first or last on a list that turned out to be empty. There is nothing to return.
How to fix it. Check the list length first, or use default :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set items = ['a', 'b', 'c'] %}
{{ items | first | default('nothing') }}
Result a
What it means. Your YAML file contains a template with unquoted braces ( {{ or {% ). YAML tries to parse { as the start of a flow-style mapping and fails.
How to fix it. Wrap the single-line template in quotes, or use a multi-line block scalar:
# Correct: quoted value_template : " {{ states('sensor.temperature') }}" # Correct: multi-line value_template : > {{ states('sensor.temperature') }}
See Templates in YAML for the full set of quoting rules.
For a systematic approach to narrowing down any template problem, see Debugging templates .
If the error came from a quoting or indentation issue, head to Templates in YAML .
If the error involves state values being text, see Working with states .
The Home Assistant community is quick to help: join Discord for real-time chat, post on the community forum with your template and the exact error message, or share on our subreddit .
Tip
AI assistants like ChatGPT or Claude can also explain or fix templates when you describe what you want in plain language. Paste in your template and the error message.
Debugging templates
Types and conversion
`typeof` function
`has_value` function
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
