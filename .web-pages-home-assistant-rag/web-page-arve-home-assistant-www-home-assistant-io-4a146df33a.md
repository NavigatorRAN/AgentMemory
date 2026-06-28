---
source_url: "https://www.home-assistant.io/integrations/arve"
final_url: "https://www.home-assistant.io/integrations/arve"
canonical_url: "https://www.home-assistant.io/integrations/arve/"
source_handle: "web:www-home-assistant-io:4a146df33a82"
source_section: "integrations-arve"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8d9370d210664dcc04fa83b90ae682ae7bafe635f7efa1f98806aab36e29ef39"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Arve - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/arve
- Final URL: https://www.home-assistant.io/integrations/arve
- Canonical URL: https://www.home-assistant.io/integrations/arve/
- Fetched at: 2026-06-28T02:29:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Arve into Home Assistant

## Extracted Text

On this page
Configuration
Measurement entities
The Arve integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the ability to monitor real-life air quality data, as measured by your Arve device.
To add the Arve hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Arve .
Follow the instructions on screen to complete the setup.
To create an integration for an Arve device, you need to fill in two required fields.
Those are Home Assistant access token and Arve customer token .
Home Assistant access token and Arve customer token can be obtained by the user on the Arve web platform .
At the moment, an Arve device has the following measurement entities:
Entity name Unit of measurement AQI CO2 ppm Humidity % PM10 µg/m³ PM25 µg/m³ Temperature °C TVOC
Here:
AQI - air quality index;
CO2 - co2 measurement in parts per million;
Humidity - humidity percentage;
PM10 - concentration of particulates with a diameter less than 10 µm;
PM25 - concentration of particulates with a diameter less than 2.5 µm;
Temperature - temperature measurement in degrees Celsius;
TVOC - Total Volatile Organic Compounds index.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Arve hub was introduced in Home Assistant 2024.5, and it's used by
1 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ikalnyi
Categories
Environment
Health
Sensor
Back to top
