# Bluesound - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bluesound
- Final URL: https://www.home-assistant.io/integrations/bluesound
- Canonical URL: https://www.home-assistant.io/integrations/bluesound/
- Fetched at: 2026-06-28T02:31:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Bluesound devices into Home Assistant.

## Extracted Text

On this page
Configuration
Buttons
Button button.speaker_name_set_sleep_timer
Button button.speaker_name_clear_sleep_timer
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Bluesound integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Bluesound HiFi wireless speakers and audio integrations from Home Assistant.
To add the Bluesound device to your Home Assistant instance, use this My button:
Bluesound can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Bluesound .
Follow the instructions on screen to complete the setup.
These are the available button entities:
button.speaker_name_set_sleep_timer : Setting a sleep timer.
button.speaker_name_sleep_timer : Clearing the sleep timer.
Replace speaker_name with the name of your speaker.
Sets a timer that will turn off the speaker. For each time you call this it will increase the time by one step. The steps are (in minutes): 15, 30, 45, 60, 90, 0.
If you increase an ongoing timer of for example 13 minutes, it will increase it to 15. If the timer is set to 90, it will remove the time (hence the 0).
Note
This button is disabled by default.
Clear the sleep timer on a speaker, if one is set.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bluesound device was introduced in Home Assistant 0.51, and it's used by
1973 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@thrawnarn
@LouisChrist
Categories
Media player
Back to top
