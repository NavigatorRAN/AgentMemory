# Types and type conversion - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/types
- Final URL: https://www.home-assistant.io/docs/templating/types
- Canonical URL: https://www.home-assistant.io/docs/templating/types/
- Fetched at: 2026-06-28T02:23:17Z
- Content type: text/html; charset=UTF-8

## Description

Understand the data types in templates and how to convert between them.

## Extracted Text

On this page
The types you will meet
Why types matter
Every state is text
Converting between types
Iterables look like lists, but are not
Getting items from lists and dictionaries
From a list
From a dictionary
Checking what type you have
Testing types with tests
Common type mistakes
Next steps
Related topics
Templates work with several kinds of values: text, numbers, lists, and a few others. Each kind is called a type , and knowing which type you have matters because most operations only work with specific types. Trying to do math on text, or count items in an iterable, gives you surprising results until you convert first.
This page walks through the types you will meet, how they interact, and when you need to convert between them.
Text ( str or string ): a piece of text, written in single or double quotes. Every entity state in Home Assistant is stored as text.
Integer ( int or integer ): a whole number without a decimal point. Examples: 0 , 42 , -7 .
Float ( float ): a number with a decimal point. Examples: 3.14 , -0.5 , 22.0 .
Boolean ( bool or boolean ): either True or False . The answer to yes-or-no questions.
None ( NoneType or None ): the absence of a value. Returned when something does not exist.
List : an ordered collection of values, written with square brackets. Example: [1, 2, 3] or ['kitchen', 'bedroom'] . Also called an array or sequence.
Dictionary ( dict ): a set of key/value pairs, written with curly braces. Example: {'temp': 22, 'humidity': 54} . Also called a map or mapping.
Iterable : a sequence of values you can loop over once . Also called a generator. Filters like map , select , and selectattr return iterables. You cannot count them, index them, or use them twice until you turn them into a list. Covered in detail below .
Datetime : a moment in time with a date, time, and time zone. Returned by now() and the last_changed attribute on states.
Most functions and operators only work with specific types. Here are some examples:
Math operators ( + , - , * , / ) need numbers . Using them on text fails.
| count or | length needs a list or similar countable. It does not work on an iterable.
Comparison with < , > works on numbers correctly, but on text it compares alphabetically ( '6' > '10' is True because '6' comes after '1' ).
The in operator works on lists, text, and dicts, but the behavior is different for each.
When a template produces an unexpected result, the type of the values involved is usually the first thing to check.
This is the single most important type fact in Home Assistant templates: every entity state is stored as text . Even when a sensor looks like it reports a number, states('sensor.temperature') returns the text '22.5' , not the number 22.5 .
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ states('sensor.temperature') | typeof }}
Result str
This is why you see | float(0) or | int(0) everywhere in template examples. Before you can do math, compare numerically, or average a bunch of values, you have to convert them to numbers.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {# This looks like math but is text concatenation #}
{{ states('sensor.a') + states('sensor.b') }}
Result 22.518.5
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {# This does real math #}
{{ states('sensor.a') | float(0) + states('sensor.b') | float(0) }}
Result 41.0
Each type has a matching filter (and function) to convert a value to that type:
| float(default) : converts to a decimal number. If the value cannot be converted, the default is used.
| int(default) : converts to a whole number. Decimals are dropped.
| string : converts anything to text.
| bool(default) : converts to True or False .
| list : materializes an iterable into a list.
The default arguments for float , int , and bool are fallbacks used when the conversion fails (for example, a sensor that reports unavailable ).
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ "3.14" | float(0) }}
{{ "seven" | float(0) }}
{{ "42" | int(0) }}
{{ 3.7 | int }}
{{ 1 | string }}
{{ "yes" | bool }}
Result 3.14
0.0
42
3
1
True
Rule of thumb: whenever you read a state and need to do math with it, add | float(0) or | int(0) with a sensible fallback.
Some filters return an iterable instead of a list. An iterable is a lazy sequence. It gives you values one at a time when you loop over it, but it is not a list. You cannot count it, index it, or use it twice.
The Home Assistant filters that return iterables are:
map
select
reject
selectattr
rejectattr
If you try to count an iterable directly, you get an error:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {# This fails #}
{{ states.light | selectattr('state', 'eq', 'on') | count }}
Result Error: object of type 'generator' has no len()
The fix is to add | list to turn the iterable into a list first:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {# This works #}
{{ states.light | selectattr('state', 'eq', 'on') | list | count }}
Result 3
You will see | list at the end of filter chains all over Home Assistant templates. It is not optional decoration, it is the step that makes the result countable, sortable, and reusable. A good habit: if you feed the result of map , select , reject , selectattr , or rejectattr into anything that needs a list, add | list .
Collections give you several ways to reach the items inside them.
Use the first and last filters to grab the ends, or square brackets with an index to reach a specific position. Indices start at 0 , and negative numbers count from the end.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set rooms = ['kitchen', 'bedroom', 'garage'] %}
First: {{ rooms | first }}
Last: {{ rooms | last }}
Index 0: {{ rooms[0] }}
Index 1: {{ rooms[1] }}
Index -1: {{ rooms[-1] }}
Result First: kitchen
Last: garage
Index 0: kitchen
Index 1: bedroom
Index -1: garage
Dictionaries support two ways to read a value: bracket notation ( data['key'] ) and dot notation ( data.key ). Both usually work.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set data = {'temp': 22.5, 'humidity': 54} %}
Bracket: {{ data['temp'] }}
Dot: {{ data.temp }}
Result Bracket: 22.5
Dot: 22.5
Use bracket notation when a key name could conflict with a dict method. If a key is named values , keys , items , get , or any other built-in dict method, dot notation returns the method instead of your value. This is common with API responses.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set response = {'status': 'ok', 'values': [1, 2, 3]} %}
{{ response['values'] }}
Result [1, 2, 3]
When in doubt, reach for bracket notation. It always looks up the dictionary value first.
When you are not sure what type a value is, use typeof to inspect it:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ 42 | typeof }}
{{ 3.14 | typeof }}
{{ "hello" | typeof }}
{{ [1, 2, 3] | typeof }}
{{ {"a": 1} | typeof }}
{{ None | typeof }}
Result int
float
str
list
dict
NoneType
The names you get back are the Python type names: str for text, int for whole numbers, float for decimals, bool for booleans, list , dict , NoneType for None .
Tests let you check a type inside an if condition , without calling typeof :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ 42 is number }}
{{ "hello" is string }}
{{ [1, 2, 3] is iterable }}
{{ {"a": 1} is mapping }}
{{ None is none }}
Result True
Useful type tests: number , string , boolean , integer , float , iterable , mapping , none , defined . See the Comparison category in the reference for the full list.
Doing math on a sensor state without | float(0) . Always convert first.
Comparing text to a number . states('sensor.temp') < 20 compares text to a number. Always | float(0) first.
Using < or > on text . Text compares alphabetically, which rarely does what you want for numbers.
Forgetting | list after map , select , reject , selectattr , rejectattr . The result is an iterable, not a list, so | count and | length fail.
Expecting None or unknown to be a number . Both break math operations. Use a fallback.
For hands-on debugging, see Debugging templates .
For more on working with states, see Working with states .
For recipes that use these conversions, see Common template patterns .
`float` filter
`int` filter
`list` filter
`typeof` function
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
