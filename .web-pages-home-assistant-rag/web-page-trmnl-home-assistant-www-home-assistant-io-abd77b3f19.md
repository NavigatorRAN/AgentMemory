# TRMNL - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/trmnl
- Final URL: https://www.home-assistant.io/integrations/trmnl
- Canonical URL: https://www.home-assistant.io/integrations/trmnl/
- Fetched at: 2026-06-28T03:24:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate TRMNL with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Sensors
Switches
Time
Examples
Send a notification when the battery is low
Data updates
Known limitations
Troubleshooting
Setup fails with an authentication error
Removing the integration
To remove an integration instance from Home Assistant
The TRMNL integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your TRMNL e-paper (e-ink) displays in Home Assistant. TRMNL devices are low-power e-ink displays that show content such as calendars, weather, and custom dashboards at a glance.
With this integration, you can track the battery level of your TRMNL devices and automate your home around them. For example, you could get a notification when the battery is running low, or align the sleep schedule of your display with your own.
The following TRMNL hardware devices are supported:
TRMNL (OG)
TRMNL (X)
To use this integration, you need a TRMNL developer license.
Open your TRMNL account settings .
Copy your API key. It starts with user_ .
To add the TRMNL hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select TRMNL .
Follow the instructions on screen to complete the setup.
API key
The API key for your TRMNL account.
The TRMNL integration provides the following entities for each TRMNL device on your account.
Battery : The current battery level of the device, in percent.
Battery voltage : The current battery voltage of the device, in volts (V). This entity is disabled by default.
Signal strength : The raw Wi-Fi received signal strength indicator (RSSI) of the device, in dBm. This entity is disabled by default.
Wi-Fi strength : The Wi-Fi connection quality of the device, shown as a percentage derived from the RSSI value. This entity is disabled by default.
Sleep mode : Enables or disables the sleep schedule on the device. When enabled, the device will sleep between the Sleep start time and Sleep end time .
Sleep start time : The time at which the device enters sleep mode.
Sleep end time : The time at which the device wakes up from sleep mode.
This automation sends a notification to your phone when the battery level of your TRMNL device drops below 20%.
Example YAML configuration
alias : " Notify when TRMNL battery is low" description : > Send a notification when the TRMNL battery level drops below 20%. triggers : - trigger : numeric_state entity_id : sensor.your_trmnl_battery below : 20 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " TRMNL battery low" message : " Your TRMNL battery is below 20%. Time to charge it."
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the TRMNL API every hour to update the device and entity states, including sensor readings and the Sleep mode switch.
The integration does not support sending custom content to the display. It only allows you to monitor the device status and control the sleep schedule.
Symptom: “Invalid authentication”
When adding the integration, the setup fails with an authentication error.
Description
This most commonly happens when the wrong API key is used. The integration requires your account API key (which starts with user_ ), not the device-level token that is shown in the individual device settings.
Resolution
Copy the API key shown there. Make sure it starts with user_ .
Re-enter this key in the integration setup.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The TRMNL hub was introduced in Home Assistant 2026.4, and it's used by
229 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Sensor
Switch
Back to top
