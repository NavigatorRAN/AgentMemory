---
source_url: "https://www.home-assistant.io/integrations/sfr_box"
final_url: "https://www.home-assistant.io/integrations/sfr_box"
canonical_url: "https://www.home-assistant.io/integrations/sfr_box/"
source_handle: "web:www-home-assistant-io:2df3efeb0e99"
source_section: "integrations-sfr-box"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8d8ff2b06d522583505bc5bc46d646a55cef2c79cb91877025b51aa97f4bde56"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SFR Box - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sfr_box
- Final URL: https://www.home-assistant.io/integrations/sfr_box
- Canonical URL: https://www.home-assistant.io/integrations/sfr_box/
- Fetched at: 2026-06-28T03:15:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SFR Box into Home Assistant.

## Extracted Text

On this page
Configuration
Compatibility
Removing the integration
To remove an integration instance from Home Assistant
The SFR Box integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers integration with the SFR broadband router.
This integration provides the following platforms:
Binary sensors - such as ADSL status.
Buttons - such as reboot.
Sensors - such as ADSL line status, attenuation, noise and data rate.
To add the SFR Box device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SFR Box .
Follow the instructions on screen to complete the setup.
Host
The hostname, IP address, or full URL of your SFR device.
Username (optional)
The username for accessing your SFR box’s web interface. The default is ‘admin’.
Password (optional)
The password for accessing your SFR box’s web interface. The default is the Wi-Fi security key found on the device label.
The integration uses the REST API, which is known to be available on models NB4 , NB5 , NB6 , NB6V , and NB6VAC .
However, NCC models do not appear to expose this REST API, and are therefore unsupported by the integration.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SFR Box device was introduced in Home Assistant 2023.2, and it's used by
375 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@epenet
Categories
Sensor
Back to top
