---
source_url: "https://www.home-assistant.io/integrations/autarco"
final_url: "https://www.home-assistant.io/integrations/autarco"
canonical_url: "https://www.home-assistant.io/integrations/autarco/"
source_handle: "web:www-home-assistant-io:c20a0839edc7"
source_section: "integrations-autarco"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "302ad75c7268fbd163eed55ec01632a91a258c5bd6c065feb4a7b9f056542cd3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Autarco - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/autarco
- Final URL: https://www.home-assistant.io/integrations/autarco
- Canonical URL: https://www.home-assistant.io/integrations/autarco/
- Fetched at: 2026-06-28T02:30:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Autarco solar system within Home Assistant.

## Extracted Text

On this page
Configuration
Configuration parameters
Data updates
Actions
Supported functionality
Solar
Inverters
Battery
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Autarco integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to gather data from the cloud API of Autarco and use it in Home Assistant.
Autarco is a Dutch company that provides solar panels, inverters and batteries. They have their own cloud platform where you can monitor the performance of your system.
To add the Autarco hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Autarco .
Follow the instructions on screen to complete the setup.
Email
The email address of your Autarco account.
Password
The password of your Autarco account.
The integration will update its information by polling Autarco every
5 minutes. This ensures the data in Home Assistant is up to date.
This integration does not provide additional actions.
The Autarco platform mainly provides sensors that you can use in your energy dashboard .
Gain insight into how much solar energy your site produces.
Power production (W)
Energy production today (kWh)
Energy production this month (kWh)
Energy production total (kWh)
Gain insight into how much energy an inverter produces. The integration will create a device for each inverter linked to your account.
AC output power (W)
AC output energy total (kWh)
If you have a battery connected to your system, you can monitor the battery status and see how much energy it charges or discharges.
Power flow (W) - Positive values indicate charging, negative values indicate discharging
State of charge (%)
Discharged energy today (kWh)
Discharged energy this month (kWh)
Discharged energy total (kWh)
Charged energy today (kWh)
Charged energy this month (kWh)
Charged energy total (kWh)
The integration does not show data about your self-sufficiency or CO2 savings.
There are no commonly known issues with this integration.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Autarco hub was introduced in Home Assistant 2024.8, and it's used by
43 active installations.
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
