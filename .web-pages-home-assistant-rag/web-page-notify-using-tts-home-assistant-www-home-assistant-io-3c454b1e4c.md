---
source_url: "https://www.home-assistant.io/integrations/notify.tts"
final_url: "https://www.home-assistant.io/integrations/notify.tts"
canonical_url: "https://www.home-assistant.io/integrations/notify.tts/"
source_handle: "web:www-home-assistant-io:3c454b1e4c5d"
source_section: "integrations-notify-tts"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a55b19c53573b743d0be477cfb1ca3baa76228184b8c69807129e117371afbe1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Notify using TTS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/notify.tts
- Final URL: https://www.home-assistant.io/integrations/notify.tts
- Canonical URL: https://www.home-assistant.io/integrations/notify.tts/
- Fetched at: 2026-06-28T03:03:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up a Notify integration using TTS action and media_player within Home Assistant.

## Extracted Text

On this page
The notify TTS platform lets you use the TTS integration speak or legacy say action and a media_player to alert you of important events. This integration provides a simple interface to use in your automations and alerts.
To use this integration, you must already have a TTS platform installed and configured, and a media_player working with the TTS platform.
To enable this platform in your installation, consider the following example using google_translate and an example media_player.living_room .
In your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file type:
notify : - platform : tts name : in_the_living_room entity_id : tts.google_en_com media_player : media_player.living_room
Configuration Variables
Looking for your configuration file?
name string Required
The name of the notify action.
entity_id string ( Exclusive )
The entity_id of the TTS entity to target. Either use entity_id or tts_service to target a TTS platform.
tts_service string ( Exclusive )
The service_name of a TTS platform. Either use entity_id or tts_service to target a TTS platform.
media_player string Required
The entity_id of a media_player.
language string ( Optional )
The language to be passed to the TTS speak or say action.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Notify using TTS integration was introduced in Home Assistant 0.117, and it's used by
10.2% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Notifications
Back to top
