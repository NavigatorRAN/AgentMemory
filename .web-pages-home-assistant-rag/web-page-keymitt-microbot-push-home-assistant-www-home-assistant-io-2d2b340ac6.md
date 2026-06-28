---
source_url: "https://www.home-assistant.io/integrations/keymitt_ble"
final_url: "https://www.home-assistant.io/integrations/keymitt_ble"
canonical_url: "https://www.home-assistant.io/integrations/keymitt_ble/"
source_handle: "web:www-home-assistant-io:2d2b340ac639"
source_section: "integrations-keymitt-ble"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6a3b2943f3f4480ea9d3fea514fa2adccb591bbf3a8fcdc046065f8aab7ac85f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Keymitt MicroBot Push - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/keymitt_ble
- Final URL: https://www.home-assistant.io/integrations/keymitt_ble
- Canonical URL: https://www.home-assistant.io/integrations/keymitt_ble/
- Fetched at: 2026-06-28T02:54:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the MicroBot Push.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
List of actions
Error codes and troubleshooting
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to locally control a MicroBot Push (previously manufactured by Naran but now under the Keymitt brand).
To use this integration, it is required to have working Bluetooth set up on the device running Home Assistant. A Naran/Keymitt hub is not required.
The device will need to be in pairing mode before adding to Home Assistant. To reset the MicroBot Push, turn it off, then back on, and immediately hold the push button while the LED is red. After approximately 5 seconds, the LED will flash rapidly, at which point release the button. The LED will blink blue if the pairing mode has been successfully activated.
If you have multiple devices, you will need to know the BTLE MAC address of your device to tell them apart.
The devices cannot remain paired to the MicroBot application for this integration to function. They will be paired to Home Assistant exclusively.
To add the Keymitt MicroBot Push device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Keymitt MicroBot Push .
Follow the instructions on screen to complete the setup.
This Integration is for the MicroBot Push only. The Keymitt lock is not supported.
The Keymitt MicroBot Push integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Calibrate ( keymitt_ble.calibrate )
Sets the push depth, hold duration, and mode of a MicroBot Push.
For an overview of every action across all integrations, see the actions reference .
The integration will automatically discover devices once the Bluetooth integration is enabled and functional.
Due to the device going into deep sleep after extended periods of no activity, the response time can be up to a minute in extreme cases. On average it will be much quicker.
Failed to pair
Make sure your devices are powered on, in range, and in pairing mode. Pressing the button on the MicroBot Push to take it out of deep sleep may also be beneficial.
No unconfigured devices found
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Keymitt MicroBot Push device was introduced in Home Assistant 2022.10, and it's used by
15 active installations.
Its IoT class is Assumed State.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@spycle
Categories
Switch
Back to top
