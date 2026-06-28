# Vanderbilt SPC - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/spc
- Final URL: https://www.home-assistant.io/integrations/spc
- Canonical URL: https://www.home-assistant.io/integrations/spc/
- Fetched at: 2026-06-28T03:18:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Vanderbilt SPC devices within Home Assistant.

## Extracted Text

On this page
Alarm
Binary sensor
Related topics
Home Assistant has support to integrate your Vanderbilt SPC alarm panel and any connected motion, door, smoke and technical sensors.
Integration with SPC is done through a third-party API gateway called SPC Web Gateway which must be installed and configured somewhere on your network.
There is currently support for the following device types within Home Assistant:
Home Assistant needs to know where to find the SPC Web Gateway API endpoints, to configure this add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry spc : api_url : API_URL ws_url : WS_URL
Configuration Variables
Looking for your configuration file?
api_url string Required
URL of the SPC Web Gateway command REST API, e.g., http://<ip>:8088 .
ws_url string Required
URL of the SPC Web Gateway WebSocket, e.g., ws://<ip>:8088/ws/spc .
The spc alarm control panel platform allows you to control your Vanderbilt SPC alarms.
The changed_by attribute enables one to be able to take different actions depending on who armed/disarmed the alarm in automation .
automation : - alias : " Alarm status changed" triggers : - trigger : state entity_id : alarm_control_panel.alarm_1 actions : - action : notify.notify data : message : > Alarm changed from {{ trigger.from_state.state }} to {{ trigger.to_state.state }} by {{ trigger.to_state.attributes.changed_by }}
The spc platform allows you to get data from your Vanderbilt SPC binary sensors from within Home Assistant.
Check the type/class list for a possible visualization of your zone. Currently motion, smoke, door and technical sensors are supported.
Hint: In SPC, Technical zones can be used to track (for example) the status of an output. Virtual zones are supported in SPC firmware from 3.11. You can set up a virtual zone as technical, and link it to a mapping key that is controlling an output.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Vanderbilt SPC integration was introduced in Home Assistant 0.47, and it's used by
41 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
