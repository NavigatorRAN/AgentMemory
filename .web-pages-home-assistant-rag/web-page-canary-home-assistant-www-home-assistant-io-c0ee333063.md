---
source_url: "https://www.home-assistant.io/integrations/canary"
final_url: "https://www.home-assistant.io/integrations/canary"
canonical_url: "https://www.home-assistant.io/integrations/canary/"
source_handle: "web:www-home-assistant-io:c0ee33306373"
source_section: "integrations-canary"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "543cf5e2ca691340de23cdc156bba2209c42313e9074f2524ef873efa1a7b6d3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Canary - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/canary
- Final URL: https://www.home-assistant.io/integrations/canary
- Canonical URL: https://www.home-assistant.io/integrations/canary/
- Fetched at: 2026-06-28T02:33:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Canary devices into Home Assistant.

## Extracted Text

On this page
Configuration
Camera
Sensor
The Canary integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Canary devices in Home Assistant.
There is currently support for the following device types within Home Assistant:
Alarm
To add the Canary hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Canary .
Follow the instructions on screen to complete the setup.
Once loaded, your front end will have the following entities:
A camera image triggered by motion for each camera.
An alarm control panel for each location.
A sensor per camera that reports temperature.
A sensor per camera that reports humidity.
A sensor per camera that reports air quality.
The canary camera platform allows you to watch the live stream of your Canary camera in Home Assistant. This requires the ffmpeg integration to be already configured.
Once you have Canary integration setup, your Canary camera(s) should show up automatically.
The canary sensor platform allows you to integrate the sensors of your Canary devices in Home Assistant.
To add canary sensors to your installation, follow instructions above.
Once loaded, you will see following sensors:
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Canary hub was introduced in Home Assistant 0.60, and it's used by
114 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Back to top
