# GeoNet NZ Volcano - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/geonetnz_volcano
- Final URL: https://www.home-assistant.io/integrations/geonetnz_volcano
- Canonical URL: https://www.home-assistant.io/integrations/geonetnz_volcano/
- Fetched at: 2026-06-28T02:45:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the GeoNet New Zealand Volcanic Alert Level feed into Home Assistant.

## Extracted Text

On this page
Configuration
State attributes
Full configuration
The GeoNet NZ Volcano integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you use a GeoJSON feed provided by
New Zealand’s GeoNet with information
about volcanoes in the New Zealand region.
It shows information of those volcanoes filtered by distance to Home Assistant’s
location.
Entities are generated and updated automatically with each update
from the feed. Each entity defines the volcanic alert level
as its state. Latitude and longitude of the volcano are included as attributes
to show on the default map automatically.
The data is updated every 5 minutes.
Note
The material used by this integration is provided under the Creative Commons Attribution 3.0 New Zealand (CC BY 3.0 NZ) license .
It has only been modified for the purpose of presenting the material in Home Assistant.
Please refer to the creator’s disclaimer notice and data policy for more information.
We acknowledge the New Zealand GeoNet project and its sponsors EQC, GNS Science and LINZ, for providing data/images used in this integration.
To add the GeoNet NZ Volcano service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select GeoNet NZ Volcano .
Follow the instructions on screen to complete the setup.
The following state attributes are available for each entity in addition to
the standard ones:
Attribute Description latitude Latitude of the volcano. longitude Longitude of the volcano. external_id The external ID used in the feed to identify the volcano. activity Volcanic activity. hazards Most likely hazards. distance The distance in km or mi to Home Assistant’s location. last update Timestamp of the last update from the feed. last update successful Timestamp of the last successful update from the feed.
# Example configuration.yaml entry geonetnz_volcano : radius : 100 latitude : -41.2 longitude : 174.7
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GeoNet NZ Volcano service was introduced in Home Assistant 0.103, and it's used by
57 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@exxamalte
Categories
Sensor
Back to top
