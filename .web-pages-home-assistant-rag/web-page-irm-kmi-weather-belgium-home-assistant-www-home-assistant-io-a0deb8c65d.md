---
source_url: "https://www.home-assistant.io/integrations/irm_kmi"
final_url: "https://www.home-assistant.io/integrations/irm_kmi"
canonical_url: "https://www.home-assistant.io/integrations/irm_kmi/"
source_handle: "web:www-home-assistant-io:a0deb8c65d2c"
source_section: "integrations-irm-kmi"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "324cce3afb3971afc30cc949d4d92fa6c2def320362b93aaad3979fdc656e17c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# IRM KMI Weather Belgium - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/irm_kmi
- Final URL: https://www.home-assistant.io/integrations/irm_kmi
- Canonical URL: https://www.home-assistant.io/integrations/irm_kmi/
- Fetched at: 2026-06-28T02:53:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate IRM KMI weather within Home Assistant.

## Extracted Text

On this page
Configuration
Options
Supported features
Limitations
Data updates
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Royal Meteorological Institute of Belgium integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates the weather data from IRM KMI (meteo.be) with Home Assistant.
Although the provider is Belgian, the data is available for Belgium 🇧🇪, Luxembourg 🇱🇺, and The Netherlands 🇳🇱.
The data provided by this integration is retrieved from their mobile application .
To add the IRM KMI Weather Belgium service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IRM KMI Weather Belgium .
Follow the instructions on screen to complete the setup.
Location
The location for which you want to get weather data.
To define options for IRM KMI Weather Belgium, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of IRM KMI Weather Belgium are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Language
Override the Home Assistant language for the textual weather forecast. Useful if your Home Assistant language is not supported by the Royal Meteorological Institute of Belgium.
The integration provides a weather entity along with weather forecast services .
The weather provider sometimes uses two weather conditions for the same day (see below). When this is the case, only the first weather condition is taken into account in this integration.
The trends for 14 days are not shown.
The provider only has data for Belgium, Luxembourg and The Netherlands.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] weather data every 7 minutes by default.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Community forum thread
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IRM KMI Weather Belgium service was introduced in Home Assistant 2025.10, and it's used by
665 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jdejaegh
Back to top
