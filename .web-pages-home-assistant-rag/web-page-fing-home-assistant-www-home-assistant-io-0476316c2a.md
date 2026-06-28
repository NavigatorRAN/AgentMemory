---
source_url: "https://www.home-assistant.io/integrations/fing"
final_url: "https://www.home-assistant.io/integrations/fing"
canonical_url: "https://www.home-assistant.io/integrations/fing/"
source_handle: "web:www-home-assistant-io:0476316c2a16"
source_section: "integrations-fing"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "627adb41ecd79b48391bbf1647d271751cb6608f488e414bdc19a34e1d52b001"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Fing - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fing
- Final URL: https://www.home-assistant.io/integrations/fing
- Canonical URL: https://www.home-assistant.io/integrations/fing/
- Fetched at: 2026-06-28T02:42:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on integrating your Fing Agent with Home Assistant

## Extracted Text

On this page
Prerequisites
Configuration
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Fing integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows Home Assistant to retrieve detailed information about the devices on your local network. Fing helps home users and IT professionals monitor, protect, and understand their networks with intuitive tools that make connectivity management simple and effective.
By connecting through the Local API , Fing automatically builds and synchronizes an inventory of devices to detect online presence and trigger automations.
Ensure that the Local API is enabled on your Fing Agent ( Fing Agent , Fingbox, or Fing Desktop ).
You will need your Fing Agent’s IP address, port, and API key to complete the setup.
To add the Fing service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fing .
Follow the instructions on screen to complete the setup.
If you experience issues with the Fing integration , try the following:
Confirm that the Fing Agent is running and reachable on your network.
Verify that the configured IP address and port in Home Assistant match your Fing Agent’s actual settings.
Make sure your Local API version is 1.1.0 or newer.
You can remove this integration following the standard Home Assistant procedure.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Once the integration is deleted, you may also disable the Fing Local API on your network if you no longer plan to use it.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fing service was introduced in Home Assistant 2025.11, and it's used by
282 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Lorenzo-Gasparini
Categories
Presence detection
Back to top
