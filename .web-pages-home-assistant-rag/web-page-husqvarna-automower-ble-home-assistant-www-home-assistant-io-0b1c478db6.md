---
source_url: "https://www.home-assistant.io/integrations/husqvarna_automower_ble"
final_url: "https://www.home-assistant.io/integrations/husqvarna_automower_ble"
canonical_url: "https://www.home-assistant.io/integrations/husqvarna_automower_ble/"
source_handle: "web:www-home-assistant-io:0b1c478db6c2"
source_section: "integrations-husqvarna-automower-ble"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2131b38c03c6d492df1f3a78712cda947f6b3a8633a0dfac8852f7734b29abcf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Husqvarna Automower BLE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/husqvarna_automower_ble
- Final URL: https://www.home-assistant.io/integrations/husqvarna_automower_ble
- Canonical URL: https://www.home-assistant.io/integrations/husqvarna_automower_ble/
- Fetched at: 2026-06-28T02:50:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Husqvarna Automower BLE lawn mowers into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
The Husqvarna Automower BLE integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides connectivity with Husqvarna Automowers lawn mowers via a local Bluetooth connection. This allows connecting and controlling an Automower without any accounts, cloud, or network connection.
The integration is based on AutoMower-BLE , an unofficial reverse engineered Husqvarna Automower Connect BLE library.
Set up a Bluetooth controller . An ESPHome Bluetooth proxy works well and allows locating a device close to the mower.
Enter the pairing mode on the mower. Different models will do this in different ways. For the 305, for example, the mower will enter pairing mode for the first 3 minutes after powering on. Ensure the mower is in pairing mode when adding the integration. This only needs to be done once per BLE controller (so changing the ESPHome device will require a repair).
When manually adding the integration to Home Assistant, you will need to enter the mower BLE Mac address. You can find this in the ESPHome logs, on an Android phone, or by some other means.
Pairing can take a few goes. Even when using the official Android application, it can be tricky to get the first pair to succeed. If you are having issues, reboot the mower and try again. The Mower must be paired, not just connected, to work.
To add the Husqvarna Automower BLE device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Husqvarna Automower BLE .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Husqvarna Automower BLE device was introduced in Home Assistant 2024.11, and it's used by
143 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@alistair23
Categories
Lawn Mower
Sensor
Back to top
