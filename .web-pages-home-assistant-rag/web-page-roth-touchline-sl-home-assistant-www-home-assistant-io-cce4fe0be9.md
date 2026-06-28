# Roth Touchline SL - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/touchline_sl
- Final URL: https://www.home-assistant.io/integrations/touchline_sl
- Canonical URL: https://www.home-assistant.io/integrations/touchline_sl/
- Fetched at: 2026-06-28T03:23:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Roth Touchline SL within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Entities
Climate
Sensor
The Roth Touchline SL integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables you to control Roth Touchline SL underfloor heating systems.
You must have an account registered with the Roth Touchline SL dashboard .
To add the Roth Touchline SL hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Roth Touchline SL .
Follow the instructions on screen to complete the setup.
The integration will present each Roth Touchline SL zone as a climate entity, which can:
Display the current temperature
Display the current humidity
Display when the zone is being actively heated or cooled.
Set a target temperature
Assign to a configured “Global Schedule” using Home Assistant climate entity presets.
For each zone, the integration exposes the following diagnostic sensor:
Sensor Description Battery Battery level of the wireless thermostat. Wired thermostats will report this sensor as unknown.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Roth Touchline SL hub was introduced in Home Assistant 2024.9, and it's used by
45 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jnsgruk
Categories
Back to top
