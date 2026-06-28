# Suez Water - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/suez_water
- Final URL: https://www.home-assistant.io/integrations/suez_water
- Canonical URL: https://www.home-assistant.io/integrations/suez_water/
- Fetched at: 2026-06-28T03:19:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Suez Water daily data within Home Assistant.

## Extracted Text

On this page
Sensors
Extra attributes
Energy
Statistics details
Configuration
Removing the integration
To remove an integration instance from Home Assistant
The Suez Water integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] fetches your water consumption data from the French water provider Tout Sur Mon Eau website.
The Water usage yesterday sensor shows yesterday’s water consumption data if that data is available.
The Water price sensor shows the current water price in euros per cubic meter (€/m3).
Extra attributes of Water usage yesterday sensor:
Daily consumption for the current month
Daily consumption for the previous month
Monthly consumption for the last 26 months
Highest monthly consumption
Last year total consumption
Current year total consumption
The integration provides statistics containing all available data from Suez.
The data is fetched every 12 hours and is updated once a day by Suez.
You can find the statistics in Settings > Developer tools > Statistics and search for “suez_water”.
Note: Due to Suez’s daily update schedule, data for the current day will not be available, and yesterday’s data may be delayed depending on when you check
At the initial setup, the integration pulls historical daily usage since the counter installation.
Prerequisites
The Energy dashboard must be enabled in your Home Assistant instance. If you haven’t set it up yet, please refer to the Energy dashboard documentation .
In the configuration of the energy dashboard ( Settings > Dashboards > Energy ):
Select Add consumption for Water source .
Select Suez water Consumption followed by your counter ID (e.g., “Suez water Consumption 123456789”) for the consumed water .
Select Suez water Cost followed by your counter ID for the total price
Suez water consumption ( suez_water_water_consumption_statistics_{counter_id} ):
Contains daily water consumption in liters
Provides both state and sum statistics for each day
Suez water cost ( suez_water_water_cost_statistics_{counter_id} ):
Contains daily cost calculations in euros
Important : Historical costs are calculated using the current water price since historical price information is not available. If water prices have changed over time, the calculated historical costs may not match your actual bills.
To add the Suez Water service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Suez Water .
Follow the instructions on screen to complete the setup.
Counter ID
The water counter ID. It should be found automatically during setup. If it was not found, the ID can be found on your Tout Sur Mon Eau user account . You need to be authenticated to access the page above.
Follow these steps to find your counter ID:
Open the browser’s developer tools (usually F12 or right-click > Inspect ).
Open the Network tab in the developer tools.
Navigate to the page or reload it if already open.
In the Network tab, search for https://www.toutsurmoneau.fr/public-api/cel-consumption/meters-list .
Select the request and open the Preview tab.
Expand the content > clientCompteursPro > list > compteursPro > list path.
Look for the id_PDS field - this value is your counter ID.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Suez Water service was introduced in Home Assistant 0.97, and it's used by
221 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ooii
@jb101010-2
Categories
Sensor
Back to top
