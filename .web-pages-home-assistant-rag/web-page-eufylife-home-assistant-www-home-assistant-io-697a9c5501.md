---
source_url: "https://www.home-assistant.io/integrations/eufylife_ble"
final_url: "https://www.home-assistant.io/integrations/eufylife_ble"
canonical_url: "https://www.home-assistant.io/integrations/eufylife_ble/"
source_handle: "web:www-home-assistant-io:697a9c55019f"
source_section: "integrations-eufylife-ble"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "83fca76955c1fc86297416c72d1999856287cda4979ebe471f49bb13ae3f45e8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# EufyLife - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/eufylife_ble
- Final URL: https://www.home-assistant.io/integrations/eufylife_ble
- Canonical URL: https://www.home-assistant.io/integrations/eufylife_ble/
- Fetched at: 2026-06-28T02:41:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your EufyLife Bluetooth device with Home Assistant.

## Extracted Text

On this page
Supported devices
Features
Configuration
The EufyLife integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate Eufy smart scales with Home Assistant.
Smart Scale (T9140)
Smart Scale C1 (T9146)
Smart Scale P1 (T9147)
Smart Scale P2 (T9148)
Smart Scale P2 Pro (T9149)
Note
This integration does not support the Wi-Fi capabilities of the P2 and P2 Pro. It can only connect to your smart scale via Bluetooth.
All smart scale models provide a weight sensor entity and a real-time weight sensor entity. The real-time weight entity updates in real time while the scale is taking a weight measurement. The weight entity updates with the final weight value only when the scale is finished taking a weight measurement.
The Smart Scale P2 Pro additionally provides a heart rate sensor entity that will display the most recent heart rate measurement taken by the scale.
The EufyLife integration will automatically discover devices once the Bluetooth integration is enabled and functional. Alternatively, follow the steps below to add the integration manually.
To add the EufyLife device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select EufyLife .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EufyLife device was introduced in Home Assistant 2023.2, and it's used by
1454 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdr99
Categories
Sensor
Back to top
