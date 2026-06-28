# Amber Electric - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/amberelectric
- Final URL: https://www.home-assistant.io/integrations/amberelectric
- Canonical URL: https://www.home-assistant.io/integrations/amberelectric/
- Fetched at: 2026-06-28T02:27:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Amber Electric live prices within Home Assistant.

## Extracted Text

On this page
Getting an API Key
Configuration
How the integration works
List of actions
Amber is an Australian electricity retailer that provides access to wholesale electricity prices. Customers monitor the wholesale price and shift their energy usage to cheaper, greener times. This saves them money and supports Australia’s shift towards more renewable energy. Customers can also sell their unused electricity for fluctuating prices. This differs from other wholesale providers, where selling prices vary based on grid demand.
Using the Amber Electric integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , customers can go a step further - setting up devices to automatically shift energy usage to cheaper and greener times, based on real-time electricity prices and forecasts
To use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you will need to generate an API key.
Log in to your Amber account
Click Settings
Enable Developer Mode
Click Generate API Key
Give your API Key a memorable name (say, Home Assistant)
Copy the code that is generated. Note: It will disappear after you reload the page, so make sure you make note of it!
To add the Amber Electric service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Amber Electric .
Follow the instructions on screen to complete the setup.
Prices are split up into three channel types:
General - This is the channel that records all your power usage from your lights and appliances
Controlled Load - A special channel that is only activated during off-peak times. Often electric hot water systems are connected to the controlled load channel.
Feed In - A channel that records exported power from solar panels and batteries.
It exposes the following sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] for each channel type:
Price - Your current electricity price in $/kWh
Forecast - The forecasted prices for the next 12 hours
Descriptor - A description of the price. Useful if you want to create an Amber light that matches the app. Possible values: extremely_low , very_low , low , neutral , high , and spike .
There are two additional sensors:
Price Spike - A binary sensor that indicates when the current price is over $3/kWh.
Renewables - The percentage of renewable energy currently in the grid.
The Amber Electric integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get price forecasts ( amberelectric.get_forecasts )
Retrieves price forecasts from Amber Electric for a site and channel.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Amber Electric service was introduced in Home Assistant 2021.10, and it's used by
1265 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@madpilot
Categories
Energy
Sensor
Back to top
