---
source_url: "https://www.home-assistant.io/integrations/knocki"
final_url: "https://www.home-assistant.io/integrations/knocki"
canonical_url: "https://www.home-assistant.io/integrations/knocki/"
source_handle: "web:www-home-assistant-io:beff5d8bb67a"
source_section: "integrations-knocki"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "26ca4f381be96790a83c04eae395da5eaf5ab28c4109f2011a09f0902d90a193"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Knocki - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/knocki
- Final URL: https://www.home-assistant.io/integrations/knocki
- Canonical URL: https://www.home-assistant.io/integrations/knocki/
- Fetched at: 2026-06-28T02:54:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Knocki devices in Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Automation example
The Knocki integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to trigger your favorite automations simply by tapping custom patterns (such as triple taps) on ordinary surfaces.
You must have a Knocki device .
Completed the setup process in the Knocki mobile app, as described in steps 1-7 below.
Open the Knocki Mobile App. It’s a free download on iOS and Android .
Using the app, log-in or create a new Knocki account.
From the app’s home screen, select a Knocki or add a Knocki .
On the app’s device screen, select a gesture or add a gesture .
Next, select the add a task option.
Scroll down the task menu and select Home Assistant.
Follow the in-app instructions to add the Home Assistant task.
To add the Knocki hub to your Home Assistant instance, use this My button:
Knocki can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Knocki .
Follow the instructions on screen to complete the setup.
Go to Settings > Automations & scenes and in the lower right corner, select Create Automation .
Select Create new automation .
Select Add Trigger , select Entity as the trigger type.
Search for the name of the task (as you named it in the Knocki app). Select the entity with that name appended to it.
Select State as the type of entity change.
Select Add action and choose whatever action(s) you’d like the automation to trigger.
Finally, test the action by tapping the associated gesture pattern.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Knocki hub was introduced in Home Assistant 2024.7, and it's used by
52 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
@jgatto1
@JakeBosh
Categories
Event
Back to top
