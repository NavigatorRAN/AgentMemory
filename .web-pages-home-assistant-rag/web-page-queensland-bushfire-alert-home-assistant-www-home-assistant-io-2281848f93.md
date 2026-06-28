---
source_url: "https://www.home-assistant.io/integrations/qld_bushfire"
final_url: "https://www.home-assistant.io/integrations/qld_bushfire"
canonical_url: "https://www.home-assistant.io/integrations/qld_bushfire/"
source_handle: "web:www-home-assistant-io:2281848f93a7"
source_section: "integrations-qld-bushfire"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "978a861053bab96d07e10ae6fdf398bfafed052cb34591dc0ea392cb5437d316"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Queensland Bushfire Alert - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/qld_bushfire
- Final URL: https://www.home-assistant.io/integrations/qld_bushfire
- Canonical URL: https://www.home-assistant.io/integrations/qld_bushfire/
- Fetched at: 2026-06-28T03:10:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Queensland Bushfire Alert feed into Home Assistant.

## Extracted Text

On this page
Configuration
State attributes
Full configuration
Related topics
The Queensland Bushfire Alert integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you integrate a
GeoRSS feed containing bushfire alerts for Queensland. It retrieves alerts from a feed
and shows information of those alerts filtered by distance to Home Assistant’s
location.
Entities are generated, updated and removed automatically with each update
from the feed. Each entity defines latitude and longitude and will be shown
on the default map automatically, or on a map card by defining the source
qld_bushfire . The distance in kilometers is available as the state
of each entity.
The data is updated every 5 minutes.
Note
The material used by this integration is provided under the Creative Commons Attribution 4.0 license .
It has only been modified for the purpose of presenting the material in Home Assistant.
Please refer to the creator’s copyright notice for more information.
To integrate the Queensland Bushfire Alert feed, add the following lines to
your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry geo_location : - platform : qld_bushfire
Configuration Variables
Looking for your configuration file?
categories list ( Optional )
List of category names found in the feed. Only alerts from the feed that match any of these categories are included. Valid categories are ‘Emergency Warning’, ‘Watch and Act’, ‘Advice’, ‘Notification’ and ‘Information’.
radius float ( Optional , default: 20.0 )
The distance in kilometers around Home Assistant’s coordinates in which bushfire alerts are included.
latitude string ( Optional )
Latitude of the coordinates around which events are considered.
Default:
Latitude defined in your configuration
longitude string ( Optional )
Longitude of the coordinates around which events are considered.
Longitude defined in your configuration
The following state attributes are available for each entity in addition to
the standard ones:
Attribute Description latitude Latitude of the bushfire alert. longitude Longitude of the bushfire alert. source qld_bushfire to be used in conjunction with geo_location automation trigger. external_id The external ID used in the feed to identify the bushfire alert in the feed. title Original title from the feed. publication_date Date and time when this alert was first published. updated_date Date and time when this alert was last updated. status Status of the alert, for example, “Patrolled”, “Going”, “Contained”
# Example configuration.yaml entry geo_location : - platform : qld_bushfire radius : 30 categories : - ' Emergency Warning' - ' Watch and Act' latitude : -24.85 longitude : 152.35
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Queensland Bushfire Alert service was introduced in Home Assistant 0.95, and it's used by
34 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@exxamalte
Categories
Geolocation
Back to top
