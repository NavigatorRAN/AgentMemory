---
source_url: "https://www.home-assistant.io/integrations/manual"
final_url: "https://www.home-assistant.io/integrations/manual"
canonical_url: "https://www.home-assistant.io/integrations/manual/"
source_handle: "web:www-home-assistant-io:c1dfe0d99c64"
source_section: "integrations-manual"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "56f6ec963b168c4c793a0280841f4b3bc35a336005668f2f02814b4d7146d2c8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Manual Alarm control panel - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/manual
- Final URL: https://www.home-assistant.io/integrations/manual
- Canonical URL: https://www.home-assistant.io/integrations/manual/
- Fetched at: 2026-06-28T02:58:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate manual alarms into Home Assistant.

## Extracted Text

On this page
Configuration
Event: Manual alarm bad code attempt
State machine
Examples
Sensors
Related topics
The Manual Alarm control panel integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables you to create an alarm system in Home Assistant.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry alarm_control_panel : - platform : manual
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: HA Alarm )
The name of the alarm.
unique_id string ( Optional )
Create a unique id for the entity.
code string ( Exclusive )
If defined, specifies a code to enable or disable the alarm in the frontend. Only one of code and code_template can be specified.
code_template string ( Exclusive )
If defined, returns a code to enable or disable the alarm in the frontend; an empty string disables checking the code. Inside the template, the variables from_state and to_state identify the current and desired state. Only one of code and code_template can be specified.
code_arm_required boolean ( Optional , default: true )
If true, the code is required to arm the alarm.
delay_time integer ( Optional , default: 60 )
The time in seconds of the ‘pending’ state before triggering the alarm.
arming_time integer ( Optional , default: 60 )
The time in seconds of the ‘arming’ state before effecting a state change.
trigger_time integer ( Optional , default: 120 )
The time in seconds of the ‘triggered’ state in which the alarm is firing.
disarm_after_trigger boolean ( Optional , default: false )
If true, the alarm will automatically disarm after it has been triggered instead of returning to the previous state.
arming_states list ( Optional )
Limit the supported arming states.
Default:
armed_away, armed_home, armed_night, armed_vacation, armed_custom_bypass
armed_custom_bypass/armed_home/armed_away/armed_night/armed_vacation/disarmed/triggered list ( Optional )
State specific settings
delay_time integer ( Optional )
State specific setting for delay_time (all states except triggered )
arming_time integer ( Optional )
State specific setting for arming_time (all states except disarmed and triggered )
trigger_time integer ( Optional )
State specific setting for trigger_time (all states except triggered )
The manual_alarm_bad_code_attempt event is fired when an attempt to change the state of a manual alarm control panel (for example, arm or disarm) fails because an invalid code was entered.
Event data
entity_id (string): The entity ID of the alarm control panel (for example, alarm_control_panel.my_alarm ).
target_state (string): The attempted target state (for example, disarmed , armed_away , armed_home ).
user_id (string): The user ID who initiated the action (if available).
Example automation trigger:
automation : - alias : " Notify on invalid manual alarm code attempt" trigger : - platform : event event_type : manual_alarm_bad_code_attempt actions : - action : notify.your_notification_service # Replace with your actual notification service data : message : > Invalid alarm code attempt for {{ trigger.event.data.entity_id }} by user ID {{ trigger.event.data.user_id }} while attempting to set state {{ trigger.event.data.target_state }}.
The state machine of the manual alarm integration is complex but powerful. The
transitions are timed according to three values, delay_time , arming_time
and trigger_time . The values in turn can come from the default configuration
variable or from a state-specific override.
When the alarm is armed, its state first goes to arming for a number
of seconds equal to the destination state’s arming_time , and then
transitions to one of the “armed” states. Note that code_template
never receives “arming” in the to_state variable; instead,
to_state contains the state which the user has requested. However,
from_state can contain “arming”.
When the alarm is triggered, its state goes to pending for a number of
seconds equal to the previous state’s delay_time . Then the alarm transitions to the “triggered”
states. The code is never checked when triggering the alarm, so the
to_state variable of code_template cannot ever contain “triggered”
either; again, from_state can contain “triggered”.
The alarm remains in the “triggered” state for a number of seconds equal to the
previous state’s trigger_time . Then, depending on disarm_after_trigger ,
it goes back to either the previous state or disarmed . If the previous
state’s trigger_time is zero, the transition to “triggered” is entirely
blocked and the alarm remains in the armed state.
Each of the settings is useful in different scenarios. arming_time gives
you some time to leave the building (for “armed” states).
delay_time can be used to allow some time to disarm the alarm, with
flexibility. For example, you could specify a delay time for the
“armed away” state, to avoid triggering the alarm while the
garage door opens, but not for the “armed home” state.
trigger_time is useful to disable the alarm when disarmed, but it can also
be used for example to sound the siren for a shorter time during the night.
In the configuration example below:
The only arming states allowed are armed_away and armed_home .
The disarmed state never triggers the alarm.
The armed_home state will leave no time to leave the building or disarm the alarm.
The other states will give 30 seconds to leave the building before triggering the alarm, and 20 seconds to disarm the alarm when coming back.
# Example configuration.yaml entry alarm_control_panel : - platform : manual name : Home Alarm unique_id : a_very_unique_id code : " 1234" arming_time : 30 delay_time : 20 trigger_time : 4 arming_states : - armed_away - armed_home disarmed : trigger_time : 0 armed_home : arming_time : 0 delay_time : 0
In the rest of this section, you find some real-life examples on how to use this panel.
Using sensors to trigger the alarm.
automation : - alias : ' Trigger alarm while armed away' triggers : - trigger : state entity_id : sensor.pir1 to : " active" - trigger : state entity_id : sensor.pir2 to : " active" - trigger : state entity_id : sensor.door to : " open" - trigger : state entity_id : sensor.window to : " open" conditions : - condition : state entity_id : alarm_control_panel.home_alarm state : armed_away actions : - action : alarm_control_panel.alarm_trigger target : entity_id : alarm_control_panel.home_alarm
Sending a notification when the alarm is triggered.
automation : - alias : ' Send notification when alarm triggered' triggers : - trigger : state entity_id : alarm_control_panel.home_alarm to : " triggered" actions : - action : notify.notify data : message : " ALARM! The alarm has been triggered"
Disarming the alarm when the door is properly unlocked.
automation : - alias : ' Disarm alarm when door unlocked by keypad' triggers : - trigger : state entity_id : sensor.front_door_lock_alarm_type to : " 19" # many z-wave locks use Alarm Type 19 for 'Unlocked by Keypad' actions : - action : alarm_control_panel.alarm_disarm target : entity_id : alarm_control_panel.home_alarm
Sending a Notification when the Alarm is Armed (Away/Home), Disarmed and in Pending Status
- alias : ' Send notification when alarm is Disarmed' triggers : - trigger : state entity_id : alarm_control_panel.home_alarm to : " disarmed" actions : - action : notify.notify data : message : " ALARM! The alarm is Disarmed at {{ states('sensor.date_time') }}"
- alias : ' Send notification when alarm is in pending status' triggers : - trigger : state entity_id : alarm_control_panel.home_alarm to : " pending" actions : - action : notify.notify data : message : " ALARM! The alarm is in pending status at {{ states('sensor.date_time') }}"
- alias : ' Send notification when alarm is Armed in Away mode' triggers : - trigger : state entity_id : alarm_control_panel.home_alarm to : " armed_away" actions : - action : notify.notify data : message : " ALARM! The alarm is armed in Away mode {{ states('sensor.date_time') }}"
- alias : ' Send notification when alarm is Armed in Home mode' triggers : - trigger : state entity_id : alarm_control_panel.home_alarm to : " armed_home" actions : - action : notify.notify data : # Using multi-line notation allows for easier quoting message : > ALARM! The alarm is armed in Home mode {{ states('sensor.date_time') }}
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Manual Alarm control panel helper was introduced in Home Assistant 0.7.6, and it's used by
1.6% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Alarm
Helper
Back to top
