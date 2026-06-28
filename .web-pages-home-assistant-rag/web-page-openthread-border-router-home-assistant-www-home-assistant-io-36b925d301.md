---
source_url: "https://www.home-assistant.io/integrations/otbr"
final_url: "https://www.home-assistant.io/integrations/otbr"
canonical_url: "https://www.home-assistant.io/integrations/otbr/"
source_handle: "web:www-home-assistant-io:36b925d3016d"
source_section: "integrations-otbr"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fd3aee8fdca42f06140827d6061507654388f71315df26d1cb803e6f1738f94c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# OpenThread Border Router - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/otbr
- Final URL: https://www.home-assistant.io/integrations/otbr
- Canonical URL: https://www.home-assistant.io/integrations/otbr/
- Fetched at: 2026-06-28T03:06:47Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
Configuration
The OpenThread Border Router integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows calling an OpenThread Border Router’s REST API from Python and via WebSocket.
This integration is installed automatically when the OpenThread Border Router app for Home Assistant (formerly known as add-on) is installed. For Home Assistant Yellow, Connect ZBT-1, or Connect ZBT-2 refer to the following procedures:
Enabling Thread on Home Assistant Yellow
Enabling Thread on Home Assistant Connect ZBT-1
Enabling Thread on Home Assistant Connect ZBT-2
Installing this integration manually is an advanced use case, for example if you run your own border router. If you do have such a use case, follow these steps:
To add the OpenThread Border Router service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OpenThread Border Router .
Follow the instructions on screen to complete the setup.
When asked to provide a URL, enter the address of your border router’s REST API. The URL uses plain HTTP, not HTTPS, and includes the host and port of your border router. A standard OpenThread border router exposes its REST API on port 8081 , so your URL typically looks like http://192.168.1.42:8081 . Replace the IP address with your border router’s IP address.
To view the app documentation, go to Settings > Apps > OpenThread Border Router and select the Documentation tab.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenThread Border Router service was introduced in Home Assistant 2023.2, and it's used by
5.7% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Other
Back to top
