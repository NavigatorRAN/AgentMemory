---
source_url: "https://www.home-assistant.io/integrations/vilfo"
final_url: "https://www.home-assistant.io/integrations/vilfo"
canonical_url: "https://www.home-assistant.io/integrations/vilfo/"
source_handle: "web:www-home-assistant-io:798c698202b9"
source_section: "integrations-vilfo"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d7bb6105b42c85721ac878b46de5827f0509a0c48c72735a5a7dc257f040338d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Vilfo Router - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vilfo
- Final URL: https://www.home-assistant.io/integrations/vilfo
- Canonical URL: https://www.home-assistant.io/integrations/vilfo/
- Fetched at: 2026-06-28T03:26:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Vilfo Router into Home Assistant.

## Extracted Text

On this page
Configuration
Obtaining an access token
The Vilfo Router integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to observe the state of your Vilfo Router from Home Assistant.
It currently supports reporting the current load of the device in percent and the current uptime measured in minutes.
To add the Vilfo Router device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Vilfo Router .
Follow the instructions on screen to complete the setup.
The access token for the API can be obtained through the Vilfo web-UI in the pane named “general”. Visit the official API documentation for more information on how to find your token.
Important
In version 1.0.13 of the Vilfo firmware, access tokens are invalidated when a new login to the web UI is made. To prevent web UI logins from interfering with the API calls, you can create a separate user solely for API purposes and use its access token.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Vilfo Router device was introduced in Home Assistant 0.106, and it's used by
1 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ManneW
Categories
Network
Sensor
System monitor
Back to top
