---
source_url: "https://www.home-assistant.io/integrations/radiotherm"
final_url: "https://www.home-assistant.io/integrations/radiotherm"
canonical_url: "https://www.home-assistant.io/integrations/radiotherm/"
source_handle: "web:www-home-assistant-io:5b1962356855"
source_section: "integrations-radiotherm"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bbd380bb7472982391947ee0444c02e09b384803f34c5ab8993d0cbb0426171d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Radio Thermostat - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/radiotherm
- Final URL: https://www.home-assistant.io/integrations/radiotherm
- Canonical URL: https://www.home-assistant.io/integrations/radiotherm/
- Fetched at: 2026-06-28T03:11:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Radio Thermostat (3M Filtrete) thermostats within Home Assistant.

## Extracted Text

On this page
Configuration
Time synchronization
Hold mode
Known working devices
The Radio Thermostat integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control a thermostat from Radio Thermostat or 3M Filtrete . Your thermostat must have the Wi-Fi module installed and connected to your network.
To add the Radio Thermostat device to your Home Assistant instance, use this My button:
Radio Thermostat can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Radio Thermostat .
Follow the instructions on screen to complete the setup.
The integration will automatically sync the time when it is loaded if the device is not currently in hold mode, as syncing the time will disable hold mode.
If you want temperature settings from Home Assistant to override a thermostat schedule on the thermostat itself, hold mode can be enabled with the hold mode switch.
CT30 v1.75
CT30 v1.92
CT30 v1.94
CT30 v1.99
CT50 V1.09
CT50 V1.88
CT50 V1.92
CT50 V1.94 (also known as Filtrete 3M50)
CT80 Rev B1 V1.00
CT80 Rev B2 V1.00
CT80 Rev B2 V1.03
CT80 Rev B2 V1.09
New models that are derivatives of the CT30 or CT80 should be detected automatically and basic functionality should work.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Radio Thermostat device was introduced in Home Assistant 0.7.6, and it's used by
77 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@vinnyfuria
Categories
Climate
Switch
Back to top
