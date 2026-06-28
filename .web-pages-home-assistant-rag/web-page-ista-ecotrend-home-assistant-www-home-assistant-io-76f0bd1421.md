# ista EcoTrend - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ista_ecotrend
- Final URL: https://www.home-assistant.io/integrations/ista_ecotrend
- Canonical URL: https://www.home-assistant.io/integrations/ista_ecotrend/
- Fetched at: 2026-06-28T02:53:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ista EcoTrend with Home Assistant.

## Extracted Text

On this page
About ista SE
How you can use this integration
Prerequisites
For new users
For existing users
Configuration
Sensors
Long-term statistics
Identifying ista EcoTrend statistic entities
Setting up long-term statistics in the energy dashboard
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The ista EcoTrend integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to import your monthly meter readings from the ista EcoTrend service.
ista SE is a company based in Germany that provides metering services for lessors and property owners. Its solutions are designed for rented or self-inhabited multi-party properties, enabling accurate measurement, assignment, and billing of heating and water consumption for renters or individual property owners.
The ista EcoTrend integration allows you to monitor your monthly heating and water usage in Home Assistant’s energy dashboard. View historical usage trends, track monthly consumption, and receive notifications when new data is available. This integration helps you stay informed about your household’s resource usage and make informed decisions about energy efficiency.
If you received an activation code by mail, register at ecotrend.ista.com .
If you did not receive an activation code after moving into a property with ista metering devices, contact your lessor or property manager.
Ensure you have an active ista EcoTrend account to set up the integration.
During the setup process in Home Assistant, enter the email address and password associated with your ista EcoTrend account.
Note
The integration currently supports only the German EcoTrend service.
To add the ista EcoTrend service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ista EcoTrend .
Follow the instructions on screen to complete the setup.
Email
Enter the email address associated with your ista EcoTrend account to connect it to Home Assistant.
Password
Enter the password for your ista EcoTrend account to enable the connection with Home Assistant.
The ista EcoTrend integration exposes the last monthly readings as sensors. It provides the following sensors:
Heating : readings from your heat cost allocators (measured in units)
Heating energy : estimated value in kWh
Heating costs : estimated costs in EUR
Hot water : consumption readings in m³
Hot water energy : estimated value in kWh
Hot water costs : estimated costs in EUR
Water : consumption readings in m³
Water costs : estimated costs in EUR
Not all values may be available in your ista EcoTrend account. Cost estimation is an optional service that has to be booked by your property manager or lessor. Therefore, the cost sensors are deactivated by default.
The ista EcoTrend integration allows you to import all your historical consumption readings from your ista EcoTrend account into long-term statistic entities. These entities can be displayed in your Home Assistant energy dashboard, providing a comprehensive view of your consumption data over time.
The statistic entities imported via this integration have a ista_ecotrend: prefix. This prefix helps you identify and distinguish these entities from other sensor statistics when setting up the long-term statistics in the energy dashboard.
To set up the ista EcoTrend long-term statistics in your Home Assistant energy dashboard, follow these steps:
Access the energy configuration panel
Go to the energy configuration panel of your Home Assistant instance.
Add heating energy usage
Go to Gas consumption .
Select Add gas source .
Choose your Heating energy entity (for example, ista_ecotrend:luxemburger_str_1_heating_energy ).
For cost tracking, select the Use an entity tracking the total costs option.
Select the corresponding Heating costs entity (for example, ista_ecotrend:luxemburger_str_1_heating_cost ).
Add hot water energy usage
To track hot water energy usage and costs (for example, ista_ecotrend:luxemburger_str_1_hot_water_energy and ista_ecotrend:luxemburger_str_1_hot_water_cost ), repeat the above steps for your Hot water energy and Hot water costs entities.
Add hot water consumption
Go to Water consumption .
Select Add water source .
Choose the Hot water entity (for example, ista_ecotrend:luxemburger_str_1_hot_water ).
Select the corresponding Hot water costs entity (for example, ista_ecotrend:luxemburger_str_1_hot_water_cost ).
Add water consumption
To track cold water consumption and costs (for example, ista_ecotrend:luxemburger_str_1_water and ista_ecotrend:luxemburger_str_1_water_cost ), repeat the above steps for your Water and Water costs entities.
The integration checks for new readings every 24 hours.
The integration does not support two-factor authentication. To connect Home Assistant to ista Ecotrend , you must first disable two-factor authentication. To do this, navigate to Menü > Benutzerkonto > Zwei-Stufen-Authentifizierung and remove any registered authentication devices.
Sensor values reflect the meter readings from the previous month, as ista publishes new readings a few days after the end of the billing period. Long-term statistics are adjusted to display these readings as of the last day of the corresponding month.
The ista EcoTrend integration relies on an active internet connection to communicate with ista. If you encounter issues, verify that your network connection is stable. Additionally, the ista EcoTrend service itself may experience downtime, whether unexpected or due to scheduled maintenance.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible, please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ista EcoTrend service was introduced in Home Assistant 2024.7, and it's used by
218 active installations.
Its IoT class is Cloud Polling.
🥇 Gold quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tr4nt0r
Categories
Energy
Back to top
