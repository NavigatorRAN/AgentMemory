---
source_url: "https://www.home-assistant.io/integrations/fortios"
final_url: "https://www.home-assistant.io/integrations/fortios"
canonical_url: "https://www.home-assistant.io/integrations/fortios/"
source_handle: "web:www-home-assistant-io:ee9bfa0e57f7"
source_section: "integrations-fortios"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "388754f03fd0eafba164fafefefc36eb1c3b9db062bc98be95d99d4b08a747b4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FortiOS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fortios
- Final URL: https://www.home-assistant.io/integrations/fortios
- Canonical URL: https://www.home-assistant.io/integrations/fortios/
- Fetched at: 2026-06-28T02:43:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Fortinet FortiOS to track devices in Home Assistant.

## Extracted Text

On this page
Example configuration
Related topics
The FortiOS presence detection enables Home Assistant to track devices with a MAC address connected to a FortiGate from Fortinet .
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] relies on the fortiosapi . It has been verified on FortiGate appliances and FortiGate VM running FortiOS v. 6.4.x (up to 6.4.8), 7.0.x (up to 7.0.4) and 7.2.0.
The minimum version supported is FortiOS 6.4.3.
All devices with a MAC address identified by FortiGate would be tracked, this covers both Ethernet and Wi-Fi devices, including devices detected by LLDP.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is based on the Home Assistant device_tracker platform.
This example uses the FortiOS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] as a device tracker, with an API token and does not verify the SSL certificate.
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml device_tracker : - platform : fortios host : YOUR_HOST token : YOUR_API_USER_KEY
Configuration Variables
Looking for your configuration file?
host string Required
Hostname or IP address of the FortiGate. Optionally port name can be added like this “10.10.10.10:443”. Remember quotes if port number is added.
token string Required
See: Generate an API token for FortiOS for how to create an API token. This integration only needs read access to a FortiGate, so configure the API user to only to have limited and read-only access.
verify_ssl boolean ( Optional , default: false )
If the SSL certificate should be verified. In most home cases users do not have a verified certificate.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FortiOS integration was introduced in Home Assistant 0.97, and it's used by
48 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kimfrellsen
Categories
Presence detection
Back to top
