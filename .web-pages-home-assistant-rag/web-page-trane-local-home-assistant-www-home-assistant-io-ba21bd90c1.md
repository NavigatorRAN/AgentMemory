---
source_url: "https://www.home-assistant.io/integrations/trane"
final_url: "https://www.home-assistant.io/integrations/trane"
canonical_url: "https://www.home-assistant.io/integrations/trane/"
source_handle: "web:www-home-assistant-io:ba21bd90c1d0"
source_section: "integrations-trane"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "898ae2bb560ca4227a07bdd41c168c81e367f07583917548eb8106872ee932bc"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Trane Local - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/trane
- Final URL: https://www.home-assistant.io/integrations/trane
- Canonical URL: https://www.home-assistant.io/integrations/trane/
- Fetched at: 2026-06-28T03:23:46Z
- Content type: text/html; charset=UTF-8

## Description

Locally control Trane and American Standard thermostats over the local network.

## Extracted Text

On this page
Prerequisites
Supported devices
Configuration
Supported functionality
Climate
Switches
Data updates
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Trane Local integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to locally control Trane and American Standard thermostats over your local network using a direct mTLS connection. No cloud connection is required.
This is the local counterpart to the Nexia cloud integration. If your thermostat supports local control, this integration provides faster response times and does not depend on internet connectivity.
Before setting up this integration, you must:
Assign a static IP address to your thermostat on your network.
Put the thermostat in pairing mode :
In the UI of your thermostat, go to Menu > Settings > Network > Advanced Setup > Remote Connection > Pair .
Trane XL1050 Smart Thermostat (firmware v5.9 or later)
American Standard Platinum 1050 Smart Thermostat (firmware v5.9 or later)
To add the Trane Local hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Trane Local .
Follow the instructions on screen to complete the setup.
The integration creates a climate entity for each zone on your thermostat. You can control the HVAC mode, target temperature, and fan mode.
HVAC modes
Off : The zone is turned off.
Heat : The zone heats to the target temperature using a manual hold.
Cool : The zone cools to the target temperature using a manual hold.
Heat/Cool : The zone maintains both a heating and cooling setpoint using a manual hold. The thermostat automatically heats or cools to keep the temperature within the range you set.
Auto : The zone follows the programmed schedule on the thermostat.
The difference between Heat/Cool and Auto is that Heat/Cool uses a manual hold with dual setpoints, while Auto follows the thermostat’s built-in schedule.
Fan modes
Auto : The fan runs only when heating or cooling is active.
On : The fan runs continuously.
Circulate : The fan runs periodically to circulate air, even when heating or cooling is not active.
The integration provides a Hold switch for each zone. When enabled, the thermostat maintains its current setpoints indefinitely (permanent hold). When disabled, the thermostat follows its programmed schedule.
The integration maintains a persistent local TCP connection to the thermostat. State changes are pushed from the thermostat to Home Assistant in real time, so there is no polling interval.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Nexia (cloud)
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Trane Local hub was introduced in Home Assistant 2026.3, and it's used by
35 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
Categories
Switch
Back to top
