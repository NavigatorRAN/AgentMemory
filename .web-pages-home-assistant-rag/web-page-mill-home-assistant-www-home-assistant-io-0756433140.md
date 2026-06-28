---
source_url: "https://www.home-assistant.io/integrations/mill"
final_url: "https://www.home-assistant.io/integrations/mill"
canonical_url: "https://www.home-assistant.io/integrations/mill/"
source_handle: "web:www-home-assistant-io:075643314071"
source_section: "integrations-mill"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "53d05ecddbb83c1f8c4c840e642e67e7fedfc2963378206b2082edd1b9f34914"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Mill - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mill
- Final URL: https://www.home-assistant.io/integrations/mill
- Canonical URL: https://www.home-assistant.io/integrations/mill/
- Fetched at: 2026-06-28T03:00:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Mill heater into Home Assistant.

## Extracted Text

On this page
Configuration
Actions
Action: Set room temperature
Integrates Mill heater into Home Assistant.
To add the Mill integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Mill .
Follow the instructions on screen to complete the setup.
You can configure it for cloud access or local access.
Local access requires Generation 3 heaters (Sold from Autumn 2021).
A number entity can configure the maximum power of the heaters.
The mill.set_room_temperature action sets the temperature for the room connected to heater in the Mill app.
Data attribute Optional Description room_name no String with room name. away_temp yes Integer with temperature comfort_temp yes Integer with temperature sleep_temp yes Integer with temperature
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mill integration was introduced in Home Assistant 0.81, and it's used by
1491 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@danielhiversen
Categories
Climate
Back to top
