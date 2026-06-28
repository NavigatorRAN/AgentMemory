---
source_url: "https://www.home-assistant.io/integrations/freshr"
final_url: "https://www.home-assistant.io/integrations/freshr"
canonical_url: "https://www.home-assistant.io/integrations/freshr/"
source_handle: "web:www-home-assistant-io:2ee7a743e90f"
source_section: "integrations-freshr"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bced4f14084e8d0729dbab05c852cfd44d23ca3bccf5b15601bba3fdf51c2f19"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Fresh-r - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/freshr
- Final URL: https://www.home-assistant.io/integrations/freshr
- Canonical URL: https://www.home-assistant.io/integrations/freshr/
- Fetched at: 2026-06-28T02:44:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Fresh-r ventilation solutions within Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Sensors
Examples
Get notified when indoor CO2 levels are high
Monitor humidity to prevent condensation
Track ventilation performance
Data updates
Known limitations
Troubleshooting
Authentication failed
Cannot connect to Fresh-r
No devices appear after setup
Removing the integration
To remove an integration instance from Home Assistant
The Fresh-r integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects to the fresh-r.me cloud dashboard, letting you monitor all Fresh-r ventilation devices linked to your account. It polls the Fresh-r cloud to keep your data up to date. Use it to keep an eye on your indoor air quality and ventilation performance, or to trigger automations when CO2 or humidity levels need attention.
The following Fresh-r devices are supported:
Fresh-r : The main heat recovery ventilation unit.
Forward : A Fresh-r ventilation unit that forwards air to the main heat recovery ventilation unit.
Monitor : A standalone indoor air quality monitor.
A Fresh-r account on fresh-r.me .
At least one Fresh-r ventilation unit connected to your Fresh-r account.
To add the Fresh-r hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fresh-r .
Follow the instructions on screen to complete the setup.
Username
The email address you use to sign in to your Fresh-r account.
Password
The password for your Fresh-r account.
The integration provides the following sensors:
Inside temperature
Description : Temperature of the air leaving the ventilation unit, in °C.
Available for : Fresh-r, Forward
Outside temperature
Description : Temperature of the incoming fresh air, in °C.
CO2
Description : CO2 concentration of the indoor air, in ppm.
Available for : All devices
Humidity
Description : Relative humidity of the indoor air, in %.
Air flow rate
Description : Air flow rate through the ventilation unit, in m³/h.
Dew point
Description : Dew point temperature of the indoor air, in °C.
Remarks : Disabled by default.
Temperature
Description : Indoor temperature, in °C.
Available for : Forward, Monitor
CO2 levels above 1000 ppm are generally considered poor for indoor air quality. You can create an automation that sends you a notification when the CO2 sensor crosses that threshold, so you know to check that your ventilation unit is running correctly and that its filter does not need cleaning.
High indoor humidity can lead to condensation and mold. Use the Humidity sensor to trigger an alert or switch on extra ventilation when humidity rises above a level you are comfortable with.
Use the Air flow rate sensor to verify that your ventilation unit is delivering the expected amount of fresh air. A sudden drop can indicate a dirty filter or a blocked duct.
The Fresh-r integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] sensor readings from the Fresh-r cloud every 10 minutes. The list of connected devices is refreshed every hour.
The integration is read-only. It is not possible to control the ventilation unit — such as changing the fan speed or operating mode — from Home Assistant.
Some Fresh-r systems include an air quality sensor, which is not yet supported by this integration.
Because data is polled Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] every 10 minutes, sensor values may be slightly behind real-time readings.
The integration depends on the Fresh-r cloud service. If the service is unavailable, data will not update until the connection is restored.
If the integration shows an authentication error, make sure the username (email address) and password match what you use to sign in to fresh-r.me . If you recently changed your password, Home Assistant will prompt you to reauthenticate. Select the notification to re-enter your updated credentials without having to remove and re-add the integration.
If the integration cannot connect or sensor values stop updating, check that your Home Assistant instance has access to the internet. You can verify whether fresh-r.me is reachable from a browser on the same network. If the Fresh-r cloud service is temporarily unavailable, the integration will resume updating automatically once the service is restored.
If the integration is set up successfully but no devices or sensors appear in Home Assistant, make sure at least one Fresh-r ventilation unit is connected and visible in your fresh-r.me dashboard before setting up the integration. Devices added to or removed from your Fresh-r account are picked up automatically within an hour.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fresh-r hub was introduced in Home Assistant 2026.4, and it's used by
5 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@SierraNL
Categories
Sensor
Back to top
