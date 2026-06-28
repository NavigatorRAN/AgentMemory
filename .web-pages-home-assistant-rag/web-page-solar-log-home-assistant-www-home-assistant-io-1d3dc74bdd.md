---
source_url: "https://www.home-assistant.io/integrations/solarlog"
final_url: "https://www.home-assistant.io/integrations/solarlog"
canonical_url: "https://www.home-assistant.io/integrations/solarlog/"
source_handle: "web:www-home-assistant-io:1d3dc74bdd5a"
source_section: "integrations-solarlog"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c0c3443a821b30c502df568c9a3e35a5f47a5967aaed72e34edd89c1126e6335"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Solar-Log - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/solarlog
- Final URL: https://www.home-assistant.io/integrations/solarlog
- Canonical URL: https://www.home-assistant.io/integrations/solarlog/
- Fetched at: 2026-06-28T03:17:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Solar-Log sensors within Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Configuration options
Supported functionality
Sensors
Additional data
Additional template sensor
Data updates
Actions
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Solar-Log integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the open JSON interface on Solar-Log PV monitoring systems to get details from your Solar-Log device and integrate these into your Home Assistant installation. With the integration you may monitor the solar power production and power consumption as tracked with your Solar-Log device.
The integration should work with all Solar-Log devices with firmware 3.x .
Before you can use the integration, you either need the password of the Solar-Log user or you must activate the open JSON interface on your Solar-Log device.
To activate the JSON interface on your Solar-Log device, on the device, go to the Configuration | System | Access control menu.
When activating the interface, a red warning triangle with security information and risks is displayed. For security reasons, it is recommended to activate password protection and use the integration with the respective password.
The solarlog integration uses the default host address “ http://solar-log ” if you don’t specify a host. If your device isn’t accessible on this address, use its IP Address instead.
Important
If password protection for the general user is deactivated, the open JSON interface is activated by default. For security reasons, it is recommended to activate the user’s password.
The open JSON interface only exposes a limited amount of data. Even if the open JSON interface has been activated, without the user’s password, only limited data is available in the integration see available sensors . For full functionality , you either need the user’s password or the user password should be deactivated (not recommended).
To add the Solar-Log hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Solar-Log .
Follow the instructions on screen to complete the setup.
To set up the integration you need the following information:
Name
The name for your Solar-Log device in Home Assistant. This will also be uses as prefix for the entity names.
Host
The URL or IP address of your Solar-Log.
User password available
Check the box, if you have the password for the Solar-Log user to securely access all data .
Password
Password for the Solar-Log user. Will only be asked for in a second step, if in the first step the checkbox has been selected.
The integration has no additional configuration options.
The following sensors are available via the open JSON interface:
name Unit Description last_update Time of latest data update. power_ac W Total output PAC from all of the inverters and meters in inverter mode. power_dc W Total output PAC from all of the inverters. voltage_ac V Average voltage AC from the inverter. voltage_dc V Average voltage DC from the inverter yield_day kWh Total yield for the day from all of the inverters yield_yesterday kWh Total yield for the previous day from all of the inverters. yield_month kWh Total yield for the month from all of the inverters. yield_year kWh Total yield for the year from all of the inverters. yield_total kWh Total yield from all of the inverters. consumption_ac kWh Current total consumption AC from all of the consumption meters. consumption_day kWh Total consumption for the day from all of the consumption meters. consumption_yesterday kWh Total consumption for the previous day from all of the consumption meters. consumption_month kWh Total consumption for the month from all of the consumption meters. consumption_year kWh Total consumption for the year from all of the consumption meters. consumption_total kWh Accumulated total consumption from all consumption meters. installed_peak_power W Installed solar peak power. alternator_loss W Altenator loss (equals to power_dc - power_ac) capacity % Capacity (equals to power_dc / total power) efficiency % Efficiency (equals to power_ac / power_dc) power_available W Available power (equals to power_ac - consumption_ac) usage % Usage (equals to consumption_ac / power_ac)
Note
The solarlog integration is using the solarlog_cli pypi package to get the data from your Solar-Log device. The last five sensors are not reported by your Solar-Log device directly, but are computed by the library.
The additional data is only accessible if the user’s password is available (or password protection is deactivated). Obviously, deactivating password protection is a security risk and should only be done in specific circumstances. In any event, you do this at your own risk.
The following additional sensor becomes available:
Name Unit Description charge_level % Current charge level of battery.* charging_power W Current power charging battery.* discharging_power W Current power discharging battery.* self_consumption_year kWh Annual self-consumed solar power.
*Only available, if battery connected to solarlog.
In addition, information from devices connected to the Solar-Log device becomes available. The following additional sensors become available (all values are per inverter/device):
Name Unit Description current_power W Current power provided/used by the device. consumption_year kWh Total energy provided/used by the device.
In case you would like to get additional calculated sensors such as the amount of excess solar power available or the energy returned to the grid, you can use the template platform .
# Example configuration.yaml entry for sensor template platform template : - sensor : - name : " Solarlog return to grid" state : " {{ states('sensor.solarlog_consumption_year') | float(0) - states('sensor.self_consumption_year') | float(0) }}"
The integration fetches data from the device every minute.
The integration provides no additional actions.
The integration only provides the (limited) data exposed by means of the JSON interface. This also entails that the values for the self-consumption are rounded to full kWh.
Firmware versions below 3.x are not supported, as they do not expose the JSON interface. Please contact the Solar-Log support if you need assistance with updating the firmware of your Solar-Log device.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Solar-Log hub was introduced in Home Assistant 0.101, and it's used by
405 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Ernst79
@dontinelli
Categories
Energy
Sensor
Back to top
