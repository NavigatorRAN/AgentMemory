---
source_url: "https://www.home-assistant.io/integrations/system_log"
final_url: "https://www.home-assistant.io/integrations/system_log"
canonical_url: "https://www.home-assistant.io/integrations/system_log/"
source_handle: "web:www-home-assistant-io:0867e711ff8f"
source_section: "integrations-system-log"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "34d3bedce90f9115df2b37cd1840c807ae665f00b8bdb44be3b370de5b402e11"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# System Log - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/system_log
- Final URL: https://www.home-assistant.io/integrations/system_log
- Canonical URL: https://www.home-assistant.io/integrations/system_log/
- Fetched at: 2026-06-28T03:20:29Z
- Content type: text/html; charset=UTF-8

## Description

Summary of errors and warnings in Home Assistant during runtime.

## Extracted Text

On this page
Configuration
List of actions
Events
Examples
Counting Number of Warnings
Conditional Messages
Writing to log
The System Log integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] stores information about all logged errors and warnings in Home Assistant. To view your logs, navigate to Settings > System > Logs (condensed and full raw logs are available). To not overload Home Assistant with log data, only the 50 last errors and warnings will be stored inside a condensed log. Older entries are automatically discarded from a condensed log; a full raw log keeps all records. It is possible to change the number of stored log entries in a condensed log using the parameter max_entries .
This integration is automatically loaded by the frontend (so no need to do anything if you are using the frontend). If you are not doing so, or if you wish to change a parameter, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
system_log : max_entries : MAX_ENTRIES
Configuration Variables
Looking for your configuration file?
max_entries integer ( Optional , default: 50 )
Number of entries to store in a condensed log (older entries are discarded).
fire_event string ( Optional , default: false )
Whether events are fired (required when used for triggers).
The System Log integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Clear system log ( system_log.clear )
Clears all stored entries from the Home Assistant system log.
Write to system log ( system_log.write )
Writes a custom entry to the Home Assistant system log.
For an overview of every action across all integrations, see the actions reference .
Errors and warnings are posted as the event system_log_event , so it is possible to write automations that trigger whenever a warning or error occurs. The following information is included in each event:
Field Description level Either WARNING or ERROR depending on severity. source File that triggered the error, e.g., core.py or media_player/yamaha.py . exception Full stack trace if available, an empty string otherwise. message Descriptive message of the error, e.g., “Error handling request”. name Name of the integration, e.g., homeassistant.components.device_tracker timestamp Unix timestamp with as a double, e.g., 1517241010.237416.
Live examples of these events can be found in the Home Assistant logs . An example could, for instance, look like this:
2019-02-14 16:20:35 ERROR (MainThread) [homeassistant.loader] Unable to find integration system_healt
2019-02-14 16:20:36 ERROR (MainThread) [homeassistant.components.device_tracker] Error setting up platform google_maps
Traceback (most recent call last):
File "/home/fab/Documents/repos/ha/home-assistant/homeassistant/integrations/device_tracker/__init__.py", line 184, in
[...]
The message (“Unable to find integration system_healt”), name ( homeassistant.loader ) and level ( ERROR ) can easily be extracted from the log. The exact timestamp and if there is a stack trace that’s shown as well.
Here are some examples using the events posted by system_log . fire_event must be set to true for these to work.
This will create a counter that increases every time a warning is logged:
counter : warning_counter : name : Warnings icon : mdi:alert automation : - alias : " Count warnings" triggers : - trigger : event event_type : system_log_event event_data : level : WARNING actions : - action : counter.increment target : entity_id : counter.warning_counter
This automation will create a persistent notification whenever an error or warning is logged that has the word “action” in the message:
automation : - alias : " Create notifications for 'action' errors" triggers : - trigger : event event_type : system_log_event conditions : - condition : template value_template : ' {{ "action" in trigger.event.data.message[0] }}' actions : - action : persistent_notification.create data : title : " Something bad happened" message : " {{ trigger.event.data.message[0] }}"
This automation will create a new log entry when the door is opened:
automation : - alias : " Log door opened" triggers : - trigger : state entity_id : binary_sensor.door from : " off" to : " on" actions : - action : system_log.write data : message : " Door opened!" level : info
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The System Log system was introduced in Home Assistant 0.58, and it's used by
1.5% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Other
Back to top
