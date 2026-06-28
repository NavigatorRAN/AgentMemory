# Nord Pool - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nordpool
- Final URL: https://www.home-assistant.io/integrations/nordpool
- Canonical URL: https://www.home-assistant.io/integrations/nordpool/
- Fetched at: 2026-06-28T03:03:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate with the Nord Pool Energy market prices.

## Extracted Text

On this page
Configuration
Data fetching and limitations
Troubleshooting
Sensors
Main sensors
Peak & off-peak sensors
Diagnostic sensors
List of actions
Examples
UI Template
YAML Template
Tomorrow’s lowest price
Energy Dashboard
Remove the integration
To remove an integration instance from Home Assistant
The Nord Pool integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates Nord Pool Group energy prices into Home Assistant.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the public market prices displayed on the Nord Pool Auction page .
Most European energy is traded via the Nord Pool Group marketplace. If your energy provider doesn’t have a dedicated Home Assistant integration and you have a spot-price-based contract, you can use the Nord Pool integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] . This integration provides spot prices for your selected market, which you can, as an example, use in a template A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] to calculate prices for your energy dashboard .
Important
The energy market is transitioning to 15-minute MTU instead of 60-minute MTU.
When this finally occurs, the Nord Pool integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will automatically switch and use the 15-minute MTU . This means during the transition, you may have a current price which is hourly based and a future price that is a 15-minute price.
If you use this integration to calculate your own energy cost, it is advisable to see how this affects you. Check if any automations, templates, or other settings might need to be modified accordingly.
You can read more and monitor the timeline on the page about the transition to 15-minute MTU by Nordpool
To add the Nord Pool service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nord Pool .
Follow the instructions on screen to complete the setup.
Areas
Select one or multiple market areas to create sensors for.
Currency
Currency to display prices in. EUR is the base currency in Nord Pool prices.
Tip
Only a single integration entry is supported. To modify the settings, you can use the reconfigure option from the integration entry.
EUR is the base currency for market prices. If you choose another currency, you can find the conversion rate in the Exchange rate sensor.
All prices are displayed as [Currency]/kWh .
Data is polled from the Nord Pool API on an hourly basis, exactly on the hour, to ensure the price sensors are displaying the correct price.
If polling cannot happen because of no connectivity or a malfunctioning API, it will wait a retry a few times before failing.
The user can use the homeassistant.update_entity action to manually try again later, in the case the user has solved the connectivity issue.
This service is reliant on an internet connection and that the Nord Pool API is available. Here are the things you can try before raising an issue:
Check that internet is available from your Home Assistant instance.
Check that the Nord Pool API is available by clicking here . You should get a JSON back with the title Unauthorized .
Use curl in a terminal on your Home Assistant instance using the same URL as previously opened in the browser. curl https://dataportal-api.nordpoolgroup.com/api/DayAheadPrices
The integration will create entities showing today’s energy prices for the configured market area. Only the base energy price is shown. VAT and other additional costs are not included.
Sensor Type Description Current price [Currency]/kWh The current (hourly) energy price. Previous price [Currency]/kWh The price of the previous hour. Next price [Currency]/kWh The price of the next hour. Daily average [Currency]/kWh The average of today’s energy prices. Lowest price [Currency]/kWh Today’s lowest price (start and end time are provided in state attributes) Highest price [Currency]/kWh Today’s highest price (start and end time are provided in state attributes)
Additional sensors are provided for peak and off-peak blocks.
Peak refers to the price of the period from 8am to 8pm.
Off-peak 1 refers to the price of the time period from midnight to 8am.
Off-peak 2 refers to the average price of the time period from 8pm to midnight.
Sensor Type Description [peak/off-peak] highest price [Currency]/kWh The hightest hourly price during the given timeframe. [peak/off-peak] lowest price [Currency]/kWh The lowest hourly price during the given timeframe. [peak/off-peak] average [Currency]/kWh The average price of the given timeframe. [peak/off-peak] time from Datetime The start date/time of the given timeframe. [peak/off-peak] time until Datetime The end date/time of the given timeframe.
The block price sensors are not enabled by default.
Sensor Type Description Currency [Currency] The configured currency. Exchange rate Decimal The exchange rate between the configure currency and Euro’s. Last updated Datetime The time when the market prices were last updated. Tomorrow price available Binary True or False if tomorrow’s price is available
The Nord Pool integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get price indices for date ( nordpool.get_price_indices_for_date )
Retrieves the price indices for a specific date.
Get prices for date ( nordpool.get_prices_for_date )
Retrieves the prices for a specific date.
For an overview of every action across all integrations, see the actions reference .
A template sensor to add VAT and fixed cost is useful to get the actual energy cost in the energy dashboard.
Create a helper using the UI.
Go to Settings > Devices & services and at the top, choose the Helpers tab.
In the bottom right corner, select Create helper .
Select Template and Template a sensor .
Enter the fields as shown below.
The template below takes the current price attributes, adds 0.1293 EUR as fixed costs and adds 21% VAT.
A template sensor to add VAT and a fixed cost from an helper entity input_number.add_fixed_cost .
template : - sensor : - name : " Nordpool" unit_of_measurement : " EUR/kWh" state_class : measurement state : > # create a variable with the current price {% set cost = states('sensor.nord_pool_nl_current_price') | float(0) %} # create a variable with the additional fixed cost {% set add_cost = states('input_number.add_fixed_cost') | float(0) %} # Add cost and additional fixed cost. Add VAT (25%) by multiplying with 1.25 and round to 2 digits: {{ ((cost + add_cost) * 1.25) | round(2, default=0) }}
Using a trigger template, you can create a template sensor to calculate tomorrow’s lowest price which also puts the list of all prices in the attributes of the sensor. All prices are returned in [Currency]/MWh.
Note
Below example will convert the action call response to kWh prices in the selected currency and add all prices for tomorrow as a list in an attribute.
You can get your config_entry by using actions within the developer tools : use one of the Nord Pool actions and view the YAML.
template : - trigger : - trigger : time_pattern minutes : /10 - trigger : homeassistant event : start action : - action : nordpool.get_prices_for_date data : config_entry : 01JEDAR1YEHJ6DZ376MP24MRDG date : " {{ now().date() + timedelta(days=1) }}" areas : SE3 currency : SEK response_variable : tomorrow_price sensor : - name : Tomorrow lowest price unique_id : se3_tomorrow_low_price state : > {% set data = namespace(prices=[]) %} {% for state in tomorrow_price['SE3'] %} {% set data.prices = data.prices + [(state.price / 1000)] %} {% endfor %} {{min(data.prices)}} attributes : data : > {% set data = namespace(prices=[]) %} {% for state in tomorrow_price['SE3'] %} {% set data.prices = data.prices + [{'start':state.start, 'end':state.end, 'price': state.price/1000}] %} {% endfor %} {{data.prices}}
To use the Nordpool integration in the Energy dashboard, when configuring grid consumption and production, use the Use an entity with current price option.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nord Pool service was introduced in Home Assistant 2024.12, and it's used by
4288 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Energy
Finance
Sensor
Back to top
