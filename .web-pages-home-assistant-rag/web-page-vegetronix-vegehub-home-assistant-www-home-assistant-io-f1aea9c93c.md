---
source_url: "https://www.home-assistant.io/integrations/vegehub"
final_url: "https://www.home-assistant.io/integrations/vegehub"
canonical_url: "https://www.home-assistant.io/integrations/vegehub/"
source_handle: "web:www-home-assistant-io:f1aea9c93cb0"
source_section: "integrations-vegehub"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ddb99ef29d0a5b84190964ec4767fe5a5453105a9a3c2683b15dbe9b2267f842"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Vegetronix VegeHub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vegehub
- Final URL: https://www.home-assistant.io/integrations/vegehub
- Canonical URL: https://www.home-assistant.io/integrations/vegehub/
- Fetched at: 2026-06-28T03:26:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a VegeHub device with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Connecting to Home Assistant
Configuration
Device settings
Power management
Troubleshooting
Device is unresponsive
Setup is failing
Hub’s settings interface is not accessible
Actuators are not responding
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Vegetronix VegeHub is a compact, network-connected device designed for agricultural monitoring and control. It supports a variety of environmental sensors—including soil moisture, soil temperature, light, and more —making it suitable for use in gardening, landscaping, and precision agriculture. In addition to monitoring, the VegeHub can also control actuators such as relays, pumps, or water valves , enabling automation of irrigation and other systems. This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows Home Assistant to receive real-time data from VegeHub devices and optionally control connected outputs.
The VegeHub is available in the standard configurations , as well as the sprinkler control variation . Both are supported by this integration.
There is currently support for the following platforms within Home Assistant:
Sensor: Collects data from VegeHub sensor channels.
Switch: Shows actuator states and lets you control them.
Sensor Based WiFi Controller - Firmware 4.0 or later - All variants
Sensor Based WiFi Data Logger - Firmware 4.0 or later - All variants
Sensor Based WiFi Sprinkler Valve Controller - Firmware 4.0 or later - All variants
The VegeHub can be connected to Wi-Fi without the need for additional apps or cloud accounts. When powered on, the VegeHub creates a Wi-Fi access point called “Vege_XX_XX” where the XX are different for each device. Connect to this network from a phone, tablet, or other similar device. The default passphrase to connect to the access point is vegetronix . This can (and should) be changed in the Wi-Fi settings.
Once connected to the network, you should automatically be directed by your device to log in to the network. Follow the prompt to be directed to the VegeHub’s Wi-Fi setup page, where you can scan for available networks, enter your Wi-Fi network’s credentials, change the device’s name, and change the access point password.
Important
It is crucial to change the default access point password. If you don’t, anyone can easily access your VegeHub and potentially compromise your Wi-Fi network credentials.
Select Apply , and your VegeHub will reset its network connection and try to connect using the credentials you entered.
Home Assistant monitors your network for VegeHub devices. As soon as your VegeHub is connected to the same network as Home Assistant, it should be detected automatically. Go to Settings > Devices & services in Home Assistant, where you should see your VegeHub listed under Discovered devices.
The VegeHub device relies on your Home Assistant instance keeping the same IP address. If your Home Assistant device changes its IP address, the VegeHub will no longer be able to send updates until you update its configuration with the new IP address.
To avoid issues, it is recommended to assign a static IP address or DHCP reservation to your Home Assistant device on your network. If you ever change your Home Assistant device’s IP address, remember to update the VegeHub’s configuration so it can continue sending updates.
We recommend adding devices through Home Assistant’s automatic detection, but you can also add devices manually if needed.
To add the Vegetronix VegeHub hub to your Home Assistant instance, use this My button:
Vegetronix VegeHub can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Vegetronix VegeHub .
Follow the instructions on screen to complete the setup.
To open the VegeHub settings page, navigate to Settings > Devices & services , choose the VegeHub device card, and under Device info select Visit .
The VegeHub has two power modes:
Battery mode (default): Device sleeps after five minutes of inactivity
Power adapter mode: Device remains always active
When in Power Adapter mode, the device will use significantly more power, so this mode should not be used when powering from batteries, as they will quickly be drained.
To change the power mode, visit the Hub’s settings interface , go to the Settings page, and change the Power source to Power adapter .
If the device is unresponsive, wake it up using one of these methods:
Press the button on the board.
Disconnect and reconnect power.
Ensure the VegeHub is awake (see Device Wake-Up section)
Ensure the VegeHub is awake (see Device Wake-Up section).
Consider switching to power adapter mode for consistent response.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
VegeHub product page
VegeHub Quick Start Guide
VegeHub Manual
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Vegetronix VegeHub hub was introduced in Home Assistant 2025.7, and it's used by
3 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@thulrus
Categories
Sensor
Switch
Back to top
