---
source_url: "https://www.home-assistant.io/integrations/netio"
final_url: "https://www.home-assistant.io/integrations/netio"
canonical_url: "https://www.home-assistant.io/integrations/netio/"
source_handle: "web:www-home-assistant-io:139072e28a80"
source_section: "integrations-netio"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f5621b0aad80d486f52ff9d18067eae202077bcb763a9b5d90e61fea7e8d3be9"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Netio - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/netio
- Final URL: https://www.home-assistant.io/integrations/netio
- Canonical URL: https://www.home-assistant.io/integrations/netio/
- Fetched at: 2026-06-28T03:02:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Netio switches into Home Assistant.

## Extracted Text

On this page
Related topics
The Netio integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Netio Netio4, Netio4 All, and Netio 230B. These are smart outlets controllable through Ethernet and/or Wi-Fi that reports consumptions (Netio4all). This integration requires Telnet to be enabled on the Netio device.
To use Netio devices in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : - platform : netio host : 192.168.1.43 username : YOUR_USERNAME password : YOUR_PASSWORD outlets : 1 : Free 2 : TV 4 : Lamp
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your Netio plug, e.g., http://192.168.1.32 .
port integer Required , default: 1234
The port to communicate with the switch.
username string Required , default: admin
The username for your plug.
password string Required
The password for your plug.
outlets list ( Optional )
List of all outlets. Consisting of a number and a name [No.]: [Name].
To get pushed updates from the Netio devices, one can add this Lua code in the device interface as an action triggered on “Netio” “System variables updated” with an ‘Always’ schedule:
-- this will send socket and consumption status updates via CGI -- to given address. Associate with 'System variables update' event -- to get consumption updates when they show up local address = 'ha:8123' local path = '/api/netio/<host>' local output = {} for i = 1 , 4 do for _ , what in pairs ({ 'state' , 'consumption' , 'cumulatedConsumption' , 'consumptionStart' }) do local varname = string.format ( 'output%d_%s' , i , what ) table.insert ( output , varname .. '=' .. tostring ( devices . system [ varname ]): gsub ( " " , "|" )) end end local qs = table.concat ( output , '&' ) local url = string.format ( 'http://%s%s?%s' , address , path , qs ) devices . system . CustomCGI { url = url }
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Netio integration was introduced in Home Assistant 0.24, and it's used by
18 active installations.
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
