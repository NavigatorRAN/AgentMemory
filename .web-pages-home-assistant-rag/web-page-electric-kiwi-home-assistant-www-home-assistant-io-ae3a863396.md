# Electric Kiwi - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/electric_kiwi
- Final URL: https://www.home-assistant.io/integrations/electric_kiwi
- Canonical URL: https://www.home-assistant.io/integrations/electric_kiwi/
- Fetched at: 2026-06-28T02:39:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the Electric Kiwi service in Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Use cases
Example automations
Removing the integration
To remove an integration instance from Home Assistant
Electric Kiwi is an independent power and broadband company in New Zealand, offering variable rates for peak, shoulder, and off-peak pricing with a selectable hour of free power.
This integration uses the official Electric Kiwi API to provide account information, including balances and savings, and to show and select your hour of free power.
To add the Electric Kiwi hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Electric Kiwi .
Follow the instructions on screen to complete the setup.
Note
The configuration uses client_id and client_secret provided to Home Assistant, so all you need to do is install the integration and authenticate using your account credentials.
The integration provides sensor entities with account balances, billing, and hour of free power start and end time. It also provides a select entity to change the hour of free power.
This integration can be used as part of an automation, for example, to turn on/off appliances automatically.
Run the heat pump during the hour of free power
alias : " Turn on expensive heat pump" description : " Turn on the heat pump when the hour of free power starts" triggers : - at : sensor.hour_of_free_power_start trigger : time actions : - action : climate.turn_on target : entity_id : climate.heat_pump data : {}
alias : " Turn off expensive heat pump" description : " Turn off the heat pump when the hour of free power ends" triggers : - at : sensor.hour_of_free_power_end trigger : time actions : - action : climate.turn_off target : entity_id : climate.heat_pump data : {}
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Electric Kiwi hub was introduced in Home Assistant 2023.8, and it's used by
40 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mikey0000
Categories
Energy
Back to top
