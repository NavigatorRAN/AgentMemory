---
source_url: "https://www.home-assistant.io/integrations/london_air"
final_url: "https://www.home-assistant.io/integrations/london_air"
canonical_url: "https://www.home-assistant.io/integrations/london_air/"
source_handle: "web:www-home-assistant-io:4714b1b64aa1"
source_section: "integrations-london-air"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "358f714e73daacdc1f8507e1b047ab45080a6c6fe4154f3bf94a21eed66c1f62"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# London Air - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/london_air
- Final URL: https://www.home-assistant.io/integrations/london_air
- Canonical URL: https://www.home-assistant.io/integrations/london_air/
- Fetched at: 2026-06-28T02:57:43Z
- Content type: text/html; charset=UTF-8

## Description

Display the current status of London air quality by area and pollution type.

## Extracted Text

On this page
Related topics
The London Air integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] queries the London air quality data feed provided by Kings College London. A single sensor will be added for each location ( local authority district or borough ) specified in the configuration file. The state of each sensor is the overall air quality in that borough. Note that only 28 of the 32 boroughs have data available.
Boroughs can have multiple monitoring sites at different geographical positions within the borough, and each of those sites can monitor up to six different kinds of pollutant. The pollutants are described here and are Carbon Monoxide ( CO ), Nitrogen Dioxide ( NO2 ), Ozone ( O3 ), Sulfur Dioxide ( SO2 ), PM2.5 & PM10 particulates . The latitude and longitude of each site is accessible through a data attribute of the sensor, as are details about the pollutants monitored at that site. The sites attribute of a sensor displays how many monitoring sites that sensor covers. The updated attribute of a sensor states when the data was last published. Nominally data is published hourly, but in my experience this can vary. To limit the number of requests made by the sensor, a single API request is made every 30 minutes.
To add sensors to Home Assistant for all possible areas/boroughs add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry for a single sensor sensor : - platform : london_air locations : - Barking and Dagenham - Bexley - Brent - Camden - City of London - Croydon - Ealing - Enfield - Greenwich - Hackney - Haringey - Harrow - Havering - Hillingdon - Islington - Kensington and Chelsea - Kingston - Lambeth - Lewisham - Merton - Redbridge - Richmond - Southwark - Sutton - Tower Hamlets - Wandsworth - Westminster
Configuration Variables
Looking for your configuration file?
locations list ( Optional )
Areas/boroughs in London to monitor.
Default:
All location with data available.
To explore the data available within the data attribute of a sensor use the dev-template tool on the Home Assistant frontend. data contains a list of monitored sites, where the number of monitored sites are given by the sites attribute. If a sensor has four sites, access the fourth site by indexing the list of sites using data[3]. Each site is a dictionary with multiple fields, with entries for the latitude and longitude of that site, a pollution_status , site_code , site_name and site_type . The field number_of_pollutants states how many pollutants are monitored (of the possible six) and the field pollutants returns a list with data for each pollutant. To access the first pollutant in the list for site zero use attributes.data[0].pollutants[0] . Each entry in pollutants is a dictionary with fields for the pollutant code , description , index , quality and a summary . Template sensors can then be added to display these attributes, for example:
# Example template sensors template : - sensor : - name : " Updated" state : " {{ state_attr('sensor.merton', 'updated') }}" - name : " Merton PM10" state : " {{ state_attr('sensor.merton', 'data')[0].pollutants[0].summary }}" - name : " Westminster S02" state : " {{ state_attr('sensor.westminster', 'data')[0].pollutants[3].summary }}"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The London Air integration was introduced in Home Assistant 0.52, and it's used by
45 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Health
Back to top
