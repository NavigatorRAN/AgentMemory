---
source_url: "https://www.home-assistant.io/integrations/dsmr_reader"
final_url: "https://www.home-assistant.io/integrations/dsmr_reader"
canonical_url: "https://www.home-assistant.io/integrations/dsmr_reader/"
source_handle: "web:www-home-assistant-io:a227abffd0e2"
source_section: "integrations-dsmr-reader"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "80dee711586328957dedf4e0167c9ea4a24645eb21cd763db9547feda180ab60"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# DSMR Reader - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dsmr_reader
- Final URL: https://www.home-assistant.io/integrations/dsmr_reader
- Canonical URL: https://www.home-assistant.io/integrations/dsmr_reader/
- Fetched at: 2026-06-28T02:38:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate DSMR Reader.

## Extracted Text

On this page
Prerequisites
Configuration
Configuring the energy dashboard
Difference with the DSMR integration
The DSMR Reader integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to easily add all sensors that DSMR Reader (Dutch Smart Meter Requirements Reader) exposes to MQTT. It adds a separate sensor for every field in the MQTT topics which is named sensor_dsmr_<mqtt_topic> .
To use this DSMR Reader sensor integration, you need to have a DSMR Reader instance running and an MQTT broker to send sensor data through.
Add the MQTT broker integration in Home Assistant, if you haven’t done so already
Configure the MQTT broker in the DSMR Reader application
Enable the following data sources in the DSMR Reader administration pages with the default mappings:
Day consumption: Split topic
Gas consumption: Split topic
Meter Statistics: Split topic
Quarter-hour peak consumption: Split topic
Telegram: Split topic
To add the DSMR Reader device to your Home Assistant instance, use this My button:
DSMR Reader can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select DSMR Reader .
Follow the instructions on screen to complete the setup.
It is most advisable to not use the “total” and “daily” sources. The regular “reading” sensors provide the most stable source of data for Home Assistant to use. These MQTT values are part of the “Telegram: Split topic” MQTT values within DSMR Reader, so make sure to enable them.
Section Sensors to configure Grid consumption Low tariff usage, High tariff usage Return to grid Low tariff returned, High tariff returned Gas consumption Gas meter usage
This integration relies on the presence of an existing DSMR Reader application setup. It processes the events triggered by the MQTT publishing feature to create sensor entities within Home Assistant. This integration uses the data published on the MQTT broker, no matter how or where the application is installed. By comparison, the DSMR integration connects directly to the smart meter within Home Assistant and doesn’t use the DSMR Reader application.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DSMR Reader device was introduced in Home Assistant 0.103, and it's used by
1403 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@sorted-bits
@glodenox
@erwindouna
Categories
Energy
Sensor
Back to top
