---
source_url: "https://www.home-assistant.io/integrations/counter"
final_url: "https://www.home-assistant.io/integrations/counter"
canonical_url: "https://www.home-assistant.io/integrations/counter/"
source_handle: "web:www-home-assistant-io:54742b3f3e84"
source_section: "integrations-counter"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "53837126cb8f676d868ba7363d31245b471563d371de1cf39658df7542098395"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Counter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/counter
- Final URL: https://www.home-assistant.io/integrations/counter
- Canonical URL: https://www.home-assistant.io/integrations/counter/
- Fetched at: 2026-06-28T02:35:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate counters into Home Assistant.

## Extracted Text

On this page
Configuration
Restore state
List of triggers
List of conditions
List of actions
Counter automation examples
Automation: send a reminder when a counter reaches its limit
Automation: stop counting after the daily target is met
The Counter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you track how many times something has happened in Home Assistant.
Use it when you want to count events over time, like how often a door opens, how many reminders have been sent, or how many times a routine has run.
The preferred way to configure counter helpers A helper is a virtual entity you create inside Home Assistant. It is not backed by a physical device. Helpers store values, track state, or do calculations that your automations and dashboards need. [Learn more] is through the user interface.
To add one, go to Settings > Devices & services > Helpers and select Create helper .
Then, select Counter .
To add helpers from the user interface, default_config: must be present in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
It is included by default unless you removed it.
If you removed default_config: , add counter: to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file first.
Counters can also be configured in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry counter : my_custom_counter : initial : 30 step : 1
Configuration Variables
Looking for your configuration file?
[alias] map Required
Alias for the counter. Multiple entries are allowed. alias should be replaced by the user for their actual value.
name string ( Optional )
Friendly name of the counter.
initial integer ( Optional , default: 0 )
Initial value (0 or positive integer) when Home Assistant starts or the counter is reset.
restore boolean ( Optional , default: true )
Try to restore the last known value when Home Assistant starts.
step integer ( Optional , default: 1 )
Incremental/step value for the counter.
minimum integer ( Optional )
Minimum value the counter will have.
maximum integer ( Optional )
Maximum value the counter will have.
icon icon ( Optional )
Icon to display for the counter.
Pick an icon from Material Design Icons and prefix it with mdi: .
For example, mdi:car , mdi:ambulance , or mdi:motorbike .
This integration restores the previous counter value when Home Assistant starts as long as restore is set to true , which is the default.
To disable this behavior, set restore to false .
If restore is set to true , the initial value is only used when no previous state is found or when the counter is reset.
The Counter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Counter decremented ( counter.decremented )
Triggers when one or more counters decrement.
Counter incremented ( counter.incremented )
Triggers when one or more counters increment.
Counter reached maximum ( counter.maximum_reached )
Triggers when one or more counters reach their maximum value.
Counter reached minimum ( counter.minimum_reached )
Triggers when one or more counters reach their minimum value.
Counter reset ( counter.reset )
Triggers when one or more counters are reset.
For an overview of every trigger across all integrations, see the triggers reference .
The Counter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Counter value ( counter.is_value )
Tests the value of one or more counters.
For an overview of every condition across all integrations, see the conditions reference .
The Counter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Decrement counter ( counter.decrement )
Decreases a counter by its step size.
Increment counter ( counter.increment )
Increases a counter by its step size.
Reset counter ( counter.reset )
Resets a counter to its initial value.
Set counter value ( counter.set_value )
Sets a counter to a specific value.
For an overview of every action across all integrations, see the actions reference .
If you use a counter helper A helper is a virtual entity you create inside Home Assistant. It is not backed by a physical device. Helpers store values, track state, or do calculations that your automations and dashboards need. [Learn more] in automations, create the helper separately before using these examples.
Here are a few ways to use counter triggers, conditions, and actions together.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If you have created a counter helper to track missed chores, you can send a reminder as soon as it reaches its maximum and then reset it for the next cycle.
Trigger : Counter reached maximum
Target : Chore reminder counter
Action : Send a notification message
Target : My Device ( notify.my_device )
Action : Reset counter
YAML example for a maximum reminder counter
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Notify when the chore counter reaches its limit"
triggers:
- trigger: counter.maximum_reached
target:
entity_id: counter.chore_reminders
actions:
- action: notify.send_message
entity_id: notify.my_device
data:
message: "The chore reminder counter reached its limit."
- action: counter.reset
If you use a counter helper to track short exercise breaks, you can stop incrementing it once the counter reaches your daily target.
Trigger : Input button pressed
Condition : Counter value
Target : Exercise break counter
Threshold type : Below 5
Action : Increment counter
YAML example for capping a daily counter
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Count exercise breaks until the daily target is met"
- trigger: state
entity_id: input_button.exercise_break_done
conditions:
- condition: counter.is_value
entity_id: counter.exercise_breaks
options:
threshold:
type: below
value:
number: 5
- action: counter.increment
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Counter helper was introduced in Home Assistant 0.53, and it's used by
7.9% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Automation
Helper
Back to top
