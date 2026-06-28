# Calendar - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/calendar
- Final URL: https://www.home-assistant.io/integrations/calendar
- Canonical URL: https://www.home-assistant.io/integrations/calendar/
- Fetched at: 2026-06-28T02:33:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate calendars within Home Assistant.

## Extracted Text

On this page
Getting started with calendars
Viewing and managing calendars
Calendar card
The state of a calendar entity
Automation
Automation recipes
List of actions
List of triggers
List of conditions
The Calendar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides calendar entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , allowing other integrations to integrate calendars into Home Assistant. Calendars are shown on the calendar dashboard and can be used with automations.
Note
Building block integration
This calendar is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this calendar building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the calendar building block offers.
Home Assistant’s calendar support is designed primarily for automation use cases. It allows you to trigger automations based on events and access event information provided by calendar integrations, regardless of where the actual calendar data is stored. When supported by a given integration, Home Assistant can also create, edit, and delete events in external calendars, making it possible to interact with calendars both for reading and writing.
Home Assistant is not intended to replace a full-featured personal calendar. Instead, it works alongside external calendar platforms and complements them with powerful automation capabilities.
Depending on your needs, you can choose from several approaches:
Use an existing external calendar: Explore the built-in calendar integrations to connect Home Assistant to your preferred calendar platform and use its events for automations.
Run your own full-featured, privacy-focused calendar platform: Solutions like Nextcloud Calendar or other self-hosted calendar platforms provide complete calendar functionality and expose calendars over CalDAV. You can integrate them with Home Assistant using the CalDAV integration while keeping full calendar management outside Home Assistant.
Use a simple, local event store for automations: The Local Calendar integration provides a fully local calendar designed specifically for automation workflows. It is not intended to function as a general-purpose personal calendar.
Each calendar is represented as its own entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] in Home Assistant and can be
viewed and managed on a calendar dashboard. You can find the calendar dashboard
in the main sidebar of your Home Assistant instance.
Some calendar integrations allow Home Assistant to manage your calendars
directly from Home Assistant. In this case, you can add new events by selecting
the Add event button in the lower right corner of the calendar dashboard.
The calendar dashboard provides quick visibility into upcoming events and simple
event editing, making it easier to build and troubleshoot automations that depend
on calendar data.
Also see Actions below.
To display calendar events directly on your dashboards, Home Assistant includes the calendar card .
The card shows upcoming events from one or more calendar entities and provides a quick, glanceable view of your schedule.
The state shows whether there is an active event:
On : The calendar has an active event.
Off : The calendar does not have an active event.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
Calendar Triggers enable automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] based on an
event’s start or end. Review the Automating Home Assistant
getting started guide on automations or the Automation
documentation for full details.
Calendar triggers A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] are the best way to automate based on calendar events.
A calendar entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] can also be used to automate based on its state, but these are limited and attributes only represent the next event.
An example of a calendar trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] in YAML:
automation : - triggers : - trigger : calendar # Possible values: start, end event : start # The calendar entity_id entity_id : calendar.personal # Optional time offset to fire a set time before or after event start/end offset : -00:15:00
Calendar triggers should not generally use automation mode single to ensure the trigger can fire when multiple events start at the same time. For example, use queued or parallel instead. Note that calendars are read once every 15 minutes. When testing, make sure you do not plan events less than 15 minutes away from the current time, or your trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] might not fire.
See Automation Trigger Variables: Calendar for additional trigger data available for conditions or actions.
Below are a few example ways you can use Calendar triggers.
Example: Calendar Event Notification
This example automation consists of:
For the calendar entity calendar.personal .
At the start of any calendar event.
Send a notification with the title and start time of the event.
Allowing multiple events starting at the same time.
automation : - alias : " Calendar notification" triggers : - trigger : calendar event : start entity_id : calendar.personal actions : - action : persistent_notification.create data : message : >- Event {{ trigger.calendar_event.summary }} @ {{ trigger.calendar_event.start }}
Example: Calendar Event Light Schedule
This example consists of:
For the calendar entity calendar.device_automation .
When event summary contains Front Lights .
Turn on and off light named light.front when the event starts and ends.
automation : - alias : " Front Light Schedule" triggers : - trigger : calendar event : start entity_id : calendar.device_automation - trigger : calendar event : end entity_id : calendar.device_automation conditions : - condition : template value_template : " {{ 'Front Lights' in trigger.calendar_event.summary }}" actions : - if : - " {{ trigger.event == 'start' }}" then : - action : light.turn_on target : entity_id : light.front else : - action : light.turn_off target : entity_id : light.front
The Calendar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Create calendar event ( calendar.create_event )
Adds a new event to a calendar.
Get calendar events ( calendar.get_events )
Gets the events on a calendar within a date range.
For an overview of every action across all integrations, see the actions reference .
The Calendar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Calendar event ended ( calendar.event_ended )
Triggers when one or more calendar events end.
Calendar event started ( calendar.event_started )
Triggers when one or more calendar events start.
For an overview of every trigger across all integrations, see the triggers reference .
The Calendar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Calendar event is active ( calendar.is_event_active )
Tests if one or more calendars have an active event.
For an overview of every condition across all integrations, see the conditions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Calendar entity was introduced in Home Assistant 0.33.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Calendar
Back to top
