# Blue Current - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/blue_current
- Final URL: https://www.home-assistant.io/integrations/blue_current
- Canonical URL: https://www.home-assistant.io/integrations/blue_current/
- Fetched at: 2026-06-28T02:31:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Blue Current charge points within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Sensor
Charge point sensors
Grid sensors
Button
Charge point buttons
Actions
Action: Start charge session
Switch
Blue Current is an Dutch company that makes electric car chargers.
The Blue Current integration allows you to connect to your blue current account to Home Assistant and monitor your charge point(s).
Log in to my.bluecurrent.nl .
Click on your username and go to settings.
Enable advanced options.
Click on your username again and go to advanced.
Generate an API token.
To add the Blue Current hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Blue Current .
Follow the instructions on screen to complete the setup.
The Blue Current integration provides the following sensors:
Activity
Average current
Average voltage
Energy usage in kWh
Max usage in Amps
The max amps the charge point can use.
Offline since
Started on
Stopped on
Total cost in EUR
Total power (estimate)
Vehicle status
The following sensors are created as well, but disabled by default:
Current phase 1-3
offline max usage
remaining current
smart charging max usage
Voltage phase 1-3
Grid average current
Grid max current
Grid current phase 1-3
The Blue Current integration provides the following buttons:
Reset
Reboot
Stop charge session
The following actions are provided by the Blue Current integration:
The blue_current.start_charge_session action allows you to start a new charge session. When no charging card ID is provided, no charging card will be used.
Data attribute Optional Description device_id no Charge point device ID charging_card_id yes Charging card ID that will be used to start a charge session.
The Blue Current integration provides the following switches:
Toggle Plug & Charge
Allows you to start a session without having to scan a card.
Toggle linked charging cards only
When enabled, visitors can’t use the charge point. Only linked charging cards are allowed.
Toggle charge point block
Enables or disables a charge point.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Blue Current hub was introduced in Home Assistant 2024.1, and it's used by
35 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gleeuwen
@jtodorova23
Categories
Car
Back to top
