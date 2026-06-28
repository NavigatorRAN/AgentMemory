---
source_url: "https://www.home-assistant.io/integrations/earn_e_p1"
final_url: "https://www.home-assistant.io/integrations/earn_e_p1"
canonical_url: "https://www.home-assistant.io/integrations/earn_e_p1/"
source_handle: "web:www-home-assistant-io:31eb65f15262"
source_section: "integrations-earn-e-p1"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cc098735cfa56c3e1a0a06b4fc1bdfa39a8a3f5f3769c6d031a2a48f7ff12621"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# EARN-E P1 Meter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/earn_e_p1
- Final URL: https://www.home-assistant.io/integrations/earn_e_p1
- Canonical URL: https://www.home-assistant.io/integrations/earn_e_p1/
- Fetched at: 2026-06-28T02:38:45Z
- Content type: text/html; charset=UTF-8

## Description

Monitor your smart meter's energy and gas data in real-time with the EARN-E P1 Meter integration.

## Extracted Text

On this page
Supported devices
Supported functionality
Real-time sensors (~1 second updates)
Meter reading sensors (~60 second updates)
Prerequisites
Configuration
Known limitations
Troubleshooting
No device discovered during setup
Sensors show as unavailable
Removing the integration
To remove an integration instance from Home Assistant
The EARN-E P1 Meter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects to the EARN-E energy monitor , a device that reads your smart meter’s P1 port and broadcasts real-time energy data via UDP on the local network. This integration listens for those broadcasts and exposes them as sensor entities.
No cloud connection or polling is needed — the device pushes data directly to Home Assistant over the local network.
EARN-E energy monitor
The EARN-E P1 Meter integration provides the following entities.
Power imported : Current power being imported from the grid (kW)
Power exported : Current power being exported to the grid (kW)
Voltage L1 : Voltage on phase 1 (V)
Current L1 : Current on phase 1 (A)
Energy imported tariff 1 : Total energy imported on tariff 1 (kWh)
Energy imported tariff 2 : Total energy imported on tariff 2 (kWh)
Energy exported tariff 1 : Total energy exported on tariff 1 (kWh)
Energy exported tariff 2 : Total energy exported on tariff 2 (kWh)
Gas consumed : Total gas consumed (m³)
Wi-Fi RSSI : Wi-Fi signal strength of the device (dBm)
The EARN-E energy monitor must be:
Connected to your smart meter’s P1 port
Connected to the same local network as your Home Assistant instance
Powered on and broadcasting UDP packets on port 16121
To add the EARN-E P1 Meter device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select EARN-E P1 Meter .
Follow the instructions on screen to complete the setup.
When adding the integration, it will automatically listen for UDP broadcasts for approximately 10 seconds. If your EARN-E device is found, you will see a confirmation screen with its IP address.
If no device is discovered (for example, if the meter is on a different subnet), you will be asked to enter the IP address manually. The integration will then listen for data from that IP address to verify connectivity.
IP Address
The local IP address of your EARN-E P1 Meter (for example, 192.168.1.100). Only required if auto-discovery does not find your device.
Only single-phase meters are supported (L1 voltage and current). Three-phase support depends on the EARN-E device firmware.
The device must be on the same network subnet as Home Assistant, or UDP broadcast traffic must be routed between subnets.
Ensure the EARN-E device is powered on and connected to your network.
Verify the device is on the same subnet as Home Assistant.
Try entering the IP address manually instead of relying on auto-discovery.
The device sends full meter data approximately every 60 seconds. Some sensors may take up to a minute to become available after setup.
Check that the device is still powered on and connected to the network.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EARN-E P1 Meter device was introduced in Home Assistant 2026.5, and it's used by
5 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Miggets7
Categories
Energy
Sensor
Back to top
