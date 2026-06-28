# Stookwijzer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/stookwijzer
- Final URL: https://www.home-assistant.io/integrations/stookwijzer
- Canonical URL: https://www.home-assistant.io/integrations/stookwijzer/
- Fetched at: 2026-06-28T03:19:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Stookwijzer data within Home Assistant

## Extracted Text

On this page
Configuration
List of actions
Examples
The Stookwijzer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] queries the Atlas Leefomgeving Stookwijzer API for windspeed and air quality index. Based on these values, Stookwijzer advises people not to burn pallets or wood or use barbecues. This can help prevent health issues for people in the area.
The state can provide three different levels of recommendations:
Code Yellow : Please note: burning wood causes discomfort and air pollution.
Code Orange : It is recommended not to burn wood now.
Code Red : Do not burn wood now.
Additionally, various sensor entities are provided:
Windspeed : Sensor containing the current windspeed at the selected location.
Air Quality Index : Sensor containing the air quality index at the selected location.
To add the Stookwijzer service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Stookwijzer .
Follow the instructions on screen to complete the setup.
The Stookwijzer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get forecast ( stookwijzer.get_forecast )
Retrieves the advice forecast from Stookwijzer.
For an overview of every action across all integrations, see the actions reference .
Example template sensor using get_forecast
Example template sensors containing the Stookwijzer forecast for 6 and 12 hours from now.
template : - trigger : - trigger : time_pattern hours : /1 action : - action : stookwijzer.get_forecast data : config_entry_id : 1b4a46c6d0f3406c80d275f5b0c6483b response_variable : advice_forecast sensor : - name : Stookwijzer forecast 6 hours unique_id : stookwijzer_forecast_6_hours state : " {{ advice_forecast['forecast'][0]['advice'] }}" attributes : final : " {{ advice_forecast['forecast'][0]['final'] }}" timestamp : " {{ advice_forecast['forecast'][0]['datetime'] }}" - name : Stookwijzer forecast 12 hours unique_id : stookwijzer_forecast_12_hours state : " {{ advice_forecast['forecast'][1]['advice'] }}" attributes : final : " {{ advice_forecast['forecast'][1]['final'] }}" timestamp : " {{ advice_forecast['forecast'][1]['datetime'] }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Stookwijzer service was introduced in Home Assistant 2023.2, and it's used by
797 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fwestenberg
Categories
Environment
Sensor
Back to top
