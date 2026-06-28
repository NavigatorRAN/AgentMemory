# Telldus Live - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tellduslive
- Final URL: https://www.home-assistant.io/integrations/tellduslive
- Canonical URL: https://www.home-assistant.io/integrations/tellduslive/
- Fetched at: 2026-06-28T03:21:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Telldus Live into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Telldus Live integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] let you connect to the Telldus Live API. It’s cloud platform that connects to your Tellstick Net or Tellstick ZNet connected gear at home.
Important
You need a Telldus Premium subscription to access the Cloud API ( https://telldus.com/en/important-announcement-english/ ).
Local API supports only one device at this stage. Local API is only supported with the Znet Lite products, the older hardware (such as Tellstick Net) does not support local API.
To manually integrate your Telldus Live with Home Assistant, e.g., if your device is on another network or in another location, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry tellduslive :
Configuration Variables
Looking for your configuration file?
host string ( Optional )
Host address to Tellstick Net or Tellstick ZNet for Local API, only useful when automatic discovery is not enabled.
scan_interval integer ( Optional , default: 60 )
Interval (in seconds) for polling the Telldus Live server (or the local server).
The integration will offer configuration through the Home Assistant user interface where it will let you associate it with your Telldus Live account.
Note
If you are receiving the error message: “The path ‘/tellduslive/authorize’ was not found”, you have to switch to a web browser that allows HTTP connections. Firefox is known to work fine. Chrome is known to cause issues.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Telldus Live hub was introduced in Home Assistant 0.11, and it's used by
686 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fredrike
Categories
Binary sensor
Cover
Hub
Light
Sensor
Switch
Back to top
