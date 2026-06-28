# Quick search - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/tools/quick-search
- Final URL: https://www.home-assistant.io/docs/tools/quick-search
- Canonical URL: https://www.home-assistant.io/docs/tools/quick-search/
- Fetched at: 2026-06-28T02:23:31Z
- Content type: text/html; charset=UTF-8

## Description

Dialog for quickly accessing entities or running commands.

## Extracted Text

On this page
Hotkeys
Entity filter
Device filter
Command palette
Currently-supported commands
My links
Assist
Disabling shortcuts
Tips
Search by “bits and pieces” rather than an exact substring
Filters work against friendly name too
Use the enter key any time to open the top result in the list
Use arrow keys to move around the list
Typing more letters will always add to your filter string
Troubleshooting
Dialog doesn’t launch using hotkeys
A command is missing
Shortcuts interfere with accessibility tools, browser extensions, or are otherwise annoying
The Quick search allows you to find entities and run commands without needing to navigate away from your current view.
It can be launched from anywhere in the frontend using hotkeys . Use ctrl + k on Windows and cmd + k on macOS to open the Quick search.
Use `ctrl` + `k` on Windows and `cmd` + `k` on macOS to open the Quick search for accessing entities and running commands
Type these from anywhere in the application to launch the dialog.
Mode Hotkey Description Quick search ctrl + k (Windows) / cmd + k (macOS) Opens the Quick search dialog. Entity filter e Opens the entity filter in the Quick search. Command palette c Opens the command palette in the Quick search. Device filter d Opens the device filter in the Quick search. Create my link m Opens a new tab to create a my link to the page you are on. Assist a Opens the Home Assistant Assist dialog.
Tip
The application must have focus for the hotkey to register. If the dialog doesn’t launch, try selecting an empty part of the main content area of Home Assistant and type it again.
Hotkey: e
Similar to Settings > Devices & services > Entities , but more lightweight and accessible from anywhere in the frontend.
Press E to filter for entities in the Quick search's entity filter mode
Once launched, start typing your entity ID (or “bits and pieces” of your entity ID ) to get back a filtered list of entities. Selecting an entity (or hitting enter when the desired entity is highlighted) will open the More info dialog for that entity.
This is helpful when, for example, you are in the middle of writing an automation and need some quick insight about an entity but don’t want to navigate away to Developer tools.
Hotkey: d
Similar to Settings > Devices & services > Devices , but accessible from anywhere in the frontend.
Once launched, start typing your device name to get back a filtered list of your devices. Selecting a device (or hitting enter when the desired device is highlighted) will open the selected device detail page.
This is helpful when you need to quickly access a device’s detail page without navigating your way through the menu.
Press D to start a quick search for devices
Hotkey: c
Run various commands from anywhere without having to go to another view.
Run commands in the **Quick search**'s "command palette"
Navigate : All entries in the sidebar and settings
Reload : All currently-supported “Reload {domain}” actions (for example, “Reload Scripts”)
Server : Restart/Stop
Hotkey: m
Create my links from any supported page in the user interface. When invoked on a supported page, it will open a new tab that will allow you to share the link in different formats.
Hotkey: a
Opens the Assist dialog to interact with Home Assistant using your voice or by text. This feature is only available if you have set up a voice assistant.
Learn more about voice assistants .
You can enable or disable all of Home Assistant’s keyboard shortcuts by going to your User Profile and selecting the Keyboard shortcuts toggle button.
Toggle button for enabling/disabling keyboard shortcuts added by Home Assistant.
We know something like “ light.ch ” should match “ light.ch andelier”. Similarly, “ telev ” should match “media_player. telev ision”.
But with Quick search , “ lich ” would also match “ li ght. ch andelier”, and “ plyrtv ” would also match “media_ pl a y e r . t ele v ision”. It checks letter sequences rather than exact substrings.
One nice use case for this is that you can quickly filter out an entire domain of entities with just a couple letters and a period. For example, “ li. ” will match any “ light. *” entities. Continuing with “li.ch” would bring up the chandelier right away.
If “light.hue_ceiling_light” has been named “Chandelier”, you can type either “hue_ceil” or “chand” to find it.
As soon as the item you wanted shows up at the top of your filtered results, just hit “enter” to activate it. No need to arrow down to the item, or select with your mouse.
When in the text field, use the down arrow ↓ to navigate down the item list. Hit enter to activate the currently highlighted row.
When in the item list, use the up arrow ↑ to navigate up the item list, and to get back into the text field.
Say you’ve just used arrow keys to navigate halfway down the list, and want to add more text to your filter. You don’t need to select back into the text field, just start typing new letters and they’ll append to your filter.
There are a few possible reasons why the Quick search dialog won’t launch:
Your user is not an admin.
The application lost focus. Try selecting the main content area of the application and typing the shortcut again.
You have disabled keyboard shortcuts in your User Profile settings.
Shortcut is marked by browser as non-overridable. Firefox does this with some shortcuts, for example. But this shouldn’t be a problem with single-key shortcuts currently used by the Quick search .
Some other application or browser extension is using or overriding the shortcut. Try disabling the extension.
The command list only shows commands that are available to you based on your user settings, and loaded integrations.
For example, if you don’t have automations: in your config, then you won’t see the Reload Automations command.
If a command is missing that you feel is in error, please create an issue on GitHub.
You can disable shortcuts in your User settings.
Please consider submitting an issue explaining why the shortcut was disruptive to you. Keyboard shortcuts are new to Home Assistant, and getting them right is a challenge for any Web application. We rely on user feedback to ensure the experience is minimally disruptive.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Authentication
Tools and helpers
Developer tools
Quick search
check_config
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
