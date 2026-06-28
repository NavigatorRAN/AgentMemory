# Twinkly - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/twinkly
- Final URL: https://www.home-assistant.io/integrations/twinkly
- Canonical URL: https://www.home-assistant.io/integrations/twinkly/
- Fetched at: 2026-06-28T03:24:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Twinkly LED string to Home Assistant.

## Extracted Text

On this page
Effects
Operation Modes
Configuration
The Twinkly integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Twinkly LED string from Home Assistant.
This integration can be used to:
Turn your Twinklys on and off
Adjust brightness
Control static colors and effects
Switch between operation modes (see explanation below)
Music mode is currently not supported.
For devices with software version > 2.7.1, you can also control the effects on your Twinklys.
The Twinkly devices do not initially have any effects stored locally. Effects must be added from the Twinkly application before they become visible in Home Assistant.
Make sure the latest firmware is installed on your Twinkly devices and add effects by apply -ing them from the Twinkly app.
Modes can be switched using the select entity.
For most use cases, “Color”, “Movie” and “Playlist” modes are the most relevant.
Color Mode
Displays a static color
Controlled through the light entity
Color can be set via RGB/RGBW
Movie Mode
Plays effects previously uploaded through the Twinkly app
Effects must be created and transferred to the device first using the app
Effect selection is done through the light entity
Playlist Mode
Sequential playback of multiple effects
Playlist must be uploaded through the Twinkly app first
Off Mode
Turns off the lighting
Demo Mode
Shows predefined demo effects
Primarily intended for presentation purposes
Limited practical use
Unsupported Modes:
Effect Mode: predefined effects built into the device. Alternatively, you can use Movie Mode
RT (Real-Time): Live control of individual LEDs
Music: Music-controlled light show
To add the Twinkly device to your Home Assistant instance, use this My button:
Twinkly can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Twinkly .
Follow the instructions on screen to complete the setup.
If configured using an IP address, on your router / DHCP, you should assign a static IP to your Twinkly device.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Twinkly device was introduced in Home Assistant 2020.12, and it's used by
1.1% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dr1rrb
@Robbie1221
@Olen
Categories
Light
Back to top
