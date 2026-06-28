# Python methods you can use in templates - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/python-methods
- Final URL: https://www.home-assistant.io/docs/templating/python-methods
- Canonical URL: https://www.home-assistant.io/docs/templating/python-methods/
- Fetched at: 2026-06-28T02:23:05Z
- Content type: text/html; charset=UTF-8

## Description

A reference of common Python string, list, and dictionary methods available in templates.

## Extracted Text

On this page
String methods
split
replace
lower, upper, title, capitalize
strip
startswith, endswith
find, index, count
join
format
Dictionary methods
items
keys, values
get
When a key name conflicts with a dict method
Datetime methods
Accessing parts
Formatting with strftime
Parsing with strptime
Number methods
is_integer
When to use methods vs filters
Next steps
Related topics
Templates are built on top of Python, and many standard Python methods are available to you. You call them the same way you would in Python: put a dot after the value, then the method name and parentheses. These methods are not listed in the template functions reference because they come from Python itself, but they solve a lot of common tasks.
This page is a cheat sheet of the ones that come up most often in Home Assistant templates. When in doubt, open the template editor and try it.
Everything Home Assistant stores as text supports these. Since entity states are always text (until you convert them), these work directly on states() results.
Splits a piece of text into a list at each occurrence of a separator.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ "light.living_room".split(".") }}
Result ['light', 'living_room']
Useful for breaking entity IDs into their domain and name, splitting comma-separated strings, or pulling words out of a sentence.
Replaces one piece of text with another.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ "light.living_room".replace("_", " ") }}
Result light.living room
Change the case of a piece of text.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] Lower: {{ "Living Room".lower() }}
Upper: {{ "Living Room".upper() }}
Title: {{ "living room".title() }}
Capitalize: {{ "living room".capitalize() }}
Result Lower: living room
Upper: LIVING ROOM
Title: Living Room
Capitalize: Living room
Removes whitespace from the start and end of a piece of text.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] '{{ ' hello world '.strip() }}'
Result 'hello world'
Check whether a piece of text begins or ends with another piece of text.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ "sensor.outdoor_temperature".startswith("sensor.") }}
{{ "image.jpg".endswith(".jpg") }}
Result True
True
These are very handy for filtering entity IDs by domain.
find returns the position of a piece of text, or -1 if not found. index does the same but raises an error when not found. count counts how many times it appears.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ "sensor.outdoor_temperature".find("outdoor") }}
{{ "hello world hello".count("hello") }}
Result 7
2
Joins a list into a single piece of text using a separator.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ ', '.join(['apples', 'oranges', 'pears']) }}
Result apples, oranges, pears
Note the order: you call .join() on the separator, passing the list in. There is also a join filter that reads more naturally: ['apples', 'oranges', 'pears'] | join(', ') .
Inserts values into a piece of text using placeholders.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ "Temperature: {} {}".format(22.5, "°C") }}
Result Temperature: 22.5 °C
Dictionaries show up in entity attributes, JSON responses, and action responses.
Iterate over a dictionary’s key-value pairs.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% for key, value in {"a": 1, "b": 2}.items() %}
{{ key }} = {{ value }}
{% endfor %}
Result a = 1
b = 2
Get only the keys or only the values.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set data = {"temp": 22.5, "humidity": 54} %}
Keys: {{ data.keys() | list }}
Values: {{ data.values() | list }}
Result Keys: ['temp', 'humidity']
Values: [22.5, 54]
Fetch a value by key, with a fallback if the key is missing. This is safer than bracket lookup, which errors on missing keys.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set data = {"name": "Frenck"} %}
Name: {{ data.get("name", "unknown") }}
Age: {{ data.get("age", "unknown") }}
Result Name: Frenck
Age: unknown
If a dictionary has a key with the same name as a dict method (like values , keys , items , or get ), dot notation returns the method, not the value. This commonly happens when parsing API responses.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set response = {"status": "ok", "values": [1, 2, 3]} %}
{{ response['values'] }}
Result [1, 2, 3]
Use bracket notation ( response['values'] ) when a key might collide with a method. It always reaches the dictionary value first.
When you have a datetime (for example, from now() ), you can reach into its parts or format it.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] Hour: {{ now().hour }}
Minute: {{ now().minute }}
Weekday: {{ now().weekday() }}
Day: {{ now().day }}
Result Hour: 14
Minute: 30
Weekday: 5
Day: 4
weekday() returns Monday as 0 through Sunday as 6 . Use isoweekday() if you prefer Monday as 1 through Sunday as 7 .
strftime formats a datetime using format codes. It is covered in detail on the Working with dates and times page, but here is the short version:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ now().strftime('%A, %B %-d, %Y') }}
Result Saturday, April 4, 2026
The reverse of strftime . Parses a piece of text into a datetime using a format string. See strptime .
Numbers have a few helpful methods.
Check whether a floating-point number has no decimal part.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ (10.0).is_integer() }}
{{ (10.5).is_integer() }}
False
Both work for many tasks. Pick whichever reads better:
Methods (with a dot) come from Python. "text".upper() , data.get("key") .
Filters (with a pipe) come from the template engine and Home Assistant. "text" | upper , data | default("key") .
Filters chain more naturally when you have several transformations. Methods can be clearer for a single transformation or when the method returns something unusual. The template functions reference lists all the filters Home Assistant provides.
If you’re looking for a specific transformation, check the template functions reference first.
For template debugging, see Debugging templates .
For date and time formatting in particular, read Working with dates and times .
Template functions reference
`upper` filter
`replace` filter
`join` filter
Working with dates and times
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
