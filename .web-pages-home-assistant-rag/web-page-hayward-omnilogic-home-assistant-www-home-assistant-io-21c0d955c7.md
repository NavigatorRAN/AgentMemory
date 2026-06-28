---
source_url: "https://www.home-assistant.io/integrations/omnilogic"
final_url: "https://www.home-assistant.io/integrations/omnilogic"
canonical_url: "https://www.home-assistant.io/integrations/omnilogic/"
source_handle: "web:www-home-assistant-io:21c0d955c7a7"
source_section: "integrations-omnilogic"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b1d8f75b724f05365450487b63db09998dd5be07cddd1874e7feba3a254e593b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Hayward Omnilogic - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/omnilogic
- Final URL: https://www.home-assistant.io/integrations/omnilogic
- Canonical URL: https://www.home-assistant.io/integrations/omnilogic/
- Fetched at: 2026-06-28T03:05:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure Hayward OmniLogic integration.

## Extracted Text

On this page
Configuration
Known limitations
Debugging integration
Hayward OmniLogic smart pool and spa technology control.
There is currently support for the following device types within Home Assistant:
Sensor - Air Temperature, Water Temperature, Variable Pump Speed, Chlorinator Setting, Salt Level, pH, and ORP
Switch - All relays, pumps (single, dual, variable speed), and relay-based lights.
To add the Hayward Omnilogic hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Hayward Omnilogic .
Follow the instructions on screen to complete the setup.
The platform only supports sensors and switches at the current release. Future releases will include light/water heater for control of Colorlogic lights and pool heaters.
If you have problems with the integration you can add debug prints to the log to aid in troubleshooting.
logger : default : info logs : omnilogic : debug homeassistant.components.omnilogic : debug
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hayward Omnilogic hub was introduced in Home Assistant 0.116, and it's used by
244 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Switch
Back to top
