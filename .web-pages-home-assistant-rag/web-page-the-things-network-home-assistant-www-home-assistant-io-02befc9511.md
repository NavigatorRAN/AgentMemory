---
source_url: "https://www.home-assistant.io/integrations/thethingsnetwork"
final_url: "https://www.home-assistant.io/integrations/thethingsnetwork"
canonical_url: "https://www.home-assistant.io/integrations/thethingsnetwork/"
source_handle: "web:www-home-assistant-io:02befc9511ae"
source_section: "integrations-thethingsnetwork"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7b3a7b334b5cbe2cd9500a8392144134aae9ef249e00b714dd86ba2f8eb9baf6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# The Things Network - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/thethingsnetwork
- Final URL: https://www.home-assistant.io/integrations/thethingsnetwork
- Canonical URL: https://www.home-assistant.io/integrations/thethingsnetwork/
- Fetched at: 2026-06-28T03:22:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for how to integrate The Things Network within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Sensor
The The Things Network integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to interact with the The Things Network from within Home Assistant. This community-driven and open network supports LoRaWAN for long-range (~5 to 15 km) communication with low bandwidth (51 bytes/message). Gateways transfer the received data from the sensors to The Things Network.
The Things Network supports various integrations to make the data available:
The Things Network Integration Home Assistant platform MQTT MQTT Storage thethingsnetwork HTTP
There is currently support for the following device types within Home Assistant:
Visit the The Things Network Console website, log in with your The Things Network credentials, choose your application from Applications .
The Application ID is used to identify the scope of your data.
Under the integrations menu, enable the storage integration:
Ensure you have an Uplink Payload Formatter for your device.
You need an API key to be able to read the data from your application.
The minimum required rights are Read Application Traffic (uplink and downlink) .
To add the The Things Network hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select The Things Network .
Follow the instructions on screen to complete the setup.
All uplink messages decoded by The Things Network (including a decoded_payload entry) will be processes by this integration. Each field in decoded_payload will be added as a Home Assistant sensor entity.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The The Things Network hub was introduced in Home Assistant 0.55, and it's used by
381 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@angelnu
Categories
Hub
Back to top
