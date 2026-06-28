# GIOŚ - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/gios
- Final URL: https://www.home-assistant.io/integrations/gios
- Canonical URL: https://www.home-assistant.io/integrations/gios/
- Fetched at: 2026-06-28T02:46:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate GIOŚ (Polish Chief Inspectorate Of Environmental Protection) air quality service into Home Assistant.

## Extracted Text

On this page
Use cases
Configuration
Supported functionality
Available sensors
Data updates
Examples
Notify when the PM10 level is too high
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The GIOŚ integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the GIOŚ web service as a source for air quality data for your location.
Monitor outdoor air quality.
Warn to close windows when air quality is poor.
Control ventilation systems based on air quality.
To add the GIOŚ service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select GIOŚ .
Follow the instructions on screen to complete the setup.
Measuring station
Select a measuring station from the list.
Below is a complete overview of the entities this integration provides.
The integration provides the following sensors:
Air quality index
Benzene
Carbon monoxide
Nitrogen dioxide
Nitrogen dioxide index
Nitrogen monoxide
Nitrogen oxides
Ozone
Ozone index
PM10
PM10 index
PM2.5
PM2.5 index
Sulphur dioxide
Sulphur dioxide index
By default, the integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the API every 30 minutes.
The following examples show how to use the integration in Home Assistant automations. These examples are just a starting point, and you can use them as inspiration to create your own automations.
The following example sends a notification to your mobile device when the PM10 level exceeds 100 µg/m³.
automation : - alias : " Notify when PM10 level is too high" triggers : - trigger : numeric_state entity_id : sensor.czerniawa_pm10 above : 100 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " High PM10 Level Alert" message : > The PM10 level is too high at {{ states('sensor.czerniawa_pm10') }} µg/m³. Avoid going outside.
The availability of sensors depends on the selected measurement station. Not all stations provide data for all pollutants or indices.
The data provider may publish new measurements less frequently than every 30 minutes, so consecutive polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] can return unchanged data.
Before reporting an issue, enable debug logging and restart the integration. As soon as the issue re-occurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible , download the diagnostics The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker. [Learn more] data. If you have collected the debug log and the diagnostics data, include them in the issue report.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GIOŚ service was introduced in Home Assistant 0.104, and it's used by
385 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bieniu
Categories
Health
Back to top
