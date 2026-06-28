# Victron Remote Monitoring - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/victron_remote_monitoring
- Final URL: https://www.home-assistant.io/integrations/victron_remote_monitoring
- Canonical URL: https://www.home-assistant.io/integrations/victron_remote_monitoring/
- Fetched at: 2026-06-28T03:26:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for implementation of Victron Remote Monitoring platform into Home Assistant.

## Extracted Text

On this page
Prerequisites
Forecast requirements
Configuration
Setup notes
Data updates
Sensor entities
Solar production forecast
Consumption forecast
Adding Victron Remote Monitoring to the Energy dashboard
To add Victron Remote Monitoring to the Energy dashboard
Troubleshooting
Can’t set up authentication
No sites listed during setup
Can’t find sensors
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Victron Remote Monitoring (VRM) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] pulls site statistics, solar production and consumption forecasts from Victron Energy ’s VRM portal into Home Assistant. It provides day-ahead, next-hour, and six-day outlooks for both production and consumption. It also includes peak-time predictions. The integration requires at least 30 days of VRM history before forecasts become available.
VRM access token (keep this secret!). Create one in the VRM Portal under Preferences > Integrations > Access tokens or use this link .
Access to your site(s) with the account used to create the token.
VRM installation with a solar system and all consumption routed through inverters or a grid meter.
At least 30 days of data in VRM before forecasts appear.
Important
Your VRM access token grants full access to your VRM portal, including system control and data retrieval. Treat it like a password:
Do not share it.
Rotate it immediately if you suspect compromise.
To add the Victron Remote Monitoring service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Victron Remote Monitoring .
Follow the instructions on screen to complete the setup.
When prompted, paste your VRM access token.
After validation, the integration automatically fetches the list of sites available to that token.
Select your site from the dropdown and finish the setup.
The VRM integration fetches fresh data from the VRM API every 60 minutes.
Estimated energy production — Yesterday
Estimated energy production — Today
Remaining production — Today
Estimated energy production — Tomorrow
Production — Current hour
Production — Next hour
Peak production time — Yesterday
Peak production time — Today
Peak production time — Tomorrow
Estimated energy consumption — Yesterday
Estimated energy consumption — Today
Remaining consumption — Today
Estimated energy consumption — Tomorrow
Consumption — Current hour
Consumption — Next hour
Peak consumption time — Yesterday
Peak consumption time — Today
Peak consumption time — Tomorrow
Solar production forecasts can be added to the built-in Energy dashboard to visualize expected solar production alongside your actual energy data.
You must first add your solar panels to the Energy dashboard.
If you have not already done so, follow the instructions in the Energy dashboard documentation to add your solar panels.
Go to Settings > Dashboards > Energy .
In the Solar panels section, edit your solar panels and enable the Forecast production option.
Select the desired Victron Remote Monitoring installation from the list of available forecast providers.
Select Save .
No additional parameters are required. The integration retrieves the forecast from your VRM data.
Result : The forecast will now appear in your Energy dashboard’s solar production graph.
Symptom: “Invalid authentication” Description
This usually means that the token used is invalid or expired.
Resolution
Verify that you’re logged in with the correct VRM account, then try the following steps:
Log in to the VRM portal and under Preferences > Integrations > Access tokens (or use this link ), remove the current token if present.
Generate a new token by selecting Add on the same page, enter the token name, leave the expiry date empty, and select Create token .
Copy and paste the newly generated token into Home Assistant. Follow the setup instructions.
Symptoms: Empty dropdown, “No sites found for this account” or “Site ID not found. Please check the ID and try again.” Description
The integration could not find any sites or installations associated with your account.
Verify that you’re logged in with the correct VRM account and that you have permission to access the desired sites or installations.
Symptom: Sensors are unavailable or missing Description
The integration cannot retrieve forecast data.
Check the logs and the Settings > Devices & services page for any errors.
Check if you still have permission to access the desired site or installation.
If you reset or just set up the VRM Forecasts, there might be a delay of up to 30 days before data appears.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After deleting the integration, go to the VRM Portal under Preferences > Integrations > Access tokens or use this link to remove the token.
Victron VRM Portal
VRM JSON API v2 documentation
VRM Portal manual
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Victron Remote Monitoring service was introduced in Home Assistant 2025.10, and it's used by
1170 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@AndyTempel
Categories
Energy
Back to top
