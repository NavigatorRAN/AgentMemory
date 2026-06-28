# OASA Telematics - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/oasa_telematics
- Final URL: https://www.home-assistant.io/integrations/oasa_telematics
- Canonical URL: https://www.home-assistant.io/integrations/oasa_telematics/
- Fetched at: 2026-06-28T03:04:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate bus and trolley arrival data for Greek OASA Telematics within Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Related topics
The OASA Telematics integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will provide you with bus and trolley arrival times for Greek public transport for Athens, using real-time data from OASA Telematics .
Add the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : oasa_telematics route_id : YOUR_ROUTE_ID stop_id : " YOUR_STOP_ID"
The route_id can be obtained by looking up the “LineCode” of the route you want at this link:
https://telematics.oasa.gr/api/?act=webGetLines
Then getting the “RouteCode” from this link:
https://telematics.oasa.gr/api/?act=webGetRoutes&p1=LINE_CODE (Replace “LINE_CODE” with the “LineCode” you copied from the first link) find the route you need and copy the RouteCode field.
Next, get the stop_id from this link:
https://telematics.oasa.gr/api/?act=webGetStops&p1=ROUTE_CODE (Replace “ROUTE_CODE” with the “RouteCode” you got from the previous link) find the stop you need and copy the StopID field. The route must pass from this stop in order for the sensor to work.
Configuration Variables
Looking for your configuration file?
route_id integer Required
The id of the public transport route.
stop_id string Required
The id of the public transport stop.
name string ( Optional , default: OASA Telematics )
A friendly name for this sensor.
A more extensive example on how to use this sensor:
# Example configuration.yaml entry sensor : - platform : oasa_telematics route_id : 1965 stop_id : " 090006"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OASA Telematics integration was introduced in Home Assistant 0.92, and it's used by
4 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Transport
Back to top
