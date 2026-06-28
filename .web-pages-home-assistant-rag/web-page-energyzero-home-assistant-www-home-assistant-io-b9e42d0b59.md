---
source_url: "https://www.home-assistant.io/integrations/energyzero"
final_url: "https://www.home-assistant.io/integrations/energyzero"
canonical_url: "https://www.home-assistant.io/integrations/energyzero/"
source_handle: "web:www-home-assistant-io:b9e42d0b59d0"
source_section: "integrations-energyzero"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1cc9fdf1c2e8d8111f817e4bbf9fedd539dbac07fe3f27d752bd8c2f83c3067b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# EnergyZero - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/energyzero
- Final URL: https://www.home-assistant.io/integrations/energyzero
- Canonical URL: https://www.home-assistant.io/integrations/energyzero/
- Fetched at: 2026-06-28T02:40:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate EnergyZero within Home Assistant.

## Extracted Text

On this page
Configuration
Use cases
Data updates
Known limitations
Sensors
Energy market price
Gas market price
List of actions
Templates
Prices sensor with response data
All-in price sensor
Removing the integration
To remove an integration instance from Home Assistant
The EnergyZero integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates the EnergyZero API platform with Home Assistant.
The integration makes it possible to retrieve the dynamic energy/gas prices
from EnergyZero to gain insight into the price trend of the day and
to adjust your consumption accordingly.
Partners who are a reseller from EnergyZero:
ANWB Energie
Energie van Ons
GroeneStroomLokaal
Mijndomein Energie
SamSam
ZonderGas
To add the EnergyZero service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select EnergyZero .
Follow the instructions on screen to complete the setup.
With the energy dashboard you can use the current hour price entity to calculate how much the electricity or gas has cost each hour based on the prices from EnergyZero. Or use one of the actions in combination with a template sensor to show the prices for the next 24 hours in a chart on your dashboard.
The integration will poll the EnergyZero API every 10 minutes to update the data in Home Assistant.
The prices retrieved via the API are bare prices including VAT, however an energy company also charges other rates such as energy tax and purchase costs . The integration has no configuration option to add these values, but you could create a template sensor for this.
The EnergyZero integration creates several sensor entities for both gas and electricity prices.
Every day around 14:00 UTC time , the new prices are published for the following day.
The current and next hour electricity market price
Average electricity price of the day
Lowest energy price
Highest energy price
Time of day when the price is highest
Time of day when the price is at its lowest
Percentage of the current price compared to the maximum price
For the dynamic gas prices, only entities are created that display the
current and next hour price because the price is always fixed for
24 hours; new prices are published every morning at 05:00 UTC time .
The EnergyZero integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get energy prices ( energyzero.get_energy_prices )
Requests energy prices from EnergyZero.
Get gas prices ( energyzero.get_gas_prices )
Requests gas prices from EnergyZero.
For an overview of every action across all integrations, see the actions reference .
Create template sensors to display the prices in a chart or to calculate the all-in hour price.
To use the response data from the actions, you can create a template sensor that updates every hour.
template : - trigger : - trigger : time_pattern hours : " *" action : - action : energyzero.get_energy_prices response_variable : prices data : config_entry : 1b4a46c6cba0677bbfb5a8c53e8618b0 incl_vat : true sensor : - name : Energy prices device_class : timestamp state : " {{ now() }}" attributes : prices : ' {{ prices }}'
To calculate the all-in hour price, you can create a template sensor that calculates the price based on the current price, energy tax, and purchase costs.
template : - sensor : - name : EnergyZero all-in current price unique_id : allin_current_price icon : mdi:cash unit_of_measurement : " €/kWh" state_class : measurement state : > {% set energy_tax = PUT_HERE_THE_PRICE %} {% set purch_costs = PUT_HERE_THE_PRICE %} {% set current_price = states('sensor.energyzero_today_energy_current_hour_price') | float(0) %} {{ (current_price + energy_tax + purch_costs) | round(2) }}
This integration follows standard integration removal steps. If you also use the template sensors, you need to remove them manually.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EnergyZero service was introduced in Home Assistant 2023.2, and it's used by
1940 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@klaasnicolaas
Categories
Energy
Back to top
