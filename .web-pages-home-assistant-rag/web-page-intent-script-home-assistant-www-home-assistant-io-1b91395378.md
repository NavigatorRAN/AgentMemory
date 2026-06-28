---
source_url: "https://www.home-assistant.io/integrations/intent_script"
final_url: "https://www.home-assistant.io/integrations/intent_script"
canonical_url: "https://www.home-assistant.io/integrations/intent_script/"
source_handle: "web:www-home-assistant-io:1b91395378c1"
source_section: "integrations-intent-script"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "aed21018f3ea4c5d8040ada8a13a290806d2271e6ad93d3d016b517eef21e93a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Intent Script - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/intent_script
- Final URL: https://www.home-assistant.io/integrations/intent_script
- Canonical URL: https://www.home-assistant.io/integrations/intent_script/
- Fetched at: 2026-06-28T02:52:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up scripts to run on intents.

## Extracted Text

On this page
Using the action response
List of actions
The Intent Script integration allows users to configure actions and responses to intents. Intents can be fired by any integration that supports it. Examples are Alexa (Amazon Echo) and Dialogflow (Google Assistant). Internally they can be fired by custom sentences .
If you are using intent script with LLMs and have parameters, make sure to mention the parameters and their types in the description.
# Example configuration.yaml entry intent_script : GetTemperature : # Intent type description : Return the temperature and notify the user speech : text : We have {{ states('sensor.temperature') }} degrees action : action : notify.notify data : message : Hello from an intent!
Inside an intent we can define these variables:
Configuration Variables
Looking for your configuration file?
intent map Required
Name of the intent. Multiple entries are possible.
description string ( Optional )
Description of the intent.
platforms list ( Optional )
List of domains that the entity supports.
action action ( Optional )
Defines an action to run to intents.
async_action boolean ( Optional , default: false )
Set to True to have Home Assistant not wait for the script to finish before returning the intent response.
mode string ( Optional , default: single )
The script mode in which to run the intent script. Use this to define if the intent should be able to run multiple times in parallel.
card map ( Optional )
Card to display.
type string ( Optional , default: simple )
Type of card to display.
title template Required
Title of the card to display.
content template Required
Contents of the card to display.
speech map ( Optional )
Text or template to return.
type string ( Optional , default: plain )
Type of speech.
text template Required
Text to speech.
When using a speech template, data returned from the executed action are
available in the action_response variable.
conversation : intents : EventCountToday : - " How many meetings do I have today" intent_script : EventCountToday : action : - action : calendar.get_events target : entity_id : calendar.my_calendar data_template : start_date_time : " {{ today_at('00:00') }}" duration : { " hours" : 24 } response_variable : result # get action response - stop : " " response_variable : result # and return it speech : text : " {{ action_response['calendar.my_calendar'].events | length }}" # use the action's response
The Intent Script integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload intent scripts ( intent_script.reload )
Reloads the intent scripts from the YAML configuration.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Intent Script integration was introduced in Home Assistant 0.50, and it's used by
2978 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@arturpragacz
Categories
Intent
Back to top
