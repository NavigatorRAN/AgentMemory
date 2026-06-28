---
source_url: "https://www.home-assistant.io/integrations/yale_smart_alarm"
final_url: "https://www.home-assistant.io/integrations/yale_smart_alarm"
canonical_url: "https://www.home-assistant.io/integrations/yale_smart_alarm/"
source_handle: "web:www-home-assistant-io:b94afd394ed5"
source_section: "integrations-yale-smart-alarm"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "735a76f066df3b3ff76bb6dd77dd9ff310f12091b453aee4036b4430ff33fbb2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Yale Smart Living - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yale_smart_alarm
- Final URL: https://www.home-assistant.io/integrations/yale_smart_alarm
- Canonical URL: https://www.home-assistant.io/integrations/yale_smart_alarm/
- Fetched at: 2026-06-28T03:29:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Yale Smart Alarms into Home Assistant.

## Extracted Text

On this page
Configuration
Alarm control panel
Binary sensors
Button
Lock
Select
Sensor
Switch
The Yale Smart Living integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides connectivity with the Yale Smart Alarm systems and Smart Hub through Yale’s API.
There is currently support for the following device types within Home Assistant:
Alarm
Binary sensor
To add the Yale Smart Living hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Yale Smart Living .
Follow the instructions on screen to complete the setup.
Actions provided are armed_away , armed_home , and disarmed .
No code is required to operate the alarm.
Provides support for contact sensors for doors/windows
Door/window is open or closed.
Battery is low on contact sensor
Provides support for pressing the panic button to trigger the alarm. Be careful as another press does not reset/turn off panic mode.
The lock platform requires a code for unlocking but no code for locking.
Provides support for setting the volume on locks, available options are “High”, “Low” and “Off”. The entity is only available for supported door locks.
Provides support for smoke detector temperature sensors.
Provides support for enable/disable autolock on locks. Entity is only available for supported door locks.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can be configured to provide a default code that is used if no code is supplied and the number of digits required.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yale Smart Living hub was introduced in Home Assistant 0.78, and it's used by
534 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Back to top
