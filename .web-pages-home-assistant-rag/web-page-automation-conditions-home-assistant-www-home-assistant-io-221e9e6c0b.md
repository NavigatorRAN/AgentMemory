---
source_url: "https://www.home-assistant.io/docs/automation/condition"
final_url: "https://www.home-assistant.io/docs/automation/condition"
canonical_url: "https://www.home-assistant.io/docs/automation/condition/"
source_handle: "web:www-home-assistant-io:221e9e6c0bf8"
source_section: "docs-automation"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "17aab33e5765744dcff204dc6721a870663745fa5a91e1d8d6d71088541855ac"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Automation conditions - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/automation/condition
- Final URL: https://www.home-assistant.io/docs/automation/condition
- Canonical URL: https://www.home-assistant.io/docs/automation/condition/
- Fetched at: 2026-06-28T02:20:48Z
- Content type: text/html; charset=UTF-8

## Description

Automations can test conditions when invoked.

## Extracted Text

Conditions are an optional part of an automation rule. They can be used to prevent the automation’s actions from being run. After a trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] occurred, all conditions will be checked. The automation will be executed if all conditions return true . If any of the conditions returns false , the automation won’t start.
Conditions look very similar to triggers, but they are very different — a trigger can observe events that may have happened and start an automation. A condition will only see the current state after the automation is started from the trigger. Take the example of a switch being turned on and then off in quick succession. That switch turned on event will start an automation regardless the fact is now off again. By the time the automation checks the conditions from the switch on event, it may already be off again as its current state. This scenario is also known as a race condition.
The available conditions for an automation are the same as for the script syntax so see that page for a full list of available conditions .
Example of using condition:
automation : - alias : " Turn on office lights" triggers : - trigger : state entity_id : sensor.office_motion_sensor to : " on" conditions : - or : - condition : numeric_state entity_id : sun.sun attribute : elevation below : 4 - condition : numeric_state entity_id : sensor.office_lux_sensor below : 10 actions : - action : scene.turn_on target : entity_id : scene.office_lights
The condition option of an automation, also accepts a single condition template directly. For example:
automation : - alias : " Turn on office lights" triggers : - trigger : state entity_id : sensor.office_motion_sensor to : " on" conditions : " {{ state_attr('sun.sun', 'elevation') < 4 }}" actions : - action : scene.turn_on target : entity_id : scene.office_lights
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
