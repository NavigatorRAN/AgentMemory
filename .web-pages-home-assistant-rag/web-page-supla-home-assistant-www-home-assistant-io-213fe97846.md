---
source_url: "https://www.home-assistant.io/integrations/supla"
final_url: "https://www.home-assistant.io/integrations/supla"
canonical_url: "https://www.home-assistant.io/integrations/supla/"
source_handle: "web:www-home-assistant-io:213fe97846af"
source_section: "integrations-supla"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "28ee39ad962d154483202512ea3cf602e83e575ccdd4a6da512f5ebcba139183"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SUPLA - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/supla
- Final URL: https://www.home-assistant.io/integrations/supla
- Canonical URL: https://www.home-assistant.io/integrations/supla/
- Fetched at: 2026-06-28T03:19:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for integration with SUPLA-CLOUD's Web API

## Extracted Text

On this page
Configuration
The SUPLA integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use SUPLA devices in Home Assistant.
SUPLA-DEV is an open source home automation system for Raspberry Pi, Arduino or ESP8266-based devices. It has its own protocols, firmware and commercially available devices, such as those produced by Zamel .
Currently, only covers (shutters in SUPLA’s terminology), gates, garage doors, and switches are supported, but thanks to comprehensive and universal REST API, it’s pretty easy to add more.
Right now, it’s impossible to add a device – all of them are discovered from SUPLA-CLOUD’s servers or yours.
For more complete Home Assistant support based on MQTT autodiscovery, consider switching your Supla devices to MQTT (through the setup interface). Or use the MQTT broker provided by Supla Cloud .
Important
The Supla Cloud MQTT broker requires changing the default MQTT protocol setting at version 3.1.
To use SUPLA devices in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
supla : servers : - server : " svr1.supla.org" access_token : " YOUR_ACCESS_TOKEN"
Configuration Variables
Looking for your configuration file?
servers list
List of server configurations.
server string Required
Address of the SUPLA-CLOUD server (either IP address or DNS name); can either be the cloud hosted instance, or a self hosted instance.
access_token string Required
An access token for REST API configuration. Under Scopes > Channels , at least the Read and Action execution permissions are required to be enabled. A token can be obtained from the Security section of SUPLA-CLOUD for Personal Access Token page, or from your own self hosted instance.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SUPLA integration was introduced in Home Assistant 0.92, and it's used by
227 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mwegrzynek
Categories
Cover
Hub
Back to top
