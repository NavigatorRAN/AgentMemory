---
source_url: "https://www.home-assistant.io/docs/automation/templating"
final_url: "https://www.home-assistant.io/docs/automation/templating"
canonical_url: "https://www.home-assistant.io/docs/automation/templating/"
source_handle: "web:www-home-assistant-io:872e3b19de84"
source_section: "docs-automation"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1ac9c9dcc4f702c97e1c35190573cb43b0bb7a04ce39bd6a8a4f2050ee316fba"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Automation templates - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/automation/templating
- Final URL: https://www.home-assistant.io/docs/automation/templating
- Canonical URL: https://www.home-assistant.io/docs/automation/templating/
- Fetched at: 2026-06-28T02:20:56Z
- Content type: text/html; charset=UTF-8

## Description

Use templates inside an automation to access trigger data, build dynamic messages, and pass calculated values to actions.

## Extracted Text

On this page
Available state data
Available trigger data
All
Calendar
Device
Event
Geolocation
Home Assistant
MQTT
Numeric state
Sentence
State
Sun
Tag
Template
Time
Time pattern
Persistent notification
Webhook
Zone
Examples
Automations support templating in the same way as scripts do. In addition to the Home Assistant template extensions available to scripts, the trigger and this template variables are available for automations.
Example of variables used in templates:
{{ this.name }} is the name of the automation executing from this trigger
{{ trigger.platform }} is the type of trigger object, like calendar
The template variable this is an object that contains the state of the automation at the moment of triggering the actions and can be used to evaluate trigger_variables declared in the configuration of the active trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] .
State objects also contain context data which can be used to identify the user that caused a script Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] or automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] to execute. Note that this will not change while executing the actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] .
The template variable trigger is an object that contains details about which platform Platforms are building blocks provided by some integrations to be used by other integrations. [Learn more] triggered the automation. The platform property contains the name of the platform Platforms are building blocks provided by some integrations to be used by other integrations. [Learn more] whose event triggered the automation.
Templates can use the data to modify the actions performed by the automation or displayed in a message. For example, you could create an automation that multiple sensors can trigger and then use the sensor’s location to specify a light to activate; or you could send a notification containing the friendly name of the sensor that triggered it.
Each trigger platform includes additional data specific to that platform Platforms are building blocks provided by some integrations to be used by other integrations. [Learn more] .
Triggers from all platforms will include the following properties.
Template variable Data trigger.platform Trigger object type. trigger.alias Alias of the trigger. trigger.id The id of the trigger . trigger.idx Index of the trigger. (The first trigger idx is 0 .)
These are the properties available for a Calendar trigger .
Template variable Data trigger.platform Hardcoded: calendar trigger.event The trigger event type, either start or end . trigger.calendar_event The calendar event object matched. trigger.calendar_event.summary The title or summary of the calendar event. trigger.calendar_event.start String representation of the start date or date time of the calendar event, for example 2022-04-10 , or 2022-04-10 11:30:00-07:00 trigger.calendar_event.end String representation of the end time of date time the calendar event in UTC, for example 2022-04-11 , or 2022-04-10 11:45:00-07:00 trigger.calendar_event.all_day Indicates the event spans the entire day. trigger.calendar_event.description A detailed description of the calendar event, if available. trigger.calendar_event.location Location information for the calendar event, if available. trigger.offset Timedelta object with offset to the event, if any.
These are the properties available for a Device trigger .
Inherits template variables from event or state template based on the type of trigger selected for the device.
Template variable Data trigger.platform Hardcoded: device
An Event trigger is fired each time an entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] state changes or an event matching the configured event_type occurs.
These are the properties available for an Event trigger .
Template variable Data trigger.platform Hardcoded: event trigger.event Event object that matched. trigger.event.event_type Event type. trigger.event.data Optional event data.
These are the properties available for a Geolocation trigger .
Template variable Data trigger.platform Hardcoded: geo_location trigger.event The trigger event type, either enter or leave . trigger.source The Geolocation platform creating the trigger event. trigger.zone State object of the zone.
The Home Assistant trigger is recommended for automations instead of homeassistant_start or homeassistant_stop events .
These are the properties available for a Home Assistant trigger .
Template variable Data trigger.platform Hardcoded: homeassistant trigger.event The trigger event type, either start or shutdown .
These are the properties available for an MQTT trigger .
Template variable Data trigger.platform Hardcoded: mqtt trigger.topic Topic that received payload. trigger.payload Payload. trigger.payload_json Dictionary of the JSON parsed payload. trigger.qos QOS of payload.
These are the properties available for a numeric state trigger .
Template variable Data trigger.platform Hardcoded: numeric_state trigger.entity_id Entity ID that we observe. trigger.below The below threshold, if any. trigger.above The above threshold, if any. trigger.from_state The previous state object of the entity. trigger.to_state The new state object that triggered trigger. trigger.for Timedelta object how long state has met above/below criteria, if any.
These are the properties available for a Sentence trigger .
Template variable Data trigger.platform Hardcoded: conversation trigger.sentence Text of the sentence that was matched. trigger.slots Object with matched slot values. trigger.details Object with matched slot details by name, such as wildcards . Each detail contains:
name - name of the slot
text - matched text
value - output value (see lists )
. trigger.device_id The device ID that captured the command, if any. trigger.satellite_id The entity ID of the satellite that captured the command, if any.
These are the properties available for a State trigger .
Template variable Data trigger.platform Hardcoded: state trigger.entity_id Entity ID that we observe. trigger.from_state The previous state object of the entity. trigger.to_state The new state object that triggered trigger. trigger.for Timedelta object how long state has been to state, if any.
These are the properties available for a Sun trigger .
Template variable Data trigger.platform Hardcoded: sun trigger.event The event that just happened: sunset or sunrise . trigger.offset Timedelta object with offset to the event, if any.
These are the properties available for a Tag trigger .
Template variable Data trigger.platform Hardcoded: tag trigger.tag_id The tag ID captured. trigger.event.data.device_id Optional device ID that captured the tag.
These are the properties available for a Template trigger .
Template variable Data trigger.platform Hardcoded: template trigger.entity_id Entity ID that caused change. trigger.from_state Previous state object of entity that caused change. trigger.to_state New state object of entity that caused template to change. trigger.for Timedelta object how long state has been to state, if any.
These are the properties available for a Time trigger .
Template variable Data trigger.platform Hardcoded: time trigger.now DateTime object that triggered the time trigger.
These are the properties available for a time pattern trigger .
Template variable Data trigger.platform Hardcoded: time_pattern trigger.now DateTime object that triggered the time_pattern trigger.
These properties are available for a persistent notification trigger .
Template variable Data trigger.platform Hardcoded: persistent_notification trigger.update_type Type of persistent notification update added , removed , current , or updated . trigger.notification Notification object that triggered the persistent notification trigger. trigger.notification.notification_id The notification ID. trigger.notification.title Title of the notification. trigger.notification.message Message of the notification. trigger.notification.created_at DateTime object indicating when the notification was created.
These are the properties available for a Webhook trigger .
Template variable Data trigger.platform Hardcoded: webhook trigger.webhook_id The webhook ID that was triggered. trigger.json The JSON data of the request (if it had a JSON content type) as a mapping. trigger.data The form data of the request (if it had a form data content type). trigger.query The URL query parameters of the request (if provided).
These are the properties available for a Zone trigger .
Template variable Data trigger.platform Hardcoded: zone trigger.entity_id Entity ID that we are observing. trigger.from_state Previous state object of the entity. trigger.to_state New state object of the entity. trigger.zone State object of the zone. trigger.event Event that trigger observed: enter or leave .
# Example configuration.yaml entries automation : triggers : - trigger : state entity_id : device_tracker.paulus id : paulus_device actions : - action : notify.notify data : message : > Paulus just changed from {{ trigger.from_state.state }} to {{ trigger.to_state.state }} This was triggered by {{ trigger.id }} automation 2 : triggers : - trigger : mqtt topic : " /notify/+" actions : - action : > notify.{{ trigger.topic.split('/')[-1] }} data : message : " {{ trigger.payload }}" automation 3 : triggers : # Multiple entities for which you want to perform the same action. - trigger : state entity_id : - light.bedroom_closet - light.kiddos_closet - light.linen_closet to : " on" # Trigger when someone leaves one of those lights on for 10 minutes. for : " 00:10:00" actions : - action : light.turn_off target : # Turn off whichever entity triggered the automation. entity_id : " {{ trigger.entity_id }}" automation 4 : triggers : # When an NFC tag is scanned by Home Assistant... - trigger : event event_type : tag_scanned # ...By certain people context : user_id : - 06cbf6deafc54cf0b2ffa49552a396ba - 2df8a2a6e0be4d5d962aad2d39ed4c9c conditions : # Check NFC tag (ID) is the one by the front door - condition : template value_template : " {{ trigger.event.data.tag_id == '8b6d6755-b4d5-4c23-818b-cf224d221ab7'}}" actions : # Turn off various lights - action : light.turn_off target : entity_id : - light.kitchen - light.bedroom - light.living_room
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
Basic automations
Using automation blueprints
Editor
Triggers
Conditions
Actions
Run modes
Automation actions
Templates
YAML
Testing and troubleshooting automations
Scenes
Blueprints
Scripts
Dashboards
Voice assistants
Organization
Home energy management
Templating
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
