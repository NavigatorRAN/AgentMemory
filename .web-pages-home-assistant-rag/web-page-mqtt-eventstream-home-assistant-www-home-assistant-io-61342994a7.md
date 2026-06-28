---
source_url: "https://www.home-assistant.io/integrations/mqtt_eventstream"
final_url: "https://www.home-assistant.io/integrations/mqtt_eventstream"
canonical_url: "https://www.home-assistant.io/integrations/mqtt_eventstream/"
source_handle: "web:www-home-assistant-io:61342994a733"
source_section: "integrations-mqtt-eventstream"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6953ee74b2c338bd0b38ea26e92d1b04144558c56f73196f49a889adc09979d3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# MQTT Eventstream - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mqtt_eventstream
- Final URL: https://www.home-assistant.io/integrations/mqtt_eventstream
- Canonical URL: https://www.home-assistant.io/integrations/mqtt_eventstream/
- Fetched at: 2026-06-28T03:01:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up MQTT eventstream within Home Assistant.

## Extracted Text

On this page
Configuration
Multiple instances
Related topics
The MQTT Eventstream integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects two Home Assistant instances via MQTT.
To integrate MQTT Eventstream into Home Assistant, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt_eventstream : publish_topic : MyServerName subscribe_topic : OtherHaServerName
Configuration Variables
Looking for your configuration file?
publish_topic string ( Optional )
Topic for publishing local events.
subscribe_topic string ( Optional )
Topic to receive events from the remote server.
ignore_event list ( Optional )
List of events which will not be sent over MQTT.
Events from multiple instances can be aggregated to a single parent instance by subscribing to a wildcard topic from the parent instance.
# Example parent instance configuration.yaml entry mqtt_eventstream : publish_topic : parent/topic subscribe_topic : child/# ignore_event : - call_service - state_changed
For a multiple instance setup, each child instance would publish to their own topic.
# Example child instance configuration.yaml entry mqtt_eventstream : publish_topic : child/upstairs subscribe_topic : parent/topic
# Example child instance configuration.yaml entry mqtt_eventstream : publish_topic : child/downstairs subscribe_topic : parent/topic
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Eventstream integration was introduced in Home Assistant 0.11, and it's used by
145 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Other
Back to top
