---
source_url: "https://www.home-assistant.io/integrations/pvpc_hourly_pricing"
final_url: "https://www.home-assistant.io/integrations/pvpc_hourly_pricing"
canonical_url: "https://www.home-assistant.io/integrations/pvpc_hourly_pricing/"
source_handle: "web:www-home-assistant-io:261bd996802b"
source_section: "integrations-pvpc-hourly-pricing"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f39120b9f2366cf8b605f5668a8d69ad1fa668a90dc36c664df2f73df4afb1c1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Spain electricity hourly pricing (PVPC) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pvpc_hourly_pricing
- Final URL: https://www.home-assistant.io/integrations/pvpc_hourly_pricing
- Canonical URL: https://www.home-assistant.io/integrations/pvpc_hourly_pricing/
- Fetched at: 2026-06-28T03:10:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the PVPC Hourly Pricing sensor in Home Assistant.

## Extracted Text

On this page
Configuration
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the official API to get the hourly price of electricity in Spain from https://www.esios.ree.es/en/pvpc .
Specifically, it shows the current active energy invoicing price (FEU) in €/kWh, which is the energy term hourly price applied in the consumers’ electrical bill with a contracted power not exceeding 15 kW and which are under the PVPC (Voluntary Price for Small Consumer).
It includes the energy term of the access tolls, the charges and the production cost. It does not include taxes. The hourly prices and energy periods are the same throughout the Spanish territory regardless of the time zone, except for the cities of Ceuta and Melilla, where they are slightly different.
More information available at https://www.cnmc.es/en/ and https://www.omie.es/en/
To configure PVPC Hourly Pricing, set it up via the integrations panel in the configuration screen.
During setup, select one of the two available tariffs, according to your geographic position in Spain:
2.0TD , for the Peninsula, the Balearic Islands and the Canary Islands.
2.0TD (Ceuta/Melilla) , for the cities of Ceuta and Melilla.
Set also your contracted power (in kW) for the two power periods that apply with the new 2.0TD tariff
(one for P1/P2 and the other one for the valley period, P3), to show your available electric power as a sensor attribute.
In case you did nothing after the tariff change on 2021-06-01, both powers are equal, and the same you had for your existing contract.
To access extra price sensors from ESIOS API, like the price for the excess energy from self-consumption , or the electricity price in the open market (useful if your provider indexes its price with it),
you must request a personal token by mailing to [email protected] .
Then, enable the API Token option for this integration.
You can set up the integration 2 times; one for each geographic zone. To do this, add them again through the integrations panel under Settings > Devices & services .
You can change the configuration anytime in the integration options.
Note
The sensor provides an hourly price for energy consumed, but the variable cost of energy is only one of the factors that add up to the electricity bill:
Fixed cost of contracted power
Fixed cost of energy consumed
Variable cost of energy consumed (the sensor’s value)
Other fixed expenses, such as the rental of the electric meter
Multiple taxes applied
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Spain electricity hourly pricing (PVPC) service was introduced in Home Assistant 0.108, and it's used by
1124 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@azogue
@chiro79
Categories
Energy
Back to top
