---
source_url: "https://www.home-assistant.io/integrations/synology_srm"
final_url: "https://www.home-assistant.io/integrations/synology_srm"
canonical_url: "https://www.home-assistant.io/integrations/synology_srm/"
source_handle: "web:www-home-assistant-io:028dcfb9e85b"
source_section: "integrations-synology-srm"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a272606ebea47404f705328b68e859472914ef07ce9664461cc78a0e4cbaf344"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Synology SRM - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/synology_srm
- Final URL: https://www.home-assistant.io/integrations/synology_srm
- Canonical URL: https://www.home-assistant.io/integrations/synology_srm/
- Fetched at: 2026-06-28T03:20:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Synology SRM routers into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence by looking at connected devices to a Synology SRM router.
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : synology_srm host : 192.168.1.254 password : YOUR_ADMIN_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The Synology SRM router host or IP address, e.g., 192.168.1.1 or router.mydomain.local
port integer ( Optional , default: 8001 )
The port to connect to the Synology SRM router.
username string ( Optional , default: admin )
The username of a user with administrative privileges.
password string Required
The password for your given admin account.
ssl boolean ( Optional , default: true )
Use HTTPS instead of HTTP to connect.
verify_ssl boolean ( Optional , default: false )
Enable or disable SSL certificate verification.
For instructions on creating multiple administrators on SRM, please refer to the Synology Knowledge Center .
List of models known to be supported:
RT1900ac
RT2600ac
MR2200ac
RT6600ax
See the device tracker integration page for instructions on how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Synology SRM integration was introduced in Home Assistant 0.87, and it's used by
180 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@aerialls
Categories
Presence detection
Back to top
