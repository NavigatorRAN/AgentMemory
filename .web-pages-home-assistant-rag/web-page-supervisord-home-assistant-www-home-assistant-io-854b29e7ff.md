# Supervisord - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/supervisord
- Final URL: https://www.home-assistant.io/integrations/supervisord
- Canonical URL: https://www.home-assistant.io/integrations/supervisord/
- Fetched at: 2026-06-28T03:19:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Supervisord within Home Assistant.

## Extracted Text

On this page
Related topics
The Supervisord integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to track the states of Supervisord .
It required that you enable the HTTP feature in the /etc/supervisord.conf configuration file.
[inet_http_server]
port=127.0.0.1:9001
After a restart of supervisord you should be able to access the web interface. If needed then this could be added as an webpage dashboard .
To use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : supervisord
Configuration Variables
Looking for your configuration file?
url string ( Optional )
The URL to track.
Default:
http://localhost:9001/RPC2
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Supervisord integration was introduced in Home Assistant 0.20, and it's used by
13 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
