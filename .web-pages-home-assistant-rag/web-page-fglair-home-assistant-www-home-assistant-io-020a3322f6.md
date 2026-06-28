---
source_url: "https://www.home-assistant.io/integrations/fujitsu_fglair"
final_url: "https://www.home-assistant.io/integrations/fujitsu_fglair"
canonical_url: "https://www.home-assistant.io/integrations/fujitsu_fglair/"
source_handle: "web:www-home-assistant-io:020a3322f66b"
source_section: "integrations-fujitsu-fglair"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f0522c4bbeac2c940d6eb3ed4e844e38e8c8d6f7c4f5f4a8f598ab4847ccf43b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FGLair - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fujitsu_fglair
- Final URL: https://www.home-assistant.io/integrations/fujitsu_fglair
- Canonical URL: https://www.home-assistant.io/integrations/fujitsu_fglair/
- Fetched at: 2026-06-28T02:44:45Z
- Content type: text/html; charset=UTF-8

## Description

Control your Fujitsu heat pump or air conditioner that uses the FGLair app

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Climate
Outside temperature
The FGLair integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides support for Fujitsu heat pumps and air conditioners that use the FGLair app.
To find out which app to use for your heat pump, check the Fujitsu FGLair FAQ .
This integration supports a subset of devices that work with the FGlair app and other external integrations.
If your device name (visible in Settings > Firmware Information in the FGlair app) starts with AC-UTY, then your device is not supported by this integration.
Devices with names starting with AP-WA, AP-WB, AP-WC, AP-WD, or AP-WF should be supported.
First, set up your device in the FGLair app before using this integration.
To configure this integration, you will need the credentials (login and password) used to connect to the FGLair application.
To add the FGLair hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select FGLair .
Follow the instructions on screen to complete the setup.
This integration supports the following functionalities (if the devices support them):
set_hvac_mode
target temperature
turn on/off
fan mode
swing mode
On units that support it, this integration will expose a temperature sensor that reports the outside temperature that the unit is sensing.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FGLair hub was introduced in Home Assistant 2024.9, and it's used by
203 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@crevetor
Categories
Back to top
