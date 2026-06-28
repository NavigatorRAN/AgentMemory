---
source_url: "https://www.home-assistant.io/integrations/statsd"
final_url: "https://www.home-assistant.io/integrations/statsd"
canonical_url: "https://www.home-assistant.io/integrations/statsd/"
source_handle: "web:www-home-assistant-io:cb31ac90d378"
source_section: "integrations-statsd"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2a652a7d365b020cdc07d2013de463518618ca512a8aacf1d3d089cd0ab42d9a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# StatsD - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/statsd
- Final URL: https://www.home-assistant.io/integrations/statsd
- Canonical URL: https://www.home-assistant.io/integrations/statsd/
- Fetched at: 2026-06-28T03:18:56Z
- Content type: text/html; charset=UTF-8

## Description

Record events in StatsD.

## Extracted Text

On this page
Related topics
The StatsD integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] makes it possible to transfer all state changes to an external StatsD instance.
To use the statsd integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry statsd :
Configuration Variables
Looking for your configuration file?
host string Required , default: localhost
IP address of your StatsD host, e.g., 192.168.1.10.
port integer ( Optional , default: 8125 )
Port to use.
prefix string ( Optional , default: hass )
Prefix to use.
rate integer ( Optional , default: 1 )
The sample rate.
log_attributes boolean ( Optional , default: false )
Log state and attribute changes. This changes the default stats path.
value_mapping list ( Optional )
Map non-numerical values to numerical ones.
Full example:
# Example configuration.yaml entry statsd : prefix : home rate : 5 value_mapping : cooling : 1 heating : 10
StatsD supports various backends .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The StatsD integration was introduced in Home Assistant 0.12, and it's used by
4 active installations.
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
