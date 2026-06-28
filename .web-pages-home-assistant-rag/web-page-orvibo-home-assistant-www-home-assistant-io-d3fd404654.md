---
source_url: "https://www.home-assistant.io/integrations/orvibo"
final_url: "https://www.home-assistant.io/integrations/orvibo"
canonical_url: "https://www.home-assistant.io/integrations/orvibo/"
source_handle: "web:www-home-assistant-io:d3fd404654cf"
source_section: "integrations-orvibo"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "466333078cca55fa3707737085d7d2582ac73cbf27489688fe1b568d43acc649"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Orvibo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/orvibo
- Final URL: https://www.home-assistant.io/integrations/orvibo
- Canonical URL: https://www.home-assistant.io/integrations/orvibo/
- Fetched at: 2026-06-28T03:06:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Orvibo sockets within Home Assistant.

## Extracted Text

On this page
Configuration
Troubleshooting
Caution
Please be aware that the product ORVIBO Wi-Fi SMART SOCKET S20 (LGS-20) has been recalled by the European authorities due to safety concerns. For more information, please visit RAPEX information .
The Orvibo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to toggle your Orvibo S20 Wi-Fi Smart Sockets.
To add the Orvibo device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Orvibo .
Follow the instructions on screen to complete the setup.
If Home Assistant cannot discover your switches, you can configure them manually.
Host
The host name or IP address (for example, 192.168.1.2) of your switch.
MAC address
The MAC address of the switch. This field is optional. If it is omitted, the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will attempt to discover and connect to the switch using the Host field alone. If this discovery fails, you must enter both the host and MAC address information.
Discovery requires that Home Assistant and the Orvibo switches are on the same network subnet. In addition, discovery may fail if the switches are in sleep mode. In this case, try toggling the switch state or power cycling the switch. If discovery still fails, you can configure the switches manually.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Orvibo device was introduced in Home Assistant 0.8, and it's used by
106 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Switch
Back to top
