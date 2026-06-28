---
source_url: "https://www.home-assistant.io/integrations/vacuum"
final_url: "https://www.home-assistant.io/integrations/vacuum"
canonical_url: "https://www.home-assistant.io/integrations/vacuum/"
source_handle: "web:www-home-assistant-io:ef2a8edf1f68"
source_section: "integrations-vacuum"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b16243a96cc156077c7b7b9698e34627dcf4b0d80f7e5bc512c7089376aae8b4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Vacuum - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vacuum
- Final URL: https://www.home-assistant.io/integrations/vacuum
- Canonical URL: https://www.home-assistant.io/integrations/vacuum/
- Fetched at: 2026-06-28T03:25:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up and use vacuums in Home Assistant.

## Extracted Text

On this page
The state of a vacuum entity
Creating an automation to send the vacuum to clean specific areas
Mapping your vacuum areas to Home Assistant areas
Sending your vacuum to clean specific areas
List of triggers
List of conditions
List of actions
Vacuum example automations
Automation: Pause cleaning during meetings
The Vacuum integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables the ability to control home cleaning robots within Home Assistant.
Note
Building block integration
This vacuum is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this vacuum building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the vacuum building block offers.
A vacuum entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] can have the following states:
Cleaning : The vacuum is currently cleaning.
Docked : The vacuum is currently docked. It is assumed that docked can also mean charging.
Error : The vacuum encountered an error while cleaning.
Idle : The vacuum is not paused, not docked, and does not have any errors.
Paused : The vacuum was cleaning but was paused without returning to the dock.
Returning : The vacuum is done cleaning and is currently returning to the dock, but not yet docked.
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
When your vacuum supports area cleaning, you can create an automation in Home Assistant to send your vacuum to clean specific areas. For example, you can set up an automation to have the vacuum clean the living room every day at 2 PM.
Creating such an automation involves two steps:
Mapping your vacuum areas to Home Assistant areas . This is a one-time setup step to link the areas defined in your vacuum’s app to the areas defined in Home Assistant.
Sending your vacuum to clean specific areas . This is where you create the automation that tells your vacuum to clean specific areas based on certain triggers.
Before you can send your vacuum to clean specific areas, you need to map the areas of your vacuum to the areas in Home Assistant.
Go to Settings > Devices & services > Entities .
Select your vacuum entity.
In the entity settings, select the cogwheel .
Select Map vacuum segments to areas .
Result: In the dialog, you should see the vacuum areas listed on the left and the Home Assistant areas on the right.
If you do not see the Map vacuum segments to areas option, your vacuum does not support area cleaning. You cannot use the vacuum.clean_area action with this vacuum.
Troubleshooting: If there are no areas listed on the left, make sure the areas are properly set up in the vacuum’s app. You might need to save or confirm them again in the app.
In the Map vacuum segments to areas dialog, for each area reported by your vacuum, select the corresponding Home Assistant area.
Select Save .
Once you have the areas mapped, you can send your vacuum to clean specific areas using the vacuum.clean_area action.
Go to Settings > Automations & scenes .
Select Create automation .
Set up your trigger. For example, you can use a time trigger to have the vacuum clean every day at 2 PM.
In the Then do section, select Add action , and from the list, select the Vacuum: Clean area with vacuum cleaner action.
Under Targets , select your vacuum entity.
Under Areas , select the area to clean. You can select multiple areas.
Give your automation a name and select Save .
Test your automation by selecting Run actions . Your vacuum should start cleaning the specified areas.
The Vacuum integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Vacuum returned to dock ( vacuum.docked )
Triggers when a vacuum cleaner docks.
Vacuum cleaner encountered an error ( vacuum.errored )
Triggers when one or more vacuum cleaners encounter an error.
Vacuum paused cleaning ( vacuum.paused_cleaning )
Triggers when one or more vacuum cleaners pause cleaning.
Vacuum started cleaning ( vacuum.started_cleaning )
Triggers when one or more vacuum cleaners start cleaning.
Vacuum started returning to dock ( vacuum.started_returning )
Triggers when one or more vacuum cleaners start returning to dock.
For an overview of every trigger across all integrations, see the triggers reference .
The Vacuum integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Vacuum is cleaning ( vacuum.is_cleaning )
Passes when the vacuum cleaner is cleaning.
Vacuum is docked ( vacuum.is_docked )
Passes when the vacuum cleaner is docked.
Vacuum is encountering an error ( vacuum.is_encountering_an_error )
Passes when the vacuum cleaner is in an error state.
Vacuum is paused ( vacuum.is_paused )
Passes when the vacuum cleaner is paused.
Vacuum is returning ( vacuum.is_returning )
Passes when the vacuum cleaner is returning to the dock.
For an overview of every condition across all integrations, see the conditions reference .
The Vacuum integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Clean area ( vacuum.clean_area )
Cleans specific mapped areas using vacuum segments.
Clean spot ( vacuum.clean_spot )
Performs a spot cleaning at the vacuum’s location.
Locate vacuum ( vacuum.locate )
Plays a sound or flashes lights to help you find the vacuum.
Pause cleaning ( vacuum.pause )
Pauses the current cleaning task on a vacuum.
Return to base ( vacuum.return_to_base )
Sends the vacuum to the charging dock.
Send command ( vacuum.send_command )
Send a platform-specific command.
Set fan speed ( vacuum.set_fan_speed )
Sets the fan/power level for cleaning.
Start cleaning ( vacuum.start )
Starts or resumes a cleaning task on a vacuum.
Start or pause cleaning ( vacuum.start_pause )
Starts, pauses, or resumes a vacuum cleaner’s cleaning task.
Stop vacuum ( vacuum.stop )
Stops the current activity of a vacuum.
Toggle vacuum power ( vacuum.toggle )
Toggles a vacuum cleaner on or off.
Turn off vacuum ( vacuum.turn_off )
Turns off a vacuum cleaner.
Turn on vacuum ( vacuum.turn_on )
Turns on a vacuum cleaner.
For an overview of every action across all integrations, see the actions reference .
Use the vacuum triggers, conditions, and actions together to turn automation ideas into reliable routines that fit your household.
Start from one small pain point, then decide which vacuum signal kicks things off, which condition keeps it safe, and which action finishes the job.
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
When the vacuum starts a run during a scheduled meeting, pause it automatically so the call stays quiet, then send yourself a reminder to resume the job later.
Trigger : vacuum.started_cleaning for the office vacuum.
Conditions : A calendar or busy sensor reports that a meeting is in progress, and vacuum.is_cleaning confirms the robot is still running.
Actions : vacuum.pause to stop the run, followed by a mobile notification that explains why the vacuum paused.
YAML example for pausing during meetings
automation : alias : " Mute vacuum during meetings" triggers : - trigger : vacuum.started_cleaning target : entity_id : vacuum.office conditions : - condition : state entity_id : binary_sensor.meeting_in_progress state : " on" - condition : vacuum.is_cleaning target : entity_id : vacuum.office actions : - action : vacuum.pause target : entity_id : vacuum.office - action : notify.send_message target : entity_id : notify.my_device data : message : " The office vacuum paused because a meeting started. Resume it when the call ends."
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Vacuum entity was introduced in Home Assistant 0.51.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Vacuum
Back to top
