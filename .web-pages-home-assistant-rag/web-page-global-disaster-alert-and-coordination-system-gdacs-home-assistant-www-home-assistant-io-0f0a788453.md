---
source_url: "https://www.home-assistant.io/integrations/gdacs"
final_url: "https://www.home-assistant.io/integrations/gdacs"
canonical_url: "https://www.home-assistant.io/integrations/gdacs/"
source_handle: "web:www-home-assistant-io:0f0a788453b3"
source_section: "integrations-gdacs"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "26a2d736ffee0b81a2bf8d81c9c1f2af9e3e809f414015b7ca4a739ffe1f5154"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Global Disaster Alert and Coordination System (GDACS) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/gdacs
- Final URL: https://www.home-assistant.io/integrations/gdacs
- Canonical URL: https://www.home-assistant.io/integrations/gdacs/
- Fetched at: 2026-06-28T02:45:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Global Disaster Alert and Coordination System (GDACS) feed into Home Assistant.

## Extracted Text

On this page
Configuration
State attributes
Sensor
The GDACS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you use a GeoRSS feed provided by GDACS with information about major droughts, earthquakes, floods, tropical cyclones, tsunamis and volcanic activities worldwide.
It retrieves alerts from a feed and shows information of those alerts filtered by distance to Home Assistant’s location.
The filter is set in the configuration as categories, radius (kilometers or miles based on unit system set in Home Assistant), latitude and longitude.
Entities are generated, updated and removed automatically with each update from the feed. Each entity defines latitude and longitude and will be shown on the default map automatically, or on a map card by defining the source gdacs . The distance is available as the state of each entity converted to the configured unit system (kilometers or miles).
The data is updated every 5 minutes.
Note
The material used by this integration is provided by the Global Disaster Alert and Coordination System (GDACS) - a cooperation framework between the United Nations and the European Commission - under the Creative Commons Attribution 4.0 International (CC BY 4.0) license .
It has only been modified for the purpose of presenting the material in Home Assistant.
Please refer to the creator’s disclaimer and terms of use notice for more information.
To add the Global Disaster Alert and Coordination System (GDACS) service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Global Disaster Alert and Coordination System (GDACS) .
Follow the instructions on screen to complete the setup.
The following state attributes are available for each entity in addition to the standard ones:
Attribute Description latitude Latitude of the alert’s location. longitude Longitude of the alert’s location. source gdacs to be used in conjunction with geo_location automation trigger. external_id The external ID used in the feed to identify the alert. title Title of this entry. description Description of this entry. event type Type of event this alert is for (Drought, Earthquake, Flood, Tropical Cyclone, Tsunami, Volcano). alert level Alert level (Red, Orange, Green). country Country that the alert is applicable to. duration in week Duration of the alert in full weeks (only shown if more than one week). from date Date and time this alert started. to date Date and time this alert ended (or now if ongoing). population Exposed population. severity Severity of the alert. vulnerability Vulnerability score (textual or numerical).
Some of the attribute values depend on the context and may not
be comparable between different event types.
This integration automatically creates a sensor that shows how many entities
are currently managed by this integration. In addition to that the sensor has
some useful attributes that indicate the currentness of the data retrieved
from the feed.
Attribute Description status Status of last update from the feed (“OK” or “ERROR”). last update Timestamp of the last update from the feed. last update successful Timestamp of the last successful update from the feed. last timestamp Timestamp of the latest entry from the feed. created Number of entities that were created during last update (optional). updated Number of entities that were updated during last update (optional). removed Number of entities that were removed during last update (optional).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Global Disaster Alert and Coordination System (GDACS) service was introduced in Home Assistant 0.106, and it's used by
1672 active installations.
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
