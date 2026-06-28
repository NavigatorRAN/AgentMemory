# Sony Songpal - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/songpal
- Final URL: https://www.home-assistant.io/integrations/songpal
- Canonical URL: https://www.home-assistant.io/integrations/songpal/
- Fetched at: 2026-06-28T03:18:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Sony Songpal devices into Home Assistant.

## Extracted Text

On this page
Configuration
Actions
Action: Set sound setting
The Sony Songpal integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Sony’s Songpal (” Audio Control API ”) compatible devices such as soundbars, AV receivers and wireless speakers from Home Assistant.
Even when the API officially supports only a few devices (HT-ST5000, HT-MT500, HT-CT800, SRS-ZR5 and STR-DN1080), it has also been confirmed to work on others. The list of supported devices from Sony’s Songpal website lists devices which are likely to be compatible with this platform.
If the platform works with your non-listed device, or you encounter bugs, please feel free to report them upstream .
A few notes:
The quick start-up mode has to be enabled to turn the device on.
Supports currently only one output terminal, that is, the volume control works only on the first volume controller as reported by the backend library.
Some devices, e.g., HT-XT3, do not support decreasing the volume step-by-step correctly.
Feel free to improve the available actions!
To add the Sony Songpal device to your Home Assistant instance, use this My button:
Sony Songpal can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sony Songpal .
Follow the instructions on screen to complete the setup.
See python-songpal’s documentation how to get your API endpoint.
In addition to the general media player actions , the following actions are provided:
The songpal.set_sound_setting action sets a sound setting. For a list of available settings and their values use the songpal sound command.
Data attribute Optional Description entity_id yes Target entity. To target all songpal devices, use all name no Configuration variable, e.g., nightmode value no New configuration value, e.g., on
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sony Songpal device was introduced in Home Assistant 0.65, and it's used by
3131 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rytilahti
@shenxn
Categories
Media player
Back to top
