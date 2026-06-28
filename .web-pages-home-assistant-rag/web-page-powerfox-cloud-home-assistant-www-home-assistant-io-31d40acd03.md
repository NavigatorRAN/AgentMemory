---
source_url: "https://www.home-assistant.io/integrations/powerfox"
final_url: "https://www.home-assistant.io/integrations/powerfox"
canonical_url: "https://www.home-assistant.io/integrations/powerfox/"
source_handle: "web:www-home-assistant-io:31d40acd0335"
source_section: "integrations-powerfox"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6fd61334d6ce4d129272a3bcfd8c3691e2d717e1254cfffea260ec9b1a1a1806"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Powerfox Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/powerfox
- Final URL: https://www.home-assistant.io/integrations/powerfox
- Canonical URL: https://www.home-assistant.io/integrations/powerfox/
- Fetched at: 2026-06-28T03:08:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Powerfox Cloud within Home Assistant.

## Extracted Text

On this page
Configuration
Configuration parameters
Poweropti devices
Data updates
Actions
Examples
Get alerted when power usage spikes
Supported functionality
Power meter
Water meter
Heat meter
Powerfox FLOW gas meter
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Powerfox Cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to gather data from your Poweropti devices, by using their cloud API and fetching the data in Home Assistant.
Powerfox is a German company that provides smart meters (Poweropti) for reading electricity, water, gas, and heat. They have their own cloud platform where you can monitor the usage of your devices and get insights into your energy consumption.
The Powerfox FLOW device delivers its measurements via a daily/hourly report endpoint, while other devices provide real-time data.
Note
If you have a PA 201901 , PA 201902 , or PB 202001 (poweropti+) and prefer to poll your device locally without relying on the cloud, see the Powerfox Local integration.
To add the Powerfox Cloud hub to your Home Assistant instance, use this My button:
Powerfox Cloud can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Powerfox Cloud .
Follow the instructions on screen to complete the setup.
Email
The email address of your Powerfox account.
Password
The password of your Powerfox account.
Not all Poweropti devices are supported currently. Check the list below to see if your device is working with this integration. Create a feature request if your device is not supported yet.
Device Type Supported PA 201901 / PA 201902 Power meter Yes PB 202001 Power meter Yes WA 201902 Water meter Yes Powerfox FLOW Gas meter Yes (report) HA 201902 Heat meter Yes
The integration polls the Powerfox cloud every 10 seconds. Power, heat, and water meters return real-time snapshots. The Powerfox FLOW relies on the hourly/daily report endpoint. The coordinator still polls every 10 seconds, but the values refresh whenever Powerfox publishes a new block in the report.
This integration does not provide additional actions.
Use this automation to keep an eye on sudden peaks in your electricity usage. When the Powerfox sensor reports more than 4 kW for two minutes, Home Assistant sends a notification so you can react quickly (for example by switching off large loads).
Example YAML automation
```yaml
alias: "Powerfox high usage alert"
description: "Notify me when the Powerfox meter reports sustained high power draw."
triggers:
- trigger: numeric_state
entity_id: sensor.poweropti_power
above: 4000
for:
minutes: 2
actions:
- action: notify.send_message
target:
entity_id: notify.my_device
data:
title: "High consumption detected"
message: "Powerfox currently reports {{ states('sensor.poweropti_power') }} W."
```
Replace the threshold value, and the notify target with the entities that exist in your installation.
The Powerfox platform mainly provides sensors that you can use in your energy dashboard .
It will create the following sensors:
Power (W) : Active power that is measured.
Energy usage (kWh) : How much energy is used since the installation.
Energy usage - low tariff (kWh) : Energy usage on the low tariff.
Energy usage - high tariff (kWh) : Energy usage on the high tariff.
Energy returned (kWh) : Energy returned to the grid.
The energy tariff sensors are only available if your Poweropti device supports it.
Cold water (m³) : How much cold water is used.
Warm water (m³) : How much warm water is used.
Total energy (kWh) : How much energy is used.
Delta energy (kWh) : How much energy is used since the last update.
Total volume (m³) : How much water is used.
Delta volume (m³) : How much water is used since the last update.
FLOW data is exposed via the Powerfox report endpoint and provides daily/hourly aggregates. The integration creates:
Gas consumption today (m³) : How much gas is consumed today.
Gas consumption energy today (kWh) : How much gas energy is consumed today.
Current gas consumption (m³) : Current gas consumption rate.
Current gas consumption energy (kWh) : Current gas consumption energy rate.
Gas cost today (€) : Total gas cost today (requires tariff in the Powerfox app).
Minimum consumption today (m³) : Lowest hourly consumption observed so far today.
Maximum consumption today (m³) : Highest hourly consumption observed so far today.
Average consumption today (m³) : Average hourly consumption observed so far today.
Minimum consumption energy today (kWh) : Lowest hourly energy consumption observed so far today.
Maximum consumption energy today (kWh) : Highest hourly energy consumption observed so far today.
Average consumption energy today (kWh) : Average hourly energy consumption observed so far today.
Maximum gas cost today (€) : Highest hourly gas cost observed so far today.
The energy-based variants are disabled by default in the entity registry. Enable them if you have a gas-to-kWh conversion configured in Powerfox.
Cost sensors stay at zero
Powerfox only publishes currency fields when a tariffs are configured in their app. Set the tariff inside the Powerfox app, then wait for the next report; the Home Assistant sensors will populate once the API exposes those fields.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Powerfox Cloud hub was introduced in Home Assistant 2025.1, and it's used by
1225 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
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
