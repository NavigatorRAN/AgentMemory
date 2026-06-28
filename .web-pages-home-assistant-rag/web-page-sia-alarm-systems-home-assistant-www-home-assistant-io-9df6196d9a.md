---
source_url: "https://www.home-assistant.io/integrations/sia"
final_url: "https://www.home-assistant.io/integrations/sia"
canonical_url: "https://www.home-assistant.io/integrations/sia/"
source_handle: "web:www-home-assistant-io:9df6196d9a0d"
source_section: "integrations-sia"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "297552f76e6e7dfb510f11e69f8420b5982ab775692bc448e2d45ba172ae9eee"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# SIA Alarm Systems - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sia
- Final URL: https://www.home-assistant.io/integrations/sia
- Canonical URL: https://www.home-assistant.io/integrations/sia/
- Fetched at: 2026-06-28T03:15:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SIA Based Alarm systems.

## Extracted Text

On this page
Alarm Setup (Ajax Systems Hub example)
Configuration
Note on monitoring multiple alarm systems
Port usage
Entities
Events
The SIA Alarm Systems integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides integration with several alarm systems that implement the SIA Protocol, including Ajax Systems . This protocol is listen-only, so does not allow you to turn on/off your alarm system, it just updates the state to reflect your alarm and allows you to act on that state, for instance turning on all lights and opening the curtains when the alarm triggers. The underlying package has support for different variants of SIA, including DC-09, DC-04 and a limited set of ADM-CID. If your alarm system uses the ADM-CID standard and it isn’t working, please log an issue here .
To use this platform, you need to set up your alarm system to communicate using the SIA Protocol and setup several things on the alarm. This integration basically works by Home Assistant listening on a port for messages from the alarm systems and handling and responding to that message and finally updating one or more entities in Home Assistant.
In the settings of your hub, go to the monitoring stations page.
Select “SIA Protocol”.
Enable “Connect on demand”.
Place Account Id - 3-16 ASCII hex characters. For example AAA.
Insert Home Assistant IP address. The hub must be able to reach this IP address. There is no cloud connection necessary.
Insert Home Assistant listening port. This port must not be used by anything else on the machine Home Assistant is running on, see the notes on port usage below.
Select Preferred Network. Ethernet is preferred if hub and Home Assistant in same network. Multiple networks are not tested.
Enable Periodic Reports. The interval with which the alarm systems reports to the monitoring station, default is 1 minute. This component adds 30 seconds before setting the alarm unavailable to deal with slights latencies between ajax and Home Assistant and the async nature of Home Assistant.
Encryption is preferred but optional. Password is 16, 24 or 32 ASCII characters.
To add the SIA Alarm Systems hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SIA Alarm Systems .
Follow the instructions on screen to complete the setup.
port
Port that your alarm will communicate with, must be set in the alarm system as explained above.
account
Hub account to communicate with. 3-16 ASCII hex characters. Must be set in the alarm system as explained above.
encryption_key
Encoding key. 16, 24 or 32 ASCII characters. Must be same, as in hub properties.
ping_interval
Ping interval in minutes that the alarm system uses to send “Automatic communication test report” messages, the component adds 30 seconds before marking all entities for that account (alarm and binary sensors) unavailable. Must be between 1 and 1440 minutes.
zones
The number of zones configured in your alarm.
additional_account
Used to ask if an additional account needs to be included, if so will open a dialog for the next account, after checking the current input.
ASCII characters are 0-9 and ABCDEF, so an account is something like 346EB and the encryption key has the same characters but needs to be 16, 24 or 32 characters in length.
If you have multiple accounts (alarm systems) that you want to monitor you can choose to have all communicating with the same port, in that case, use the additional accounts checkbox in the dialog to set up the next account and keep doing that until you have them all. You can also choose to have both running on a different port, in that case set up the component twice with the different ports.
The port used with this component must be a port no other processes use on the machine your Home Assistant instance is running. If you have a complex network setup or want to monitor alarm systems at other locations you will most likely have to open firewalls and/or create network routes for that purpose, the integration will just listen for messages coming into that port, and will not proactively send, only responding with an acknowledgement to the alarm system.
In the initial version, after setup you will see one alarm_control_panel per account and zone combination. This entity will have 5 attributes that reflect all messages that came in for that account and zone, it includes fields for last_code , last_zone , last_message , last_id , last_timestamp . The alarm_control_panel state itself is changed based on a subset of values, including but not limited to codes: CA , CB , CG , BA , TA , OA , NC , NL , for the full list check the code on GitHub. If you expected the state to change then please log which code it was and create an issue on GitHub as well.
Each event that comes into your systems through SIA is also forwarded to the internal HA event bus, which can then be used to trigger automations directly on the codes that came in there. The events are created with event_type set to sia_event_<port>_<account> . The event_data holds many fields, see details below.
Fields in event_data for HA events emitted by the SIA integration.
message_type
receiver
line
sequence
content
ti
id
ri (also known as zone )
code
message
x_data
timestamp
event_qualifier
event_type
partition
extended_data (list)
identifier
name
description
length
characters
value
sia_code
type
concerns
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SIA Alarm Systems hub was introduced in Home Assistant 2021.6, and it's used by
1326 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@eavanvalkenburg
Categories
Alarm
Back to top
