---
source_url: "https://www.home-assistant.io/integrations/opensensemap"
final_url: "https://www.home-assistant.io/integrations/opensensemap"
canonical_url: "https://www.home-assistant.io/integrations/opensensemap/"
source_handle: "web:www-home-assistant-io:4f34f29070ed"
source_section: "integrations-opensensemap"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b7cb1bcf04ee08c369579448ba71ecf233eaa27337c753c763447fceb37b4aa2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# openSenseMap - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/opensensemap
- Final URL: https://www.home-assistant.io/integrations/opensensemap
- Canonical URL: https://www.home-assistant.io/integrations/opensensemap/
- Fetched at: 2026-06-28T03:06:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up openSenseMap sensors in Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Removing the integration
To remove an integration instance from Home Assistant
The openSenseMap integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] queries the open data API of openSenseMap.org to monitor an air quality sensor station.
To find the ID of a station, open it on openSenseMap and copy the last segment of the URL — for example, 5b450e565dc1ec001bf7cd1d in https://opensensemap.org/explore/5b450e565dc1ec001bf7cd1d .
To add the openSenseMap service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select openSenseMap .
Follow the instructions on screen to complete the setup.
Station ID
The ID of the openSenseMap station to monitor.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The openSenseMap service was introduced in Home Assistant 0.85, and it's used by
142 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@AlCalzone
Categories
Health
Back to top
