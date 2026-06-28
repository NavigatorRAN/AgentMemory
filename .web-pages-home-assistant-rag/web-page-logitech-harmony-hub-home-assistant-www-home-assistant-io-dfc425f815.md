---
source_url: "https://www.home-assistant.io/integrations/harmony"
final_url: "https://www.home-assistant.io/integrations/harmony"
canonical_url: "https://www.home-assistant.io/integrations/harmony/"
source_handle: "web:www-home-assistant-io:dfc425f815fd"
source_section: "integrations-harmony"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "52c7f5cd3cbe4d4fe438a971eca57b7523e458c3339e73939bb6dd8ac8150ccf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Logitech Harmony Hub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/harmony
- Final URL: https://www.home-assistant.io/integrations/harmony
- Canonical URL: https://www.home-assistant.io/integrations/harmony/
- Fetched at: 2026-06-28T02:47:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Harmony Hub remotes into Home Assistant.

## Extracted Text

On this page
Configuration
Configuration file
Action remote.turn_off
Action remote.turn_on
Action remote.send_command
List of actions
Examples
The Logitech Harmony Hub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the state of your Harmony Hub Device .
Supported units:
Harmony Hub
Harmony Companion
Harmony Pro
Harmony Elite
Harmony Pro 2400
To add the Logitech Harmony Hub device to your Home Assistant instance, use this My button:
Logitech Harmony Hub can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Logitech Harmony Hub .
Follow the instructions on screen to complete the setup.
Note: Depending on the firmware, you may need to enable XMPP for this integration to work. From your Harmony app, go to: Menu > Harmony Setup > Add/Edit Devices & Activities > Remote & Hub > Enable XMPP .
Once the Logitech Harmony Hub has been configured, the default activity and duration in seconds between sending commands to a device can be adjusted in the settings via Settings > Devices & services > Your Logitech Harmony Hub
Upon startup one file will be written to your Home Assistant configuration directory per device in the following format: harmony_UNIQUE_ID.conf . The file will contain:
List of all programmed activity names and ID numbers
List of all programmed device names and ID numbers
List of all available commands per programmed device
This file will be overwritten whenever the Harmony HUB has a new configuration, there is no need to restart Home Assistant.
Turn off all devices that were switched on from the start of the current activity.
Data attribute Optional Description entity_id no Entity ID to target.
Start an activity. Will start the default activity from configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] if no activity is specified. The specified activity can either be the activity name or the activity ID from the configuration file written to your Home Assistant configuration directory .
Data attribute Optional Description entity_id no Entity ID to target. activity yes Activity ID or Activity Name to start. Example
In the file ‘harmony_REMOTENAME.conf’ you can find the available activities, for example:
{
"Activities": {
"-1": "PowerOff",
"20995306": "Watch TV",
"20995307": "Play Games",
"20995308": "Listen Music"
}
Using the activity name ‘Watch TV’, you can perform an action via automation to switch this activity on:
actions : - action : remote.turn_on target : entity_id : remote.bed_room_hub data : activity : " Watch TV"
Send a single command or a set of commands to one device, device ID and available commands are written to the configuration file at startup. You can optionally specify the number of times you wish to repeat the command(s) and delay you want between repeated command(s).
Data attribute Optional Description entity_id no Entity ID to target. device no Device ID or Device Name to send the command to. command no A single command or a list of commands to send. num_repeats yes The number of times to repeat the command(s). delay_secs yes The number of seconds between sending each command. hold_secs yes The number of seconds the button on the remote is held before the release is sent.
In the file ‘harmony_REMOTENAME.conf’ you can find the available devices and commands, for example:
"Devices": {
"TV": {
"commands": [
"PowerOff",
"PowerOn"
],
"id": "327297814"
},
"Receiver": {
"PowerOn",
"VolumeUp",
"VolumeDown",
"Mute"
"id": "428297615"
A typical action for sending several button presses looks like this:
action : remote.send_command target : entity_id : remote.tv_room data : command : - PowerOn - Mute device : Receiver delay_secs : 0.6
OR
action : remote.send_command target : entity_id : remote.tv_room data : command : - PowerOn - Mute device : 428297615 delay_secs : 0.6
The Logitech Harmony Hub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Change channel ( harmony.change_channel )
Sends a change channel command to the Harmony Hub.
Sync ( harmony.sync )
Synchronizes the Harmony Hub configuration with the Harmony cloud.
For an overview of every action across all integrations, see the actions reference .
Template sensors can be utilized to display current activity in the frontend.
template : - sensor : - name : ' Family Room Harmony Remote' state : > {{ state_attr('remote.family_room', 'current_activity') }} - name : ' Bedroom Harmony Remote' state : > {{ state_attr('remote.bedroom', 'current_activity') }}
The example below shows how to control an input_boolean switch using the Harmony remote’s current activity. The switch will turn on when the remote’s state changes and the Kodi activity is started and off when the remote’s state changes and the current activity is “PowerOff”.
automation : - alias : " Watch TV started from harmony hub" triggers : - trigger : state entity_id : remote.family_room conditions : - condition : template value_template : ' {{ trigger.to_state.attributes.current_activity == "Kodi" }}' actions : - action : input_boolean.turn_on target : entity_id : input_boolean.notify - alias : " PowerOff started from harmony hub" triggers : - trigger : state entity_id : remote.family_room conditions : - condition : template value_template : ' {{ trigger.to_state.attributes.current_activity == "PowerOff" }}' actions : - action : input_boolean.turn_off target : entity_id : input_boolean.notify
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Logitech Harmony Hub device was introduced in Home Assistant 0.34, and it's used by
2.5% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ehendrix23
@bdraco
@mkeesey
@Aohzan
Categories
Remote
Back to top
