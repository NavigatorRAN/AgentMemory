# Melissa - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/melissa
- Final URL: https://www.home-assistant.io/integrations/melissa
- Canonical URL: https://www.home-assistant.io/integrations/melissa/
- Fetched at: 2026-06-28T02:59:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Melissa Climate into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Melissa integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the main integration to connect to a Melissa Climate A/C control.
There is currently support for the following device types within Home Assistant:
Climate
The climate platform will be automatically configured if Melissa integration is configured.
To set the Melissa integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry melissa : username : YOUR_MELISSA_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
username string Required
The username for accessing your Melissa account.
password string Required
The password for accessing your Melissa account.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Melissa integration was introduced in Home Assistant 0.63, and it's used by
16 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kennedyshead
Categories
Hub
Back to top
