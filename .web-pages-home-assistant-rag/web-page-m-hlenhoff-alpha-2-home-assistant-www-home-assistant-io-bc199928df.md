# Möhlenhoff Alpha 2 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/moehlenhoff_alpha2
- Final URL: https://www.home-assistant.io/integrations/moehlenhoff_alpha2
- Canonical URL: https://www.home-assistant.io/integrations/moehlenhoff_alpha2/
- Fetched at: 2026-06-28T03:00:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Möhlenhoff Alpha 2 temperature control system into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Climate
Actions
The Möhlenhoff Alpha 2 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Möhlenhoff Alpha 2
temperature control system.
Please make sure the base station is turned on and connected to your local network.
To add the Möhlenhoff Alpha 2 hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Möhlenhoff Alpha 2 .
Follow the instructions on screen to complete the setup.
The climate platform provides current and target temperature information,
HVAC and preset mode.
A climate entity will be created for each area. The name of the entity is
taken from the name of the heat area defined in the Alpha 2 base station.
The state is polled from the base every 60 seconds.
After changing the temperature in Home Assistant,
it may take up to 10 minutes for your room control units to display these
changes.
This integration supports the following actions (see Climate ).
set_temperature
set_hvac_mode
heat for heating mode
cool for cooling mode
set_preset_mode
auto enable schedule based operation
day enable day mode
night enable night mode
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Möhlenhoff Alpha 2 hub was introduced in Home Assistant 2022.3, and it's used by
85 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@j-a-n
Categories
Back to top
