# Meraki - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/meraki
- Final URL: https://www.home-assistant.io/integrations/meraki
- Canonical URL: https://www.home-assistant.io/integrations/meraki/
- Fetched at: 2026-06-28T02:59:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Meraki-based presence detection into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Related topics
Use your Meraki AP as device tracker. Note that Meraki will see all devices, not only connected to the network.
Go to Network-wide/General page, and find the Location and scanning section.
Make sure analytics and Scanning API are both enabled.
Make note of the Validator string, which will be used in the device_tracker configuration.
Click Add a Post URL :
Set the Post URL to https://YOUR_HOSTNAME/api/meraki
Set the Secret to a randomly generated string, and make note of it for the device_tracker configuration.
Make sure the API Version is set to 2.0 .
Hit Save in the bottom right of the page.
After you configure access to the Meraki CMX API, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : meraki secret : your_secret validator : meraki_validator
Configuration Variables
Looking for your configuration file?
secret string Required
Secret code added in Meraki.
validator string Required
Validation string from Meraki.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Meraki integration was introduced in Home Assistant 0.60, and it's used by
23 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
