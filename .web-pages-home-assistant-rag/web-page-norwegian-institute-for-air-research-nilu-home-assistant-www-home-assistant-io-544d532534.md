# Norwegian Institute for Air Research (NILU) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nilu
- Final URL: https://www.home-assistant.io/integrations/nilu
- Canonical URL: https://www.home-assistant.io/integrations/nilu/
- Fetched at: 2026-06-28T03:03:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate air pollution data from NILU within Home Assistant.

## Extracted Text

On this page
Configuration
Health risk index explanations
Low
Moderate
High
Extremely high
Available areas
Configuration examples
Related topics
The NILU integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] shows measurements of current air quality from NILU (Norsk Institutt for luftforskning/Norwegian Institute for Air Research) sensor stations within Norway. Makes data from the open API at luftkvalitet.info and nilu.no available in Home Assistant.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry air_quality : - platform : nilu
Configuration Variables
Looking for your configuration file?
latitude float ( Optional )
Manually specify latitude. By default, the value will be taken from the Home Assistant configuration.
Default:
Provided by Home Assistant configuration.
longitude float ( Optional )
Manually specify longitude. By default, the value will be taken from the Home Assistant configuration.
name string ( Optional , default: NILU )
Name of the sensor to use in the frontend.
area string ( Exclusive )
Name of an area to get sensor stations from. See available areas below.
stations string ( Exclusive )
Name of a specific station to get measurements from.
show_on_map boolean ( Optional , default: false )
Option to show the position of the sensor station on the map.
Under the attributes from a NILU station, there will be a nilu pollution index . This indicates how polluted the air is in the area around the sensor station. Following is a longer explanation of what the indexes mean.
Low or no health risk linked to measured air pollution. Outdoor activities are recommended.
Health effects may occur in some asthmatics and people with other respiratory diseases, as well as serious cardiovascular diseases. Outdoor activity can be recommended for the vast majority, but some should consider their activity in areas with high traffic or high emissions.
Health effects may occur in asthmatics and people with other respiratory diseases, as well as serious cardiovascular disease. Children with respiratory distress (asthma, bronchitis) and adults with severe cardiac or respiratory distress should reduce outdoor activity and not stay in the most polluted areas.
Sensitive groups in the population can have health effects. Respiratory irritation and discomfort may occur in healthy subjects. People with heart or respiratory distress should reduce outdoor activity and not stay in the most polluted areas.
Source: Health Recommendations and Pollution Classes
The area configuration is restricted to the areas NILU has defined. Here is the list of available areas:
Bergen
Birkenes
Bodø
Brumunddal
Bærum
Drammen
Elverum
Fredrikstad
Gjøvik
Grenland
Halden
Hamar
Harstad
Hurdal
Karasjok
Kristiansand
Kårvatn
Lillehammer
Lillesand
Lillestrøm
Lørenskog
Mo i Rana
Moss
Narvik
Oslo
Prestebakke
Sandve
Sarpsborg
Stavanger
Sør-Varanger
Tromsø
Trondheim
Tustervatn
Zeppelinfjellet
Ålesund
Example of adding health risk monitoring from sensor stations around the Home Assistant location.
# Example configuration.yaml entry # Adds all sensor stations within 20km. air_quality : - platform : nilu
Example where the sensors are also added to the map.
# Example configuration.yaml entry # Adds all sensor stations within 20km. # Additionally adds the sensors to the map. air_quality : - platform : nilu show_on_map : true
Example of a specific station.
# Example configuration.yaml entry # Monitors stations 'Alnabru' air_quality : - platform : nilu stations : - Alnabru
Example of getting stations from a specified area, giving the sensors a custom name.
# Example configuration.yaml entry # Stations from specific area, 'Bergen' # Custom name for the sensors. air_quality : - platform : nilu area : Bergen name : Forurensing Bergen
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Norwegian Institute for Air Research (NILU) integration was introduced in Home Assistant 0.87, and it's used by
43 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hfurubotten
Categories
Health
Back to top
