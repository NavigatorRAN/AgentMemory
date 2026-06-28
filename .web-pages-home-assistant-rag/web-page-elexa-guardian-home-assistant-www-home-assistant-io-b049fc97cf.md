---
source_url: "https://www.home-assistant.io/integrations/guardian"
final_url: "https://www.home-assistant.io/integrations/guardian"
canonical_url: "https://www.home-assistant.io/integrations/guardian/"
source_handle: "web:www-home-assistant-io:b049fc97cfc8"
source_section: "integrations-guardian"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0c14fff38c8fabcaa3908cf553d9dd6eb25183c116b9ad41286bb9e736dced09"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Elexa Guardian - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/guardian
- Final URL: https://www.home-assistant.io/integrations/guardian
- Canonical URL: https://www.home-assistant.io/integrations/guardian/
- Fetched at: 2026-06-28T02:47:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Guardian into Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Paired Sensor Notes
The Elexa Guardian integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates
Elexa Guardian water valve controllers into Home Assistant.
There is currently support for the following device types within Home Assistant:
Binary sensor : reports the status of the onboard leak detector and access point
Button : add various configuration controls
Sensor : reports on the device’s detected temperature and uptime
Switch : allows you to enable and disable the onboard access point
Valve : allows you to open and close the valve
To add the Elexa Guardian device to your Home Assistant instance, use this My button:
Elexa Guardian can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Elexa Guardian .
Follow the instructions on screen to complete the setup.
The Elexa Guardian integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Pair sensor ( guardian.pair_sensor )
Adds a new paired sensor to the valve controller.
Unpair sensor ( guardian.unpair_sensor )
Removes a paired sensor from the valve controller.
Upgrade firmware ( guardian.upgrade_firmware )
Upgrades the device firmware.
For an overview of every action across all integrations, see the actions reference .
Note
Not all actions are available on all Guardian valve controller firmwares.
Please ensure you upgrade your valve controller to the latest firmware before opening
bugs related to non-working actions.
When a paired sensor is first added to the valve controller, it may return inaccurate or
nonsensical values for several of its attributes, such as battery and temperature . This
is due to the sensor never having communicated its data to the valve controller and can
be fixed by moving the sensor around (so that it beeps, indicating that data has been
sent to the valve controller).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Elexa Guardian device was introduced in Home Assistant 0.111, and it's used by
22 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Binary sensor
Button
Sensor
Switch
Valve
Back to top
