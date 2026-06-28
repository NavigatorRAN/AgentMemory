---
source_url: "https://www.home-assistant.io/integrations/syncthing"
final_url: "https://www.home-assistant.io/integrations/syncthing"
canonical_url: "https://www.home-assistant.io/integrations/syncthing/"
source_handle: "web:www-home-assistant-io:bf7ae3068ea7"
source_section: "integrations-syncthing"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6db829c010b9ac8fe4f56b6e303823fb1fd4bb05d46bc49174d3cd2814c42685"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Syncthing - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/syncthing
- Final URL: https://www.home-assistant.io/integrations/syncthing
- Canonical URL: https://www.home-assistant.io/integrations/syncthing/
- Fetched at: 2026-06-28T03:20:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Syncthing within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Integration entities
Syncthing is a continuous file synchronization program. It synchronizes files between two or more computers
in real-time, safely protected from prying eyes.
The Syncthing integration allows you to monitor states of your synced folders from within Home Assistant and set up automations based on the information.
To set up the monitoring you need to get an API key . Open the Syncthing web
interface (e.g., http://127.0.0.1:8384 ) in the browser and go to Actions > Settings . You will find
the key on the right of the settings dialog.
To add the Syncthing service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Syncthing .
Follow the instructions on screen to complete the setup.
The Syncthing integration adds one sensor per syncing folder:
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Syncthing service was introduced in Home Assistant 2021.6, and it's used by
696 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@zhulik
Categories
Downloading
Sensor
Back to top
