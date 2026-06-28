---
source_url: "https://www.home-assistant.io/integrations/victron_ble"
final_url: "https://www.home-assistant.io/integrations/victron_ble"
canonical_url: "https://www.home-assistant.io/integrations/victron_ble/"
source_handle: "web:www-home-assistant-io:da49999be94a"
source_section: "integrations-victron-ble"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ca81845cd90a1fdf7058404cbe2ca9929d8c524c249ae69bcca63a19983af4bc"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Victron BLE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/victron_ble
- Final URL: https://www.home-assistant.io/integrations/victron_ble
- Canonical URL: https://www.home-assistant.io/integrations/victron_ble/
- Fetched at: 2026-06-28T03:26:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Victron BLE devices into Home Assistant.

## Extracted Text

On this page
Supported devices
Unsupported devices
Configuration
Adding a device
Troubleshooting
Device only shows signal strength
Device is not discovered
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Victron BLE integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates Victron Energy devices that support Instant Readout via Bluetooth (Bluetooth Low Energy, or BLE) into Home Assistant.
The integration supports the following Victron device types:
AC Charger (Blue Smart IP22, Blue Smart IP65)
Battery Monitor (SmartShunt, BMV series)
Battery Sense
DC-DC Converter (Orion TR Smart)
DC Energy Meter
Inverter/Charger (MultiPlus, Quattro, Inverter RS via VE.Bus)
Smart Battery Protect
Smart Lithium
Solar Charger (SmartSolar, BlueSolar MPPT)
The following device types are not yet supported:
Inverter RS (standalone, non-VE.Bus mode)
Lynx Smart BMS
Multi RS
Orion XS
If your device advertises via BLE with Victron manufacturer data but is not in the supported list above, it may appear in Home Assistant with only a Signal strength sensor. This is because the integration can detect any Victron BLE device, but can only read sensor data from supported device types. Full sensor data will become available when support for that device type is added.
To add the Victron BLE device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Victron BLE .
Follow the instructions on screen to complete the setup.
The Victron BLE integration will automatically discover devices once the Bluetooth integration is enabled and functional.
To configure a discovered device, you will need to supply the per-device encryption key.
To get the encryption key, use the VictronConnect app ( Android , iOS , Linux , macOS , Windows ):
Install the VictronConnect app, ideally on the device you are using to set up this integration so you can simply cut and paste the key.
Open the app and pair with your device.
From the list, select the device that you want to monitor.
To open the Settings for that device, select the gear icon.
Open the menu and select Product Info .
Scroll down to Instant Readout via Bluetooth and enable the feature (if it is not already enabled).
To display the encryption key, next to Instant Readout Details , select Show .
If your device appears in Home Assistant but only shows a signal strength sensor, this can mean:
Unsupported device type : The device type is not yet supported by the integration. See the supported devices list above.
Incorrect encryption key : The key validation only performs a basic check. If the key is wrong but passes the initial check, the integration will be unable to decrypt the sensor data. Try removing the device and re-adding it with the correct encryption key from the VictronConnect app.
Make sure Instant Readout via Bluetooth is enabled in the VictronConnect app for the device (see Adding a device above).
Make sure no other device (such as a phone running VictronConnect) is actively connected to the device via Bluetooth, as this can prevent BLE advertisements from being sent.
Make sure the Bluetooth integration is set up and working.
This integration subscribes to passive Bluetooth updates and will update the sensors
as often as the updates are received.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Victron BLE device was introduced in Home Assistant 2025.12, and it's used by
1533 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rajlaud
Categories
Sensor
Back to top
