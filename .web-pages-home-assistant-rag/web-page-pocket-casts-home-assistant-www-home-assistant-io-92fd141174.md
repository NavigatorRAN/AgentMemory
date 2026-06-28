# Pocket Casts - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pocketcasts
- Final URL: https://www.home-assistant.io/integrations/pocketcasts
- Canonical URL: https://www.home-assistant.io/integrations/pocketcasts/
- Fetched at: 2026-06-28T03:08:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Pocket Casts sensors within Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Pocket Casts integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you monitor how many unplayed episodes you have of your favorite podcasts at Pocket Casts . This integration requires a Pocket Casts + Plus subscription to work!
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : pocketcasts username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
username string Required
The username to access the PocketCasts service.
password string Required
The password for the given username.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pocket Casts integration was introduced in Home Assistant 0.39, and it's used by
66 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Multimedia
Back to top
