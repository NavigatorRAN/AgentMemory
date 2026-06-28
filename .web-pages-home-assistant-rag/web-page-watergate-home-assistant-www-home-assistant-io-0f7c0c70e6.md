---
source_url: "https://www.home-assistant.io/integrations/watergate"
final_url: "https://www.home-assistant.io/integrations/watergate"
canonical_url: "https://www.home-assistant.io/integrations/watergate/"
source_handle: "web:www-home-assistant-io:0f7c0c70e619"
source_section: "integrations-watergate"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f9e5e707afa81d55fa127d7eaa2e75d6bd54f08f1ee45f271728162955872fb1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Watergate - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/watergate
- Final URL: https://www.home-assistant.io/integrations/watergate
- Canonical URL: https://www.home-assistant.io/integrations/watergate/
- Fetched at: 2026-06-28T03:27:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Watergate with Home Assistant.

## Extracted Text

On this page
Prerequisites
Supported devices
Unsupported devices
Supported functionality
Entities
Data updates
Known limitations
Configuration
Examples
Monitor water usage in the Energy Dashboard
Automation ideas
Removing the integration
To remove an integration instance from Home Assistant
The Watergate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates your Watergate Devices (currently Sonic Wi-Fi) with your Home Assistant.
With this integration, you can:
Control your valve
Monitor live telemetry (water flow, water pressure, water temperature)
Monitor water usage
Receive information when Sonic shuts off the valve due to potential leak
You need to have a Sonic device.
The Local API feature must be enabled in the Watergate application.
The following devices are known to be supported by the integration:
Watergate Sonic Wi-Fi
The following devices are not supported by the integration:
Watergate Sonic Pro
The Watergate integration provides the following entities.
Sensors
Water meter volume
Description : Water volume used by this device for the entire lifetime of a Sonic device.
Remarks : It can be used in the Energy Dashboard.
Water flow rate
Description : The current flow rate of water through the device.
Remarks : Useful for monitoring real-time water usage.
Water pressure
Description : The current water pressure in the system.
Remarks : Can be used to detect potential issues in the water supply.
Water temperature
Description : The current temperature of the water.
Remarks : Useful for monitoring and ensuring safe water temperatures.
Valves
Water valve state
Description : The current state of the water valve (open/closed).
Remarks : It is automatically updated when the valve state is changed.
Events
Auto Shut-Off
Description : Event triggered when the valve automatically shuts off due to detected leak.
Event Type : Either volume_threshold or duration_threshold
Event Data :
volume : The volume of water that triggered the shut-off
duration : The duration of leak that triggered the shut-off
Remarks : Historical events are not preserved across Home Assistant restarts.
The Watergate integration fetches data from the Sonic device every 2 minutes.
Thanks to the webhook option, Sonic will provide live telemetry every second when water is flowing directly to Home Assistant.
The integration does not provide the ability to set auto shut-off thresholds.
To add the Watergate device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Watergate .
Follow the instructions on screen to complete the setup.
IP address
The IP address of your Sonic device.
The water meter volume entity can be added to the Energy Dashboard, allowing you to monitor water usage.
Turn off the water when no one is at home.
Turn on the water when someone arrives home.
Send a notification when the water is too hot.
Send a notification when the water is too cold.
Send a notification when water is flowing for too long.
This integration follows standard integration removal procedures. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Watergate device was introduced in Home Assistant 2025.1, and it's used by
24 active installations.
Its IoT class is Local Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@adam-the-hero
Categories
Sensor
Valve
Water management
Back to top
