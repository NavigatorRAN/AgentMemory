---
source_url: "https://www.home-assistant.io/integrations/device_automation"
final_url: "https://www.home-assistant.io/integrations/device_automation"
canonical_url: "https://www.home-assistant.io/integrations/device_automation/"
source_handle: "web:www-home-assistant-io:d53d69083a67"
source_section: "integrations-device-automation"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "80c6c6d49b22f082e2e62ca65e6aecf11412eb4c82c2e22d48c828b1f417ba3f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Device automation - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/device_automation
- Final URL: https://www.home-assistant.io/integrations/device_automation
- Canonical URL: https://www.home-assistant.io/integrations/device_automation/
- Fetched at: 2026-06-28T02:36:48Z
- Content type: text/html; charset=UTF-8

## Description

Information about the device automation plugin.

## Extracted Text

On this page
Device automation is a plugin for the automation integration to allow other integrations to provide device specific triggers, conditions and actions.
There is no device automation specific configuration. Instead, it is configured as part of the normal automations.
Device automations are meant to be configured via the UI.
Example:
- alias : " Light turns off" triggers : - trigger : device device_id : 7a92d5ee74014a0b86903fc669b0bcd6 domain : light type : turn_off entity_id : light.bowl actions : - action : camera.turn_off
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Device automation system was introduced in Home Assistant 0.7, and it's used by
4844 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Back to top
