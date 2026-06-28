---
source_url: "https://www.home-assistant.io/integrations/adax"
final_url: "https://www.home-assistant.io/integrations/adax"
canonical_url: "https://www.home-assistant.io/integrations/adax/"
source_handle: "web:www-home-assistant-io:afc8473085a8"
source_section: "integrations-adax"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "01f19d37b60d03d1f1456bcf98728acd56c2eb56805e8a8492af7513f1586ddd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Adax - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/adax
- Final URL: https://www.home-assistant.io/integrations/adax
- Canonical URL: https://www.home-assistant.io/integrations/adax/
- Fetched at: 2026-06-28T02:26:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Adax heater into Home Assistant.

## Extracted Text

On this page
Local integration
Cloud integration
Configuration
Energy monitoring
The Adax integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates Adax heaters into Home Assistant and can be configured to use a local or cloud interface.
The local integration only works with newer Adax heaters with both Bluetooth and Wi-Fi. Home Assistant uses Bluetooth LE to configure the heaters, this means the machine running Home Assistant needs to have a Bluetooth adapter and the heater needs to be in range during setup. Using local control will disable cloud communication and the Adax app will not work.
Reset the heater by pressing + and OK until the display shows Reset .
Press and hold the OK button on the heater until the blue LED starts blinking.
Press Submit .
This process may take several minutes.
For the cloud integration, you’ll need your Account ID. This can be found in the Adax WiFi app by pressing Account . The ID will be shown as a number between the log out and close account buttons.
You will also need a credential, which you can create in the Adax app:
Navigate to the Account tab.
Go to Third party integrations .
Select Remote API .
Select Add Credential .
Give some name to the created credential (e.g. ‘Home Assistant’) and copy the generated password.
In the configuration popup you will need the Account ID, and the generated API password (not the account password)
To add the Adax integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Adax .
Follow the instructions on screen to complete the setup.
When using the cloud integration, the Adax integration provides energy monitoring sensors that track the power consumption of your heaters. These sensors are only available when using the cloud connection, as the local integration does not support energy data.
The integration creates the following energy sensors:
Individual energy sensors - One sensor for each Adax heater showing its energy consumption in Wh
The energy sensors use the total_increasing state class, making them suitable for use with Home Assistant’s energy dashboard to track your heating costs and consumption over time.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Adax integration was introduced in Home Assistant 2021.8, and it's used by
927 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@danielhiversen
@lazytarget
Categories
Climate
Sensor
Back to top
