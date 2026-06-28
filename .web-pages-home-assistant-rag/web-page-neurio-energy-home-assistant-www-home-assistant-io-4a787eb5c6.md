# Neurio energy - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/neurio_energy
- Final URL: https://www.home-assistant.io/integrations/neurio_energy
- Canonical URL: https://www.home-assistant.io/integrations/neurio_energy/
- Fetched at: 2026-06-28T03:02:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Neurio within Home Assistant.

## Extracted Text

On this page
Consumption
Production
Related topics
Integrate your Neurio meter information into Home Assistant. To get an API key and secret, log in to your Neurio account and register an application. Note the Homepage URL and Callback URL are optional.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : platform : neurio_energy api_key : " CLIENT_ID" api_secret : " CLIENT_SECRET" sensor_id : " SENSOR_ID"
Four sensors will be created with the following names:
Energy Usage : Current active power usage in Watts. Updated every 10 seconds.
Daily Energy Usage : Daily power usage in kWh. Updated every 2.5 minutes.
Energy Production : Current solar/generation power in Watts. Updated every 10 seconds.
Daily Energy Production : Daily solar/generation in kWh. Updated every 2.5 minutes.
The production sensors are useful for monitoring solar panels or other energy generation sources connected to your Neurio meter.
Configuration Variables
Looking for your configuration file?
api_key string Required
The API key for your account/application.
api_secret string Required
The API secret for your account/application.
sensor_id string Required
The sensor ID, a hex number as shown on the PWRView webpage , e.g., 0x0000XXXXXXXXXXXX .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Neurio energy integration was introduced in Home Assistant 0.14, and it's used by
28 active installations.
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
