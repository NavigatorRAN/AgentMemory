---
source_url: "https://www.home-assistant.io/integrations/streamlabswater"
final_url: "https://www.home-assistant.io/integrations/streamlabswater"
canonical_url: "https://www.home-assistant.io/integrations/streamlabswater/"
source_handle: "web:www-home-assistant-io:abb5e2f78e7d"
source_section: "integrations-streamlabswater"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "97a4a4845f02039c0083d8627e40792683ca0c2296da02d78f4d65d601a4a0ca"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# StreamLabs - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/streamlabswater
- Final URL: https://www.home-assistant.io/integrations/streamlabswater
- Canonical URL: https://www.home-assistant.io/integrations/streamlabswater/
- Fetched at: 2026-06-28T03:19:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Streamlabs Water devices with Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
The StreamLabs integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to interact with StreamLabs water monitoring devices to retrieve usage information and manage the away mode of the device. The StreamLabs Water API is used to retrieve daily, monthly, and yearly water usage along with the current away mode.
Important
Access to the StreamLabs Water API is not free, you must have a StreamPlus™ subscription level that enables API access. Visit https://streamlabswater.com/subscription for more information.
There is currently support for the following device types within Home Assistant:
Binary sensor
Sensor
In preparation for using this integration you will need to request an API key following the instructions in the StreamLabs API Getting Started Section . Be sure to request an API key and not an OAuth token.
To add the StreamLabs service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select StreamLabs .
Follow the instructions on screen to complete the setup.
The StreamLabs integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set away mode ( streamlabswater.set_away_mode )
Sets the home or away mode for a StreamLabs Water Monitor.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The StreamLabs service was introduced in Home Assistant 0.95, and it's used by
26 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Back to top
