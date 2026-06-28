---
source_url: "https://www.home-assistant.io/integrations/loqed"
final_url: "https://www.home-assistant.io/integrations/loqed"
canonical_url: "https://www.home-assistant.io/integrations/loqed/"
source_handle: "web:www-home-assistant-io:1d802433ef75"
source_section: "integrations-loqed"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "788f9c2ff98278bb262422727a401dbe468830eca50c3ffc751140036990a669"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# LOQED Touch Smart Lock - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/loqed
- Final URL: https://www.home-assistant.io/integrations/loqed
- Canonical URL: https://www.home-assistant.io/integrations/loqed/
- Fetched at: 2026-06-28T02:57:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Loqed Touch Smart Lock

## Extracted Text

On this page
Features
Prerequisites
Configuration
Actions
De-installation in Loqed
Integrate your LOQED Touch Smart Lock with Home Assistant. The lock instantly notifies Home Assistant of a lock state change and you can change the lock state yourself.
This integration supports:
Send real-time status changes of the lock (open, unlock, lock)
Change the lock state (open, unlock, lock).
Only if your lock has a fixed knob on the outside of your door, you can use the “open” lock state. If you do not have this (thus you have a handle on the outside of your door that you can push down), this command will behave as if the unlock command is sent.
On the LOQED personal access token website , please follow the following steps:
Generate access token
Log in with your LOQED App email address (you need to be an admin).
Select Create .
Give your personal access token a name (this will not be used further on, but we recommend something like “Home Assistant” to recognize it as used by Home Assistant).
Select Save .
Store the access token somewhere you can easily copy/paste from, as you’ll need them in the next steps (and it will only be shown once). Note: that you can use this token for setting up multiple locks.
To add the LOQED Touch Smart Lock device to your Home Assistant instance, use this My button:
LOQED Touch Smart Lock can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LOQED Touch Smart Lock .
Follow the instructions on screen to complete the setup.
Home Assistant should automatically detect your lock when your Home Assistant runs on the same network as your lock. In that case, you only need to provide the selected API key when configuring the integration.
You can also set up a lock manually when for some reason, it is not automatically detected. In that case, you need to provide both the API Key from the previous step and the name of the Lock, as it is known in the LOQED companion app.
Please see the default lock integration page for the actions available for the lock.
First, remove the integration from Home Assistant. This will remove any configuration made on the lock itself for Home Assistant.
On LOQED personal access token website , please follow the following steps:
Log in with your LOQED App email address (you need to be admin).
Select delete on the Personal Access Token you used when creating this integration.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LOQED Touch Smart Lock device was introduced in Home Assistant 2023.7, and it's used by
658 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mikewoudenberg
Categories
Lock
Back to top
