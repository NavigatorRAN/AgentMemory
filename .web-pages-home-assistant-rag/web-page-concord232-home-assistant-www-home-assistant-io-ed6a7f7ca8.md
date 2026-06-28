---
source_url: "https://www.home-assistant.io/integrations/concord232"
final_url: "https://www.home-assistant.io/integrations/concord232"
canonical_url: "https://www.home-assistant.io/integrations/concord232/"
source_handle: "web:www-home-assistant-io:ed6a7f7ca8de"
source_section: "integrations-concord232"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3e3fffe504c00a126e78bcc38c02a9a93b0aa36a8bb4d556fa841be4c305d97e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Concord232 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/concord232
- Final URL: https://www.home-assistant.io/integrations/concord232
- Canonical URL: https://www.home-assistant.io/integrations/concord232/
- Fetched at: 2026-06-28T02:34:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Interlogix/GE Concord4 into Home Assistant.

## Extracted Text

On this page
Alarm control panel
Binary sensor
The Concord232 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides integration with GE, Interlogix (and other brands) alarm panels that support the RS-232 Automation Control Panel interface module (or have it built in). Supported panels include Concord 4.
To use this platform, you will need to have the external concord232 client and server installed. The server must be running on the device which is connected to the automation module’s serial port. The client must be installed on the machine running Home Assistant. These may often be the same machine, but do not have to be. For additional details in setting up and testing the client and server, see the concord232 project on GitHub .
There is currently support for the following device types within Home Assistant:
Alarm
To enable the alarm control panel platform, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry alarm_control_panel : - platform : concord232
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: localhost )
The host where the concord232 server process is running.
port integer ( Optional , default: 5007 )
The port where the Alarm panel is listening.
code string ( Optional )
If defined, specifies a code to enable or disable the alarm in the frontend.
mode string ( Optional , default: audible )
audible/silent if defined, specifies whether Alarm Panel should be audible or silent when armed in Home Mode.
To enable the binary sensor platform, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry binary_sensor : - platform : concord232
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Concord232 integration was introduced in Home Assistant 0.31, and it's used by
11 active installations.
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
