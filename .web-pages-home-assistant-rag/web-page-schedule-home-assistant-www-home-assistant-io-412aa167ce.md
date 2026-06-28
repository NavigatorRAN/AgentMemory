# Schedule - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/schedule
- Final URL: https://www.home-assistant.io/integrations/schedule
- Canonical URL: https://www.home-assistant.io/integrations/schedule/
- Fetched at: 2026-06-28T03:13:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to make a weekly schedule in Home Assistant.

## Extracted Text

On this page
Configuration
Adding additional data
YAML configuration
Attributes
Behavior at block boundaries
List of triggers
List of conditions
List of actions
Schedule automation examples
Automation: turn on the porch light when the evening schedule starts
Automation: start the robot vacuum only when both quiet-time schedules are off
The Schedule integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you create a weekly schedule entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] in Home Assistant from time blocks with defined start and end times. The schedule is active when a time block starts and becomes inactive when it ends, so you can use it as a trigger or condition in automations and scripts.
To add the Schedule helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Schedule .
Follow the instructions on screen to complete the setup.
Name
Friendly name of the schedule.
Icon
Icon to display in the frontend for this schedule.
Schedule blocks
Press and drag to select time blocks for each day of the week. It is not possible to create overlapping time blocks on the same day.
After creating schedule blocks, you can press a block to edit the details.
Start
The start time to mark the schedule as active/on.
End
The end time to mark as inactive/off again.
Additional data
A mapping of attribute names to values, which will be added to the entity’s attributes when the block is active.
Adding the following as Additional data will show brightness and color_temp as entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] attributes when the block is active:
brightness : 100 color_temp : 4000
Alternatively, you can configure and set up this integration manually via YAML. To enable the Schedule integration in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
Note
The data field follows the same logic as described above in Adding additional data .
schedule : light_schedule : name : " Light schedule" wednesday : - from : " 17:00:00" to : " 21:00:00" data : brightness : 100 color_temp : 4000 thursday : - from : " 17:00:00" to : " 23:00:00" data : brightness : 90 color_temp : 3500 friday : - from : " 07:00:00" to : " 10:00:00" data : brightness : 80 color_temp : 3000 - from : " 16:00:00" to : " 23:00:00" data : brightness : 60 color_temp : 2500
Configuration Variables
Looking for your configuration file?
schedule map Required
Alias for the schedule. Multiple entries are allowed.
name string Required
icon icon ( Optional )
monday|tuesday|wednesday|thursday|friday|saturday|sunday list ( Optional , default: [] )
A schedule for each day of the week.
from time Required
to time Required
data map ( Optional , default: {} )
A schedule entity exports state attributes that can be useful in automations and templates.
next_event : A datetime object containing the next time the schedule is going to change state.
key_1 , key_2 , …: The mapping values from Additional data or data settings of a time block when that block is active.
Time blocks use an inclusive start and an exclusive end. A block from 09:00 to 12:00 is active from 09:00:00.000 up to but not including 12:00:00.000 .
When two time blocks on the same day touch (for example, one block from 07:00 to 10:00 and another from 10:00 to 12:00 ), the schedule transitions cleanly from one to the other:
The schedule’s state stays on across the boundary. It does not briefly flip to off between two touching blocks.
The data attributes are replaced with the new block’s data at the moment of the transition.
An automation triggering on the state changing to off does not fire at a boundary between two touching blocks.
An automation triggering on an attribute change (for example, a new setpoint) fires once, with the new block’s data.
Overlapping time blocks on the same day are not allowed and are rejected during configuration validation.
The Schedule integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Schedule block ended ( schedule.turned_off )
Triggers when a schedule block ends.
Schedule block started ( schedule.turned_on )
Triggers when a schedule block starts.
For an overview of every trigger across all integrations, see the triggers reference .
The Schedule integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Schedule is off ( schedule.is_off )
Tests if one or more schedule blocks are currently not active.
Schedule is on ( schedule.is_on )
Tests if one or more schedule blocks are currently active.
For an overview of every condition across all integrations, see the conditions reference .
The Schedule integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get schedule ( schedule.get_schedule )
Retrieves the configured time ranges of one or more schedules.
Reload schedules ( schedule.reload )
Reloads schedules from your YAML configuration.
For an overview of every action across all integrations, see the actions reference .
You can use a schedule to decide when an automation should start, or to check whether a routine is currently active.
Here are two examples you can adapt to your own schedules.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If you use a schedule to define when your porch light should be active, you can start the light automatically when that schedule block begins.
Trigger : Schedule block started
Target : Evening porch light schedule
Action : Turn on light
Target : Porch light
YAML example for turning on the porch light when the evening schedule starts
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Turn on the porch light when the evening schedule starts"
triggers:
- trigger: schedule.turned_on
target:
entity_id: schedule.evening_porch_light
actions:
- action: light.turn_on
entity_id: light.porch
If you use schedules to keep certain times interruption-free, you can start your robot vacuum only when both of those schedules are no longer active.
Trigger : Time: 14:00
Condition : Schedule is off
Target : Quiet time schedule, Meeting schedule
Condition passes if : All
Action : Start vacuum cleaner
Target : Living room vacuum
YAML example for starting the robot vacuum when both quiet-time schedules are off
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Start the robot vacuum when both quiet-time schedules are off"
- trigger: time
at: "14:00:00"
conditions:
- condition: schedule.is_off
entity_id:
- schedule.quiet_time
- schedule.meeting_time
options:
behavior: all
- action: vacuum.start
entity_id: vacuum.living_room
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Schedule helper was introduced in Home Assistant 2022.9, and it's used by
7.4% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Helper
Back to top
