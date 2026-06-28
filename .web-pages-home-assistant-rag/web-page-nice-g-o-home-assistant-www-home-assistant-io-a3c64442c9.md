---
source_url: "https://www.home-assistant.io/integrations/nice_go"
final_url: "https://www.home-assistant.io/integrations/nice_go"
canonical_url: "https://www.home-assistant.io/integrations/nice_go/"
source_handle: "web:www-home-assistant-io:a3c64442c99a"
source_section: "integrations-nice-go"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3b049b250cbfe242f3bfc528d982047874cd397f38d5b7e8b555978853f9a0a6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Nice G.O. - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nice_go
- Final URL: https://www.home-assistant.io/integrations/nice_go
- Canonical URL: https://www.home-assistant.io/integrations/nice_go/
- Fetched at: 2026-06-28T03:03:15Z
- Content type: text/html; charset=UTF-8

## Description

Control Nice G.O. garage doors

## Extracted Text

On this page
Prerequisites
Configuration
Cover
Event
Light
Switch
Removing the integration
To remove an integration instance from Home Assistant
The Nice G.O. integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate with Nice/Linear and Mighty Mule products.
This integration is used for garage doors and gate openers created by these companies.
Device names in Home Assistant are generated based on the names defined in your Nice G.O. mobile app.
Make sure you have a working account with the Nice G.O. app and have your email and password ready.
To add the Nice G.O. hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nice G.O. .
Follow the instructions on screen to complete the setup.
Garage doors linked to your Nice G.O. account will appear as covers.
The barrier obstructed event entity will be triggered whenever the barrier gets obstructed. This could be triggered by anything that results in the closure being unsuccessful. This may include beam block during closure, beam block before closure, and an object in the way.
Lights on your garage door will appear as lights.
A switch for turning vacation mode on and off will be made available for each device. Vacation mode prevents the operation of the door from physical control points such as a wall station, wireless keypad, remote control, or HomeLink. It can still be controlled from Home Assistant.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nice G.O. hub was introduced in Home Assistant 2024.9, and it's used by
81 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@IceBotYT
Categories
Back to top
