---
source_url: "https://www.home-assistant.io/integrations/launch_library"
final_url: "https://www.home-assistant.io/integrations/launch_library"
canonical_url: "https://www.home-assistant.io/integrations/launch_library/"
source_handle: "web:www-home-assistant-io:cedc1be7aebf"
source_section: "integrations-launch-library"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "62bc50b901fa03189450779c1f3b09f3e3e47d50f42077bf5042a9de08a01b6e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Launch Library - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/launch_library
- Final URL: https://www.home-assistant.io/integrations/launch_library
- Canonical URL: https://www.home-assistant.io/integrations/launch_library/
- Fetched at: 2026-06-28T02:55:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate space launch information within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Launch Library integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides information about upcoming spaceflight, including the next planned rocket launch, the next SpaceX Starship launch, and the next SpaceX Starship event.
You can use it to keep an eye on the next launch from a dashboard, get a notification when a launch is about to happen, or announce upcoming launches through your media players.
The data comes from the Launch Library 2 API by The Space Devs.
There are no prerequisites. The integration uses a public data source, so you do not need an account or API key.
To add the Launch Library service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Launch Library .
Follow the instructions on screen to complete the setup.
You can only add this integration once. It provides information about the next launch worldwide, not for a specific location or provider.
The integration creates the following sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] entities:
Next launch : The name of the next upcoming rocket launch. Additional attributes show the launch provider, the launch pad, the facility, and the provider’s country code.
Launch time : The scheduled date and time of the next launch. Additional attributes show the start and end of the launch window.
Launch probability : The estimated probability of the launch happening, as a percentage. This is unavailable when the provider does not share a probability.
Launch status : The current status of the next launch, such as whether it is confirmed, on hold, or in flight. An additional attribute shows the hold reason when there is one.
Launch mission : The name of the mission for the next launch. Additional attributes show the mission type, the target orbit, and a description of the mission.
Next Starship launch : The scheduled date and time of the next SpaceX Starship launch. Additional attributes show the mission title, status, target orbit, and a description.
Next Starship event : The scheduled date and time of the next SpaceX Starship event. Additional attributes show the event title, location, a link to the stream, and a description.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Launch Library 2 API once an hour for the latest information.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Launch Library service was introduced in Home Assistant 0.83, and it's used by
387 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ludeeus
@DurgNomis-drol
Categories
Sensor
Back to top
