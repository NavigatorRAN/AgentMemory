# GeoRSS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/geo_rss_events
- Final URL: https://www.home-assistant.io/integrations/geo_rss_events
- Canonical URL: https://www.home-assistant.io/integrations/geo_rss_events/
- Fetched at: 2026-06-28T02:45:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up GeoRSS sensors within Home Assistant.

## Extracted Text

On this page
Configuration
Example Feeds
Bush Fire Alerts
Earthquake Alerts
Related topics
The GeoRSS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] retrieves events from a GeoRSS feed and shows information of those events filtered by distance to Home Assistant’s location and grouped by category.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is particularly useful if events occur unexpectedly in the vicinity of the home while the GeoRSS feed also contains many events representing distant unrelated entries. Typical examples are bush fires alerts or earthquakes.
The reference point for comparing the distance is by default defined by latitude and longitude in the basic configuration.
Only entries of the feed are considered that define a location as point or polygon in georss.org format or as WGS84 latitude/longitude .
The data is updated every 5 minutes.
To enable the GeoRSS events sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
This is an example configuration showing bush fire incidents from the NSW Rural Fire Service.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : geo_rss_events name : NSW Fire Service url : https://www.rfs.nsw.gov.au/feeds/majorIncidents.xml unit_of_measurement : " Incidents" categories : - ' Emergency Warning' - ' Watch and Act' - ' Advice'
Configuration Variables
Looking for your configuration file?
url string Required
Full URL of the GeoRSS feed.
name string ( Optional , default: Event Service )
Name of the sensor used in generating the entity id.
latitude string ( Optional )
Latitude of the coordinates around which events are considered.
Default:
Latitude defined in your configuration.yaml
longitude string ( Optional )
Longitude of the coordinates around which events are considered.
Longitude defined in your configuration.yaml
radius string ( Optional , default: 20km )
The distance in kilometers around the Home Assistant’s coordinates in which events are considered.
categories list ( Optional )
List of event category names found in the GeoRSS feed. A separate sensor is created for each category defined.
Default is to join events from all categories into an ‘Any’ category.
unit_of_measurement string ( Optional , default: Events )
The type of events found in the GeoRSS feed.
sensor : - platform : geo_rss_events name : Qld Fire and Emergency Services url : https://www.qfes.qld.gov.au/data/alerts/bushfireAlert.xml unit_of_measurement : " Alerts" - platform : geo_rss_events name : TasALERT url : https://alert.tas.gov.au/data/incidents-and-alerts.xml unit_of_measurement : " Alerts" - platform : geo_rss_events name : WA Department of Fire and Emergency Services url : https://www.emergency.wa.gov.au/data/incident_FCAD.rss - platform : geo_rss_events name : ACT Emergency Services Agency url : https://www.esa.act.gov.au/feeds/currentincidents.xml
sensor : - platform : geo_rss_events name : USGS All Earthquakes url : https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.atom categories : - ' Past Hour' - ' Past Day' - platform : geo_rss_events name : BGS Worldwide Earthquakes url : http://earthquakes.bgs.ac.uk/feeds/WorldSeismology.xml categories : - ' EQMH' - platform : geo_rss_events name : Recent significant earthquake reports (Canada) url : https://www.earthquakescanada.nrcan.gc.ca/cache/earthquakes/canada-en.atom categories : - ' Earthquake Report'
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GeoRSS integration was introduced in Home Assistant 0.55, and it's used by
78 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@exxamalte
Categories
Sensor
Back to top
