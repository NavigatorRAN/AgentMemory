# easyEnergy - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/easyenergy
- Final URL: https://www.home-assistant.io/integrations/easyenergy
- Canonical URL: https://www.home-assistant.io/integrations/easyenergy/
- Fetched at: 2026-06-28T02:38:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate easyEnergy within Home Assistant.

## Extracted Text

On this page
Configuration
Use cases
Examples
Send a notification when the energy price is low
Start a dishwasher when the energy price is low
Data updates
Known limitations
Sensors
Energy market prices
Gas market price
List of actions
Templates
Prices sensor with response data
All-in price sensor
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The easyEnergy integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates the easyEnergy API platform with Home Assistant.
The integration makes it possible to retrieve the dynamic energy/gas prices
from easyEnergy to gain insight into the price trend of the day and
to adjust your consumption accordingly.
Companies that use the data from easyEnergy:
NieuweStroom
To add the easyEnergy service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select easyEnergy .
Follow the instructions on screen to complete the setup.
With the energy dashboard you can use the current hour price entity to calculate how much the electricity or gas has cost each hour based on the prices from easyEnergy. Or use one of the actions in combination with a template sensor to show the prices for the next 24 hours in a chart on your dashboard.
Use the current hour price sensor to send a notification when the energy price drops below your chosen threshold. In this example, the threshold is 0.15 €/kWh .
automation : - alias : " Notify when the energy price is low" triggers : - trigger : numeric_state entity_id : sensor.easyenergy_today_energy_usage_current_hour_price below : 0.15 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Low energy price" message : " The current energy price is {{ trigger.to_state.state }} €/kWh."
Use the current hour price sensor to start a dishwasher when the energy price drops below your chosen threshold. In this example, the threshold is 0.15 €/kWh .
automation : - alias : " Start dishwasher when energy price is low" triggers : - trigger : numeric_state entity_id : sensor.easyenergy_today_energy_usage_current_hour_price below : 0.15 actions : - action : switch.turn_on target : entity_id : switch.dishwasher
The integration will poll the easyEnergy API every 10 minutes to update the data in Home Assistant.
The prices retrieved via the API are bare prices including VAT, however an energy company also charges other rates such as energy tax and purchase costs . The integration has no configuration option to add these values, but you could create a template sensor for this.
The easyEnergy integration creates several sensor entities for both gas
and electricity prices.
In terms of electricity you get two separate services, easyEnergy uses separate
prices for electricity that you use (buy) or return (sell). Every day around
14:00 UTC time , the new prices are published for the following day.
The current and next hour electricity market price
Average electricity price of the day
Lowest energy price
Highest energy price
Time of day when the price is highest
Time of day when the price is at its lowest
Percentage of the current price compared to the maximum price
Number of hours with the current price higher or lower
Entities with the number of hours indicate how many hours there are with a price
above or below the current hourly price. If we take the graph below as an example
and it is 00:30, then there are 8 hours below the current price and 4 hours above the
current price. With this information, you could switch devices at the X cheapest number
of hours during the day.
Example showing the energy price graph.
For the dynamic gas prices, only entities are created that display the
current and next hour price because the price is always fixed for
24 hours; new prices are published every morning at 05:00 UTC time .
The easyEnergy integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get energy return prices ( easyenergy.get_energy_return_prices )
Requests energy return prices from easyEnergy.
Get energy usage prices ( easyenergy.get_energy_usage_prices )
Requests energy usage prices from easyEnergy.
Get gas prices ( easyenergy.get_gas_prices )
Requests gas prices from easyEnergy.
For an overview of every action across all integrations, see the actions reference .
Create template sensors to display the prices in a chart or to calculate the all-in hour price.
To use the response data from the actions, you can create a template sensor that updates every hour.
template : - triggers : - trigger : time_pattern seconds : " *" actions : - action : easyenergy.get_energy_usage_prices response_variable : prices data : config_entry : 013713c172577bada2874a32dbe44feb incl_vat : true granularity : quarter price_type : all_in sensor : - name : Energy prices device_class : timestamp state : " {{ now() }}" attributes : prices : " {{ prices }}"
To calculate the all-in hour price, you can create a template sensor that calculates the price based on the current price, energy tax, and purchase costs.
template : - sensor : - name : easyEnergy all-in current price unique_id : allin_current_price icon : mdi:cash unit_of_measurement : " €/kWh" state_class : measurement state : > {% set energy_tax = PUT_HERE_THE_PRICE %} {% set purch_costs = PUT_HERE_THE_PRICE %} {% set current_price = states('sensor.easyenergy_today_energy_usage_current_hour_price') | float(0) %} {{ (current_price + energy_tax + purch_costs) | round(2) }}
Prices for tomorrow are unavailable
Symptom: The next-day price entities are unavailable or do not show tomorrow’s prices.
Description: The electricity prices for the next day are usually published around 14:00 UTC time . Gas prices are published every morning around 05:00 UTC time .
Resolution:
Wait until the prices have been published by easyEnergy and then wait for the next integration update. The integration polls the API every 10 minutes.
The prices do not match my energy bill
Symptom: The price shown by Home Assistant is lower than the price charged by the energy company.
Description: The prices retrieved from the easyEnergy API are bare prices including VAT. Energy companies can charge additional costs, such as energy tax and purchase costs.
Create a template sensor that adds these extra costs to the current price. See the all-in price sensor example.
This integration follows standard integration removal steps. If you also use the template sensors, you need to remove them manually.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The easyEnergy service was introduced in Home Assistant 2023.3, and it's used by
301 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@klaasnicolaas
Categories
Energy
Sensor
Back to top
