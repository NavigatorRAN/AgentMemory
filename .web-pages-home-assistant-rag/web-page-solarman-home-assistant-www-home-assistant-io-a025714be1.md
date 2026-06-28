---
source_url: "https://www.home-assistant.io/integrations/solarman"
final_url: "https://www.home-assistant.io/integrations/solarman"
canonical_url: "https://www.home-assistant.io/integrations/solarman/"
source_handle: "web:www-home-assistant-io:a025714be10b"
source_section: "integrations-solarman"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "42881ca611a163874619f6141c77c4842c77b23fd53e52587c4a69a133207d63"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Solarman - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/solarman
- Final URL: https://www.home-assistant.io/integrations/solarman
- Canonical URL: https://www.home-assistant.io/integrations/solarman/
- Fetched at: 2026-06-28T03:17:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Solarman device with Home Assistant.

## Extracted Text

On this page
Use cases
Supported devices
Prerequisites
Configuration
Supported functionality
SP-2W-EU
P1-2W
MR1-D5-W/MR1-D5-WR
Data updates
Known limitations
Troubleshooting
Cannot add device or obtain data
Removing the integration
To remove an integration instance from Home Assistant
The Solarman integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables direct local communication between Home Assistant and your Solarman devices. This solution provides real-time monitoring of energy production and consumption while enabling device control, all through secure local communication.
Monitor energy usage in real time.
Control devices remotely.
Automate schedules for your appliances.
Currently, the integration supports the following devices:
SP-2W-EU: Smart Plug for energy monitoring (power consumption, voltage, current) and remote outlet control.
P1-2W: P1 Meter Reader for monitoring operating status and consumption data of P1 meter.
MR1-D5-W/MR1-D5-WR: Smart Meter for bidirectional energy metering in residential and small commercial and industrial scenarios.
Connect your Solarman device and Home Assistant to the same local network.
Ensure the Solarman device is powered on and has acquired a network IP address. You can get the IP from the app or from your router.
Enable the device’s API through the app.
To add the Solarman device to your Home Assistant instance, use this My button:
Solarman can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Solarman .
Follow the instructions on screen to complete the setup.
Host
The IP address of your device. You can find it in your router or in the app.
The Solarman integration mainly provides sensors about what your device is measuring.
The SP-2W-EU provides the following sensors:
Power (W)
Voltage (V)
Current (A)
Positive active energy (kWh)
Reverse active energy (kWh)
The P1-2W provides the following sensors:
SN: serial number of the P1 meter
Device version: version of the P1 meter
Total actual energy low tariff (kWh)
Total actual energy normal tariff (kWh)
Total actual returned energy low tariff (kWh)
Total actual returned energy normal tariff (kWh)
AC phase-A current (A)
AC phase-B current (A)
AC phase-C current (A)
AC phase-A voltage (V)
AC phase-B voltage (V)
AC phase-C voltage (V)
Total actual power (kW)
Total actual returned power (kW)
Active power phase-A (kW)
Active power phase-B (kW)
Active power phase-C (kW)
Active returned power phase-A (kW)
Active returned power phase-B (kW)
Active returned power phase-C (kW)
Total gas consumption (m³)
The MR1-D5-W/MR1-D5-WR provides the following sensors:
SN: serial number of the meter
Active power (W)
Apparent power (W)
Reactive power (W)
Power factor: ratio of active to apparent power
Frequency (Hz)
Total actual energy (kWh)
Total actual returned energy (kWh)
The Solarman integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the device every 30 seconds.
The integration does not provide the ability to configure the devices, which can instead be done via the manufacturer’s app.
Ensure the device is powered on and functioning normally.
Confirm both the device and Home Assistant are connected to the same local network.
Ensure the device’s IP address is correct and hasn’t changed.
Check the device’s settings in app to ensure that the API is enabled.
Check the Home Assistant logs for more information.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Solarman device was introduced in Home Assistant 2026.4, and it's used by
26 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@solarmanpv
Categories
Energy
Sensor
Back to top
