# Eliqonline - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/eliqonline
- Final URL: https://www.home-assistant.io/integrations/eliqonline
- Canonical URL: https://www.home-assistant.io/integrations/eliqonline/
- Fetched at: 2026-06-28T02:39:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Eliqonline devices within Home Assistant.

## Extracted Text

On this page
Related topics
Integrate your ELIQ Online smart meter information into Home Assistant. To get an access token and the Channel ID , log in to your account.
To enable this sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : eliqonline access_token : ACCESS_TOKEN channel_id : CHANNEL_ID
Configuration Variables
Looking for your configuration file?
access_token string Required
The Access Token for your account.
channel_id integer Required
Channel ID (as integer) of your device.
name string ( Optional , default: ELIQ Online )
The name of the sensor, e.g., the city.
For details please check the API documentation .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Eliqonline integration was introduced in Home Assistant 0.10, and it's used by
3 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Energy
Back to top
