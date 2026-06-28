# Kankun - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/kankun
- Final URL: https://www.home-assistant.io/integrations/kankun
- Canonical URL: https://www.home-assistant.io/integrations/kankun/
- Fetched at: 2026-06-28T02:54:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for the Kankun SP3 Wifi switch

## Extracted Text

On this page
Configuration
Related topics
The Kankun integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to toggle customized Kankun SP3 Wi-Fi switches. Switches are
modified to include the json.cgi
script to provide an HTTP API.
Details of the necessary modifications were provided on the now dead HomeAutomationForGeeks site,
but fortunately we can still access the information via
archive.org link
(be sure to install the JSON version of the script as linked above).
To enable it, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : platform : kankun switches : bedroom_heating : host : hostname_or_ipaddr
Configuration Variables
Looking for your configuration file?
switches map Required
The array that contains all Kankun switches.
identifier map Required
Name of the Kankun switch as slug. Multiple entries are possible.
host string Required
Hostname or IP address of the switch on the local network.
name string ( Optional )
Friendly name of the switch.
port integer ( Optional , default: 80 )
HTTP connection port.
path string ( Optional , default: /cgi-bin/json.cgi )
Path of CGI script.
username string ( Optional )
Username for basic authentication.
password string ( Optional )
Password for basic authentication.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Kankun integration was introduced in Home Assistant 0.36, and it's used by
8 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Switch
Back to top
