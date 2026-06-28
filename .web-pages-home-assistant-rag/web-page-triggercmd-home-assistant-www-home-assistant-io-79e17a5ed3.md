---
source_url: "https://www.home-assistant.io/integrations/triggercmd"
final_url: "https://www.home-assistant.io/integrations/triggercmd"
canonical_url: "https://www.home-assistant.io/integrations/triggercmd/"
source_handle: "web:www-home-assistant-io:79e17a5ed376"
source_section: "integrations-triggercmd"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "55af056eca58d10e467284fd1a8bc53ec1b8b783fc0a40722afda5c64f7c6418"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# TRIGGERcmd - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/triggercmd
- Final URL: https://www.home-assistant.io/integrations/triggercmd
- Canonical URL: https://www.home-assistant.io/integrations/triggercmd/
- Fetched at: 2026-06-28T03:23:59Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate TRIGGERcmd with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Using TRIGGERcmd with Home Assistant
The TRIGGERcmd integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to run commands on computers via TRIGGERcmd with Home Assistant.
To use TRIGGERcmd, you need the following:
A TRIGGERcmd account
A computer with the TRIGGERcmd agent running on it
For instructions on installing and using TRIGGERcmd itself, refer to the TRIGGERcmd Quick Start Guide .
After adding the TRIGGERcmd integration, you will be prompted for your user token . This can be found at the bottom of your TRIGGERcmd profile page or the instructions page.
To add the TRIGGERcmd hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select TRIGGERcmd .
Follow the instructions on screen to complete the setup.
All of your TRIGGERcmd commands should show up as switch devices. You can change the rooms of your devices, or select Finish to leave them without rooms.
Using the switch will trigger the respective command. If you have Allow parameters enabled, your command will run with an “on” or “off” parameter, depending on whether you flip the switch in Home Assistant on or off.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The TRIGGERcmd hub was introduced in Home Assistant 2024.10, and it's used by
110 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rvmey
Categories
Automation
Switch
Back to top
