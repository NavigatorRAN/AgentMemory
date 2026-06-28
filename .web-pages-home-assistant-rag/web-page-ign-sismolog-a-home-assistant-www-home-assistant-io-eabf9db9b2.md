# IGN Sismología - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ign_sismologia
- Final URL: https://www.home-assistant.io/integrations/ign_sismologia
- Canonical URL: https://www.home-assistant.io/integrations/ign_sismologia/
- Fetched at: 2026-06-28T02:51:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Instituto Geográfico Nacional Sismología (Earthquakes) Feed feed into Home Assistant.

## Extracted Text

On this page
Configuration
State Attributes
Full Configuration
Related topics
The IGN Sismología integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you integrate a GeoRSS feed provided by the
Spanish Instituto Geográfico Nacional with information
about seismic events like earthquakes on the Iberian Peninsula and Canary
Islands. It retrieves incidents from a feed and shows information of those
incidents filtered by distance to Home Assistant’s location.
Entities are generated, updated and removed automatically with each update
from the feed. Each entity defines latitude and longitude and will be shown
on the default map automatically, or on a map card by defining the source
ign_sismologia . The distance in kilometers is available as the state
of each entity.
The data is updated every 5 minutes.
To integrate the IGN Sismología feed, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry geo_location : - platform : ign_sismologia
Configuration Variables
Looking for your configuration file?
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
The following state attributes are available for each entity in addition to
the standard ones:
Attribute Description latitude Latitude of the earthquake. longitude Longitude of the earthquake. source ign_sismologia to be used in conjunction with geo_location automation trigger. external_id The external ID used in the feed to identify the earthquake in the feed. title Original title from the feed. region Textual description of named geographic region near to the event. magnitude Reported magnitude of the earthquake. publication_date Date and time when this event occurred. image_url URL to a map supplied in the feed marking the location of the event. This could for example be used in notifications.
# Example configuration.yaml entry geo_location : - platform : ign_sismologia radius : 100 minimum_magnitude : 2.0 latitude : 37.39 longitude : -5.99
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IGN Sismología service was introduced in Home Assistant 0.92, and it's used by
57 active installations.
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
