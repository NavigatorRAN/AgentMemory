---
source_url: "https://www.home-assistant.io/integrations/thingspeak"
final_url: "https://www.home-assistant.io/integrations/thingspeak"
canonical_url: "https://www.home-assistant.io/integrations/thingspeak/"
source_handle: "web:www-home-assistant-io:85bcf4759646"
source_section: "integrations-thingspeak"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a2fcb24052b069fc8271821a911b35d62170366634ed6943286386b778359afa"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# ThingSpeak - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/thingspeak
- Final URL: https://www.home-assistant.io/integrations/thingspeak
- Canonical URL: https://www.home-assistant.io/integrations/thingspeak/
- Fetched at: 2026-06-28T03:22:07Z
- Content type: text/html; charset=UTF-8

## Description

Record one entity in ThingSpeak

## Extracted Text

On this page
Configuration
The ThingSpeak integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] makes Home Assistant communicate with the ThingSpeak API .
For now, it records exactly one entity at once, which is great for testing purposes. For long-time storage you should rely on the InfluxDB integration .
You will have to create a new channel on ThingSpeak and grab your Write API Key from the “API Keys” tab of the channel you want to use.
To set up the ThingSpeak integration in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry thingspeak : api_key : MY_API_KEY id : 1337 whitelist : sensor.yr_temperature
Configuration Variables
Looking for your configuration file?
api_key string Required
Your ThingSpeak Channel Write API key.
id integer Required
The ID of your desired ThingSpeak channel.
whitelist string Required
The name of the entity whose states should be sent to the channel.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ThingSpeak integration was introduced in Home Assistant 0.32, and it's used by
37 active installations.
Its IoT class is Cloud Push.
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
