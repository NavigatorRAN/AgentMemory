---
source_url: "https://www.home-assistant.io/integrations/quantum_gateway"
final_url: "https://www.home-assistant.io/integrations/quantum_gateway"
canonical_url: "https://www.home-assistant.io/integrations/quantum_gateway/"
source_handle: "web:www-home-assistant-io:c798c3a1fcff"
source_section: "integrations-quantum-gateway"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d0d849b0c0e2b0a9fea55190e87856d6b43601f6db38fc84cb0a606a409b4a72"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Quantum Gateway - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/quantum_gateway
- Final URL: https://www.home-assistant.io/integrations/quantum_gateway
- Canonical URL: https://www.home-assistant.io/integrations/quantum_gateway/
- Fetched at: 2026-06-28T03:10:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Quantum Gateways into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Quantum Gateway integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at devices connected to a Verizon Fios gateway.
It was tested with a Verizon Fios-G1100 and G3100 Quantum Gateway.
To use a Verizon Fios Quantum Gateway in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : quantum_gateway host : 192.168.1.1 password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: myfiosgateway.com )
The IP address of your router, e.g., 192.168.1.1 .
password string Required
The password for the admin user. The default password may be printed on the gateway itself.
ssl boolean ( Optional , default: true )
Use HTTPS when connecting to gateway. New firmware may require HTTPS while older may require this to be False.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Quantum Gateway integration was introduced in Home Assistant 0.81, and it's used by
36 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@cisasteelersfan
Categories
Presence detection
Back to top
