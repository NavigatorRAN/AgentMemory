---
source_url: "https://www.home-assistant.io/integrations/altruist"
final_url: "https://www.home-assistant.io/integrations/altruist"
canonical_url: "https://www.home-assistant.io/integrations/altruist/"
source_handle: "web:www-home-assistant-io:18035d91d383"
source_section: "integrations-altruist"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "567700b123335c0f82608ef7c2d1424007770eb6d0d75ff2a625f0265335e2c7"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Altruist - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/altruist
- Final URL: https://www.home-assistant.io/integrations/altruist
- Canonical URL: https://www.home-assistant.io/integrations/altruist/
- Fetched at: 2026-06-28T02:27:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Altruist Sensors in Home Assistant.

## Extracted Text

On this page
Configuration
Available sensors
Removing the integration
To remove an integration instance from Home Assistant
The Altruist integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects Home Assistant to Air Quality Sensor “Altruist“ — a device designed for decentralized environmental monitoring. It captures noise, dust, and temperature data from the sensor over HTTP, making it available as locally usable entities within Home Assistant.
To add the Altruist device to your Home Assistant instance, use this My button:
Altruist can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Altruist .
Follow the instructions on screen to complete the setup.
IP Address
The local IP address for your Altruist device.
The integration will fetch data from each device. The following sensors are supported:
Humidity
Temperature
Atmospheric pressure
PM2.5 density
PM10 density
Ambient noise level
Carbon dioxide (CO2) level
Total volatile organic compounds (TVOC)
Ambient radiation level
Wi-Fi signal strength
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Altruist device was introduced in Home Assistant 2025.7, and it's used by
2 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@airalab
@LoSk-p
Categories
Health
Sensor
Back to top
