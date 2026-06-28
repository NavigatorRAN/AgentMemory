---
source_url: "https://www.home-assistant.io/integrations/sensoterra"
final_url: "https://www.home-assistant.io/integrations/sensoterra"
canonical_url: "https://www.home-assistant.io/integrations/sensoterra/"
source_handle: "web:www-home-assistant-io:e96ba414f1a8"
source_section: "integrations-sensoterra"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "383c1c8d5895cbf379de8e6913beda4d7d80e4461bad9c65ebeec21c5e8a94fa"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Sensoterra - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sensoterra
- Final URL: https://www.home-assistant.io/integrations/sensoterra
- Canonical URL: https://www.home-assistant.io/integrations/sensoterra/
- Fetched at: 2026-06-28T03:15:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Sensoterra probes with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Sensors
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] communicates with your Sensoterra soil moisture probes using the public Sensoterra Customer API via HTTPS.
Soil moisture probes can be purchased at Sensoterra.com. Create a free account in the Sensoterra app and register your probes. The Sensoterra Home Assistant integration needs your credentials to obtain a token to access your probe data.
To add the Sensoterra hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sensoterra .
Follow the instructions on screen to complete the setup.
The integration provides the following sensors for each probe:
Soil moisture (either in volumetric-% or in SI)
Temperature (in degrees Celsius)
LoRaWAN signal strength (RSSI level)
Battery level (100, 50 or 10% approximations)
Last seen timestamp
Typically, soil moisture probes measure once an hour. The Home Assistant integration polls this data every 15 minutes.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sensoterra hub was introduced in Home Assistant 2024.10, and it's used by
2 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@markruys
Categories
Sensor
Back to top
