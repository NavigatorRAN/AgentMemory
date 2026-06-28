---
source_url: "https://www.home-assistant.io/integrations/websocket_api"
final_url: "https://www.home-assistant.io/integrations/websocket_api"
canonical_url: "https://www.home-assistant.io/integrations/websocket_api/"
source_handle: "web:www-home-assistant-io:44f7630ee6e9"
source_section: "integrations-websocket-api"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "92f751b4252e225c41fe94ad0ba899ad7fed4d95bb130d80e6a9db8555ea4623"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Home Assistant WebSocket API - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/websocket_api
- Final URL: https://www.home-assistant.io/integrations/websocket_api
- Canonical URL: https://www.home-assistant.io/integrations/websocket_api/
- Fetched at: 2026-06-28T03:28:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the WebSocket API within Home Assistant.

## Extracted Text

On this page
Configuration
Track current connections
The Home Assistant WebSocket API integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] set up a WebSocket API and allows one to interact with a Home Assistant instance that is running headless. This integration depends on the http integration .
# Example configuration.yaml entry websocket_api :
For details to use the WebSocket API, please refer to the WebSocket API documentation .
The WebSocket API provides a sensor that will keep track of the number of currently connected clients. You can add it by adding the following to your configuration:
# Example configuration.yaml entry sensor : - platform : websocket_api
This will create a sensor called sensor.connected_clients whose value is the total number of connected clients.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Home Assistant WebSocket API system was introduced in Home Assistant 0.34, and it's used by
1.3% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Other
Back to top
