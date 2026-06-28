---
source_url: "https://www.home-assistant.io/integrations/proliphix"
final_url: "https://www.home-assistant.io/integrations/proliphix"
canonical_url: "https://www.home-assistant.io/integrations/proliphix/"
source_handle: "web:www-home-assistant-io:ea3ade7b7462"
source_section: "integrations-proliphix"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "29413d785738aac5288f6873b442e76b4c7558ec2daa8998cad20b68f65536ac"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Proliphix - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/proliphix
- Final URL: https://www.home-assistant.io/integrations/proliphix
- Canonical URL: https://www.home-assistant.io/integrations/proliphix/
- Fetched at: 2026-06-28T03:09:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Proliphix thermostats within Home Assistant.

## Extracted Text

On this page
The Proliphix integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] let you control Proliphix thermostats from Home Assistant.
Currently supported and tested thermostats:
NT10e
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
climate : - platform : proliphix host : IP_ADDRESS username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
Address of your thermostat, e.g., 192.168.1.32.
username string Required
Username for the thermostat.
password string Required
Password for the thermostat.
The Proliphix NT Thermostat series are Ethernet connected thermostats. They have a local HTTP interface that is based on get/set
of OID values. A complete collection of the API is available in this API documentation .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Proliphix integration was introduced in Home Assistant 0.11, and it's used by
6 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Climate
Back to top
