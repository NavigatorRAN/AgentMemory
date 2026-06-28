---
source_url: "https://www.home-assistant.io/integrations/timer"
final_url: "https://www.home-assistant.io/integrations/timer"
canonical_url: "https://www.home-assistant.io/integrations/timer/"
source_handle: "web:www-home-assistant-io:1967d77c8920"
source_section: "integrations-timer"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d575b9bf3c24688d5572dc1e9d43278db36c415cc48c84b7d43ac8c8dd96e01d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Timer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/timer
- Final URL: https://www.home-assistant.io/integrations/timer
- Canonical URL: https://www.home-assistant.io/integrations/timer/
- Fetched at: 2026-06-28T03:22:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate timers into Home Assistant.

## Extracted Text

On this page
Configuration
Configuration options
Supported functionality
List of triggers
List of conditions
List of actions
Timer automation examples
Automation: turn off the bathroom fan when the timer finishes
Automation: send a reminder when only five minutes remain
Known limitations
Removing the integration
The Timer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you create and manage countdown timers in Home Assistant.
You can use timers in automations and scripts to keep a bathroom fan running for 20 minutes, remind yourself when laundry is nearly done, or turn lights off after motion has stopped.
Note
Timers will be restored to their correct state and time on Home Assistant startup and restarts when configured with the restore option.
However, automations using the timer.finished event will not trigger on startup if the timer expires when Home Assistant is not running.
The preferred way to create a timer is from the user interface. Go to Settings > Devices & services > Helpers , select Create helper , and then select Timer .
If you removed default_config: from your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] , add timer: first before creating timers from the UI.
You can also define timers in YAML. To add a timer, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry timer : laundry : duration : " 00:01:00"
Configuration Variables
Looking for your configuration file?
[alias] map Required
Alias for the timer. Multiple entries are allowed.
name string ( Optional )
Friendly name of the timer.
duration integer | time ( Optional , default: 0 )
Initial duration in seconds or 00:00:00 when Home Assistant starts.
icon icon ( Optional )
Set a custom icon for the state card.
restore boolean ( Optional , default: false )
When true, active and paused timers are restored after Home Assistant starts or restarts.
When you create or edit a timer from the UI, the following options are available.
Name
Duration
The starting duration for the timer.
Icon
Optional icon to show for the timer.
Restore
Restores active and paused timers after Home Assistant starts or restarts.
Pick an icon from Material Design Icons and prefix it with mdi: .
The Timer integration provides timer entities that you can use in dashboards, scripts, and automations.
Use a timer when you want a countdown that can be started, paused, changed, canceled, finished, shown on a dashboard, or reused across multiple automations. Unlike an automation’s for option, a timer is its own entity, so you can see it, manage it, and use the same countdown in more than one place. If you only need to wait until another trigger or condition stays true for a while, using that automation’s for option is often simpler.
Timer entity
Description : Represents a countdown that you can start, pause, change, cancel, or finish.
States : idle , active , and paused .
Remarks : A timer returns to idle when it finishes, is canceled, or has not been started yet.
The Timer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Timer cancelled ( timer.cancelled )
Triggers when one or more timers are cancelled.
Timer finished ( timer.finished )
Triggers when one or more timers finish.
Timer paused ( timer.paused )
Triggers when one or more timers are paused.
Timer restarted ( timer.restarted )
Triggers when one or more timers are restarted.
Timer started ( timer.started )
Triggers when one or more timers are started.
Timer time remaining ( timer.time_remaining )
Triggers when one or more timers reach a specific remaining time.
For an overview of every trigger across all integrations, see the triggers reference .
The Timer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Timer is active ( timer.is_active )
Tests if one or more timers are active.
Timer is idle ( timer.is_idle )
Tests if one or more timers are idle.
Timer is paused ( timer.is_paused )
Tests if one or more timers are paused.
For an overview of every condition across all integrations, see the conditions reference .
The Timer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Cancel a timer ( timer.cancel )
Cancels a running or paused timer without firing the finished event.
Change a timer ( timer.change )
Adds or subtracts time on a running timer.
Finish a timer ( timer.finish )
Finishes a running or paused timer earlier than scheduled.
Pause a timer ( timer.pause )
Pauses a running timer, keeping the remaining time.
Reload timers ( timer.reload )
Reloads timers from the YAML configuration.
Start a timer ( timer.start )
Starts a timer, or restarts it with a new duration.
For an overview of every action across all integrations, see the actions reference .
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
Use a timer to keep the fan running for a fixed amount of time after a shower.
Trigger : Timer finished
Target : Bathroom fan timer
Trigger when : Each
Action : Turn off fan
YAML example for a bathroom fan timer
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Turn off bathroom fan when the timer finishes"
triggers:
- trigger: timer.finished
target:
entity_id: timer.bathroom_fan
actions:
- action: fan.turn_off
entity_id: fan.bathroom
Get a reminder shortly before a timer finishes, like when laundry or cooking time is almost done.
Trigger : Timer time remaining
Target : Laundry timer
Time remaining : 00:05:00
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for a laundry timer reminder
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Notify when five minutes remain on the laundry timer"
- trigger: timer.time_remaining
entity_id: timer.laundry
options:
remaining: "00:05:00"
- action: notify.send_message
entity_id: notify.my_device
data:
message: "The laundry timer has five minutes left."
If a timer finishes while Home Assistant is not running, automations that use the Timer finished trigger do not run after startup.
To remove a timer created from the UI, go to Settings > Devices & services > Helpers , select the timer, and delete it.
If you configured a timer in YAML, remove it from your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file and reload or restart Home Assistant.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Timer helper was introduced in Home Assistant 0.57, and it's used by
13.3% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Automation
Helper
Back to top
