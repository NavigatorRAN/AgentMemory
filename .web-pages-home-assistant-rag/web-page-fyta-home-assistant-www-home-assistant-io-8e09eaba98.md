# FYTA - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fyta
- Final URL: https://www.home-assistant.io/integrations/fyta
- Canonical URL: https://www.home-assistant.io/integrations/fyta/
- Fetched at: 2026-06-28T02:44:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate FYTA sensors within Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Binary sensors
Image
Sensors
Data updates
Actions
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The FYTA integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the open API of FYTA to obtain the data from your plant sensors and integrate these into Home Assistant.
The integration should work with any FYTA Beam .
For the integration to work you need a FYTA Beam and a FYTA account.
To add the FYTA hub to your Home Assistant instance, use this My button:
FYTA can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select FYTA .
Follow the instructions on screen to complete the setup.
To set up the integration you need the following information:
Email
The email address used to access the FYTA account.
Password
The password used to access the FYTA account.
The integration has no additional configuration options.
The following binary sensors are currently available per plant:
Low battery
Light notification
Nutrition notification
Temperature notification
Water notification
Productive plant
Repotted
Sensor update available
An image entity for both the generic plant image and the user image is added. You may use those for your dashboard.
The following sensors are currently available per plant:
name Unit Description scientific_name Scientific name of the plant plant_status FYTA-Status (cf. scale below) temperature_status FYTA-Status (cf. scale below) light_status FYTA-Status (cf. scale below) moisture_status FYTA-Status (cf. scale below) nutrients_status FYTA-Status (cf. scale below) salinity_status FYTA-Status (cf. scale below) temperature °C Temperature measured by sensor light μmol/h Light measured by sensor (hourly photosynthetically active radiation PAR) moisture % Moisture measured by sensor salinity mS/cm Salinity measured by sensor (measured as conductivity) fertilise_last date Date when plant has last been fertilized fertilise_next date Date when plant should be fertilized battery_level % Battery level of the sensor
The plant status may have one of the following states:
Plant deleted
Plant good status
Plant bad status
Plant no sensor
For plant measurements, the following status scale is applied:
No Data
Too Low
Low
Perfect
High
Too High
For the measurement sensors (light, moisture, salinity, and temperature), the maximal/minimal values that define the ranges of what is considered acceptable and good for the plant are saved as an extra attribute of the sensor. For example: Below 10 it’s too cold, that could be the minimum acceptable. 15 could be the minimum of the good range. Between 15 and 30 is perfect. 30 would be maximum good and 35 would be the maximum acceptable. Above 35 it’s too hot. These values can be used for automations or visualizations on the dashboard.
The integration fetches data from the device every 4 minutes.
The integration provides no additional actions.
The integration provides the data exposed by means of the plant API. The light measurement as current daily light integral (DLI) is not yet available (currently only the PAR value is provided).
To be able to access your plant data over the API, you need a FYTA hub that uploads the data from the Beam sensor to the FYTA server. Alternatively, the mobile app can serve as a gateway to upload the data from the Beam to the server. No direct connection to the FYTA Beam is supported (as the Beam only provides raw data, that needs to be processed on the FYTA server).
For this integration the general process to remove integrations applies:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FYTA hub was introduced in Home Assistant 2024.4, and it's used by
345 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dontinelli
Categories
Binary sensor
Sensor
Back to top
