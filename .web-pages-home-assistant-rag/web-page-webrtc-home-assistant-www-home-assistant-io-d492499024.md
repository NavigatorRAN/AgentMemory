---
source_url: "https://www.home-assistant.io/integrations/web_rtc"
final_url: "https://www.home-assistant.io/integrations/web_rtc"
canonical_url: "https://www.home-assistant.io/integrations/web_rtc/"
source_handle: "web:www-home-assistant-io:d49249902456"
source_section: "integrations-web-rtc"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7d21129e9942a4d9acb915fffff63c28f1ed40777453a5befde65b45eab95015"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# WebRTC - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/web_rtc
- Final URL: https://www.home-assistant.io/integrations/web_rtc
- Canonical URL: https://www.home-assistant.io/integrations/web_rtc/
- Fetched at: 2026-06-28T03:28:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure the WebRTC integration for Home Assistant.

## Extracted Text

On this page
Advanced configuration
Configuration example
The WebRTC integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is an internal integration that provides WebRTC functionality for camera streaming in Home Assistant. It is automatically set up when needed and does not require any manual configuration.
To configure your own STUN and TURN servers, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry web_rtc :
Configuration Variables
Looking for your configuration file?
web_rtc map Required
Enables the WebRTC integration. Only allowed once.
ice_servers list Required
List of STUN and TURN server configurations.
url string Required
STUN or TURN server URLs. This can either be a single URL or a list of URLs.
username string ( Optional )
Username for TURN server authentication.
credential string ( Optional )
Credential for TURN server authentication.
# Example configuration.yaml entry with custom STUN and TURN servers web_rtc : ice_servers : # Add an entry for each STUN or TURN server - url : - " stun:stun.example.com:19302" - " stun:stun2.example.com:12345" - url : " turn:turn.domain.com" username : " username" credential : " abc123"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WebRTC system was introduced in Home Assistant 2026.1, and it's used by
1374 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Other
Back to top
