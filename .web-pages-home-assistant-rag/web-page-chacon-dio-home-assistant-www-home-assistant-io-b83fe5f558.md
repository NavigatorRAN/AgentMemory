---
source_url: "https://www.home-assistant.io/integrations/chacon_dio"
final_url: "https://www.home-assistant.io/integrations/chacon_dio"
canonical_url: "https://www.home-assistant.io/integrations/chacon_dio/"
source_handle: "web:www-home-assistant-io:b83fe5f558e7"
source_section: "integrations-chacon-dio"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3b8a73045f4b5c4ebe393b0c26735c68df07095892ec06804b15c4f253c34384"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Chacon DiO - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/chacon_dio
- Final URL: https://www.home-assistant.io/integrations/chacon_dio
- Canonical URL: https://www.home-assistant.io/integrations/chacon_dio/
- Fetched at: 2026-06-28T02:33:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Chacon Dio devices within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Cover
Switch
Actions
Tips
Chacon Dio devices are connected home devices that can be controlled via RF 433 MHz or Wi-Fi.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] gives you access to the Wi-Fi connection so that Home Assistant can list your Chacon Dio devices and interact with them in real time, the same way the vendor’s smartphone application does.
There is currently support for the following device types within Home Assistant:
You will need to use the standalone app for this device to register a username and password.
Google
Apple
To add the Chacon DiO integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Chacon DiO .
Follow the instructions on screen to complete the setup.
The cover platform integrates Chacon Dio devices to manage covers (like the REV-SHUTTER model) into Home Assistant, enabling control of the following:
get the state of the cover (connected or not, position and current movement)
Open/close/stop the cover
Set position of the cover (0-100%)
The switch platform integrates Chacon Dio devices to manage switches (like the REV-SWITCH model) into Home Assistant, enabling control of the following:
get the state of the switch (connected or not and on/off state)
Turn on/off the switch
In rare cases, such as Wi-Fi interruptions, you may need to manually update the state of your devices. You can use the homeassistant.update_entity action to refresh the device state manually.
You can use the group integration to group entities as the application proposes (for example covers of the first floor).
You can use any Cover card to have a specific display of the covers.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Chacon DiO integration was introduced in Home Assistant 2024.8, and it's used by
197 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@cnico
Categories
Back to top
