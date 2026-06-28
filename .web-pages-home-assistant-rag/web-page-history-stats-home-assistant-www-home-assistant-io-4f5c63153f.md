---
source_url: "https://www.home-assistant.io/integrations/history_stats"
final_url: "https://www.home-assistant.io/integrations/history_stats"
canonical_url: "https://www.home-assistant.io/integrations/history_stats/"
source_handle: "web:www-home-assistant-io:4f5c63153fc3"
source_section: "integrations-history-stats"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "851562cdd92de14b3409c466ea7fdd2f10d1bfa20eae571c2f83e08d94bf7f1c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# History Stats - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/history_stats
- Final URL: https://www.home-assistant.io/integrations/history_stats
- Canonical URL: https://www.home-assistant.io/integrations/history_stats/
- Fetched at: 2026-06-28T02:48:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions about how to integrate historical statistics into Home Assistant.

## Extracted Text

On this page
Configuration
YAML Configuration
Sensor type
Time periods
Duration
Minimum state duration
Video tutorial
Examples
Related topics
The History stats integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides quick statistics about another integration or platforms, using data from the history integration.
It can track how long an entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] has been in a specific state, in a custom time period.
Examples of what you can track:
How long you were at home this week
How long the lights were ON yesterday
How long you watched TV today
To add the History Stats helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select History Stats .
Follow the instructions on screen to complete the setup.
Further information and examples about these configuration options can be found under the YAML configuration
Name
The name the sensor should have.
Entity
The entity that provides the input.
State
Which states of the input entity is counted in the statistics.
Type
Any of time , ratio or count .
Start
When to start the measure (timestamp or datetime). Can be a template.
End
When to stop the measure (timestamp or datetime). Can be a template.
Duration of the measure.
State class
The state_class of the sensor.
Minimum duration of measurement
Minimum duration of the measurement to be considered for calculations (defaults to 0, all measurements will be included). Useful to exclude short state changes from the statistics.
To enable the history statistics sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry sensor : - platform : history_stats name : Lamp ON today entity_id : light.my_lamp state : " on" type : time start : " {{ today_at() }}" end : " {{ now() }}"
Configuration Variables
Looking for your configuration file?
entity_id string Required
The entity you want to track.
unique_id string ( Optional )
An ID that uniquely identifies this entity. Set this to a unique value to allow customization through the UI.
state list | string Required
The states you want to track.
name string ( Optional , default: unnamed statistics )
Name displayed on the frontend. Note that it is used by Home Assistant to generate sensor’s object_id so it is advisable to choose a unique one and change name for frontend using customization or via Dashboards .
type string ( Optional , default: time )
The type of sensor: time , ratio , or count .
start template ( Optional )
When to start the measure (timestamp or datetime).
end template ( Optional )
When to stop the measure (timestamp or datetime).
duration time ( Optional )
state_class string ( Optional , default: measurement )
state_class of the sensor. May be null , measurement , or total_increasing (not allowed for ratio type).
min_state_duration time ( Optional , default: 0 )
Minimum duration of the measurement to be considered for calculations. Used as a filter to remove short state changes from statistics.
Note
You have to provide exactly 2 of start , end and duration .
You can use template extensions such as now() or as_timestamp() to handle dynamic dates, as shown in the examples below.
Depending on the sensor type you choose, the history_stats integration can show different values:
time : The default value, which is the tracked time, in hours
ratio : The tracked time divided by the length of your period, as a percentage
count : How many times the tracked entity matched the configured state during the time period. This will count states (for example, how many times a light was in the on state during the time period), as opposed to counting state transitions (for example, how many times a light was turned on ). The difference is if the entity was already in the desired state at the start of the time period, that scenario will be counted with this sensor type. If a list of states is provided to the state option, transitions between defined states are considered all part of a single event and do not increment the count.
For a time or count sensor that uses a time period that does not slide (such as one that resets upon each hour, as opposed to one which considers the trailing 60 minutes), set the state_class to total_increasing to generate statistics that track the sum . This is useful when emulating the behavior of a utility_meter helper that has a defined reset cycle.
The history_stats integration will execute a measure within a precise time period. You should always provide 2 of the following :
When the period starts ( start variable)
When the period ends ( end variable)
How long is the period ( duration variable)
As start and end variables can be either datetimes or timestamps, you can configure almost any period you want.
The duration variable is used when the time period is fixed. Different syntaxes for the duration are supported, as shown below.
# 6 hours duration : " 06:00"
# 1 minute, 30 seconds duration : " 00:01:30"
# 2 hours and 30 minutes duration : # supports seconds, minutes, hours, days hours : 2 minutes : 30
If the duration exceeds the number of days of history stored by the recorder integration ( purge_keep_days ), the history statistics sensor will not have all the information it needs to look at the entire duration. For example, if purge_keep_days is set to 7, a history statistics sensor with a duration of 30 days will only report a value based on the last 7 days of history.
The history stats sensor will be updated when the source entity changes or once per minute if there is no source change. Keep this in mind when using fixed durations that aren’t evenly divisible by one minute.
The minimum state duration variable is used to exclude short state changes from the statistics. In this example state changes shorter than 2 minutes will be excluded from statistics. It can be useful for instance to exclude short disconnections of a device.
# 2 minutes min_state_duration : " 00:02:00"
This video tutorial explains how you can use history stats. It also shows how you can create a daily bar chart graph to visualize things such as occupancy, or how long the lights are on in a particular room.
Important
When writing templates for start , end , or duration , prefer helpers like today_at('HH:MM') over manual datetime math with now() + timedelta(...) combined with .replace(hour=..., minute=...) . On days when daylight saving time starts or ends, replacing the hour field of a local time may land in a skipped or repeated hour, which can silently produce the wrong timestamp. today_at() always returns a valid local datetime and is the safer building block for local-time boundaries. For more context, see Dates and times in templates .
Here are some examples of periods you could work with, and what to write in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
Today : starts at 00:00 of the current day and ends right now.
start : " {{ today_at('00:00') }}" end : " {{ now() }}" state_class : total_increasing
Yesterday : ends today at 00:00, lasts 24 hours.
end : " {{ today_at('00:00') }}" duration : hours : 24
This morning (6AM - 11AM) : starts today at 6, lasts 5 hours.
start : " {{ today_at('06:00') }}" duration : hours : 5
Current week : starts last Monday at 00:00, ends right now.
Here, last Monday is today at 00:00, minus the current weekday (the weekday is 0 on Monday, 6 on Sunday).
start : " {{ today_at('00:00') - timedelta(days=now().weekday()) }}" end : " {{ now() }}"
Current month : starts the first day of the current month at 00:00, ends right now.
start : " {{ today_at('00:00').replace(day=1) }}" end : " {{ now() }}"
Previous month : starts the first day of the previous month at 00:00, ends the first day of the current month.
start : " {{ (today_at('00:00').replace(day=1) - timedelta(days=1)).replace(day=1) }}" end : " {{ today_at('00:00').replace(day=1) }}"
Next 4 pm : 24 hours, from the last 4 pm until the next 4 pm. If it is not yet 4 pm today, the period runs from 4 pm yesterday to 4 pm today. If it is at or after 4 pm today, the period runs from 4 pm today to 4 pm tomorrow. When changing the start time, adjust the hour in today_at() accordingly.
end : >- {% set today_4pm = today_at('16:00') %} {{ today_4pm if now() < today_4pm else today_4pm + timedelta(days=1) }} duration : hours : 24
Last 30 days : ends today at 00:00, lasts 30 days. Easy one.
end : " {{ today_at('00:00') }}" duration : days : 30
All your history starts at timestamp = 0, and ends right now.
start : " {{ 0 }}" end : " {{ now() }}"
Tip
The /developer-tools/template page of your Home Assistant UI can help you check if the values for start , end or duration are correct. If you want to check if your period is right, just click on your component, the from and to attributes will show the start and end of the period, nicely formatted.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The History Stats helper was introduced in Home Assistant 0.39, and it's used by
4.2% of the active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Helper
Sensor
Utility
Back to top
