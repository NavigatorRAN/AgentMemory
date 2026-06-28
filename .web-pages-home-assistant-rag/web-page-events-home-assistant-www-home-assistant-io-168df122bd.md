# Events - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/events
- Final URL: https://www.home-assistant.io/docs/configuration/events
- Canonical URL: https://www.home-assistant.io/docs/configuration/events/
- Fetched at: 2026-06-28T02:21:26Z
- Content type: text/html; charset=UTF-8

## Description

Events are how integrations and parts of Home Assistant tell each other that something has happened, and how you can trigger automations based on them.

## Extracted Text

On this page
Events and state changes
State change events versus event entity
Common fields
Built-in Events (core)
call_service
component_loaded
core_config_updated
data_entry_flow_progressed
homeassistant_start, homeassistant_started
homeassistant_stop, homeassistant_final_write, homeassistant_close
logbook_entry
service_registered
service_removed
state_changed
themes_updated
user_added
user_removed
Built-in events (default integrations)
automation_reloaded
automation_triggered
scene_reloaded
script_started
Related topics
The core of Home Assistant is the event bus. The event bus allows any integration to fire or listen for events.
All entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] produce state change events. Every time a state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] changes, a state change event is produced. State change events are just one type of event on the event bus, but there are other kinds of events, such as the built-in events that are used to coordinate between various integrations.
State change events are not to be confused with the event entity . The event entity is a specific type of entity that itself produces event state changes, just like all other entities.
Any state change will be announced on the event bus as a state_changed event, containing the previous and the new state of an entity.
All events share these basic fields.
Field Description event_type Type of the event. Example: call_service . origin Origin of the event. REMOTE (coming in from the API, such as a webhook) or LOCAL (everything else). time_fired When the event was fired. Example: 2022-01-28T12:19:53.736380+00:00 . context Dictionary with the context . Example: { 'id': '123', "parent_id": null, 'user_id': 'abc'} .
In addition, all events contain a data dictionary with event-specific information. These are described below.
This event is fired when a service action is performed
Field Description domain Domain of the action. Example: light . service The service action that is performed. Example: turn_on service_data Dictionary with the call parameters. Example: { 'brightness': 120 } . service_call_id String with a unique call id. Example: 23123-4 .
This event is fired when a new integration has been loaded and initialized.
Please note that while this event is fired for each loaded integration during Home Assistant startup, the automation engine of Home Assistant is started last. Thus, this event can not be used to run automations during startup as it would have missed these events.
Field Description component Domain of the integration that has just been initialized. Example: light .
This event is fired when the core configuration is updated, for example when the location has been changed.
It contains no additional data.
This event is fired when a data entry flow has changed and is used by the frontend to reload the flow state.
Field Description handler The flow handler. flow_id Identification of the flow.
homeassistant_start , homeassistant_started
These events are fired during the startup of Home Assistant, in the following order:
homeassistant_start
homeassistant_started
These events contain no additional data.
If you want to trigger automation on a Home Assistant start event, we recommend using the special Home Assistant trigger instead of listening to these events.
homeassistant_stop , homeassistant_final_write , homeassistant_close
These events are fired during the shutdown of Home Assistant, in the following order:
homeassistant_stop
homeassistant_final_write
homeassistant_close
Please note that homeassistant_final_write and homeassistant_close , cannot be used with automations, as the automation engine would already have been stopped when those are fired.
If you want to trigger automation on a Home Assistant stop event, we recommend using the special Home Assistant trigger instead of listening to these events.
Field Description name Name of the entity. Example: Kitchen light . message Message. Example: was turned on domain Optional, domain of the entry. Example: light entity_id Optional, identifier of the entity that was logged.
This event is fired when a new service action has been registered within Home Assistant.
Field Description domain The domain of the integration that offers this action. Example: light . service The name of the service action. Example: turn_on
This event is fired when a service action has been removed from Home Assistant.
This event is fired when a state has changed. It contains the entity identifier and both the new_state and old_state of the entity as state objects .
Field Description entity_id Identifier of the entity that has changed. Example: light.kitchen old_state The previous state of the entity before it changed. Omitted if the state is set for the first time. new_state The new state of the entity. Omitted if the state has been removed.
This event is fired after a theme has been set or reloaded. It contains no additional data.
This event is fired when a user has been added.
Field Description user_id Identification of the new user.
This event is fired when a user has been removed.
Field Description user_id Identification of the removed user.
Integration: automation
This event is fired when automations have been reloaded and thus might have changed.
This event contains no additional data.
This event is fired when an automation is triggered.
Field Description name The name of the automation. entity_id The identifier of the automation.
Integration: homeassistant
This event is fired when scenes have been reloaded and thus might have changed.
Integration: script
This event is fired when a script is run. A script can be invoked by a user or triggered by an automation. The resulting changes can be tracked because all related events will share the same context as this event.
Field Description name Name of the script that was run. entity_id Identifier of the script that was run.
Event triggers
Event integration
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
Common tasks
Configuration
Home information
People and user configuration
Customizing entities
Remote access to Home Assistant
Securing your Home Assistant
Storing secrets in YAML
YAML syntax
The configuration.yaml file
Troubleshooting configuration
Splitting up the configuration
Packages
Events
State and state object
Entities and domains
Entity component platform options
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
