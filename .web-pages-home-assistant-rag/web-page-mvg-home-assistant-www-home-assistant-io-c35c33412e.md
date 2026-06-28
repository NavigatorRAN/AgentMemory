# MVG - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mvglive
- Final URL: https://www.home-assistant.io/integrations/mvglive
- Canonical URL: https://www.home-assistant.io/integrations/mvglive/
- Fetched at: 2026-06-28T03:01:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Munich public transport departure times into Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Full configuration
Related topics
The MVG integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you the departure time of the next bus, tram, subway, or train at the next station or stop in the Munich public transport network. Additional details such as the line number and destination are present in the attributes.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : mvglive nextdeparture : - station : STATION_OR_STOP_NAME
Configuration Variables
Looking for your configuration file?
station string Required
Name of the stop or station. Visit the MVG live website to find valid names. Be aware, that not all data of interest might be available (for example, bus departure-times in Haar).
destinations list ( Optional )
One or multiple final stop names, e.g., ‘Feldmoching’ or [‘Feldmoching’,‘Harthof’]. This can be used to only consider a particular direction of travel.
directions list ( Optional )
Filter by direction of the departure. For Tram, Bus, SEV, and S-Bahn, direction = destination. For U-Bahn trains, directions are more general. For U1, U2, U3 and U6, direction=‘1’ indicates south-bound trains, direction=‘2’ indicates northbound trains. For U4 and U5, direction=‘1’ indicates east-bound trains, direction=‘2’ indicates west-bound trains. For example, setting directions: ‘1’ can be used to get all south-bound trains at Scheidplatz.
lines list ( Optional )
One or more line numbers, e.g., ‘U2’ or [‘U2’,‘U8’,‘N41’].
products list ( Optional )
One or more modes of transport.
Default:
all 5 modes [‘U-Bahn’, ‘Tram’, ‘Bus’, ‘S-Bahn’, ‘Nachteule’]
timeoffset integer ( Optional , default: 0 )
Do not display departures leaving sooner than this number of minutes. Useful if you are a couple of minutes away from the stop.
number integer ( Optional , default: 1 )
Store a list of departures in the attribute “departures”. If you set this parameter to 3, the next three departures will be stored.
name string ( Optional )
You can customize the name of the sensor, which defaults to the station name.
The example below shows a full configuration with three sensors that showcase the various configuration options.
# Example configuration.yaml entry sensor : - platform : mvglive nextdeparture : - station : Hauptbahnhof name : Hbf destinations : [ ' München Flughafen Terminal' , ' Markt Schwaben' ] products : " S-Bahn" timeoffset : 2 - station : Sendlinger Tor lines : [ ' U2' , ' U8' ] number : 5 - station : Scheidplatz products : [ ' U-Bahn' ] directions : " 1"
The first sensor will return S-Bahn departures to Munich Airport or Markt Schwaben that are at least 2 minutes away.
The second sensor returns U2 and U8 departures from Sendlinger Tor and stores a total of 5 departures in attributes. To retrieve the time until the second departure, you would use state_attr(‘sensor.ENTITY_NAME’, ‘departures’)[1].time.
The third sensor returns all south-bound U-Bahn trains from Scheidplatz.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MVG integration was introduced in Home Assistant 0.42, and it's used by
32 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Transport
Back to top
