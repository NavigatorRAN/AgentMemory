---
source_url: "https://www.home-assistant.io/integrations/graphite"
final_url: "https://www.home-assistant.io/integrations/graphite"
canonical_url: "https://www.home-assistant.io/integrations/graphite/"
source_handle: "web:www-home-assistant-io:e23f72841235"
source_section: "integrations-graphite"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f086498756dee8a0dd294f0150f58c6ca16e9b7cf35552ef3dd09115eb7e230e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Graphite - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/graphite
- Final URL: https://www.home-assistant.io/integrations/graphite
- Canonical URL: https://www.home-assistant.io/integrations/graphite/
- Fetched at: 2026-06-28T02:47:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to record Home Assistant history in Graphite.

## Extracted Text

On this page
Related topics
The Graphite integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] records all events and state changes and feeds the data to a graphite instance.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry graphite :
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: localhost )
IP address of your graphite host, e.g., 192.168.1.10.
port integer ( Optional , default: 2003 )
Port on graphite host.
protocol string ( Optional , default: tcp )
Type of communication protocol: tcp or udp .
prefix string ( Optional , default: ha )
Prefix is the metric prefix in graphite.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Graphite integration was introduced in Home Assistant 0.13, and it's used by
20 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
History
Back to top
