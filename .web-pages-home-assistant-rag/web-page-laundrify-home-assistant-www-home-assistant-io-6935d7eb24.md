---
source_url: "https://www.home-assistant.io/integrations/laundrify"
final_url: "https://www.home-assistant.io/integrations/laundrify"
canonical_url: "https://www.home-assistant.io/integrations/laundrify/"
source_handle: "web:www-home-assistant-io:6935d7eb24f9"
source_section: "integrations-laundrify"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b98adfbbc7c86585412a9cb2e6921bff88c01463fe8f1e4621dc7fb1f35521a1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# laundrify - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/laundrify
- Final URL: https://www.home-assistant.io/integrations/laundrify
- Canonical URL: https://www.home-assistant.io/integrations/laundrify/
- Fetched at: 2026-06-28T02:55:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate laundrify within Home Assistant.

## Extracted Text

On this page
Generate an Auth Code
Configuration
Monitor the status of your washing machine or dryer within Home Assistant using a laundrify WiFi power plug.
The following platforms/entities are currently supported by the integration:
Binary sensor
Wash Cycle ( running / not running )
Sensor
Power (latest measurement in Watts )
Energy (total consumption in kWh )
The laundrify App v1.12.0 is required to activate the Home Assistant integration.
The integration requires an Auth Code to complete the account linking. Open the laundrify App and tap on Home Assistant -> Integration aktivieren to generate your code.
Your code will expire within 60 minutes after activation. Make sure to configure your integration in time.
To add the laundrify hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select laundrify .
Follow the instructions on screen to complete the setup.
Code
Auth Code that can be obtained in the laundrify App (see above), e.g., 123-456 .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The laundrify hub was introduced in Home Assistant 2022.6, and it's used by
362 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@xLarry
Categories
Back to top
