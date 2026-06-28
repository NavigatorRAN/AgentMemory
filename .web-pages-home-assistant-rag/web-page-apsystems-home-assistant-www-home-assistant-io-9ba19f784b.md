---
source_url: "https://www.home-assistant.io/integrations/apsystems"
final_url: "https://www.home-assistant.io/integrations/apsystems"
canonical_url: "https://www.home-assistant.io/integrations/apsystems/"
source_handle: "web:www-home-assistant-io:9ba19f784b19"
source_section: "integrations-apsystems"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6371016515818c2c72e6d0c52b6ca115a0d0748d5df982605d2cd15cf8022ab3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# APsystems - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/apsystems
- Final URL: https://www.home-assistant.io/integrations/apsystems
- Canonical URL: https://www.home-assistant.io/integrations/apsystems/
- Fetched at: 2026-06-28T02:28:50Z
- Content type: text/html; charset=UTF-8

## Description

Control and monitor your APsystems EZ1 microinverters locally without the cloud

## Extracted Text

On this page
Sensors
Numerical sensors
Binary sensors
Settings
Flash Endurance
Prerequisites
Configuration
The APsystems integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to read the data from your APsystems EZ1 microinverter. It also allows you to set the output limit to anything above 30 watts.
Sensor ID Unit Description total_power W Total current output of the inverter lifetime_production_p1 kWh Lifetime production of first input lifetime_production_p2 kWh Lifetime production of second input lifetime_production kWh Lifetime production of both inputs combined total_power_p1 W Current input on first input total_power_p2 W Current input on second input today_production kWh Today’s production of both inputs combined today_production_p1 kWh Today’s production of first input today_production_p2 kWh Today’s production of second input
Sensor ID Description off_grid_status On when the inverter is not connected to the power grid dc_1_short_circuit_error_status Short circuit detected on first input dc_2_short_circuit_error_status Short circuit detected on second input output_fault_status Output because of any error deactivated
Setting ID Type Description inverter_status switch Enables or disables the inverter’s output output_limit number Sets the max output of the inverter
There has been a discussion about the inverter’s lifetime being shortened when using the output_limit setting excessively. APsystems officially confirmed this to me while also acknowledging that newer hardware versions don’t have this issue, while older ones should be updated at most every 300 seconds. Newer inverters have a serial number starting with Ex701 and thus aren’t at risk of flash wear when setting the output_limit more frequently than every 300 seconds.
Make sure the local API is activated and set to Continuously . For that, connect to the inverter via Bluetooth using the app and go to Settings > Local Mode , set the switch Enable Local Mode to on, and make sure to set this to Continuously .
Note
If Settings > Local Mode is not visible in the APsystems app, the device is probably still connected to the APsystems cloud.
To make Settings > Local Mode available:
Open the APsystems app on your mobile device.
Sign out of your APsystems cloud account in the app.
If the app specifically asks you to remove the device from the cloud so that you can use it locally, follow the on-screen steps.
After you are signed out, reconnect to the inverter directly via Bluetooth.
When you are connected via Bluetooth only, Settings > Local Mode should be visible in the app.
To add the APsystems device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select APsystems .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The APsystems device was introduced in Home Assistant 2024.6, and it's used by
1227 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mawoka-myblock
@SonnenladenGmbH
Categories
Energy
Back to top
