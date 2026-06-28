# Thinking Cleaner - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/thinkingcleaner
- Final URL: https://www.home-assistant.io/integrations/thinkingcleaner
- Canonical URL: https://www.home-assistant.io/integrations/thinkingcleaner/
- Fetched at: 2026-06-28T03:22:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a ThinkingCleaner within Home Assistant.

## Extracted Text

On this page
Sensor
Switch
Example configuration using a Roomba with a static IP
There is currently support for the following device types within Home Assistant:
The thinkingcleaner sensor platform simple displays information about your Thinking Cleaner (archived website) add-on.
To enable this sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
sensor : - platform : thinkingcleaner
Configuration Variables
Looking for your configuration file?
host string ( Optional )
IP address of Thinking Cleaner device
This will automatically add sensors for each Thinking Cleaner in your network.
The thinkingcleaner switch platform allows you to control your Thinking Cleaner (archived website) add-on.
To enable this switch in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
switch : - platform : thinkingcleaner
This will automatically add switches for each Thinking Cleaner in your network.
If your thinkingcleaner device has a static IP address, you can also supply this to the sensor and switch using the host parameter. This is optional and will disable the automatic lookup.
sensor : - platform : thinkingcleaner host : 10.0.0.55 switch : - platform : thinkingcleaner host : 10.0.0.55
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Thinking Cleaner integration was introduced in Home Assistant 0.18, and it's used by
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
Back to top
