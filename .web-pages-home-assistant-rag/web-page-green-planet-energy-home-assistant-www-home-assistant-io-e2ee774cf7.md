---
source_url: "https://www.home-assistant.io/integrations/green_planet_energy"
final_url: "https://www.home-assistant.io/integrations/green_planet_energy"
canonical_url: "https://www.home-assistant.io/integrations/green_planet_energy/"
source_handle: "web:www-home-assistant-io:e2ee774cf739"
source_section: "integrations-green-planet-energy"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7b2e3389b45fd8196ee29eef371e3c376ed46dd7f29a22f05337abdae67ae87d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Green Planet Energy - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/green_planet_energy
- Final URL: https://www.home-assistant.io/integrations/green_planet_energy
- Canonical URL: https://www.home-assistant.io/integrations/green_planet_energy/
- Fetched at: 2026-06-28T02:47:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Green Planet Energy dynamic electricity pricing into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Sensors
Current price
Statistics
Removing the integration
To remove an integration instance from Home Assistant
Disclaimer
The Green Planet Energy integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides real-time electricity pricing data from Green Planet Energy, a German renewable energy provider. It fetches hourly electricity prices and provides various sensors for energy optimization and monitoring. It visualizes the prices so that you can adapt your power consumption and shift it to cheaper hours.
You don’t need to have an account with Green Planet Energy for this integration to work. However, the integration will probably only make sense if you are their customer with a dynamic energy tariff. For the setup, no additional information is required.
To add the Green Planet Energy service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Green Planet Energy .
Follow the instructions on screen to complete the setup.
The Green Planet Energy integration provides the following sensors.
Current price : The current electricity price in EUR/kWh
Highest price today : The highest electricity price for the current day
Lowest price day : The lowest electricity price during day hours (6:00-18:00)
Lowest price night : The lowest electricity price during night hours (18:00-6:00)
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
This plugin is third-party and not offered by Green Planet Energy eG.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Green Planet Energy service was introduced in Home Assistant 2026.2, and it's used by
64 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@petschni
Categories
Energy
Sensor
Back to top
