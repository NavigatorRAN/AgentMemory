---
source_url: "https://www.home-assistant.io/docs/templating/dates-and-times"
final_url: "https://www.home-assistant.io/docs/templating/dates-and-times"
canonical_url: "https://www.home-assistant.io/docs/templating/dates-and-times/"
source_handle: "web:www-home-assistant-io:8a51930d5490"
source_section: "docs-templating"
collection: "home-assistant-docs"
doc_type: "web-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "516b82120d1873502e5c59d559c953f3e4bd3e13278c567d1972e0d271015a64"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "web-docs"
---

# Working with dates and times - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/templating/dates-and-times
- Final URL: https://www.home-assistant.io/docs/templating/dates-and-times
- Canonical URL: https://www.home-assistant.io/docs/templating/dates-and-times/
- Fetched at: 2026-06-28T02:22:52Z
- Content type: text/html; charset=UTF-8

## Description

Read, format, compare, and calculate with dates and times in your templates.

## Extracted Text

On this page
Getting the current time
now() and utcnow()
today_at
Accessing parts of a datetime
Formatting with strftime
Common format codes
Parsing text into a datetime with strptime
Converting between types
UNIX timestamp to datetime
Datetime to UNIX timestamp
Text to datetime
Time differences
How long ago did something happen?
Is it more than X minutes?
Counting down to a future date
Time zones
Common gotchas
Next steps
Related topics
Related links
Dates and times come up constantly in Home Assistant templates. “How long ago did the door open?” “Is it past sunset?” “How many days until my next bin collection?” This page gathers the tools and patterns you need, in one place.
If you only need the current moment, start with now() . If you’re converting or formatting, jump to the formatting section . If you’re working with a timestamp from a sensor, head to the conversion section .
now() returns the current date and time in your configured time zone. utcnow() returns it in UTC.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] Local: {{ now() }}
UTC: {{ utcnow() }}
Result Local: 2026-04-04 14:30:00.123456+02:00
UTC: 2026-04-04 12:30:00.123456+00:00
Important
Templates that use now() or utcnow() re-run once per minute. This is how clock-based templates stay current. If you need something to refresh more often, base it on a state change instead.
today_at gives you a specific time on the current day, handy for “is it past bedtime?” checks.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ today_at('22:00') }}
Result 2026-04-04 22:00:00+02:00
Once you have a datetime, you can pull out individual parts with dots.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] Year: {{ now().year }}
Month: {{ now().month }}
Day: {{ now().day }}
Hour: {{ now().hour }}
Minute: {{ now().minute }}
Weekday: {{ now().weekday() }}
Result Year: 2026
Month: 4
Day: 4
Hour: 14
Minute: 30
Weekday: 5
weekday() is 0 for Monday through 6 for Sunday. If you prefer the other convention, isoweekday() gives you 1 for Monday through 7 for Sunday.
strftime turns a datetime into text, shaped the way you want. This is the single most useful method for displaying dates and times.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] 24-hour: {{ now().strftime('%H:%M') }}
12-hour: {{ now().strftime('%I:%M %p') }}
Weekday: {{ now().strftime('%A') }}
Short date: {{ now().strftime('%Y-%m-%d') }}
Long date: {{ now().strftime('%A, %B %-d, %Y') }}
Sentence: {{ now().strftime('It is %A at %H:%M') }}
Result 24-hour: 14:30
12-hour: 02:30 PM
Weekday: Saturday
Short date: 2026-04-04
Long date: Saturday, April 4, 2026
Sentence: It is Saturday at 14:30
Here are the ones you will use most often:
%Y : four-digit year (for example, 2026 )
%m : zero-padded month (for example, 04 )
%d : zero-padded day (for example, 04 )
%-d : day without leading zero (for example, 4 )
%H : hour in 24-hour format (for example, 14 )
%M : minute (for example, 30 )
%S : second (for example, 00 )
%I : hour in 12-hour format (for example, 02 )
%p : AM or PM
%A : full weekday name (for example, Saturday )
%a : short weekday name (for example, Sat )
%B : full month name (for example, April )
%b : short month name (for example, Apr )
The Python documentation has the full list of format codes if you need something unusual.
Note
Weekday and month names from strftime , like the ones produced by %A and %B , are always in English, regardless of the language set in your Home Assistant profile. There is currently no built-in way to render them in another language.
strptime is the reverse of strftime . It takes a piece of text and a format string, and gives you back a datetime.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set event = strptime('2026-12-25 10:30', '%Y-%m-%d %H:%M') %}
{{ event }}
Result 2026-12-25 10:30:00
See the strptime reference for the full signature.
Sensors, APIs, and MQTT messages deliver timestamps in many different shapes. These functions convert between them.
A UNIX timestamp is the number of seconds since January 1, 1970. Many APIs use them.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set ts = 1710510600 %}
Local: {{ ts | timestamp_local }}
UTC: {{ ts | timestamp_utc }}
Custom: {{ ts | timestamp_custom('%H:%M on %B %d') }}
Result Local: 2024-03-15 14:30:00+01:00
UTC: 2024-03-15 13:30:00+00:00
Custom: 14:30 on March 15
See timestamp_local , timestamp_utc , and timestamp_custom .
Use as_timestamp :
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ as_timestamp(now()) | int }}
Result 1743768600
as_datetime is a forgiving version of strptime that tries to figure out common formats on its own.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ as_datetime('2026-04-04 14:30:00') }}
Result 2026-04-04 14:30:00+02:00
When you subtract two datetimes, you get a timedelta that represents the duration between them. Timedeltas support their own calculations and methods.
Every state has a last_changed timestamp. Subtract it from now() to get a timedelta.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set since = now() - states.binary_sensor.front_door.last_changed %}
Total seconds: {{ since.total_seconds() | int }}
Total minutes: {{ (since.total_seconds() / 60) | int }}
Result Total seconds: 900
Total minutes: 15
For a human-readable version, reach for time_since instead:
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{ time_since(states.binary_sensor.front_door.last_changed) }} ago
Result 15 minutes ago
A common pattern: trigger an alert when something has been in a state too long.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {{
(now() - states.binary_sensor.front_door.last_changed)
.total_seconds() > 600
}}
Result True (when the door has been in its state for more than 10 minutes)
time_until turns a future datetime into a human-readable duration.
Template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] {% set birthday = strptime('2026-12-25', '%Y-%m-%d') %}
Christmas: {{ time_until(birthday) }}
Result Christmas: 8 months
Home Assistant stores state timestamps ( last_changed , last_updated ) in your configured time zone. now() also returns your local time zone. utcnow() returns UTC.
If you need to compare datetimes, both sides need to be in the same time zone. as_datetime and strptime return datetimes without a time zone by default. Apply the matching conversion before comparing, or stick to timestamp_local and timestamp_utc which handle this for you.
Text comparison vs time comparison. Comparing date-looking text with < or > compares alphabetically, not chronologically. Convert both sides to datetimes first.
timestamp_custom is not the only option. For datetime values (like now() ), use .strftime(...) directly. timestamp_custom is specifically for UNIX timestamps.
Templates using now() re-run every minute. Don’t use it for things that should update more often.
Subtraction gives you a timedelta, not seconds. Call .total_seconds() on the result when you need a number.
.replace(hour=..., minute=...) can be wrong around daylight saving time. Replacing the hour field on a timezone-aware datetime can land in a skipped or repeated local hour, which silently produces the wrong absolute time. Prefer today_at('HH:MM') for “today at a specific local time”, and add or subtract full days with timedelta(days=1) only when you accept 24 exact hours, not one calendar day.
See the full list of date and time functions in the reference.
For common date/time recipes, see Common template patterns .
The Python methods page covers .strftime() , .weekday() , and similar datetime methods.
`now` function
`strptime` function
`timestamp_custom` filter
`time_since` function
All date and time functions
Python strftime format codes
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
