---
source_url: "https://www.home-assistant.io/integrations/qnap"
final_url: "https://www.home-assistant.io/integrations/qnap"
canonical_url: "https://www.home-assistant.io/integrations/qnap/"
source_handle: "web:www-home-assistant-io:1a0ad8c4dfec"
source_section: "integrations-qnap"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8227ae2fab2d40eb42f7f83479d4ac9a3a60de7566b58a3a4b08569262dd4286"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# QNAP - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/qnap
- Final URL: https://www.home-assistant.io/integrations/qnap
- Canonical URL: https://www.home-assistant.io/integrations/qnap/
- Fetched at: 2026-06-28T03:10:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the QNAP sensor within Home Assistant.

## Extracted Text

On this page
Configuration
Integration entities
QNAP device support
The QNAP integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows getting various statistics from your QNAP NAS .
To add the QNAP device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select QNAP .
Follow the instructions on screen to complete the setup.
The QNAP integration will add the following sensors:
System: status, system temperature
CPU: usage, temperature
Memory: usage, free, used, total
Volume: usage, used
Folders: usage, used
Drives: smart status, usage
Network: bandwidth, status
This integration works with most (but not all) QNAP devices. A complete, up-to-date list of compatible devices can be found here .
In the case of QTS 5, the QNAP account that is being used by Home Assistant needs the following:
Make sure you log into the device’s web interface and complete any agreements, warnings, wizards, or setup steps, as the QNAP API may block requests until those are completed.
The QNAP account must have access to System Monitoring. This can be achieved either by being an administrator or by having an administrator assign System Monitoring privileges (within QTS: ControlPanel > Privilege > Delegated Administration > System Monitoring).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The QNAP device was introduced in Home Assistant 0.38, and it's used by
4211 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@disforw
Categories
System monitor
Back to top
