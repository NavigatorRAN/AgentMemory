---
source_url: "https://www.home-assistant.io/integrations/permobil"
final_url: "https://www.home-assistant.io/integrations/permobil"
canonical_url: "https://www.home-assistant.io/integrations/permobil/"
source_handle: "web:www-home-assistant-io:8c54de8ab9c2"
source_section: "integrations-permobil"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "27b8d2b904334c206c6a13aadd5da7d221d68daaf87495c1ff9524cfaf7bfccb"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# MyPermobil - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/permobil
- Final URL: https://www.home-assistant.io/integrations/permobil
- Canonical URL: https://www.home-assistant.io/integrations/permobil/
- Fetched at: 2026-06-28T03:07:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Permobil wheelchair into Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
The MyPermobil integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to view various sensors with information about your Permobil wheelchair. For example: battery status, distance traveled, and number of seating adjustments. The values of the sensors may be delayed by several minutes and should not be relied on for any crucial applications. For the integration to work, you must ensure that voice assistant linking is activated in the MyPermobil app. To do this, open the app and navigate to Settings > My Account > Connection Settings .
To add the MyPermobil device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select MyPermobil .
Follow the instructions on screen to complete the setup.
A total of 13 sensors are available:
Battery charge
The current battery state of the wheelchair as a percentage.
Battery health
The maximum amount of charge the battery can hold. Measured as a percentage of the battery’s original capacity.
Charge time left
A number indicating how many hours the battery needs until it is fully charged. The battery needs to be charging for this sensor to work.
Distance left
The distance the wheelchair can travel on its current charge. This figure is an estimate and should not be relied upon.
Indoor drive time
The estimated number of hours of indoor drive time that is left on the current battery charge.
Battery max watt hours
The number of watt hours of energy stored in the battery when it is at maximum capacity.
Watt hours left
The number of watt hours of energy stored in the battery on its current charge.
Full charge distance
The distance the wheelchair can travel on a full charge. This figure is an estimate and should not be relied upon.
Distance traveled
The distance the wheelchair has traveled today.
Number of adjustments
The number of adjustments sessions today. Multiple different adjustment within a short time period are counted as a single sessions.
Highest number of adjustments
The highest number of adjustments ever recorded in a single day.
Longest distance traveled
The largest distance traveled ever recorded in a single day.
Is charging
Binary sensor that is true when the Permobil wheelchair is charging.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MyPermobil device was introduced in Home Assistant 2023.12, and it's used by
10 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@IsakNyberg
Categories
Sensor
Back to top
