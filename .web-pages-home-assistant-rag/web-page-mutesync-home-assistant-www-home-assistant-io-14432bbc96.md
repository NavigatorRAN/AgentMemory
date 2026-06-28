# mutesync - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mutesync
- Final URL: https://www.home-assistant.io/integrations/mutesync
- Canonical URL: https://www.home-assistant.io/integrations/mutesync/
- Fetched at: 2026-06-28T03:01:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the mütesync button with Home Assistant.

## Extracted Text

On this page
Configuration
Important
The mutesync desktop app that this integration depends on was discontinued on 16 November 2024 . mütesync has since been acquired by MuteMe, and MuteSync devices are now supported through the MuteMe software, which does not expose a compatible API.
Because of this, new setups of this integration are no longer possible. Existing installations that rely on the mütesync desktop app may continue to work for a while, but will stop working once you migrate to the MuteMe software.
The mutesync integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant connects to the mütesync virtual button . The mütesync tray app pairs with popular video conferencing tools such as Zoom, Google Meet, Discord, and Teams.
With this integration, Home Assistant can track when you’re in a meeting and whether your microphone is muted.
There is currently support for the following platforms within Home Assistant:
Binary sensor: microphone muted/unmuted and meeting live/not-live
To add the mutesync service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select mutesync .
Follow the instructions on screen to complete the setup.
When setting up the integration, the UI will ask for the Host . This is the hostname or IP address of the machine you run mütesync on, most likely your desktop computer.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The mutesync service was introduced in Home Assistant 2021.5, and it's used by
19 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@currentoor
Categories
Presence detection
Back to top
