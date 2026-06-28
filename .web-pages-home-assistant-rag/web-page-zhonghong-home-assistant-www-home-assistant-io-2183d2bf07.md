---
source_url: "https://www.home-assistant.io/integrations/zhong_hong"
final_url: "https://www.home-assistant.io/integrations/zhong_hong"
canonical_url: "https://www.home-assistant.io/integrations/zhong_hong/"
source_handle: "web:www-home-assistant-io:2183d2bf07da"
source_section: "integrations-zhong-hong"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0d283a2ad07ab764c6861469824e54f2ecad4b194dad4f519c181110a793cd3a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# ZhongHong - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/zhong_hong
- Final URL: https://www.home-assistant.io/integrations/zhong_hong
- Canonical URL: https://www.home-assistant.io/integrations/zhong_hong/
- Fetched at: 2026-06-28T03:31:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ZhongHong Support thermostats within Home Assistant.

## Extracted Text

On this page
The ZhongHong integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control Zhonghong HVAC Gateway Controller thermostats through Home Assistant.
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
climate : - platform : zhong_hong host : GATEWAY_IP
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your controller.
port integer ( Optional , default: 9999 )
The port of your controller.
gateway_address integer ( Optional , default: 1 )
The gateway address for the gateway (Settings in the controller itself).
When Gateway is found, All HVAC devices will be configured automatically.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ZhongHong integration was introduced in Home Assistant 0.72, and it's used by
3 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Climate
Back to top
