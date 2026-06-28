# Dublin Bus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dublin_bus_transport
- Final URL: https://www.home-assistant.io/integrations/dublin_bus_transport
- Canonical URL: https://www.home-assistant.io/integrations/dublin_bus_transport/
- Fetched at: 2026-06-28T02:38:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate timetable data for traveling on Dublin Bus within Home Assistant.

## Extracted Text

On this page
Related topics
The Dublin Bus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you the time until the next two departures from a Dublin bus stop using the RTPI information.
The Dublin Bus website can help to determine the id of your bus stop. You can check if this is correct by going to
https://data.dublinked.ie/cgi-bin/rtpi/realtimebusinformation?stopid=[Stop ID]
Then add the data to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : dublin_bus_transport stopid : STOP_ID
Configuration Variables
Looking for your configuration file?
stopid string Required
The ID of the bus stop to get the information for.
route string ( Optional )
Only show a single bus route at the stop. This is the same as the bus number, for example, 83 .
name string ( Optional , default: Next Bus )
A friendly name for this sensor.
The public RTPI information is coming from Dub Linked .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Dublin Bus integration was introduced in Home Assistant 0.36, and it's used by
2 active installations.
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
