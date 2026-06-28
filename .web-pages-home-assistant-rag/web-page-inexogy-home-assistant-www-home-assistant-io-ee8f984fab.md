---
source_url: "https://www.home-assistant.io/integrations/discovergy"
final_url: "https://www.home-assistant.io/integrations/discovergy"
canonical_url: "https://www.home-assistant.io/integrations/discovergy/"
source_handle: "web:www-home-assistant-io:ee8f984fab88"
source_section: "integrations-discovergy"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "34719a4c2828d7bf38b0fa72a3b2f4fc40ee6d2bc02c3307ab57117d36512fca"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# inexogy - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/discovergy
- Final URL: https://www.home-assistant.io/integrations/discovergy
- Canonical URL: https://www.home-assistant.io/integrations/discovergy/
- Fetched at: 2026-06-28T02:37:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate inexogy smart meters within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Electricity meter
Gas meter
Provided sensors
Electricity - Main sensors
Electricity - Optional sensors (disabled by default)
Gas
Data update
Use cases and examples
Energy dashboard
Automations
Troubleshooting
No data or stale sensors
Missing sensors
Network issues
Removing the integration
To remove an integration instance from Home Assistant
The inexogy integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows users to integrate their inexogy smart meters into Home Assistant.
The integration is using the official REST API by inexogy.
The integration supports the following meter types within Home Assistant:
For this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you need a inexogy smart meter, a inexogy account and your credentials.
To add the inexogy service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select inexogy .
Follow the instructions on screen to complete the setup.
Email address
Email address to connect Home Assistant to your inexogy account
Password
Password for the account to connect Home Assistant to inexogy
Sensor entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] are being added for current active power usage and the all-time total consumption.
By default, the sensors for phase-specific current active power usage are disabled but can be enabled in the entity settings.
In case you have a bidirectional meter for consumption and production, the all-time total production is added as well.
A Sensor entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is being added for total gas consumption.
Depending on your meter type, different sensors are available:
sensor.electricity_<street>_<number>_total_power : Current power consumption in watts
sensor.electricity_<street>_<number>_total_consumption : Total energy consumption in kWh
sensor.electricity_<street>_<number>_total_production : Total energy production in kWh (bidirectional meters only)
sensor.electricity_<street>_<number>_phase_1_power : Power consumption phase 1 in watts
sensor.electricity_<street>_<number>_phase_2_power : Power consumption phase 2 in watts
sensor.electricity_<street>_<number>_phase_3_power : Power consumption phase 3 in watts
sensor.electricity_<street>_<number>_phase_1_voltage : Voltage phase 1 in volts
sensor.electricity_<street>_<number>_phase_2_voltage : Voltage phase 2 in volts
sensor.electricity_<street>_<number>_phase_3_voltage : Voltage phase 3 in volts
sensor.gas_<street>_<number>_total_gas_consumption : Total gas consumption in cubic meters
The sensors are updated every 30 seconds. This pulls the latest data available from the inexogy API.
Note that this doesn’t mean the meter data itself is new every 30 seconds. The frequency at which your meter sends new data to inexogy depends on your meter model and measurement concept.
The total consumption and production sensors provided by this integration are fully compatible with the Home Assistant Energy Dashboard .
sensor.electricity_example_street_11_total_consumption (total consumption) can be added to the “Grid consumption” field.
sensor.electricity_example_street_11_total_production (total production) can be added to the “Return to grid” field.
You can use the current power sensor ( sensor.electricity_example_street_11_total_power ) to trigger automations based on your electricity usage.
Example: Send a notification when power consumption exceeds 3000 W for 5 minutes.
automation : - alias : High Power Consumption Detected trigger : - platform : numeric_state entity_id : sensor.electricity_example_street_11_total_power above : 3000 for : minutes : 5 actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " High power consumption detected: {{ states('sensor.electricity_example_street_11_total_power') }} W"
Example: Turn off high-power devices when photovoltaic production is insufficient (for bidirectional meters).
automation : - alias : Consumption Control Based on PV Output trigger : - platform : state entity_id : sensor.electricity_example_street_11_total_power condition : - condition : numeric_state entity_id : sensor.electricity_example_street_11_total_power above : 0 # Positive value means grid consumption actions : - action : switch.turn_off target : entity_id : switch.high_power_device
If your sensors are not showing data or values are stale, check the following:
inexogy Portal : Log in to the inexogy web portal and check if it shows current data from your meter. If not, there might be an issue with your meter or connection to inexogy.
Home Assistant Logs : Check the Home Assistant logs for error messages related to the inexogy integration. Authentication errors ( Authentication failed ) mean your email address or password is incorrect.
API Rate Limits : The inexogy API has rate limits. Although the integration is designed to stay within these limits, frequent Home Assistant restarts or other tools using the API might lead to temporary blocks.
Production sensors : The electricity production sensor is only available for bidirectional meters. If you have such a meter but don’t see it, check your data in the inexogy portal.
Phase sensors : Per-phase power and voltage sensors are disabled by default and not available for all meters. You can enable them on the integration page under “Entities”.
If you see connection errors, ensure that Home Assistant has a stable internet connection. The integration needs access to api.inexogy.com over HTTPS (port 443).
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The inexogy service was introduced in Home Assistant 2023.7, and it's used by
656 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jpbede
Categories
Energy
Sensor
Back to top
