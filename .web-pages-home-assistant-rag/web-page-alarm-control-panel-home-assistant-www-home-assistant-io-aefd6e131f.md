---
source_url: "https://www.home-assistant.io/integrations/alarm_control_panel"
final_url: "https://www.home-assistant.io/integrations/alarm_control_panel"
canonical_url: "https://www.home-assistant.io/integrations/alarm_control_panel/"
source_handle: "web:www-home-assistant-io:aefd6e131f94"
source_section: "integrations-alarm-control-panel"
collection: "home-assistant-docs"
doc_type: "web-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "902b8429f520bd172fdca813c2b17268b7226da46b3980d1be0096a7e964f7ab"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "web-docs"
---

# Alarm control panel - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/alarm_control_panel
- Final URL: https://www.home-assistant.io/integrations/alarm_control_panel
- Canonical URL: https://www.home-assistant.io/integrations/alarm_control_panel/
- Fetched at: 2026-06-28T02:27:09Z
- Content type: text/html; charset=UTF-8

## Description

Connect your home alarm system to Home Assistant for automated arming, disarming, and instant notifications when the alarm triggers.

## Extracted Text

On this page
The state of an alarm panel entity
Using an alarm PIN code in actions
About the “Changed by” attribute
Alarm automation examples
Automation: arm the alarm when everyone leaves
Automation: disarm when you arrive home
Automation: send an urgent notification when the alarm triggers
Automation: arm in night mode at bedtime
Automation: notify the household who disarmed the alarm
List of triggers
List of conditions
List of actions
Related topics
The Alarm control panel integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] brings your home alarm system into Home Assistant. Whether you have a professionally installed security system or a DIY setup, this integration gives you full control over arming and disarming from anywhere. Imagine your alarm arming itself automatically when the last person leaves the house, disarming the moment you arrive home, sending an urgent notification to your phone when the alarm triggers at 3 AM, or quietly switching to night mode when bedtime rolls around. With Home Assistant watching over your security system, you get peace of mind knowing your home protects itself.
Note
Building block integration
This alarm control panel is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this alarm control panel building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the alarm control panel building block offers.
An alarm panel entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] reflects the current state of your alarm system. Not every alarm panel supports every state or every arming mode. Home Assistant shows only the modes your hardware provides.
Disarmed : the alarm is off. Sensors are not being monitored.
Armed home : perimeter protection while you are inside. Doors and windows are monitored, but interior motion sensors are ignored so you move freely around the house.
Armed away : full protection for when nobody is home. All sensors (perimeter and interior) are active.
Armed night : similar to home mode, but tuned for sleeping. Typically covers perimeter sensors and selected interior zones while leaving bedroom areas free.
Armed vacation : extended away protection for longer trips. Some systems enable additional monitoring or alerts in this mode.
Armed custom bypass : armed with one or more zones deliberately skipped. Useful when you want to leave a specific door or window open while arming the rest of the system.
Arming : the alarm is counting down its exit delay. You have a short window to leave the house before monitoring begins.
Pending : the alarm detected a sensor trip and is counting down its entry delay. You have a short window to disarm before the alarm triggers.
Triggered : the alarm has gone off. Sirens, notifications, and any other alert actions are active.
Disarming : the alarm is in the process of being disarmed.
Unavailable : the entity is currently unavailable.
Unknown : the state is not yet known.
Some alarm panels require a PIN code to arm, disarm, or both. Others work without a PIN code. If your panel requires a PIN and you omit it or enter the wrong one, the action fails silently, and the alarm stays in its current state.
Check your alarm integration’s documentation to find out whether a PIN is required for arming, disarming, or both.
In your automation or script, add the alarm action.
If a PIN is needed, under Data , add code with your PIN:
actions : - action : alarm_control_panel.alarm_disarm target : entity_id : alarm_control_panel.home_alarm data : code : " 1234"
If your alarm panel supports it, the Changed by ( changed_by ) attribute tells you who last changed the alarm state. This is the name or identifier reported by your alarm system, for example a person’s name like “Franck Nijhof” or a key fob ID. You can use this attribute in notifications and automations to keep your household informed about who armed or disarmed the alarm.
The real power of this integration is combining triggers and conditions into automations that protect your home without you having to think about it. Here are a few ideas to get you started.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
When the last person leaves the house, arm the alarm in away mode automatically. No more wondering whether you remembered to set the alarm after rushing out the door.
Trigger : Everyone leaves the home zone
Action : Arm the alarm in away mode
YAML example for arming when everyone leaves
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Arm alarm when everyone leaves"
triggers:
- trigger: zone
entity_id: person.alex
zone: zone.home
event: leave
entity_id: person.jamie
conditions:
- condition: not
- condition: zone
entity_id:
- person.alex
- person.jamie
actions:
- action: alarm_control_panel.alarm_arm_away
target:
entity_id: alarm_control_panel.home_alarm
When you pull into the driveway, Home Assistant recognizes you are home and disarms the alarm. You walk through the front door without fumbling for a keypad or app.
Trigger : Your person entity enters the home zone
Action : Disarm the alarm
YAML example for disarming on arrival
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Disarm alarm on arrival"
event: enter
- action: alarm_control_panel.alarm_disarm
data:
code: "1234"
If the alarm goes off, you want to know immediately, even if you are on the other side of town. This automation sends a critical notification to your phone the instant the alarm triggers.
Trigger : Alarm triggered
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for an alarm trigger notification
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Notify on alarm trigger"
- trigger: alarm_control_panel.triggered
options:
behavior: each
- action: notify.send_message
entity_id: notify.my_device
title: "Alarm triggered"
message: >
Your home alarm has been triggered.
Check your cameras immediately.
When bedtime arrives, switch the alarm to night mode so perimeter sensors stay active while you move freely inside the house.
Trigger : Time reaches 23:00
Action : Arm the alarm in night mode
YAML example for arming at bedtime
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Arm alarm at bedtime"
- trigger: time
at: "23:00:00"
- action: alarm_control_panel.alarm_arm_night
If your alarm panel reports who made the change, you get a notification telling you exactly who disarmed the system. Handy for families who want to know when the kids got home, or for keeping a log of who opened up the house.
Trigger : Alarm disarmed
Action : Send a notification with the name of the person who disarmed it
YAML example for a changed-by notification
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Notify who disarmed the alarm"
- trigger: alarm_control_panel.disarmed
- action: notify.notify
title: "Alarm disarmed"
The alarm was disarmed
by {{ state_attr(
'alarm_control_panel.home_alarm',
'changed_by') }}.
The Alarm control panel integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Alarm armed ( alarm_control_panel.armed )
Triggers when one or more alarms become armed, regardless of the mode.
Alarm armed away ( alarm_control_panel.armed_away )
Triggers when one or more alarms become armed in away mode.
Alarm armed home ( alarm_control_panel.armed_home )
Triggers when one or more alarms become armed in home mode.
Alarm armed night ( alarm_control_panel.armed_night )
Triggers when one or more alarms become armed in night mode.
Alarm armed vacation ( alarm_control_panel.armed_vacation )
Triggers when one or more alarms become armed in vacation mode.
Alarm disarmed ( alarm_control_panel.disarmed )
Triggers when one or more alarms become disarmed.
Alarm triggered ( alarm_control_panel.triggered )
Triggers when one or more alarms become triggered.
For an overview of every trigger across all integrations, see the triggers reference .
The Alarm control panel integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Alarm is armed ( alarm_control_panel.is_armed )
Tests if one or more alarms are armed.
Alarm is armed away ( alarm_control_panel.is_armed_away )
Tests if one or more alarms are armed in away mode.
Alarm is armed home ( alarm_control_panel.is_armed_home )
Tests if one or more alarms are armed in home mode.
Alarm is armed night ( alarm_control_panel.is_armed_night )
Tests if one or more alarms are armed in night mode.
Alarm is armed vacation ( alarm_control_panel.is_armed_vacation )
Tests if one or more alarms are armed in vacation mode.
Alarm is disarmed ( alarm_control_panel.is_disarmed )
Tests if one or more alarms are disarmed.
Alarm is triggered ( alarm_control_panel.is_triggered )
Tests if one or more alarms are triggered.
For an overview of every condition across all integrations, see the conditions reference .
The Alarm control panel integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Arm alarm away ( alarm_control_panel.alarm_arm_away )
Arm an alarm control panel in away mode. Optionally provide a code if your alarm panel requires one.
Arm alarm with custom bypass ( alarm_control_panel.alarm_arm_custom_bypass )
Arm an alarm control panel while bypassing specific zones. Optionally provide a code if your alarm panel requires one.
Arm alarm home ( alarm_control_panel.alarm_arm_home )
Arm an alarm control panel in home mode. Optionally provide a code if your alarm panel requires one.
Arm alarm night ( alarm_control_panel.alarm_arm_night )
Arm an alarm control panel in night mode. Optionally provide a code if your alarm panel requires one.
Arm alarm vacation ( alarm_control_panel.alarm_arm_vacation )
Arm an alarm control panel in vacation mode. Optionally provide a code if your alarm panel requires one.
Disarm alarm ( alarm_control_panel.alarm_disarm )
Disarm an alarm control panel. Optionally provide a code if your alarm panel requires one.
Trigger alarm ( alarm_control_panel.alarm_trigger )
Manually trigger an alarm control panel. Optionally provide a code if your alarm panel requires one.
For an overview of every action across all integrations, see the actions reference .
Manual alarm
Template alarm
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Alarm control panel entity was introduced in Home Assistant 0.7.3.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Alarm
Back to top
