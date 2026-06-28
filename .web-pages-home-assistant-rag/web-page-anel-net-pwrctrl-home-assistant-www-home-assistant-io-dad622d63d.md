---
source_url: "https://www.home-assistant.io/integrations/anel_pwrctrl"
final_url: "https://www.home-assistant.io/integrations/anel_pwrctrl"
canonical_url: "https://www.home-assistant.io/integrations/anel_pwrctrl/"
source_handle: "web:www-home-assistant-io:dad622d63d59"
source_section: "integrations-anel-pwrctrl"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "adb2bb298fafbd4fef740dd2d6c98cc08c4169f6090cab20fee2d514f7f7ffd6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Anel NET-PwrCtrl - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/anel_pwrctrl
- Final URL: https://www.home-assistant.io/integrations/anel_pwrctrl
- Canonical URL: https://www.home-assistant.io/integrations/anel_pwrctrl/
- Fetched at: 2026-06-28T02:28:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ANEL PwrCtrl switches within Home Assistant.

## Extracted Text

On this page
Related topics
The Anel NET-PwrCtrl integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control ANEL PwrCtrl devices on firmware 6.x and older. ANEL PwrCtrl devices on firmware 7.x are not supported.
Supported devices (tested):
PwrCtrl HUT
PwrCtrl Advanced
PwrCtrl Advanced Power
To add this platform to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : - platform : anel_pwrctrl host : IP_ADDRESS port_recv : PORT port_send : PORT username : USERNAME password : PASSWORD
Configuration Variables
Looking for your configuration file?
host string ( Optional )
The IP address or hostname of your PwrCtrl device.
port_recv integer Required
The port on which the device receives data.
port_send integer Required
The port from which the device sends data.
username string Required
The username for your device.
password string Required
The password for your device.
Note
If no host is given the platform will try to auto-discover all devices on the network, that are listening on the given port_recv .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Anel NET-PwrCtrl integration was introduced in Home Assistant 0.30, and it's used by
9 active installations.
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
