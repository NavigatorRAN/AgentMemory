---
source_url: "https://www.home-assistant.io/integrations/dormakaba_dkey"
final_url: "https://www.home-assistant.io/integrations/dormakaba_dkey"
canonical_url: "https://www.home-assistant.io/integrations/dormakaba_dkey/"
source_handle: "web:www-home-assistant-io:8f40a7456c78"
source_section: "integrations-dormakaba-dkey"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "12baa887ba99027021284161419f61b980bd2abb2e049e9a33d1a9096544f0c6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Dormakaba dKey - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dormakaba_dkey
- Final URL: https://www.home-assistant.io/integrations/dormakaba_dkey
- Canonical URL: https://www.home-assistant.io/integrations/dormakaba_dkey/
- Fetched at: 2026-06-28T02:37:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Dormakaba dKey locks into Home Assistant.

## Extracted Text

On this page
Configuration
Integrates Dormakaba dKey Bluetooth Low Energy connected locks into Home Assistant.
The integration only supports connecting to the lock directly via Bluetooth. Connecting via the Dormakaba dKey gateway is not supported.
To add the Dormakaba dKey device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Dormakaba dKey .
Follow the instructions on screen to complete the setup.
In addition to a lock entity, each added dKey lock will also have:
A battery sensor
A binary_sensor which shows if the door is open or not
A binary_sensor which shows the position of the lock’s dead bolt
Important
The Dormakaba dKey lock is currently not working with USB dongles or built-in Bluetooth radios, only ESPHome Bluetooth proxies configured to allow active connections work reliably.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Dormakaba dKey device was introduced in Home Assistant 2023.3, and it's used by
12 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@emontnemery
Categories
Lock
Back to top
