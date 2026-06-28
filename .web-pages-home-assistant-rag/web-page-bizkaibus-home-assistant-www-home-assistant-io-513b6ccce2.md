# Bizkaibus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bizkaibus
- Final URL: https://www.home-assistant.io/integrations/bizkaibus
- Canonical URL: https://www.home-assistant.io/integrations/bizkaibus/
- Fetched at: 2026-06-28T02:31:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate timetable data for traveling on Bizkaibus within Home Assistant.

## Extracted Text

On this page
Related topics
The Bizkaibus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you the time until the next bus in the selected stop.
The next website can help to determine the id of your bus stop. You can check if this is correct by going to next link and look the PR_CODE for the STOP_ID.
For a correct use of the sensor the selected route must stop in the selected stop.
Then add the data to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : bizkaibus stopid : STOP_ID route : ROUTE_ID
Configuration Variables
Looking for your configuration file?
stopid string Required
The ID of the bus stop to get the information for.
route string Required
The ID of the bus route to get information for. This is the same as the bus number, for example, A3641 .
name string ( Optional , default: Next Bus )
A friendly name for this sensor.
The public RTPI information is coming from Bizkaibus API .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bizkaibus integration was introduced in Home Assistant 0.93, and it's used by
3 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@UgaitzEtxebarria
Categories
Sensor
Transport
Back to top
