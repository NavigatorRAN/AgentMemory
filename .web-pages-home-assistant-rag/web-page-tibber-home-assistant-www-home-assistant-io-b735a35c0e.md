---
source_url: "https://www.home-assistant.io/integrations/tibber"
final_url: "https://www.home-assistant.io/integrations/tibber"
canonical_url: "https://www.home-assistant.io/integrations/tibber/"
source_handle: "web:www-home-assistant-io:b735a35c0e42"
source_section: "integrations-tibber"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f5122218f35518f608c042c7b891194fc5dd752b51683717aad407199ec7ce34"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Tibber - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tibber
- Final URL: https://www.home-assistant.io/integrations/tibber
- Canonical URL: https://www.home-assistant.io/integrations/tibber/
- Fetched at: 2026-06-28T03:22:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Tibber within Home Assistant.

## Extracted Text

On this page
Setup
Client ID and client secret (Tibber Data API)
Configuration
Notifications
Send message
Sensor
Available sensors
Binary sensor
Available binary sensors
Charger sensors
EV sensors
Heaters
Actions
Action: Get prices
Examples
Electricity price
The Tibber integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a sensor with the current electricity price if you are a Tibber customer.
If you have a Tibber Pulse or Watty it will also show the electricity consumption in real-time. You get a sensor for monthly consumption, monthly cost, and monthly peak hour. If you do have a real-time meter it is updated once every hour, otherwise it is updated once per day. Statistics with hourly consumption and cost data is generated that can be used in the Energy Dashboard (the ids are tibber:energy_consumption_HOMEID and tibber:energy_totalcost_HOMEID ). If you produce energy there are also statistics with hourly production and profit data generated which can also be used there (the ids are tibber:energy_production_HOMEID and tibber:energy_profit_HOMEID ).
There is currently support for the following device types within Home Assistant:
Go to developer.tibber.com/settings/accesstoken to get your API token.
Go to the Tibber developer portal at https://data-api.tibber.com/clients/manage .
Create a new client.
Add a redirect URI for Home Assistant:
https://my.home-assistant.io/redirect/oauth
Save the application.
Copy the client ID and client secret .
Go to Settings > Devices & services > Application credentials , add Tibber credentials, and paste your client ID and client secret.
To add the Tibber hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tibber .
Follow the instructions on screen to complete the setup.
Tibber can send a notification by calling the notify.send_message action . It will send a notification to all devices registered in the Tibber account.
To use notifications, please see the getting started with automation page .
actions : - action : notify.send_message data : entity_id : notify.tibber title : " Your title" message : " This is a message for you!"
The tibber sensor provides the current electricity price if you are a Tibber customer.
You also get sensors for monthly consumption, monthly cost, and monthly peak hour
If you have a Tibber Pulse it will also show the electricity consumption in real time.
Accumulated cost since midnight (requires active Tibber power deal)
kWh consumed since midnight
net kWh produced since midnight
net kWh produced since last hour shift
Current on L1, L2 and L3
Estimate of kWh consumption current hour
kWh consumed since last hour shift
Average consumption since midnight (Watt)
Last meter active import register state (kWh)
Last meter active export register state (kWh)
Peak consumption since midnight (Watt)
Min consumption since midnight (Watt)
Consumption at the moment (Watt)
Net production (A-) at the moment (Watt)
The total price (energy + taxes)
Device signal strength (Pulse - dB; Watty - percent)
Voltage on phase 1, 2 and 3
Monthly cost
Monthly net consumption
Monthly peak hour
Time of max hour consumption
Storage state of charge
Storage target state of charge
Remaining range
Maximum charging current
Offline fallback charging current
The Tibber integration provides binary sensors.
Charging: Indicates whether the charger is currently charging a vehicle
Plug: Indicates whether a vehicle is plugged into the charger
Charging: Indicates whether the EV is currently charging
Plug: Indicates whether the EV is plugged in
Power: Indicates whether the smart plug or thermostat is powered on
The hourly prices are exposed using actions . The actions populate response data with price data.
The tibber.get_prices action fetches hourly energy prices.
Data attribute Optional Description Example start yes Start time to get prices. Defaults to today 00:00:00 2024-01-01 00:00:00 end yes End time to get prices. Defaults to tomorrow 00:00:00 2024-01-01 00:00:00 Response data
The response data is a dictionary with the energy prices for each Home. start_time is returned in local time from the API.
{ "prices" : { "Nickname_Home" :[ { "start_time" : "2023-12-09 03:00:00+02:00" , "price" : 0.46914 , }, { "start_time" : "2023-12-09 04:00:00+02:00" , "price" : 0.46914 , } ], "Nickname_Home_2" :[ { "start_time" : "2023-12-09 03:00:00+02:00" , "price" : 0.46914 , }, { "start_time" : "2023-12-09 04:00:00+02:00" , "price" : 0.46914 , } ] } }
In this section, you will find some real-life examples of how to use this sensor.
The electricity price can be used to make automations. The sensor has a max_price and min_price attribute, with max and min price for the current day. Here is an example to get a notification when the price is above 90% of the maximum price for the day:
- alias : " Electricity price" triggers : - trigger : time_pattern # Matches every hour at 1 minutes past whole minutes : 1 conditions : - condition : template value_template : ' {{ float(states('sensor.electricity_price_hamretunet_10')) > 0.9 * float(state_attr('sensor.electricity_price_hamretunet_10', 'max_price')) }}' actions : - action : notify.pushbullet data : title : " Electricity price" target : " device/daniel_telefon_cat" message : " The electricity price is now {{ states('sensor.electricity_price_hamretunet_10') }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tibber hub was introduced in Home Assistant 0.8, and it's used by
2% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@danielhiversen
Categories
Energy
Back to top
