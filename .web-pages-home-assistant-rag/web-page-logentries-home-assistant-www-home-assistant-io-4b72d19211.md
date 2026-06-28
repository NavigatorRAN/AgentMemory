# Logentries - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/logentries
- Final URL: https://www.home-assistant.io/integrations/logentries
- Canonical URL: https://www.home-assistant.io/integrations/logentries/
- Fetched at: 2026-06-28T02:57:37Z
- Content type: text/html; charset=UTF-8

## Description

Send events to Logentries.

## Extracted Text

On this page
Related topics
The Logentries integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] makes it possible to log all state changes to Logentries using Logentries Webhook endpoint.
Open the Add a Log page and choose Manual . Enter a name for your log in Log Name , add a group in Select Log Set , set Token TCP - logs are identified by a token. and press Create Log Token . The generated token is required for the Home Assistant configuration.
To use the Logentries integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry logentries : token : TOKEN
Configuration Variables
Looking for your configuration file?
token string Required
The token for the log to use.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Logentries integration was introduced in Home Assistant 0.13, and it's used by
1 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
History
Back to top
