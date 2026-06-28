---
source_url: "https://www.home-assistant.io/integrations/moon"
final_url: "https://www.home-assistant.io/integrations/moon"
canonical_url: "https://www.home-assistant.io/integrations/moon/"
source_handle: "web:www-home-assistant-io:c8069cd3bb2b"
source_section: "integrations-moon"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1a3393c5dc7e3ae064228d6fc212b1b43e7b215973518cf7a924345c0011fc56"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Moon - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/moon
- Final URL: https://www.home-assistant.io/integrations/moon
- Canonical URL: https://www.home-assistant.io/integrations/moon/
- Fetched at: 2026-06-28T03:01:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the moon sensor into Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Sensor
Data updates
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Moon integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds a sensor to Home Assistant that tells you the current phase of the moon, from new moon to full moon and back again.
It works out the phase on your own system from the current date, so it needs no account, no API key, and no internet connection. Show the moon phase on a dashboard, or use it as a condition in your automations, for example to only run a garden light scene on the night of a full moon.
To add the Moon service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Moon .
Follow the instructions on screen to complete the setup.
There is nothing to set up. The Moon integration has no options, and you can add it only once.
The integration provides a single Phase sensor. It reports the current moon phase as one of eight values:
New moon : The moon sits between the Earth and the Sun and is not visible.
Waxing crescent : A thin sliver of light that grows each night.
First quarter : Half of the moon is lit, and the lit part is growing.
Waxing gibbous : More than half is lit and still growing toward full.
Full moon : The whole face of the moon is lit.
Waning gibbous : More than half is lit, but the lit part is shrinking.
Last quarter : Half of the moon is lit, and the lit part is shrinking.
Waning crescent : A thin sliver of light that shrinks toward the next new moon.
The sensor shows a matching moon icon for each phase, so you can recognize the current phase at a glance.
The more info dialog showing the current moon phase.
The phase is calculated on your own system from the current date, so no data is fetched from the internet. Home Assistant recalculates it as the date advances, so the sensor changes at most once per day.
The phase is based on the date only. The sensor does not report the exact percentage of illumination, moonrise and moonset times, or how the moon looks from your specific location or hemisphere.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Moon service was introduced in Home Assistant 0.38, and it's used by
4.2% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
@frenck
Categories
Environment
Back to top
