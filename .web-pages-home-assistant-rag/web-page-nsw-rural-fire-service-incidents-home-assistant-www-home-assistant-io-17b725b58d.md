# NSW Rural Fire Service Incidents - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nsw_rural_fire_service_feed
- Final URL: https://www.home-assistant.io/integrations/nsw_rural_fire_service_feed
- Canonical URL: https://www.home-assistant.io/integrations/nsw_rural_fire_service_feed/
- Fetched at: 2026-06-28T03:04:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the NSW Rural Fire Service Incidents feed into Home Assistant.

## Extracted Text

On this page
Configuration
State Attributes
Advanced Configuration Example
Related topics
The NSW Rural Fire Service Incidents integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you integrate a GeoJSON feed provided by the NSW Rural Fire Service with information about bush fires, grass fires, hazard reductions and more. It retrieves incidents from a feed and shows information of those incidents filtered by distance to Home Assistant’s location.
Entities are generated, updated and removed automatically with each update from the feed. Each entity defines latitude and longitude and will be shown on the map automatically. The distance in kilometers is available as the state of each entity.
For example, you can use the entity’s information to trigger actions based on the proximity and severity of a fire incident. You can set up automations to close windows, activate sprinklers or remind yourself to clean the gutters if there is a fire in your area.
The data is updated every 5 minutes.
To integrate the NSW Rural Fire Service Incidents feed, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry geo_location : - platform : nsw_rural_fire_service_feed
Configuration Variables
Looking for your configuration file?
radius float ( Optional , default: 20.0 )
The distance in kilometers around Home Assistant’s coordinates in which incidents are included.
categories list ( Optional )
List of incident category names found in the feed. Only incidents from the feed that match any of these categories are included. Valid categories are ‘Emergency Warning’, ‘Watch and Act’, ‘Advice’, ‘Not Applicable’.
Default:
None. Any incident regardless of its category will be included.
latitude string ( Optional )
Latitude of the coordinates around which events are considered.
Latitude defined in your configuration.yaml
longitude string ( Optional )
Longitude of the coordinates around which events are considered.
Longitude defined in your configuration.yaml
The following state attributes are available for each entity in addition to the standard ones:
Attribute Description latitude Latitude of the incident. longitude Longitude of the incident. source nsw_rural_fire_service_feed to be used in conjunction with geo_location automation trigger. external_id The external ID used in the feed to identify the incident in the feed. category One of ‘Emergency Warning’, ‘Watch and Act’, ‘Advice’, ‘Not Applicable’. location Location details of where the incident takes place. publication_date Date and time when this incident was last updated. council_area Council area in which this incident takes place. status One of ‘Under Control’, ‘Being Controlled’, ‘Out of Control’. type Incident type, for example ‘Bush Fire’, ‘Grass Fire’ or ‘Hazard Reduction’. fire True if this incident is a fire, False otherwise. size Size in hectare responsible_agency Agency responsible for this incident.
Depending on your personal circumstances with regards to bush fire risk you may want to adjust the radius and define the categories of fire warnings you are actually interested in.
# Example configuration.yaml entry geo_location : - platform : nsw_rural_fire_service_feed entity_namespace : " nsw_fire_service_feed" radius : 10 categories : - ' Emergency Warning' - ' Watch and Act' - ' Advice'
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NSW Rural Fire Service Incidents service was introduced in Home Assistant 0.81, and it's used by
118 active installations.
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
