---
source_url: "https://www.home-assistant.io/integrations/yandex_transport"
final_url: "https://www.home-assistant.io/integrations/yandex_transport"
canonical_url: "https://www.home-assistant.io/integrations/yandex_transport/"
source_handle: "web:www-home-assistant-io:052adf37d5e4"
source_section: "integrations-yandex-transport"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "358b5a04150f3bf583455b65580406ff4ab393cc486ad4c602d2fcc64054f78c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Yandex Transport - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yandex_transport
- Final URL: https://www.home-assistant.io/integrations/yandex_transport
- Canonical URL: https://www.home-assistant.io/integrations/yandex_transport/
- Fetched at: 2026-06-28T03:30:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Yandex transport with Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration example
Options for entities
Related topics
The Yandex Transport integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Yandex Maps it will give you the time until the next departure time from a bus/tramway/etc stop.
The Yandex Maps website can help to determine the id of your bus stop. You can select a bus stop by clicking on the map, and look to the URL:
https://yandex.ru/maps/213/moscow/?ll=37.722565%2C55.806662&masstransit%5BstopId%5D=stop__9642962&mode=masstransit&z=16.52
Where stop id is: stop__9642962
If you want to track only specific routes, you can add them in the routes section.
To activate Yandex Transport, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : yandex_transport stop_id : YOUR_STOP_ID
Configuration Variables
Looking for your configuration file?
stop_id string Required
The ID of the transport stop to get the information for.
routes list ( Optional )
A list of a specific bus, tramway, etc routes at the stop. This is the same as the bus number, e.g., 83 . If the routes with letters contain Cyrillic symbols, so write them to configuration.yaml in Cyrillic.
name string ( Optional , default: Yandex Transport )
A friendly name for this sensor.
The configuration sample below shows how an entry can look like:
# Example configuration.yaml entry sensor : - platform : yandex_transport name : Bus_to_subway stop_id : stop__9639579 routes : - 63 - 179 - 179к - 154 - 591 - 677к
You can configure view information about the next bus using dashboard card.
To enable displaying the relative time in your default_view add the following lines:
# Example default_view entry views : cards : - entities : - entity : sensor.yandex_transport format : relative type : entities path : default_view
Data provided by https://maps.yandex.ru
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yandex Transport integration was introduced in Home Assistant 0.100, and it's used by
37 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rishatik92
@devbis
Categories
Sensor
Transport
Back to top
