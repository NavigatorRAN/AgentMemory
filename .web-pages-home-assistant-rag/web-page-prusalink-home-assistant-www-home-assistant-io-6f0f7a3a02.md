---
source_url: "https://www.home-assistant.io/integrations/prusalink"
final_url: "https://www.home-assistant.io/integrations/prusalink"
canonical_url: "https://www.home-assistant.io/integrations/prusalink/"
source_handle: "web:www-home-assistant-io:6f0f7a3a0253"
source_section: "integrations-prusalink"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5b4165d6474b95cb9c46532cfec12f92c6477b52f852598e1d5d8f22918fbc65"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# PrusaLink - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/prusalink
- Final URL: https://www.home-assistant.io/integrations/prusalink
- Canonical URL: https://www.home-assistant.io/integrations/prusalink/
- Fetched at: 2026-06-28T03:09:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on monitoring Prusa 3D printers using PrusaLink.

## Extracted Text

On this page
Obtaining hostname, username, and password
Prusa MINI/MINI+/MK3.9/MK4/XL/CORE One
Prusa MK2.5/MK3
Configuration
Related links
The PrusaLink integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your Prusa 3D printer and its progress with your Home Assistant installation. This integration works with Prusa MINI/MINI+, Prusa MK3.9/MK4, Prusa XL, Prusa CORE One, and with the older Raspberry Pi-based Prusa MK2.5/MK3.
This integration has been updated to use the latest v1 API endpoints, which require firmware version 4.7.0 or later. If you own a Prusa MINI/MINI+, please make sure your printer is running firmware 5.1.0 or a more recent version. Firmware versions 4.7.x and 5.0.x are not available for this model. The Prusa CORE One works with its default firmware. For Prusa MK2.5/MK3, this integration requires PrusaLink version 0.7.2 or later.
Firmware update guides can be found here:
Prusa MINI/MINI+
Prusa MK3.9/MK4/XL
Prusa CORE One
On your printer, navigate to Settings > Network > PrusaLink .
Find the device’s IP address . Alternatively, you can look for the printer’s IP address or hostname on your router.
Note that for some models, the username may not be visible, as it is hardcoded to maker .
Depending on your model, the password entry may not be called Password , but API key .
The device’s IP address is displayed on the printer LCD after PrusaLink starts up. Alternatively, you can look for the printer’s IP address or hostname on your router.
Use the username and password you entered during the initial PrusaLink setup (not the API key).
To add the PrusaLink device to your Home Assistant instance, use this My button:
PrusaLink can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select PrusaLink .
Follow the instructions on screen to complete the setup.
PrusaLink documentation
PrusaLink installation guide for Prusa MK3 with Raspberry Pi Zero W
PrusaLink installation guide for Prusa MK2.5/MK3 with Raspberry Pi 3/4
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The PrusaLink device was introduced in Home Assistant 2022.9, and it's used by
2677 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
3D printing
Back to top
