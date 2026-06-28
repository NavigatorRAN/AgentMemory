# Indevolt - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/indevolt
- Final URL: https://www.home-assistant.io/integrations/indevolt
- Canonical URL: https://www.home-assistant.io/integrations/indevolt/
- Fetched at: 2026-06-28T02:52:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Indevolt device with Home Assistant.

## Extracted Text

On this page
Use cases
Supported devices
Prerequisites
Configuration
Supported functionality
Buttons
Sensors
Configurable entities (Generation 2 only)
List of actions
Examples
Setting emergency SOC based on forecasted minimum temperatures
Dynamically control battery discharge based on battery state, grid import/export and solar production
Data updates
Known limitations
Troubleshooting
Cannot add device or obtain data
Removing the integration
To remove an integration instance from Home Assistant
The Indevolt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables direct local communication between Home Assistant and your Indevolt energy storage devices.
With this integration, you can monitor energy production, consumption, and battery status in real time. You can also manage battery working modes, control real-time charging and discharging behavior, and configure power limits and other battery protection settings.
Beyond basic monitoring, the Indevolt integration enables advanced energy management automations within Home Assistant. For example, you can:
Optimize battery charging and discharging based on solar production forecasts
Automatically adjust energy modes to take advantage of variable electricity pricing
Prevent grid feed-in during peak tariff periods by dynamically limiting output power
Maintain a minimum battery charge for backup scenarios by adjusting discharge limits when applicable
Coordinate battery behavior with other Home Assistant energy devices for whole-home optimization
The integration supports the following devices:
BK1600 / BK1600 Ultra
SolidFlex 1200 / SolidFlex 2000 / PowerFlex 2000
Connect your Indevolt device and Home Assistant to the same local network.
Ensure the Indevolt device is powered on and has acquired a network IP address.
In the Indevolt app, enable the Local API and set the protocol to http .
To add the Indevolt device to your Home Assistant instance, use this My button:
Indevolt can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Indevolt .
Follow the instructions on screen to complete the setup.
Host
The IP address of your device. You can find it in your router or in the Indevolt app.
The Indevolt integration provides sensors for monitoring your device (read only).
The following button entity allows triggering device actions directly from Home Assistant.
Enable standby mode : Puts the battery in standby mode which pauses battery charging and discharging. Change the energy mode to resume normal battery activity.
All generations
Rated capacity (kWh)
Device mode (overall setup of the device, for example standalone/cluster)
Energy mode (battery and energy management strategy, for example Self-consumption prioritized/Price-Based Strategy)
Device heating state (Gen-1 specific, on/off)
Real-time mode
Real-time power limit (W)
Real-time target SOC (%)
DC input voltage (2 channels, V)
DC input current (2 channels, A)
DC input power (2 channels, W)
Daily production (kWh)
Cumulative production (kWh)
Total AC input power (W)
Total AC input energy (kWh)
Total AC output power (W)
Total AC output energy (kWh)
Total DC output power (W)
Off-grid output energy (kWh)
Bypass power (W)
Bypass input energy (Wh)
Battery power (W)
Battery charge/discharge state
Battery SOC (%)
Battery daily charging energy (kWh)
Battery daily discharging energy (kWh)
Battery total charging energy (kWh)
Battery total discharging energy (kWh)
Meter connection status
Meter power (W)
BK1600 / BK1600 Ultra (Generation 1)
Inverter temperature (°C)
MOS Temperature charge/discharge (°C)
Battery pack 1-3 temperature (°C)
Device heating state (on/off)
SolidFlex 1200 / SolidFlex 2000 / PowerFlex 2000 (Generation 2)
DC input voltage (4 channels, V)
DC input current (4 channels, A)
DC input power (4 channels, W)
Grid voltage (V)
Grid frequency (Hz)
Equivalent full cycles
Transformer temperature (°C)
Main battery serial number
Main battery cycle count
Main battery SOC (%)
Main battery temperature (°C)
Main battery MOS temperature (°C)
Main battery voltage (V)
Main battery current (A)
Battery pack 1-5 serial number
Battery pack 1-5 cycle count
Battery pack 1-5 SOC (%)
Battery pack 1-5 temperature (°C)
Battery pack 1-5 MOS temperature (°C)
Battery pack 1-5 voltage (V)
Battery pack 1-5 current (A)
Battery pack 1-5 heating state (on/off)
In addition to the read-only sensors listed above, the Indevolt integration also exposes the following configurable entities for supported Generation 2 devices. You can change these settings from Home Assistant, and they are applied directly to your device.
Energy mode: Configure battery and energy management strategy (select)
Discharge limit: Set the minimum battery level (emergency power/SOC, %)
Max AC output power: Configure maximum discharge power (W)
Inverter input limit: Set maximum PV input power (W)
Feed-in power limit: Configure grid feed-in power limit (W)
Allow grid charging: Enable or disable charging from the grid (switch)
Bypass socket: Enable or disable the bypass socket (switch)
LED indicator: Enable or disable the LED indicator (switch)
The Indevolt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Charge ( indevolt.charge )
Starts charging an Indevolt battery until the target state of charge is reached.
Discharge ( indevolt.discharge )
Starts discharging an Indevolt battery until the target state of charge is reached.
For an overview of every action across all integrations, see the actions reference .
The Indevolt integration automatically retrieves data from your devices by polling the OpenData API every 30 seconds. If an update fails, the integration will retry again at the set interval (self-recovery).
Real-time configuration changes may appear with a small delay in Home Assistant and the Indevolt app.
Energy mode can only be set when the device is not in “Outdoor / Portable”-mode (BK1600 / BK1600 Ultra).
Some sensors are device generation-specific and may not appear for all models.
Some sensors / configurations available in the app are not (yet) available in the integration.
The inverter temperature only shows when the inverter is active (BK1600 / BK1600 Ultra).
The SolidFlex 1200 identifies itself as a SolidFlex 2000 device.
Ensure the device is powered on and functioning normally.
Confirm both the device and Home Assistant are connected to the same local network.
Ensure the device’s IP address is correct and hasn’t changed.
Check the device’s settings in the Indevolt app to ensure that the API is enabled in “HTTP” mode.
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
The Indevolt device was introduced in Home Assistant 2026.3, and it's used by
165 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@xirt
Categories
Energy
Sensor
Back to top
