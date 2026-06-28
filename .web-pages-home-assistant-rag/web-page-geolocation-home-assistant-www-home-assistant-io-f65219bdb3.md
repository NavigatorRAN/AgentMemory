# Geolocation - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/geo_location
- Final URL: https://www.home-assistant.io/integrations/geo_location
- Canonical URL: https://www.home-assistant.io/integrations/geo_location/
- Fetched at: 2026-06-28T02:45:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate geolocation aware platforms into Home Assistant.

## Extracted Text

On this page
Geolocation trigger
Geolocation notification example
Geolocation aware entities are typically related to events in the real world in the vicinity of Home Assistant’s location, like for example weather events, bush fires or earthquakes.
Entities can have associated geolocation coordinates (latitude and longitude) so that they are displayed on the map. The distance from the entity’s coordinates to Home Assistant’s location can be used for filtering.
Note
Building block integration
This geolocation is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this geolocation building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the geolocation building block offers.
The Geolocation trigger can be used in automations triggered by Geolocation entities appearing in or disappearing from zones. The following value must be used as source of the trigger depending on which platform is managing the entities:
Platform Source GeoJSON Events geo_json_events GeoNet New Zealand Quakes geonetnz_quakes Global Disaster Alert and Coordination System (GDACS) gdacs IGN Sismología ign_sismologia NSW Rural Fire Service Incidents nsw_rural_fire_service_feed Queensland Bushfire Alert qld_bushfire U.S. Geological Survey Earthquake Hazards Program usgs_earthquakes_feed
Conditions can be used to further filter entities, for example by inspecting their state attributes.
The following example automation creates a notification on the screen when a fire classified as ‘Bush Fire’ is reported within a predefined bush fire alert zone:
geo_location : - platform : nsw_rural_fire_service_feed categories : - ' Emergency Warning' - ' Watch and Act' - ' Advice' zone : - name : Bush Fire Alert Zone latitude : -36.666667 longitude : 149.833333 radius : 15000 passive : true automation : - alias : " Bush Fire Alert" triggers : - trigger : geo_location source : nsw_rural_fire_service_feed zone : zone.bush_fire_alert_zone event : enter conditions : - condition : template value_template : " {{ trigger.to_state.attributes.type == 'Bush Fire' }}" actions : - action : persistent_notification.create data : message : " {{ trigger.to_state.name }} - {{ trigger.to_state.attributes.status }}" title : " Bush Fire Alert"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Geolocation entity was introduced in Home Assistant 0.78.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Geolocation
Back to top
