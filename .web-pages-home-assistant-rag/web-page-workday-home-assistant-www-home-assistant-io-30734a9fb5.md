---
source_url: "https://www.home-assistant.io/integrations/workday"
final_url: "https://www.home-assistant.io/integrations/workday"
canonical_url: "https://www.home-assistant.io/integrations/workday/"
source_handle: "web:www-home-assistant-io:30734a9fb52d"
source_section: "integrations-workday"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d58752d2ed9bc6298f45c619b4f806e0fd71047cd6fba605b497ad11cf10109c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Workday - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/workday
- Final URL: https://www.home-assistant.io/integrations/workday
- Canonical URL: https://www.home-assistant.io/integrations/workday/
- Fetched at: 2026-06-28T03:29:04Z
- Content type: text/html; charset=UTF-8

## Description

Steps to configure the binary workday sensor.

## Extracted Text

On this page
Setup
Configuration
Specific field information
List of actions
Automation example
The Workday integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] indicates whether the current day is a workday or not.
It allows specifying which days of the week will count as workdays and also uses the Python module holidays to incorporate information about region-specific public holidays.
This can be used to make daily automations that act differently on workdays than non-workdays. For example, you could make your bedroom lights turn on (gently) at 7 in the morning if it is a workday but wait until 11 if it is a non-working day.
The workday integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] also provides a calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] entity that may be used to see upcoming workdays.
Check the country list for available provinces (and other subdivisions, like states and territories) for each country.
To add the Workday service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Workday .
Follow the instructions on screen to complete the setup.
The keyword “Holidays” is used for public holidays identified by the holidays module and holidays added by the “Add holidays” configuration option.
Important
Take note of the “Holidays” keyword. Your first instinct might be to add it to the “Excludes” configuration, thinking it means skipping the holidays. But it is meant to exclude the days in the holiday list from the workdays. So, when you exclude “Holidays” and a workday falls on that day, that workday is excluded, and the sensor will be off . If you want every workday flagged with no regard to holidays, ensure that there is something in your “Excludes” configuration other than “Holidays”.
Country code must be given according to holidays notation. The country can also be set to None to start with an empty set of holidays. This is useful in conjunction with the add holidays field.
Subdivision code must be given according to holidays notation.
Add holidays will only take dates formatted with YYYY-MM-DD or a date range formatted with YYYY-MM-DD,YYYY-MM-DD .
Remove holidays will take dates formatted with YYYY-MM-DD , a date range formatted with YYYY-MM-DD,YYYY-MM-DD or partial of name, for example, christmas will exclude Christmas Day .
The offset can be used to see if future days are workdays. For example, put 1 to see if tomorrow is a workday.
Additional categories can be added through the configuration to include optional holidays according to the lists provided in the python-holidays library
The Workday integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Check date ( workday.check_date )
Checks whether a given date is a workday.
For an overview of every action across all integrations, see the actions reference .
Example usage for automation:
automation : alias : " Turn on heater on workdays" triggers : - trigger : time at : " 08:00:00" conditions : - condition : state entity_id : binary_sensor.workday_sensor state : " on" actions : - action : switch.turn_on target : entity_id : switch.heater
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Workday service was introduced in Home Assistant 0.41, and it's used by
5.4% of the active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
@gjohansson-ST
Categories
Binary sensor
Calendar
Utility
Back to top
