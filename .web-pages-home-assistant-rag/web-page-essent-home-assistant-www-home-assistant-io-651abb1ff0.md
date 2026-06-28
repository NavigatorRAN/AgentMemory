# Essent - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/essent
- Final URL: https://www.home-assistant.io/integrations/essent
- Canonical URL: https://www.home-assistant.io/integrations/essent/
- Fetched at: 2026-06-28T02:41:14Z
- Content type: text/html; charset=UTF-8

## Description

Monitor dynamic energy prices from Essent Netherlands

## Extracted Text

On this page
Configuration
Sensors
Electricity
Gas
Data updates
Examples
Smart EV charging
Troubleshooting
Sensors show “Unavailable” or “Unknown”
Prices don’t match my Essent account
Removing the integration
To remove an integration instance from Home Assistant
The Essent integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] monitors dynamic energy prices for Essent customers in the Netherlands with Dynamic Contracts.
Price data is fetched from Essent’s public API and requires no authentication. The integration provides real-time electricity and gas pricing information, updated twice a day.
Note
This is a community integration using Essent’s public API, not officially provided by Essent.
To add the Essent service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Essent .
Follow the instructions on screen to complete the setup.
The integration provides the following sensors:
The following sensors are created for electricity prices:
Current electricity price - Current hourly electricity price per kWh including VAT
Next electricity price - Next hour’s electricity price per kWh (disabled by default)
Average electricity price today - Average of all hourly electricity prices for today
Lowest electricity price today - Minimum electricity price for today (disabled by default)
Highest electricity price today - Maximum electricity price for today (disabled by default)
Current electricity price excl. VAT - Current hourly price excluding VAT (disabled by default)
Current electricity VAT - VAT component of the current price (disabled by default)
Current electricity market price - Spot market component of the current price (disabled by default)
Current electricity purchasing fee - Supplier purchasing fee component (disabled by default)
Current electricity tax - Tax component of the current price (disabled by default)
The following sensors are created for gas prices:
Current gas price - Current daily gas price per m³ including VAT
Next gas price - Next day’s gas price per m³ (disabled by default)
Current gas price excl. VAT - Current daily price excluding VAT (disabled by default)
Current gas VAT - VAT component of the current price (disabled by default)
Current gas market price - Spot market component of the current price (disabled by default)
Current gas purchasing fee - Supplier purchasing fee component (disabled by default)
Current gas tax - Tax component of the current price (disabled by default)
The API is polled every 12 hours to fetch price data. Each call fetches all hourly prices for today and tomorrow (when available). Tomorrow’s prices typically appear after 12:00 CET for electricity and 19:00 CET for gas.
Sensors update on the hour using cached API data, so they advance to the current price without additional API calls between polls.
Charge your electric vehicle when electricity prices are lowest:
alias : Charge EV at lowest price triggers : - trigger : template value_template : >- {{ states('sensor.essent_current_electricity_price') == states('sensor.essent_lowest_electricity_price_today') }} actions : - action : switch.turn_on target : entity_id : switch.ev_charger
If your sensors are showing unavailable or unknown states, check the following:
Network connectivity : Verify that Home Assistant can reach essent.nl
Check your network and firewall settings
Verify internet connectivity
API service status : Essent’s API may be temporarily unavailable
Check Settings → System → Logs for error messages
Wait and check if data returns within an hour
The integration displays base prices from Essent’s public API. Your actual billing may differ due to:
Individual contract adjustments
Additional fees specific to your account
Rounding differences
For billing-accurate prices, refer to your Essent customer portal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Essent service was introduced in Home Assistant 2025.12, and it's used by
94 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jaapp
Categories
Energy
Back to top
