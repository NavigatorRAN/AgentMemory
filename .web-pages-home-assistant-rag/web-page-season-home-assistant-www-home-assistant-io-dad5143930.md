---
source_url: "https://www.home-assistant.io/integrations/season"
final_url: "https://www.home-assistant.io/integrations/season"
canonical_url: "https://www.home-assistant.io/integrations/season/"
source_handle: "web:www-home-assistant-io:dad5143930f8"
source_section: "integrations-season"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ca8a12aa7254cac62803f3225f6be758b2578d680141b340e89c80b70d63c4d6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Season - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/season
- Final URL: https://www.home-assistant.io/integrations/season
- Canonical URL: https://www.home-assistant.io/integrations/season/
- Fetched at: 2026-06-28T03:14:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add season sensors into Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Sensors
Examples
Running an automation only in a specific season
Triggering an automation when the season changes
Adjusting behavior based on the current season
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Season integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a sensor that reports the current season (spring, summer, autumn, or winter) based on your configured home location.
Use cases for this integration include:
Adjusting your heating or cooling schedule based on the current season.
Changing irrigation duration or frequency throughout the year.
Toggling seasonal automations on and off when the season changes.
Setting different default lighting scenes for summer evenings versus winter evenings.
To add the Season service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Season .
Follow the instructions on screen to complete the setup.
Type of season definition
Choose how seasons are determined.
You can choose between two types:
Astronomical : Seasons are based on the actual solstice and equinox dates, calculated using the position of the Earth relative to the Sun. In the Northern Hemisphere, spring starts around March 20.
Meteorological : Seasons are based on fixed calendar months. In the Northern Hemisphere, spring starts on March 1.
You can set up the integration twice to have both types available at the same time.
For more information on the difference between the two, see Meteorological versus astronomical seasons from NOAA.
Season
Description : The current season.
Device class : Enum.
Possible states : spring , summer , autumn , winter .
The sensor automatically determines your hemisphere from the latitude configured under Settings > System > General :
Northern Hemisphere (latitude above 0): spring, summer, autumn, winter follow the standard Northern Hemisphere dates.
Southern Hemisphere (latitude below 0): seasons are swapped. For example, when it is summer in the Northern Hemisphere, the sensor reports winter.
Equator (latitude exactly 0): the sensor does not report a season because the equator does not experience traditional seasons.
You can use the season sensor as a condition to limit an automation to a specific season. For example, to only run a heating automation during winter:
conditions : - condition : state entity_id : sensor.season state : winter
You can trigger an automation when the season changes, for example, to adjust your thermostat schedule or toggle seasonal automations on and off:
triggers : - trigger : state entity_id : sensor.season
You can use choose to vary what an automation does depending on the season. For example, to set different default temperatures:
actions : - choose : - conditions : - condition : state entity_id : sensor.season state : winter sequence : - action : climate.set_temperature target : entity_id : climate.living_room data : temperature : 21 - conditions : - condition : state entity_id : sensor.season state : summer sequence : - action : climate.set_temperature target : entity_id : climate.living_room data : temperature : 25
The sensor updates its value on a regular polling interval. Because seasons change infrequently, updates are only meaningful around the transition dates.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Season service was introduced in Home Assistant 0.53, and it's used by
2.5% of the active installations.
Its IoT class is Local Polling.
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
