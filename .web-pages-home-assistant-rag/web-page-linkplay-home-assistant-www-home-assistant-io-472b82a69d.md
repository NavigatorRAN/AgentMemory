# LinkPlay - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/linkplay
- Final URL: https://www.home-assistant.io/integrations/linkplay
- Canonical URL: https://www.home-assistant.io/integrations/linkplay/
- Fetched at: 2026-06-28T02:56:51Z
- Content type: text/html; charset=UTF-8

## Description

Connect and control your LinkPlay media players using the LinkPlay integration

## Extracted Text

On this page
Configuration
Features
Media Player
Buttons
List of actions
The LinkPlay integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to control various media players based on the LinkPlay protocol. The integration supports auto-discovery on your local network through Zeroconf .
To add the LinkPlay hub to your Home Assistant instance, use this My button:
LinkPlay can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LinkPlay .
Follow the instructions on screen to complete the setup.
The media player entity offers robust controls and playback features from the media player integration and provides additionally:
Preset playback : Play LinkPlay presets configured on the device using the action linkplay.play_preset .
Multiroom : Combine multiple LinkPlay devices in a multiroom. Use the actions media_player.join and media_player.unjoin .
The button entities provide some additional LinkPlay features available on the device:
Time Sync : Synchronize the device’s internal clock with the current time in Home Assistant.
Restart Device : Reboot the device, allowing for convenient troubleshooting and maintenance.
The LinkPlay integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Play preset ( linkplay.play_preset )
Plays a preset stored on a LinkPlay media player.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LinkPlay hub was introduced in Home Assistant 2024.8, and it's used by
1.3% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Velleman
Categories
Media player
Back to top
