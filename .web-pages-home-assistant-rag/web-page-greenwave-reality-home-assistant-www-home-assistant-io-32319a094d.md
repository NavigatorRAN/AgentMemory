# Greenwave Reality - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/greenwave
- Final URL: https://www.home-assistant.io/integrations/greenwave
- Canonical URL: https://www.home-assistant.io/integrations/greenwave/
- Fetched at: 2026-06-28T02:47:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Greenwave Reality lights within Home Assistant.

## Extracted Text

On this page
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] communicates with the Greenwave Reality (TCP Connected) Gateway to allow control of all lights and fixtures registered to the gateway. Bulbs and Fixtures can be created and modified inside the TCP Lighting App for Android and iOS.
This integration has been tested on firmware revisions:
2.0.105
To configure the connection to the gateway, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
light : - platform : greenwave host : XXX.XXX.XXX.XXX version : 3
The version option is the major revision of your firmware, which should be 2 or 3. If you are running Version 2, there are no extra steps. If you are running Version 3, you must press the Sync button on the gateway before the first launch of Home Assistant, so a token can be grabbed. Once Home Assistant has started, you can either press the Sync button again or wait for it to time out manually.
Configuration Variables
Looking for your configuration file?
host string Required
The IP Address of your Gateway
version integer Required
Major version of the gateway firmware
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Greenwave Reality integration was introduced in Home Assistant 0.61, and it's used by
1 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Light
Back to top
