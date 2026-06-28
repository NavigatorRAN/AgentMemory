---
source_url: "https://www.home-assistant.io/integrations/smlight"
final_url: "https://www.home-assistant.io/integrations/smlight"
canonical_url: "https://www.home-assistant.io/integrations/smlight/"
source_handle: "web:www-home-assistant-io:0c4e198f39bd"
source_section: "integrations-smlight"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b557f5381f83e1f0357b0e28f1b45ac779d6f2242c8d9547e2fc4ce9ef836814"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# SMLIGHT SLZB - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/smlight
- Final URL: https://www.home-assistant.io/integrations/smlight
- Canonical URL: https://www.home-assistant.io/integrations/smlight/
- Fetched at: 2026-06-28T03:17:29Z
- Content type: text/html; charset=UTF-8

## Description

The SMLIGHT SLZB integration allows users to monitor and manage their SMLIGHT SLZB devices from directly within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Data Updates
Supported functionality
Sensors
Buttons
Switches
Updates
Peripherals
Actions
List of actions
Removing the integration
To remove an integration instance from Home Assistant
Known Limitations
Troubleshooting
The SMLIGHT SLZB Ethernet Zigbee coordinators provide a reliable and convenient way to integrate Zigbee devices into your smart home setup. By placing the Zigbee gateway closer to your devices, you can improve connectivity and reduce interference, avoiding the limitations of gateways hidden in cupboards or distant locations.
The SMLIGHT SLZB integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor and manage your SLZB devices directly from Home Assistant. This integration provides direct access to many features available in the SLZB device’s web UI, such as managing firmware updates, monitoring device health through diagnostic sensors, and controlling settings like LED modes or restarting the device. These features can also be incorporated into your automations for central control.
You need a supported SLZB adapter.
This integration has been tested with the following devices. Newer “U” variants of these models are also supported.
SLZB-06
SLZB-06M
SLZB-06Mg24
SLZB-06p7
SLZB-06p10
SLZB-06Mg26
Multi radio devices - Additional entities will be created for the second Zigbee radio, including Zigbee firmware updates, temperature sensor, router reconnect button, and firmware type. (Note: the Zigbee restart and flash mode buttons are shared between both radios.) Requires core firmware v2.8.x or later.
SLZB-MR1
SLZB-MR2
SLZB-MR3
SLZB-MR4
SLZB-MR5
SLZB-Ultima3
Core firmware on your SLZB device must be v2.3.6 or newer. If you have an older v2.x.x version, you can update from within Home Assistant. If you have v0.9.9 , update using the SMLIGHT web flasher before installing this integration.
To add the SMLIGHT SLZB device to your Home Assistant instance, use this My button:
SMLIGHT SLZB can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SMLIGHT SLZB .
Follow the instructions on screen to complete the setup.
Host
Hostname or IP address of your SLZB device
Username
Username for web login to your SLZB device
Password
Password for web login to your SLZB device
The SMLIGHT integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will poll for sensor updates every 5 minutes, except for the internet connectivity sensor which is checked every 15 minutes. Firmware updates for both core and Zigbee are checked once per day.
The following sensors will be created:
Core temperature - Temperature of core ESP32
Zigbee temperature - Temperature of Zigbee CC2652 or EFR32 chip
Core uptime - Uptime of Core device
Zigbee uptime - Uptime of Zigbee connection to ZHA/Z2M
RAM usage - Monitor RAM usage
PSRAM usage - Monitor PSRAM usage (U-devices only)
FS usage - Monitor filesystem usage
Connection mode - Connection mode - Ethernet, Wi-Fi, or USB
Ethernet - Ethernet connection status
Internet - Internet connection status
VPN - WireGuard VPN client connection status
Wi-Fi - Wi-Fi connection status
Firmware channel - Channel for updates, stable, or development firmware or currently installed firmware.
Zigbee type - Current mode of Zigbee chip. Coordinator, router, or Thread. Only works with official firmware installed via OTA in SMLIGHT web UI.
The following buttons will be created:
Core restart - Restart core ESP32
Zigbee restart - Restart Zigbee CC2652 or EFR32 chip
Zigbee flash mode - Trigger the Zigbee chip into bootloader flash mode so it can be flashed. It is possible to flash Zigbee firmware over a network socket once this is activated.
Reconnect Zigbee router - Place the router into pairing mode to join a new Zigbee network. This is only created if the SLZB device is in Zigbee router mode.
The following switches will be created:
Auto Zigbee update - This allows the core firmware on SLZB to manage Zigbee firmware updates and it will automatically install updates when they are released.
Disable LEDs - Disable all LEDs on the SLZB device.
LED night mode - Enables night mode, which turns off the LEDs overnight, based on the times set in SLZB web UI.
Enable VPN - Enable WireGuard VPN client (requires configuration via the SMLIGHT web UI).
Switches update in real-time if the settings are changed from the SLZB device web interface.
The following update entities will be created:
Core firmware - Core firmware updates of SLZB firmware
Zigbee firmware - Firmware updates of Zigbee chip
The updates offered in Home Assistant will match your currently installed firmware. This is based on the firmware channel (dev, release) and for Zigbee also on the firmware type (coordinator, router, Thread). If you wish to switch channels, install the different firmware type in the SMLIGHT web UI. You will get notifications when new firmware updates are available to install.
SLZB-Ultima devices support additional peripherals not found on other SLZB adapters, including an Ambilight LED strip, an infrared remote controller, and a buzzer. Support for these peripherals is being added progressively. The following entities are currently available.
Lights
Ambilight - Controls the LED strip on the front of the Ultima device, including selecting built-in effects. The color2 , speed , and direction properties used by some effects are not yet supported.
Infrared
IR Emitter : This entity can be used by other integrations as an Infrared proxy to send IR commands through the SLZB-Ultima device. For example, you can use the LG Infrared integration with this entity type to control your TV.
The SMLIGHT SLZB integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Play RTTTL tone ( smlight.play_rtttl )
Play a Ring Tone Text Transfer Language (RTTTL) tone on the built-in buzzer of a SMLIGHT Ultima device.
For an overview of every action across all integrations, see the actions reference .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Certain advanced features are not supported directly within this integration and must be configured through the SLZB device’s web UI:
Switching the firmware update channel (for example, stable or development).
Changing firmware modes (for example, Zigbee coordinator, Zigbee router, or OpenThread).
Configuring security settings.
Adjusting network settings.
Setting up the WireGuard VPN client.
In the unlikely event you encounter issues after a firmware update, you can always downgrade the firmware to a previously stable version using the device’s web UI.
If you require access to the SLZB device over IPv6, this can be enabled on the device’s web UI.
For any problems with the integration, open an issue on GitHub and include the device diagnostics from the SMLIGHT integration page. Including diagnostics will help identify and address the issue more efficiently.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SMLIGHT SLZB device was introduced in Home Assistant 2024.9, and it's used by
4.7% of the active installations.
Its IoT class is Local Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tl-sl
Categories
Binary sensor
Button
Light
Sensor
Switch
Update
Back to top
