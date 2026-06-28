---
source_url: "https://www.home-assistant.io/integrations/aidot"
final_url: "https://www.home-assistant.io/integrations/aidot"
canonical_url: "https://www.home-assistant.io/integrations/aidot/"
source_handle: "web:www-home-assistant-io:795538d8d07a"
source_section: "integrations-aidot"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7adcf615086e5faaafdd2b2cae07bf6d556726392d2fc789563f7aeceea2f1d1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# AiDot - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aidot
- Final URL: https://www.home-assistant.io/integrations/aidot
- Canonical URL: https://www.home-assistant.io/integrations/aidot/
- Fetched at: 2026-06-28T02:26:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on integrating AiDot Wi-Fi lights with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Lights
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The AiDot integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Wi-Fi lights with Home Assistant.
A19
BR30
Your devices need to be added to your account using the official AiDot app first.
Only login with username and password is supported.
To add the AiDot hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AiDot .
Follow the instructions on screen to complete the setup.
Country
The country you use to log into the AiDot app.
Username
The username you use to log into the AiDot app.
Password
The password you use to log into the AiDot app.
The integration adds a light entity for each device.
All lights support turning on and off, as well as adjusting brightness.
Depending on the device, the following features may also be available:
Color temperature : Adjusts the white light warmth in Kelvin. The supported range varies per device (for example, 2700 K to 6500 K).
RGBW color : Adjusts the color using red, green, blue, and white channels. Devices with RGBW support also support color temperature control.
After you sign in successfully, the integration retrieves the device list from AiDot Cloud.
After the initial device list is retrieved, the integration checks the cloud every 6 hours and processes any additions or deletions.
The integration maintains a persistent TCP connection to each device and receives real-time status updates when the device state changes.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AiDot hub was introduced in Home Assistant 2026.6, and it's used by
89 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@s1eedz
@HongBryan
Categories
Light
Back to top
