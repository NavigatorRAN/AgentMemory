---
source_url: "https://www.home-assistant.io/integrations/hdfury"
final_url: "https://www.home-assistant.io/integrations/hdfury"
canonical_url: "https://www.home-assistant.io/integrations/hdfury/"
source_handle: "web:www-home-assistant-io:70d8d154fa75"
source_section: "integrations-hdfury"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7757da20fb54036147c659e5bceac39a2c73ab452e296c5c7a4d149f94d68a09"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# HDFury - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hdfury
- Final URL: https://www.home-assistant.io/integrations/hdfury
- Canonical URL: https://www.home-assistant.io/integrations/hdfury/
- Fetched at: 2026-06-28T02:48:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate HDFury devices within Home Assistant.

## Extracted Text

On this page
Use cases
Supported devices
Configuration
Supported functionality
Button
Number
Select
Sensors
Switches
Data updates
Examples
Switch HDMI input
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The HDFury integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor your HDFury device.
Monitor current device state.
Control the HDMI port selectors and operation state.
Control audio muting, and display/relay configuration.
Monitor HDMI input, output, and audio signal status.
VRROOM
Diva
Vertex 2
To add the HDFury device to your Home Assistant instance, use this My button:
HDFury can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select HDFury .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of the HDFury Device.
The integration will fetch data from each device.
Below is a complete overview of the entities this integration provides.
Issue hotplug (Sends a command to hotplug TX & RX connected devices)
Restart (Reboot the device remotely)
Unmute delay (Controls time offset before sending audio data to SINK0)
eARC unmute delay (Controls time offset before sending audio data to eARC TX)
OLED fade timer (Controls time before the front-panel OLED display fades out)
Restart timer (Controls interval for automatic device restarts)
Operation Mode (Controls the device Operation Mode, such as Splitter or Matrix)
Port Select TX0 (Controls the HDMI source selection for output TX0)
Port Select TX1 (Controls the HDMI source selection for output TX1)
Audio TX0 (Current audio format/status on HDMI output TX0)
Audio TX1 (Current audio format/status on HDMI output TX1)
Audio output (Current audio format/status on HDMI output AUD)
eARC/ARC status (Current eARC or ARC connection state)
EDID TXA0 (EDID received from TX0 audio channel)
EDID TXA1 (EDID received from TX1 audio channel)
EDID AUDA (EDID received from AUD audio output)
Input RX0 (Status and signal information for HDMI input RX0)
Input RX1 (Status and signal information for HDMI input RX1)
EDID TX0 (EDID received from TX0 video channel)
EDID TX1 (EDID received from TX1 video channel)
EDID AUD (EDID received from AUD video channel)
Output TX0 (Status and signal information for HDMI output TX0)
Output TX1 (Status and signal information for HDMI output TX1)
Auto switch inputs (Automatically switches to the active HDMI input)
CEC (Enables or disables HDMI-CEC on all inputs and outputs)
CEC RX0 (Enables or disables HDMI-CEC on input RX0)
CEC RX1 (Enables or disables HDMI-CEC on input RX1)
CEC RX2 (Enables or disables HDMI-CEC on input RX2)
CEC RX3 (Enables or disables HDMI-CEC on input RX3)
HTPC mode RX0 (Enables HTPC-optimized mode for HDMI input RX0)
HTPC mode RX1 (Enables HTPC-optimized mode for HDMI input RX1)
HTPC mode RX2 (Enables HTPC-optimized mode for HDMI input RX2)
HTPC mode RX3 (Enables HTPC-optimized mode for HDMI input RX3)
Infrared (Enables or disables the IR receiver)
Mute audio TX0 (Mutes audio output on HDMI output TX0)
Mute audio TX1 (Mutes audio output on HDMI output TX1)
OLED display (Turns the front-panel OLED display on or off)
Relay (Controls the onboard relay output)
TX0 force +5v (Forces the +5v line on the HDMI cable for TX0 to be active)
TX1 force +5v (Forces the +5v line on the HDMI cable for TX1 to be active)
This integration uses local polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] , meaning it checks for changes to all entities by regularly communicating with the HDFury device.
The integration will retrieve data from the device every minute.
The following examples show how to use the HDFury integration in Home Assistant automations.
These examples are just a starting point, and you can use them as inspiration to create your own automations.
The following example switches the HDFury input to the correct source when the media player powers on.
automation : - alias : " Switch HDFury input to Nvidia SHIELD when powered on" triggers : - trigger : state entity_id : - remote.nvidia_shield to : - " on" from : - " off" actions : - action : select.select_option target : entity_id : select.hdfury_port_selector_tx0 data : option : 1
The HDFury integration currently has no known limitations.
If you’re experiencing issues with your HDFury integration, try these general troubleshooting steps:
Make sure your HDFury device is powered on and properly connected to your home network.
Verify that the OLED screen on the HDFury device shows an IP address.
If the integration shows as unavailable, try restarting both your HDFury device and Home Assistant.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The HDFury device was introduced in Home Assistant 2026.2, and it's used by
95 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@glenndehaan
Categories
Sensor
Switch
Back to top
