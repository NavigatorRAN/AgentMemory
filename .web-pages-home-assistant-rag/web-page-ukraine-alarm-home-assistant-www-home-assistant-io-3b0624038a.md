---
source_url: "https://www.home-assistant.io/integrations/ukraine_alarm"
final_url: "https://www.home-assistant.io/integrations/ukraine_alarm"
canonical_url: "https://www.home-assistant.io/integrations/ukraine_alarm/"
source_handle: "web:www-home-assistant-io:3b0624038ac1"
source_section: "integrations-ukraine-alarm"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8124a91c1d72b8c199dbf08bbea59e5a419d0b73ae809cc4f6da319e7e6917ca"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Ukraine Alarm - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ukraine_alarm
- Final URL: https://www.home-assistant.io/integrations/ukraine_alarm
- Canonical URL: https://www.home-assistant.io/integrations/ukraine_alarm/
- Fetched at: 2026-06-28T03:24:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Ukraine Alarm within Home Assistant.

## Extracted Text

On this page
Configuration
Limitations
The Ukraine Alarm integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the siren.pp.ua API - public wrapper for Ukraine Alarm web service to offer air-raid siren notifications. The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will create 6 binary sensors for your selected region in Ukraine:
Air
Artillery
Chemical
Nuclear
Urban Fights
Unknown
Siren check interval is set to 10 seconds to avoid overloading the API and still be able to react fast enough.
To add the Ukraine Alarm service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ukraine Alarm .
Follow the instructions on screen to complete the setup.
You can monitor up to 5 regions to not hit the API rate limit.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ukraine Alarm service was introduced in Home Assistant 2022.6, and it's used by
1022 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@PaulAnnekov
Categories
Other
Back to top
