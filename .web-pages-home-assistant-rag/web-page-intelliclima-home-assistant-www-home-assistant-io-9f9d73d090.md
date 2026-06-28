---
source_url: "https://www.home-assistant.io/integrations/intelliclima"
final_url: "https://www.home-assistant.io/integrations/intelliclima"
canonical_url: "https://www.home-assistant.io/integrations/intelliclima/"
source_handle: "web:www-home-assistant-io:9f9d73d09059"
source_section: "integrations-intelliclima"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7161eb80efcb982fafd7360c4cc49f734db4e31f19f16ef8f7322e97f60392e2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# IntelliClima - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/intelliclima
- Final URL: https://www.home-assistant.io/integrations/intelliclima
- Canonical URL: https://www.home-assistant.io/integrations/intelliclima/
- Fetched at: 2026-06-28T02:52:38Z
- Content type: text/html; charset=UTF-8

## Description

Integration for Fantini Cosmi IntelliClima Ecocomfort 2.0 VMC devices.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Fan
Select
Sensors
Data updates
Examples
Automatic ventilation based on air quality
Time-based ventilation schedule
Known limitations
Troubleshooting
Enabling debugging
Device appears offline or not responding
Integration fails to authenticate
No devices found after authentication
Slow response times or delayed updates
Removing the integration
To remove an integration instance from Home Assistant
Support and contributions
Related links
The IntelliClima integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate with Fantini Cosmi Ecocomfort 2.0 ventilation devices. The Ecocomfort 2.0 is a mechanical ventilation with heat recovery (MVHR) system that monitors indoor air quality and automates ventilation to maintain healthy indoor environments. With this integration, you can control fan modes and speeds, and automate ventilation based on air quality and schedules.
The following devices are known to be supported by the integration:
Ecocomfort 2.0 with firmware 0.6.8
Before setting up this integration, you must complete the following steps in the IntelliClima+ mobile app:
Install the IntelliClima+ app on your smartphone (iOS or Android).
Create an account or sign in to your existing account.
Add your Ecocomfort 2.0 device to the app via Bluetooth.
Complete the device setup and configuration in the app (such as network connection or device name).
Verify that the device appears as Online in the IntelliClima+ app.
Once your device is set up and responding in the IntelliClima+ app, you can add the integration to Home Assistant.
To add the IntelliClima device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IntelliClima .
Follow the instructions on screen to complete the setup.
Username
The username associated with your IntelliClima+ account.
Password
The password for your IntelliClima+ account.
The IntelliClima integration provides the following entities for each discovered Ecocomfort 2.0 device.
Fan (Main control entity)
Description : Control the ventilation system’s operation mode and speed.
Supported preset mode :
auto : Full automatic mode that follows in-app programs and sensor thresholds for speeds and direction modes
Speed control : Adjustable from 0-100%, mapped to 5 possible fan control values:
0% : Off
25% : Sleep
50% : Low (Vel1 in-app)
75% : Medium (Vel2 in-app)
100% : High (Vel3 in-app)
Available for devices : Ecocomfort 2.0
Fan Direction Mode
Description : Select the ventilation system’s direction operation mode. When you change the direction mode, the integration keeps the current fan speed whenever the device is already running at a fixed speed. If you change the direction mode while the device is off, or while the Fan entity is in the auto preset (which does not have a fixed speed), the fan is started at 25% (sleep) speed.
Supported options :
forward : Intake mode (supply air into the room)
reverse : Extract mode (exhaust air into the room)
alternate : Alternating mode (cycles between intake and extract)
sensor : Sensor-based mode that uses sensor thresholds configured in the app, with a fixed speed when the thresholds are exceeded. Corresponds to the Manual sensor mode in the app.
Temperature
Description : Current indoor ambient temperature detected by the device.
Unit : °C
Measurement type : Temperature
Humidity
Description : Current indoor relative humidity detected by the device.
Unit : %
Measurement type : Humidity
VOC (Volatile Organic Compounds)
Description : Air quality indicator based on detected volatile organic compounds.
Unit : ppm (parts per million)
Measurement type : Air quality/VOC level
Remarks : Higher values indicate lower air quality and may trigger automatic ventilation adjustments.
The IntelliClima integration uses cloud polling to fetch device status. The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the IntelliClima cloud API every 1 minute by default to retrieve current device state, sensor readings, and configuration.
This means:
An active internet connection is required on the Home Assistant device.
Your Ecocomfort 2.0 device must be connected to the internet and registered with the IntelliClima+ service.
Data updates are limited by cloud API availability and latency.
The following automation adjusts the fan speed based on VOC sensor readings. Replace sensor.ecocomfort_2_voc and fan.ecocomfort_2 with your own entity IDs.
automation : - alias : " Adjust ventilation by air quality" description : " Increase ventilation when VOC levels are high" triggers : - trigger : numeric_state entity_id : sensor.ecocomfort_2_voc above : 300 for : minutes : 2 actions : - action : fan.set_percentage target : entity_id : fan.ecocomfort_2 data : percentage : 75 - alias : " Reduce ventilation when air quality improves" description : " Lower ventilation speed when VOC levels normalize" triggers : - trigger : numeric_state entity_id : sensor.ecocomfort_2_voc below : 150 actions : - action : fan.set_percentage target : entity_id : fan.ecocomfort_2 data : percentage : 25
Create a day and night ventilation schedule to run high speed at night and low speed during the day:
automation : - alias : " Nighttime high-speed ventilation" description : " Run ventilation at high speed during night for air exchange" triggers : - trigger : time at : " 22:00:00" actions : - action : fan.set_percentage target : entity_id : fan.ecocomfort_2 data : percentage : 100 - alias : " Daytime low-speed ventilation" description : " Reduce ventilation during day when people are home" triggers : - trigger : time at : " 07:00:00" actions : - action : fan.set_percentage target : entity_id : fan.ecocomfort_2 data : percentage : 25
This integration is based on reverse-engineered communication with the IntelliClima+ cloud API. The IntelliClima+ service does not provide an official public API documentation. This means:
API stability: If Fantini Cosmi changes their cloud API communication protocol or endpoints, this integration may stop working. Updates would be required to restore functionality.
Feature support: Only the features and commands that were reverse-engineered are implemented. Future features added by Fantini Cosmi may not be immediately available through this integration.
Cloud dependency: The integration requires a working internet connection and access to Fantini Cosmi’s cloud servers. It cannot operate with local-only communication.
Device support: Currently, only the Ecocomfort 2.0 device with firmware 0.6.8 has been tested. Other devices in the Ecocomfort line may work but have not been verified.
To turn on debug logging, please check the documentation on enabling debug logs and diagnostics . For fully debugging, you might also want to enable debugging for the external pyintelliclima library by modifying your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file in the /config directory and adding the following:
logger : logs : homeassistant.components.intelliclima : debug pyintelliclima : debug
Symptom: Device is offline and device shows as unavailable in IntelliClima+ app
The integration cannot communicate with your Ecocomfort 2.0 device through the IntelliClima+ cloud service.
Resolution
Try the following steps:
Verify device status in IntelliClima+ app: Open the IntelliClima+ mobile app and check that your Ecocomfort 2.0 shows as “Online” and responsive.
Check your internet connection: Ensure both your Home Assistant device and your Ecocomfort 2.0 have stable internet connectivity.
Power cycle the device:
Turn off the Ecocomfort 2.0 at the power supply for 30 seconds.
Turn it back on and wait 2-3 minutes for it to reconnect.
Restart via IntelliClima+ app:
Open the IntelliClima+ app on your smartphone.
Find your Ecocomfort 2.0 device.
Use the app’s restart or reset function if available: Settings > ECOCOMFORT 2.0 MANAGEMENT > RESTART
ECOCOMFORT.
Wait for the device to come back online.
Check Home Assistant logs: Look for error messages in the Home Assistant logs for more details about the connection failure:
Go to Settings > System > Logs .
Search for “intelliclima” messages.
Symptom: “Invalid authentication” error during setup
Your IntelliClima+ account credentials are incorrect or authentication with Fantini Cosmi’s service failed.
Verify credentials: Double-check that your email/username and password are correct.
Check account status: Ensure your IntelliClima+ account is active and not locked.
Try in the mobile app: Open the IntelliClima+ app and sign in to confirm your credentials work.
Symptom: “No devices found” or setup fails when validating account
The integration authenticated successfully, but no Ecocomfort devices were found in your account.
Verify device is set up: Open the IntelliClima+ mobile app and confirm your Ecocomfort 2.0 is listed and shows as “Online”.
Check device status: Ensure the device is powered on and connected to the internet (may take a few minutes after powering on).
Re-add the device: If the device doesn’t appear, try removing and re-adding it in the IntelliClima+ app.
Wait for sync: After making changes in the IntelliClima+ app, wait a few minutes before retrying the Home Assistant integration setup.
Symptom: Fan commands take a long time to execute, or sensor data is stale
Cloud polling introduces latency in command execution and data updates.
Check internet connection: Ensure stable, fast internet connectivity for both your Home Assistant device and Ecocomfort 2.0.
Check cloud service status: Fantini Cosmi’s cloud service may occasionally experience slowdowns. Try again in a few minutes.
Monitor polling interval: By default, the integration polls every 1 minute. If real-time responsiveness is critical, you can set up local automations that don’t depend on frequent updates.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After deleting the integration from Home Assistant, you can continue using your device normally with the IntelliClima+ app.
If you encounter issues not covered in the troubleshooting section, or if you have suggestions for improvements, please make an issue and tag the author.
For users with other Ecocomfort device models who wish to add support, contributions are welcome. Support for additional models can be added to the underlying pyintelliclima library through reverse-engineering or official API documentation.
Fantini Cosmi
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IntelliClima device was introduced in Home Assistant 2026.3, and it's used by
9 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dvdinth
Categories
Back to top
