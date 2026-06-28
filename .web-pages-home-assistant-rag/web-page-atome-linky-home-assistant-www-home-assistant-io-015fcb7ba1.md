# Atome Linky - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/atome
- Final URL: https://www.home-assistant.io/integrations/atome
- Canonical URL: https://www.home-assistant.io/integrations/atome/
- Fetched at: 2026-06-28T02:29:44Z
- Content type: text/html; charset=UTF-8

## Description

Integrate Atome Linky consumption data within Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Atome Linky integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is retrieving the consumption of your home from the Direct Energy Atome electric meter .
This special little device is connected to a Linky Electric Meter, and sends live data to a cloud platform.
As there is no official documentation for the API, the integration retrieves data from the API used in the Atome mobile app, hosted here .
To use it, you need to order the device directly from “Total Direct Energie” Mobile App. Then you need to follow up the installation (covered in the Atome App).
The configuration (see below) needs your Atome username & password you created during the initialization of the Atome device.
Next, add the Atome sensor to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : atome username : YOUR_ATOME_USERNAME password : YOUR_ATOME_PASSWORD
Configuration Variables
Looking for your configuration file?
username string Required
The Atome account username.
password string Required
The Atome account password.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Atome Linky integration was introduced in Home Assistant 0.99, and it's used by
30 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@baqs
Categories
Energy
Sensor
Back to top
