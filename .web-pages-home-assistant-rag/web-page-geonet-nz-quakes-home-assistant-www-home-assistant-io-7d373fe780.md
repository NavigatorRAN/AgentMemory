# GeoNet NZ Quakes - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/geonetnz_quakes
- Final URL: https://www.home-assistant.io/integrations/geonetnz_quakes
- Canonical URL: https://www.home-assistant.io/integrations/geonetnz_quakes/
- Fetched at: 2026-06-28T02:45:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the GeoNet New Zealand Quakes feed into Home Assistant.

## Extracted Text

On this page
Configuration
State attributes
Sensor
Full configuration
The GeoNet NZ Quakes integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you use a GeoJSON feed provided by
New Zealand’s GeoNet with information
about quakes in the New Zealand region that happened within the last 7 days.
It retrieves incidents from a feed and
shows information of those incidents filtered by distance to Home Assistant’s
location.
Entities are generated, updated and removed automatically with each update
from the feed. Each entity defines latitude and longitude and will be shown
on the default map automatically, or on a map card by defining the source
geonetnz_quakes . The distance is available as the state of each entity, and
converted to the unit (kilometers or miles) configured in Home Assistant.
The data is updated every 5 minutes.
Note
The material used by this integration is provided under the Creative Commons Attribution 3.0 New Zealand (CC BY 3.0 NZ) license .
It has only been modified for the purpose of presenting the material in Home Assistant.
Please refer to the creator’s disclaimer notice and data policy for more information.
We acknowledge the New Zealand GeoNet project and its sponsors EQC, GNS Science and LINZ, for providing data/images used in this integration.
To add the GeoNet NZ Quakes service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select GeoNet NZ Quakes .
Follow the instructions on screen to complete the setup.
The following state attributes are available for each entity in addition to
the standard ones:
Attribute Description latitude Latitude of the quake. longitude Longitude of the quake. source geonetnz_quakes to be used in conjunction with geo_location automation trigger. external_id The external ID used in the feed to identify the quake in the feed. title Title of this entry. mmi The calculated MMI shaking at the closest locality in the New Zealand region. magnitude The summary magnitude for the quake. depth The depth of the quake in km. time The origin date and time of the quake. locality Distance and direction to the nearest locality. quality The quality of this information: best, good, caution, deleted.
The reported MMI may be lower than the minimum requested MMI.
This integration is passing the requested MMI value to the feed source and
displays all entries retrieved without further filtering by MMI.
This integration automatically creates a sensor that shows how many entities
are currently managed by this integration. In addition to that the sensor has
some useful attributes that indicate the currentness of the data retrieved
from the feed.
Attribute Description status Status of last update from the feed (“OK” or “ERROR”). last update Timestamp of the last update from the feed. last update successful Timestamp of the last successful update from the feed. last timestamp Timestamp of the latest entry from the feed. created Number of entities that were created during last update (optional). updated Number of entities that were updated during last update (optional). removed Number of entities that were removed during last update (optional).
# Example configuration.yaml entry geonetnz_quakes : radius : 100 mmi : 4 minimum_magnitude : 4.5 latitude : -41.2 longitude : 174.7
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GeoNet NZ Quakes service was introduced in Home Assistant 0.98, and it's used by
222 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@exxamalte
Categories
Geolocation
Back to top
