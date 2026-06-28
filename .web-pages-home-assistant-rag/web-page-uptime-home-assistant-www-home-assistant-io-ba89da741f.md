---
source_url: "https://www.home-assistant.io/integrations/uptime"
final_url: "https://www.home-assistant.io/integrations/uptime"
canonical_url: "https://www.home-assistant.io/integrations/uptime/"
source_handle: "web:www-home-assistant-io:ba89da741f48"
source_section: "integrations-uptime"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "933d432d4a8157b81bb80a28167d1e055268e72863464c528c3e40c1e8808220"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Uptime - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/uptime
- Final URL: https://www.home-assistant.io/integrations/uptime
- Canonical URL: https://www.home-assistant.io/integrations/uptime/
- Fetched at: 2026-06-28T03:25:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an uptime sensor into Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Sensors
Examples
Skipping automations right after a restart
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Uptime integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a sensor that stores the date and time when Home Assistant was last started. This is useful for automations that should behave differently right after a restart, for example, to avoid triggering actions while devices are still coming online.
To add the Uptime service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Uptime .
Follow the instructions on screen to complete the setup.
Uptime
Description : The date and time when Home Assistant was last started.
Device class : Timestamp. The state is a UTC datetime.
The sensor value is set once at startup and does not change until Home Assistant is restarted again.
You can use the uptime sensor in a condition to prevent an automation from running within the first few minutes after Home Assistant starts. This avoids false triggers while devices and integrations are still initializing.
conditions : - condition : template value_template : > {{ now() - as_datetime(states('sensor.uptime')) > timedelta(minutes=5) }}
This condition passes only when Home Assistant has been running for more than 5 minutes.
The sensor value is set once when Home Assistant starts and is not polled or updated after that.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Uptime service was introduced in Home Assistant 0.56, and it's used by
4% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Sensor
Utility
Back to top
