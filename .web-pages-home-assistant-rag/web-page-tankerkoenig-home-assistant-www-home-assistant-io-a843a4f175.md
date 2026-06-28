# Tankerkoenig - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tankerkoenig
- Final URL: https://www.home-assistant.io/integrations/tankerkoenig
- Canonical URL: https://www.home-assistant.io/integrations/tankerkoenig/
- Fetched at: 2026-06-28T03:20:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Tankerkoenig sensors within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Options
Data updates
Provides entities
Usage examples
Show current fuel price only when station is opened
Troubleshooting
Remove the integration
To remove an integration instance from Home Assistant
Related topics
The Tankerkoenig integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor the fuel prices with tankerkoenig.de from within Home Assistant and setup automations based on the information.
To use this integration, you need an API key from tankerkoenig.
Go to tankerkoenig API and in the top right, select API-KEY .
Fill out the form and request a free API key.
Important
The Terms & Conditions of tankerkoenig.de specify that the API is not meant for massive data fetching, but it does not explicitly mention a limit. Having a maximum of 10 monitored fuel stations is recommended, and a warning will be issued otherwise.
If you consider to define a custom polling interval , then please keep in mind that requests should be limited to less than once every 5 minutes.
To add the Tankerkoenig service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tankerkoenig .
Follow the instructions on screen to complete the setup.
Region name
The name of the particular region to be added.
API Key
The tankerkoenig API-KEY to be used ( see Prerequisites ).
Location
Pick the location where to search for gas stations ( defaults to the location of your Home which was et during onboarding )
Search radius
The radius in kilometers to search for gas stations around the selected location ( default: 2km )
Stations
Select the gas stations you want to add to Home Assistant.
To define options for Tankerkoenig, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Tankerkoenig are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Show stations on map
Weather to show the station sensors on the map or not.
This integration fetches the data every 30 minutes from the tankerkoenig API .
This integrations provides a set of Binary sensor A binary sensor returns information about things that only have two states - such as on or off. [Learn more] and Sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] entities for each selected gas station.
Sensors Description Status Indicates if the gas station is opened or closed at the moment. Diesel The current price of Diesel fuel. Super The current price of Super fuel. Super E10 The current price of Super E10 fuel.
Note
As the data of tankerkoenig.de is based on data from the German market transparency office for fuels ( Markttransparenzstelle für Kraftstoffe MTS-K ), only the three base fuel types Diesel , Super , and Super E10 are available.
The example below uses the common sensor card in the frontend The frontend is a necessary component for the UI, it is also where you can define your themes. [Learn more] and adds a visibility condition.
graph : line type : sensor entity : sensor.my_favorite_gas_station_super detail : 1 name : Favorite Gas Station visibility : - condition : state entity : binary_sensor.my_favorite_gas_station_status state : " on"
Before reporting an issue, enable debug logging and restart the integration. As soon as the issue re-occurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible , download the diagnostics The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker. [Learn more] data. If you have collected the debug log and the diagnostics data, include them in the issue report.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Defining a custom polling interval
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tankerkoenig service was introduced in Home Assistant 0.107, and it's used by
1.2% of the active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@guillempages
@mib1185
@jpbede
Categories
Energy
Sensor
Back to top
