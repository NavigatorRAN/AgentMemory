---
source_url: "https://www.home-assistant.io/integrations/actron_air"
final_url: "https://www.home-assistant.io/integrations/actron_air"
canonical_url: "https://www.home-assistant.io/integrations/actron_air/"
source_handle: "web:www-home-assistant-io:1c433bfe5701"
source_section: "integrations-actron-air"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8f1f98426f367d7e894c7b205de2f2c4ebf315cff6d5e6ce1eac1171f5042989"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Actron Air - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/actron_air
- Final URL: https://www.home-assistant.io/integrations/actron_air
- Canonical URL: https://www.home-assistant.io/integrations/actron_air/
- Fetched at: 2026-06-28T02:25:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Actron Air A/C controller into Home Assistant.

## Extracted Text

On this page
Prerequisites
Supported devices
Configuration
Supported functionality
Climate
Switch
Removing the integration
To remove an integration instance from Home Assistant
The Actron Air integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Actron Air Air Conditioning controllers into Home Assistant.
You must have an Actron Air air conditioner with the Neo or Que controller, an active internet connection, and be registered to an email address.
This integration supports the Actron Air Neo and Que controllers.
To add the Actron Air hub to your Home Assistant instance, use this My button:
Actron Air can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Actron Air .
Follow the instructions on screen to complete the setup.
The integration will create a climate entity for the main air conditioning system found and for each zone. The main air conditioner unit will be reflected based on the name in the Actron Air app. You can set the temperature, operation mode, and fan speed through this entity.
Each zone will be reflected as a separate climate entity. You can set the temperature and operation mode per zone (if supported by your air conditioner).
The integration will add the Away mode , Continuous fan , Quiet mode , and Turbo mode (if supported) switches to your Actron Air air conditioner.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Actron Air hub was introduced in Home Assistant 2025.11, and it's used by
71 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kclif9
@JagadishDhanamjayam
Categories
Back to top
