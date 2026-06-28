# Sesame Smart Lock - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sesame
- Final URL: https://www.home-assistant.io/integrations/sesame
- Canonical URL: https://www.home-assistant.io/integrations/sesame/
- Fetched at: 2026-06-28T03:15:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Sesame by CANDY HOUSE into Home Assistant.

## Extracted Text

On this page
Sesame Smart Lock Versions
Configuration
Related topics
The Sesame Smart Lock integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Sesame smart locks made by CANDY HOUSE, Inc.
The integration documented here should only be used with the original Sesame Lock.
Sesame Smart Lock version 5 and Hub version 3 were released in 2025 and can be integrated with Home Assistant via the Matter integration instead.
Your Sesame needs to be paired with a standalone Wi-Fi Access Point purchased separately.
You will also need to generate an API key from my.candyhouse.co .
Once you have remote access enabled using one of the above AND the Integration - cloud option enabled on the Sesame app for that lock settings, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry lock : - platform : sesame api_key : YOUR_SESAME_API_KEY
Configuration Variables
Looking for your configuration file?
api_key string Required
The API key for your Sesame account.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sesame Smart Lock integration was introduced in Home Assistant 0.47, and it's used by
11 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Lock
Back to top
