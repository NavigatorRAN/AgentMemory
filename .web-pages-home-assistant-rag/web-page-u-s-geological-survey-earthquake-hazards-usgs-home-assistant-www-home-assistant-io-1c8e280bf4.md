---
source_url: "https://www.home-assistant.io/integrations/usgs_earthquakes_feed"
final_url: "https://www.home-assistant.io/integrations/usgs_earthquakes_feed"
canonical_url: "https://www.home-assistant.io/integrations/usgs_earthquakes_feed/"
source_handle: "web:www-home-assistant-io:1c8e280bf4c3"
source_section: "integrations-usgs-earthquakes-feed"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ed2af9735201d8d83932e7f0515b756059dbbdf36751fe2ed8b3d1fdf6e10927"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# U.S. Geological Survey Earthquake Hazards (USGS) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/usgs_earthquakes_feed
- Final URL: https://www.home-assistant.io/integrations/usgs_earthquakes_feed
- Canonical URL: https://www.home-assistant.io/integrations/usgs_earthquakes_feed/
- Fetched at: 2026-06-28T03:25:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the U.S. Geological Survey Earthquake Hazards Program Feed feed into Home Assistant.

## Extracted Text

On this page
Configuration
Supported feed types
State attributes
Full configuration
Card example
Related topics
The U.S. Geological Survey Earthquake Hazards (USGS) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you integrate a GeoJSON feed provided by the U.S. Geological Survey with information about seismic events like earthquakes. It retrieves incidents from a feed and shows information of those incidents filtered by distance to Home Assistant’s location.
Entities are generated, updated and removed automatically with each update from the feed. Each entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] defines latitude and longitude and will be shown on the map automatically. The distance in kilometers is available as the state of each entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] .
The data is updated every 5 minutes.
To integrate the U.S. Geological Survey Earthquake Hazards Program feed, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry geo_location : - platform : usgs_earthquakes_feed feed_type : " past_day_all_earthquakes"
Configuration Variables
Looking for your configuration file?
feed_type string Required
The U.S. Geological Survey Earthquake Hazards Program provides 20 feeds covering different timeframes and magnitudes. You must select one of the feed types listed below.
minimum_magnitude float ( Optional , default: 0.0 )
The minimum magnitude of an earthquake to be included.
radius float ( Optional , default: 50.0 )
The distance in kilometers around Home Assistant’s coordinates in which seismic events are included.
latitude string ( Optional )
Latitude of the coordinates around which events are considered.
Default:
Latitude defined in your configuration.yaml
longitude string ( Optional )
Longitude of the coordinates around which events are considered.
Longitude defined in your configuration.yaml
Description Feed Type Past Hour - Significant Earthquakes past_hour_significant_earthquakes Past Hour - M4.5+ Earthquakes past_hour_m45_earthquakes Past Hour - M2.5+ Earthquakes past_hour_m25_earthquakes Past Hour - M1.0+ Earthquakes past_hour_m10_earthquakes Past Hour - All Earthquakes past_hour_all_earthquakes Past Day - Significant Earthquakes past_day_significant_earthquakes Past Day - M4.5+ Earthquakes past_day_m45_earthquakes Past Day - M2.5+ Earthquakes past_day_m25_earthquakes Past Day - M1.0+ Earthquakes past_day_m10_earthquakes Past Day - All Earthquakes past_day_all_earthquakes Past 7 Days - Significant Earthquakes past_week_significant_earthquakes Past 7 Days - M4.5+ Earthquakes past_week_m45_earthquakes Past 7 Days - M2.5+ Earthquakes past_week_m25_earthquakes Past 7 Days - M1.0+ Earthquakes past_week_m10_earthquakes Past 7 Days - All Earthquakes past_week_all_earthquakes Past 30 Days - Significant Earthquakes past_month_significant_earthquakes Past 30 Days - M4.5+ Earthquakes past_month_m45_earthquakes Past 30 Days - M2.5+ Earthquakes past_month_m25_earthquakes Past 30 Days - M1.0+ Earthquakes past_month_m10_earthquakes Past 30 Days - All Earthquakes past_month_all_earthquakes
The following state attributes are available for each entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] in addition to the standard ones:
Attribute Description latitude Latitude of the earthquake. longitude Longitude of the earthquake. source usgs_earthquakes_feed to be used in conjunction with geo_location automation trigger. external_id The external ID used in the feed to identify the earthquake in the feed. place Textual description of named geographic region near to the event. magnitude Reported magnitude of the earthquake. time Date and time when this event occurred. updated Date and time when this event was most recently updated. status Indicates whether the event has been reviewed by a human: “automatic”, “reviewed”, “deleted” type Type of seismic event: “earthquake” or “quarry”.
# Example configuration.yaml entry geo_location : - platform : usgs_earthquakes_feed feed_type : " past_month_all_earthquakes" radius : 50 minimum_magnitude : 0.0 latitude : 35.899722 longitude : -120.432778
Assuming you configure this service using feed_type: past_week_all_earthquakes , you can create a corresponding map card in a dashboard with the following card:
type : map geo_location_sources : - usgs_earthquakes_feed entities : - zone.home title : Nearby Earthquakes Last Week
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The U.S. Geological Survey Earthquake Hazards (USGS) service was introduced in Home Assistant 0.84, and it's used by
541 active installations.
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
