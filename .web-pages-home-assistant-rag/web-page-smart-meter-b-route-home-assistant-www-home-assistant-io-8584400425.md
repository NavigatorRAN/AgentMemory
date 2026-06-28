---
source_url: "https://www.home-assistant.io/integrations/route_b_smart_meter"
final_url: "https://www.home-assistant.io/integrations/route_b_smart_meter"
canonical_url: "https://www.home-assistant.io/integrations/route_b_smart_meter/"
source_handle: "web:www-home-assistant-io:8584400425fb"
source_section: "integrations-route-b-smart-meter"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d8840daee9df2daf447401cea0d27988d095c19ce124262c364076762c35d1cd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Smart Meter B Route - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/route_b_smart_meter
- Final URL: https://www.home-assistant.io/integrations/route_b_smart_meter
- Canonical URL: https://www.home-assistant.io/integrations/route_b_smart_meter/
- Fetched at: 2026-06-28T03:12:59Z
- Content type: text/html; charset=UTF-8

## Description

Integrate your Smart Meter using B Route.

## Extracted Text

On this page
Overview
Prerequisites
Configuration
Signal reach
Obtaining B Route credentials
Retrieving your monthly consumption data
Retrieving your monthly cost data
Removing the integrationIntegrations connect and integrate Home Assistant with your devices, services, and more. [Learn more]
To remove an integration instance from Home Assistant
The Smart Meter B Route integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to access the data of your smart meter using the B Route protocol.
This integration enables you to access and monitor your household energy consumption data from a smart meter using the B Route protocol in Home Assistant. You’ll need a compatible USB dongle and your B Route credentials to set up this integration. It has been tested for the Japanese market and most households are eligible, the installation of a smart meter is free. You can find some information by TEPCO here but other utility companies may have similar pages.
Even if you have a contract with a new power provider, you can still use this service by applying to the regional utility company (for example, TEPCO in Tokyo).
Ensure that your power supply is not a bulk power supply for an apartment building.
Compatible USB dongles (tested with):
Wi-SUN USB dongle from Ratoc Systems .
Wi-SUN Module RL7023 Stick-D/DSS from Tessera Technology Inc. .
Wi-SUN Module RL7023 Stick-D/IPS from Tessera Technology Inc. (Production ended).
B Route credentials from your utility company .
Smart meter:
A smart meter that supports the B Route protocol.
If you are renting but do not have a smart meter equipped, you will need to contact your house management company, as the installation is free but may require permission.
To add the Smart Meter B Route device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Smart Meter B Route .
Follow the instructions on screen to complete the setup.
The Wi-SUN USB dongle has a typical signal reach of approximately 50 meters indoors and up to 200 meters outdoors, depending on environmental factors such as walls, interference, and other obstacles.
Contact your utility company : Reach out to your electricity provider and request your B Route credentials. For example, if you live in Tokyo, contact TEPCO.
Provide necessary information : You may need to provide your smart meter ID, customer ID, or other identifying information.
Receive credentials : Your utility company will provide you with a user ID and password for accessing the B Route data.
Refer to the links below to apply for your B Route credentials:
Hokkaido Electric Power
Tohoku Electric Power
TEPCO
Chubu Electric Power
Hokuriku Electric Power
Kansai Electric Power
Chugoku Electric Power
Shikoku Electric Power
Kyushu Electric Power
Okinawa Electric Power
By default, the data you get is the total consumption since an unknown date in the past. If you want to get your monthly consumption data, you can use the utility_meter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] .
To get your monthly cost data, you can use the template sensor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] along with the utility_meter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] . You will need to know your electricity rate (cost per kWh) to calculate the cost. For instance, if you are using Tokyo Gas and have a price depending on your usage, you can use the following template with a unit of measurement set to your currency per kWh (for example, JPY/kWh) and the appropriate sensor name:
{% set consumption = states('sensor.tokyo_gas_electricity_monthly_consumption') | float(0) %} {% if consumption < 120 %} 29.9 {% elif consumption < 300 %} 35.41 {% else %} 37.47 {% endif %}
Removing the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more]
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] follows standard integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Smart Meter B Route device was introduced in Home Assistant 2025.10, and it's used by
27 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@SeraphicRav
Categories
Energy
Sensor
Back to top
