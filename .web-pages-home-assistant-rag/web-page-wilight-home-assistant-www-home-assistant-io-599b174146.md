---
source_url: "https://www.home-assistant.io/integrations/wilight"
final_url: "https://www.home-assistant.io/integrations/wilight"
canonical_url: "https://www.home-assistant.io/integrations/wilight/"
source_handle: "web:www-home-assistant-io:599b174146e8"
source_section: "integrations-wilight"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6e73db1f348cbb7fa571c9244a53cf0e71efeef9cea8862313dcf8fa8f2e4b3d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# WiLight - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/wilight
- Final URL: https://www.home-assistant.io/integrations/wilight
- Canonical URL: https://www.home-assistant.io/integrations/wilight/
- Fetched at: 2026-06-28T03:28:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate WiLight devices into Home Assistant.

## Extracted Text

On this page
Configuration
Fan
Fan actions
Irrigation
Irrigation actions
The WiLight integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is to integrate WiLight devices with Home Assistant.
There is currently support for the following device types within Home Assistant:
Cover (WiLight model C-103).
Fan (WiLight model V-104).
Light (WiLight model I-100, I-102, I-107, I-110 and I-112).
Irrigation / Switch (WiLight model R-105).
To add the WiLight hub to your Home Assistant instance, use this My button:
WiLight can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select WiLight .
Follow the instructions on screen to complete the setup.
The WiLight integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Fans from within Home Assistant.
There are several actions which can be used for automations and control of the fan:
Action Description set_percentage Calling this action sets the fan speed ( entity_id and percentage are required parameters). Percentage must be in the range 0-100, percentage = 0 turns off the fan. There are three speed levels 33%, 66% and 100%. Adjusting to intermediate levels goes to the next higher level. set_direction Calling this action will set the fan direction ( entity_id and direction are required parameters, and direction must be one of the following: forward or reverse). Calling this action will turn the fan on. toggle Calling this action will toggle the fan between on and off states ( entity_id is required). turn_off Calling this action will turn the fan off ( entity_id is required). turn_on Calling this action will turn the fan on and set the speed and direction to the last used ones (defaults to high and forward, entity_id is required).
The WiLight integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Irrigation from within Home Assistant. This is exposed via switches in Home Assistant.
There are two switch types for Irrigation: watering switch and pause switch .
A watering switch can turn on and off the irrigation valve, while the pause switch can disable / enable the action of a watering switch .
Triggers activate (turn on) the watering switch (irrigation valve) at the programmed time. The trigger can be set to run on a day of the week or only once (today).
There are several actions which can be used for automations and control of the Irrigation:
For watering switch :
Action Description turn_off Calling this action will turn the irrigation valve off ( entity_id is required). turn_on Calling this action will turn the irrigation valve on ( entity_id is required). set_watering_time Calling this action sets the watering time ( entity_id and watering_time are required parameters), watering_time must be in the range 1-1800 seconds. set_trigger Calling this action sets the trigger_1, trigger_2, trigger_3 or trigger_4 ( entity_id , trigger_index and trigger are required parameters), trigger_index must be between 1 and 4 and trigger must be according Trigger rules (see below).
For pause switch :
Action Description turn_off Performing this action will turn the pause switch off, enabling watering switch ( entity_id is required). turn_on Performing this action will turn the pause switch on, disabling watering switch ( entity_id is required). set_pause_time Performing this action sets the pause time ( entity_id and pause_time are required parameters), pause_time must be in the range 1-24 hours.
Trigger rules:
String with 8 decimal characters (“0” to “9”).
The first three characters (String[0,3]) represent an integer from 0 to 127, which corresponds to Bitfield of: 1 - Sunday, 2 - Monday, 4 - Tuesday, 8 - Wednesday, 16 - Thursday, 32 - Friday and 64 - Saturday. Setting zero, trigger is only valid for today.
String[3,5] represents the hour of trigger, from 0 to 23.
String[5,7] represents the minute of trigger, from 0 to 59.
String[7,8] represents the enable trigger, 0 - disabled, 1- enabled.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WiLight hub was introduced in Home Assistant 0.115, and it's used by
3 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@leofig-rj
Categories
Cover
Light
Switch
Back to top
