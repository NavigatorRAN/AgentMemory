---
source_url: "https://www.home-assistant.io/integrations/sisyphus"
final_url: "https://www.home-assistant.io/integrations/sisyphus"
canonical_url: "https://www.home-assistant.io/integrations/sisyphus/"
source_handle: "web:www-home-assistant-io:e406074f7ad0"
source_section: "integrations-sisyphus"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c9b9224e6715e61acb951cb8b05af31b2cb49afde32c3d60d2ea47579a08b76e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Sisyphus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sisyphus
- Final URL: https://www.home-assistant.io/integrations/sisyphus
- Canonical URL: https://www.home-assistant.io/integrations/sisyphus/
- Fetched at: 2026-06-28T03:16:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Sisyphus Kinetic Art Table within Home Assistant.

## Extracted Text

On this page
The Sisyphus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to observe and control your Sisyphus Kinetic Art Table.
There is currently support for the following device types within Home Assistant:
Light - Can be used to sleep/wake the table or adjust the brightness of the table light.
Media player - Can be used to sleep/wake the table, play/pause, move between tracks, or toggle shuffle on and off. The “volume” control adjusts the table’s speed.
The light and media players will be automatically added for each of your Sisyphus tables, if the Sisyphus integration is configured.
There are two ways to configure this integration. For the automatic discovery of your table(s), add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# This will auto-detect all Sisyphus tables on your local network. sisyphus :
Auto-detection can be a little slow, so if your table has a fixed IP address or hostname, you may add a list of tables in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] . For example:
# This will skip auto-detection and add only the listed tables sisyphus : - name : ' TABLE_NAME' host : " TABLE_IP_OR_HOSTNAME" - name : ' ANOTHER_TABLE_NAME' host : " ANOTHER_TABLE_IP_OR_HOSTNAME"
Configuration Variables
Looking for your configuration file?
name string Required
The name by which the table should appear in Home Assistant
host string Required
The hostname or IP address of the table
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sisyphus integration was introduced in Home Assistant 0.75, and it's used by
35 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jkeljo
Categories
Hub
Light
Media player
Back to top
