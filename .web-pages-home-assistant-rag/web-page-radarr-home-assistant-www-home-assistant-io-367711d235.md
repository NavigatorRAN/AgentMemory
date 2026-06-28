---
source_url: "https://www.home-assistant.io/integrations/radarr"
final_url: "https://www.home-assistant.io/integrations/radarr"
canonical_url: "https://www.home-assistant.io/integrations/radarr/"
source_handle: "web:www-home-assistant-io:367711d235e9"
source_section: "integrations-radarr"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "701cb0ff0c53d9ac26c04b1adb64a186d34c28c778a6f64f447ad1899ead7082"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Radarr - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/radarr
- Final URL: https://www.home-assistant.io/integrations/radarr
- Canonical URL: https://www.home-assistant.io/integrations/radarr/
- Fetched at: 2026-06-28T03:10:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Radarr sensors with Home Assistant

## Extracted Text

On this page
Configuration
Integration entities
Binary sensor
Calendar
Sensors
List of actions
The Radarr integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] pulls data from a given Radarr instance.
Your API key can be found in Settings > General in the Radarr Web UI.
To add the Radarr service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Radarr .
Follow the instructions on screen to complete the setup.
Health : Shows if the Radarr instance is healthy. This is determined to have a problem if Radarr cannot communicate with any enabled download clients or no indexers are available for RSS feeds or searches.
A calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] entity will also be created indicating the day of release and the type of release, such as Cinemas, Digital, or Physical.
A calendar entity will be created indicating the day of release and the type of release, such as Cinemas, Digital, or Physical.
Disk space : Shows the disk space available to Radarr in gigabytes. A separate sensor is created for each storage path configured in Radarr (for example: sensor.radarr_disk_space_movies ).
Movies : Shows the number of movies in the Radarr database. (disabled by default)
Queue : The number of movies in the download queue. (disabled by default)
Start time : The time when Radarr was last restarted. (disabled by default)
The Radarr integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get movies ( radarr.get_movies )
Gets all movies in Radarr with their details and status.
Get queue ( radarr.get_queue )
Gets all movies currently in the Radarr download queue with their progress and details.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Radarr service was introduced in Home Assistant 0.47, and it's used by
3926 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Downloading
Back to top
