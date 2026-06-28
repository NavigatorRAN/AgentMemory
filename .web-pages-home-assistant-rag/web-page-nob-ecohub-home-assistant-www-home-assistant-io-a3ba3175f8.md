---
source_url: "https://www.home-assistant.io/integrations/nobo_hub"
final_url: "https://www.home-assistant.io/integrations/nobo_hub"
canonical_url: "https://www.home-assistant.io/integrations/nobo_hub/"
source_handle: "web:www-home-assistant-io:a3ba3175f887"
source_section: "integrations-nobo-hub"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9cf6c0fc97d1788242b2606d6f61d8007227f89a6751e4be1ea103ac70510993"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Nobø Ecohub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nobo_hub
- Final URL: https://www.home-assistant.io/integrations/nobo_hub
- Canonical URL: https://www.home-assistant.io/integrations/nobo_hub/
- Fetched at: 2026-06-28T03:03:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Nobø Ecohub into Home Assistant.

## Extracted Text

On this page
Configuration
Operation modes
Preset override duration
Week profiles
No preset “Off”
Global override
Integrates Nobø Ecohub
into Home Assistant. This integration is not officially supported or endorsed by Glen Dimplex Nordic AS,
and the authors/maintainers are not official partners of Glen Dimplex Nordic AS.
To configure the integration, you need the 3 last digits of the serial number of your hub. The serial number is located
on the back of the hub. If the hub is on a different network than Home Assistant (such as IoT VLAN or another routable network from Home Assistant), you also need to provide the IP address of the hub.
To add the Nobø Ecohub hub to your Home Assistant instance, use this My button:
Nobø Ecohub can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nobø Ecohub .
Follow the instructions on screen to complete the setup.
Heaters
Each zone containing floor or wall mounted heaters is represented as an HVAC entity. Adding and removing zones
and heaters must be done using the Nobø Energy mobile app.
Currently, you can see and change operation and preset for zones and set eco/comfort temperatures if you have
a thermostat that supports remote control of the temperature settings.
The possible operation modes are as follows:
“Auto” - In this mode, the zone is in the default setting and preset shows which state the zone is in right now
(according to calendar setup).
“Heat” - In this mode the zone is overridden and in the state selected by the preset (“Away”, “Eco”
or “Comfort”).
This can be utilized the following ways:
Changing preset to “Away”, “Eco”, or “Comfort” will automatically change operation mode to “Heat”.
Changing preset to none will automatically change operation to “Auto” and update preset.
Changing operation to “Auto” will automatically update preset.
Changing operation to “Heat” will set preset to “Comfort”.
By default, all overrides (when operation is not in “Auto” mode) are constant. It is possible to change this
to let overrides end when the week profile changes next (same as duration “Now” in the Nobø Energy mobile app)
in the integration configuration.
The week profiles are retrieved from the hub. It is possible to change the current week profile for a zone
using a selector. Week profiles must be created and edited using the Nobø Energy mobile app.
Nobø heaters do not support preset “Off”. This is not a limitation of the integration, but a safety mechanism in the
Nobø system (perhaps related to frozen pipes due to frost in Nordic regions).
“Away” temperature is fixed to 7°C and cannot be altered. On/off receivers will be off when the zone is in “Away” status.
To turn heaters completely off, follow these steps (this is a workaround solution):
In the Nobø Energy mobile app, create a week profile.
In this profile, set all days to state off.
To turn a zone off, select this week profile for the zone.
To turn a zone on again, switch to the normal week profile for the zone.
For more information, see the Nobø Ecohub manual .
To override all zones to a given preset (except the zones configured to not respect global override), use the global
override selector. Global override duration respects the same configuration as preset override duration.
Nobø Switch
Each Nobø Switch (SW4) is represented as a temperature sensor. If a switch is linked to a zone, the temperature is
also available as the current temperature of the HVAC entity.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nobø Ecohub hub was introduced in Home Assistant 2022.10, and it's used by
125 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@echoromeo
@oyvindwe
Categories
Climate
Back to top
