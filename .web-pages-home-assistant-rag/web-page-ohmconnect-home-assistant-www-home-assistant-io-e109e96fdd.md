# OhmConnect - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ohmconnect
- Final URL: https://www.home-assistant.io/integrations/ohmconnect
- Canonical URL: https://www.home-assistant.io/integrations/ohmconnect/
- Fetched at: 2026-06-28T03:05:09Z
- Content type: text/html; charset=UTF-8

## Description

Documentation about the OhmConnect sensor.

## Extracted Text

On this page
Configuration
Related topics
The OhmConnect integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will show you the current OhmConnect status for the given OhmConnect ID.
OhmConnect monitors real-time conditions on the electricity grid. When dirty and unsustainable power plants turn on, our users receive a notification to save energy. By saving energy at that time, California does not have to turn on additional power plants and California’s energy authorities pay you for that.
You can find your OhmConnect ID on the OhmConnect API settings page . It’s the string after the last / in the URL, e.g., for the URL https://login.ohmconnect.com/verify-ohm-hour/AbCd1e your ID is AbCd1e .
To enable the OhMConnect integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : ohmconnect id : YOUR_OHMCONNECT_ID
Configuration Variables
Looking for your configuration file?
id string Required
Your OhmConnect ID.
name string ( Optional , default: OhmConnect Status )
A name to display on the sensor.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OhmConnect integration was introduced in Home Assistant 0.26, and it's used by
105 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@robbiet480
Categories
Energy
Back to top
