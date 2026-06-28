---
source_url: "https://www.home-assistant.io/integrations/sky_remote"
final_url: "https://www.home-assistant.io/integrations/sky_remote"
canonical_url: "https://www.home-assistant.io/integrations/sky_remote/"
source_handle: "web:www-home-assistant-io:cc0a92ca3b7a"
source_section: "integrations-sky-remote"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9befcaea18a18b1bc182f0c9da1e0289f256d1d793dbb7d87932f76f6b1f5d34"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Sky Remote Control - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sky_remote
- Final URL: https://www.home-assistant.io/integrations/sky_remote
- Canonical URL: https://www.home-assistant.io/integrations/sky_remote/
- Fetched at: 2026-06-28T03:16:27Z
- Content type: text/html; charset=UTF-8

## Description

The Sky Remote integration allows you to control a Sky box with Home Assistant.

## Extracted Text

On this page
Supported models
Configuration
Remote
Action: Send command
Available Commands
Related topics
The Sky Remote Control integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control a Sky box using Home Assistant.
This integration is intended to control Sky+ HD and Sky Q satellite receiver boxes with a LAN port. It will not control Sky stream pucks.
To add the Sky Remote Control device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sky Remote Control .
Follow the instructions on screen to complete the setup.
host
Hostname or IP address of your Sky device (e.g., 192.168.1.250). This can typically be found in your Sky box network settings or router’s DHCP client list.
The Sky Remote platform will create a Remote entity for the device. This entity allows you to send commands via the remote.send_command action.
The remote.send_command action sends a single command or a set of commands to one Sky box.
Data attribute Optional Description entity_id no Entity ID to target. command no A single command or a list of commands to send.
A typical action for sending several commands looks like this:
action : remote.send_command target : entity_id : remote.192_168_1_250 data : command : - sky - tvguide
The following commands are supported:
Power & Navigation
power - Turns Sky box on or off
up , down , left , right - Navigate menus and guides
select - Confirm selection
backup - Return to previous screen or step in navigation.
Menu Access
sky - Exits menus and returns to live TV
tvguide - Open the TV guide
boxoffice - Access Sky Box Office
services - Access Sky services
interactive - Access interactive features
Channel Controls
channelup - Moves to next channel or to next page in menus
channeldown - Moves to previous channel or to previous page in menus
Information and Help
i - Displays information about the current program
text - Access text services when on live TV
help - Access subtitles or audio description when in live TV
Color Coded Shortcut Buttons
red , green , yellow , blue - Perform specific actions or open options within the user interface. The functions of these buttons vary depending on the menu or app currently in use.
Numeric Keypad
0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 - Number keys used for channel or PIN input
Playback Controls
play - Starts or resumes playback.
pause - Pauses playback.
stop - Stops playback entirely.
record - Starts recording the current program or selected content.
fastforward - Speeds up playback to skip ahead.
rewind - Rewinds playback to go back.
SkyQ Only
sidebar - Opens the SkyQ sidebar
dismiss - Dismiss interactive content
search - Opens SkyQ search interface
home - Launches SkyQ homepage
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sky Remote Control device was introduced in Home Assistant 2024.12, and it's used by
671 active installations.
Its IoT class is Assumed State.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dunnmj
@saty9
Categories
Back to top
