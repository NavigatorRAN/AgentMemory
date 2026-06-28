---
source_url: "https://www.home-assistant.io/integrations/waqi"
final_url: "https://www.home-assistant.io/integrations/waqi"
canonical_url: "https://www.home-assistant.io/integrations/waqi/"
source_handle: "web:www-home-assistant-io:5c816163eac2"
source_section: "integrations-waqi"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f8c04c4ab4b7c5091cd8a383c31389ad27cf4613764bae29e876d308026fa46d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# World Air Quality Index (WAQI) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/waqi
- Final URL: https://www.home-assistant.io/integrations/waqi
- Canonical URL: https://www.home-assistant.io/integrations/waqi/
- Fetched at: 2026-06-28T03:27:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up World Air Quality Index sensor in Home Assistant.

## Extracted Text

On this page
Setup
Configuration
The World Air Quality Index (WAQI) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will query World Air Quality Index service to check AQI value for a specific set of locations. The resulting indexes will be added to the Home Assistant as sensor outputs.
This sensor requires an API token. Please obtain one at AQICN API token .
To add the World Air Quality Index (WAQI) service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select World Air Quality Index (WAQI) .
Follow the instructions on screen to complete the setup.
The value reported is an overall AQ index for the location. The values of the index can be interpreted as following:
AQI Status Description 0 - 50 Good Air quality is considered satisfactory, and air pollution poses little or no risk 51 - 100 Moderate Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution 101 - 150 Unhealthy for Sensitive Groups Members of sensitive groups may experience health effects. The general public is not likely to be affected 151 - 200 Unhealthy Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects 201 - 300 Very unhealthy Health warnings of emergency conditions. The entire population is more likely to be affected 301+ Hazardous Health alert: everyone may experience more serious health effects
Further information about AQI can be found on the EPA’s AirNOW website .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The World Air Quality Index (WAQI) service was introduced in Home Assistant 0.34, and it's used by
4344 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Health
Back to top
