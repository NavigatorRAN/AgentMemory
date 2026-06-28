---
source_url: "https://www.home-assistant.io/integrations/accuweather"
final_url: "https://www.home-assistant.io/integrations/accuweather"
canonical_url: "https://www.home-assistant.io/integrations/accuweather/"
source_handle: "web:www-home-assistant-io:85f159bf9514"
source_section: "integrations-accuweather"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "701e9911a779e98a7fb16210d6be9d110632a2852338c578bb0a286ffd5ce7cf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# AccuWeather - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/accuweather
- Final URL: https://www.home-assistant.io/integrations/accuweather
- Canonical URL: https://www.home-assistant.io/integrations/accuweather/
- Fetched at: 2026-06-28T02:25:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate AccuWeather within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Data updates
There is an active alert for this integration!
LEARN MORE
The AccuWeather integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the AccuWeather web service as a source for weather data for your location. A paid subscription is required to use this integration.
To generate an AccuWeather API key, go to AccuWeather APIs page, register, subscribe to one of the available plans and create application in Subscriptions & Keys section.
You can test your newly created API key here
To add the AccuWeather service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AccuWeather .
Follow the instructions on screen to complete the setup.
By default, the integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the current weather condition data from the AccuWeather API every 10 minutes, daily forecast data every 6 hours and hourly forecast data every 30 minutes. If you want to configure the integration for more than two locations, you need a plan higher than Starter .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AccuWeather service was introduced in Home Assistant 0.114, and it's used by
2672 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bieniu
Categories
Weather
Back to top
