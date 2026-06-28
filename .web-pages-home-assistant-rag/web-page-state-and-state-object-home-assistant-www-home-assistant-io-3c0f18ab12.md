---
source_url: "https://www.home-assistant.io/docs/configuration/state_object"
final_url: "https://www.home-assistant.io/docs/configuration/state_object"
canonical_url: "https://www.home-assistant.io/docs/configuration/state_object/"
source_handle: "web:www-home-assistant-io:3c0f18ab12c1"
source_section: "docs-configuration"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2d569bdca7adbdd20a3516427c7c58c081ac74f34a28670e4c4e1f907ae08326"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# State and state object - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/state_object
- Final URL: https://www.home-assistant.io/docs/configuration/state_object
- Canonical URL: https://www.home-assistant.io/docs/configuration/state_object/
- Fetched at: 2026-06-28T02:21:43Z
- Content type: text/html; charset=UTF-8

## Description

Every entity in Home Assistant has a state, such as on, off, or a temperature reading. This page covers what the state object contains and how to use it.

## Extracted Text

On this page
State versus state object
About the state object
About the state
About entity state attributes
Context
Examples
Related topics
Devices are represented in Home Assistant as entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . The state of an entity (for example, if a light is on, at 50% brightness in orange) can be shown on the dashboard or be used in automations. This page looks at the concepts state , state object , and entity state attribute .
In Home Assistant, the state object is the current representation of the entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] with all its attributes at a given moment in time. This state is recorded as a state object . Entities constantly keep track of their state and write it into a state object, so that other entities/templates/frontend can access it. In the example—the light is on, at 50% brightness in orange— on is the actual state of the light. 50% brightness and the color are entity state attributes.
The state object represents the state of an entity with its attributes at a specific point in time. All state objects will always have an entity id, a state, and timestamps when last updated, last changed, and last reported.
The state prefix indicates that this information is part of the state object (which is related to the entity). For example, state.state is the state of the entity at a given time.
Field Description state.state String representation of the current state of the entity. Example off . state.entity_id Entity ID. Format: <domain>.<object_id> . Example: light.kitchen . state.domain Domain of the entity. Example: light . state.object_id Object ID of entity. Example: kitchen . state.name Name of the entity. Based on friendly_name attribute with fall back to object ID. Example: Kitchen ceiling . state.last_changed Time the state changed in the state machine in UTC time. This is not updated if only state attributes change. Example: 2013-09-17 07:32:51.715874+00:00 . state.last_reported Time the state was written to the state machine in UTC time. This timestamp is updated regardless of any changes to the state or state attributes. Example: 2013-09-17 07:32:51.715874+00:00 . state.last_updated Time the state or state attributes changed in the state machine in UTC time. This is not updated if neither state nor state attributes changed. Example: 2013-09-17 07:32:51.715874+00:00 . state.attributes A dictionary with extra attributes related to the current state. state.context A dictionary with extra attributes related to the context of the state.
The screenshot of the Developer tools States page shows three lights in different states (the state.state ): on , off , and unavailable . Each light comes with its own entity state attributes such as supported_color_modes , supported_features . These attributes have their own state: the state of the supported_color_modes attribute is color_temp and hs , the state of the supported_features attribute is 4 .
Three lights with different states: `on`, `off`, or `unavailable`.
The state.state is the heart of the state object . State holds the information of interest of an entity. For example, if a
light is on or off, the current temperature, or the amount of energy used. The state object stores 3
timestamps related to the state: last_updated , last_changed , and last_reported . Each
entity has exactly one state, and the state only holds one value at a time.
The state only holds one value at a time. However, entities can store related entity state attributes in the state object. For example,
the state of a light is on , and the related attributes could be its
current brightness and color values. State change events can be used as triggers.
The current state can be used in conditions . The example below shows three lights with different entity state attributes.
Example showing three lights with different entity state attributes.
Entities have some attributes that are not related to its state, such as friendly_name . A few attributes are available on all entities, such as friendly_name or icon . In addition to those, each integration has its own attributes to represent extra state data about the entity. For example, the light integration has attributes for the current brightness and color of the light. When an attribute is not available, Home Assistant will not write it to the state. Entity attributes are optional.
When using templates, attributes will be available by their name. For example state.attributes.assumed_state .
The table lists common state attributes that may be present, depending on the entity domain.
Attribute Description friendly_name Name of the entity. Example: Kitchen Ceiling . icon Icon to use for the entity in the frontend. Example: mdi:home . entity_picture URL to a picture that should be used instead of showing the domain icon. Example: http://example.com/picture.jpg . assumed_state Boolean if the current state is an assumption. More info Example: True . unit_of_measurement The unit of measurement the state is expressed in. Used for grouping graphs or understanding the entity. Example: °C . attribution The provider of the data. For example, “Data provided by rejseplanen.dk”, “Data provided by openSenseMap” device_class The type of device that an entity represents. Used to display device specific information in the UI. supported_features The features an entity supports. For covers, for example, it might list opening , closing , stopping , setting position . For media players, it might list play , pause , stop , and volume control
When an attribute contains spaces, you can retrieve it with the state_attr function: state_attr('sensor.livingroom', 'Battery numeric') .
Context is a property used in state objects and events. It ties events Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] and states The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] together in Home Assistant. Whenever an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] or user interaction causes a state to change, a new context is assigned in the state object. This context will be attached to all events and states that happen as a result of the change.
Field Description id Unique identifier for the context. user_id Unique identifier of the user that started the change. Will be None if the action was not started by a user (for example, started by an automation). parent_id Unique identifier of the parent context that started the change, if available. For example, if an automation is triggered, the context of the trigger will be set as parent.
Evaluate the state.last_changed of a switch entity:
{{ states.switch.my_switch.last_changed }}
result type: string representing a datetime object, for example
2025-11-11 12:56:10.244125+00:00
Evaluate the state.context.id of this switch:
{{ states.switch.my_switch.context.id }}
result type: string representing an id code, for example
01K9SF2R36KRV5N4PTC38S6KJ2F
Evaluate the state.context.user_id of this switch:
{{ states.switch.my_switch.context.user_id }}
result type: string representing a user id code, for example
01K9SF2R36KRV5N4PTC38SKS4LW6
Entities and domains
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
