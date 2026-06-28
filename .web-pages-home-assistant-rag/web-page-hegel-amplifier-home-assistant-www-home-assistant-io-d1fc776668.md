# Hegel Amplifier - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hegel
- Final URL: https://www.home-assistant.io/integrations/hegel
- Canonical URL: https://www.home-assistant.io/integrations/hegel/
- Fetched at: 2026-06-28T02:48:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on integrating Hegel amplifiers into Home Assistant.

## Extracted Text

On this page
Configuration
Prerequisites
Supported models
Features
Real-time control
Connection reliability
Model-specific features
Using the integration
Automation examples
Network configuration
Firewall requirements
Static IP recommendation
Troubleshooting
Setup issues
Connection problems
Control issues
Debug logging
The Hegel integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Hegel Music Systems amplifiers from Home Assistant. It uses Hegel’s official IP control protocol over TCP and supports real-time push updates for a responsive experience.
This integration provides complete control over your Hegel amplifier including power management, volume control, input selection, and mute functionality, all with instant feedback when changes are made via the front panel or remote control.
To add the Hegel Amplifier device to your Home Assistant instance, use this My button:
Hegel Amplifier can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Hegel Amplifier .
Follow the instructions on screen to complete the setup.
Host
Hostname or IP address of your Hegel amplifier.
Model
Your specific Hegel amplifier model for proper input mapping.
Your Hegel amplifier must be connected to the same network as Home Assistant.
The amplifier must support IP control (models H95, H120, H190, H190V, H390, H590, and Röst).
TCP port 50001 must be accessible between Home Assistant and your amplifier.
UPnP/SSDP should be enabled on your network for automatic discovery.
The following Hegel amplifiers are confirmed to work with this integration:
Röst
H95
H120
H190
H190V
H390
H590
Other Hegel models with IP control support may also work. If your model is not listed but supports network control, try the integration and report compatibility via the Home Assistant Community Forum.
The integration provides instant bidirectional communication with your amplifier:
Power control : Turn your amplifier on or off
Volume control : Set precise volume levels (0-100%) with fine adjustment capability
Mute toggle : Quickly mute and unmute audio
Source selection : Switch between available inputs based on your specific model
Live status updates : Changes made via front panel, remote, or other sources instantly appear in Home Assistant
The integration features robust connection management:
Automatic discovery : Finds compatible amplifiers on your network via SSDP/UPnP
Connection recovery : Automatically reconnects if network connection is temporarily lost
Exponential backoff : Smart retry logic prevents network spam during outages
Connection validation : Tests connectivity during setup to prevent configuration issues
Each Hegel model has specific input configurations that are automatically mapped:
H95 : Analog 1, Analog 2, Coaxial, Optical 1-3, USB, Network
H190 : Balanced, Analog 1-2, Coaxial, Optical 1-3, USB, Network
H190V : XLR, Analog 1-2, Coaxial, Optical 1-3, USB, Network, Phono
H390 : XLR, Analog 1-2, BNC, Coaxial, Optical 1-3, USB, Network
H590 : XLR 1-2, Analog 1-2, BNC, Coaxial, Optical 1-3, USB, Network
Röst : Balanced, Analog 1-2, Coaxial, Optical 1-3, USB, Network
Turn on amplifier with TV:
automation : - alias : " Turn on Hegel with TV" trigger : platform : state entity_id : media_player.tv to : " on" action : - action : media_player.turn_on target : entity_id : media_player.hegel_amplifier - action : media_player.select_source target : entity_id : media_player.hegel_amplifier data : source : " Optical 1"
Automatic volume adjustment for different sources:
automation : - alias : " Adjust Hegel volume by source" trigger : platform : state entity_id : media_player.hegel_amplifier attribute : source action : choose : - conditions : - condition : state entity_id : media_player.hegel_amplifier attribute : source state : " Network" sequence : - action : media_player.volume_set target : entity_id : media_player.hegel_amplifier data : volume_level : 0.6 - conditions : - condition : state entity_id : media_player.hegel_amplifier attribute : source state : " Phono" sequence : - action : media_player.volume_set target : entity_id : media_player.hegel_amplifier data : volume_level : 0.4
Late night quiet mode:
automation : - alias : " Hegel quiet mode at night" trigger : platform : time at : " 22:00:00" condition : condition : state entity_id : media_player.hegel_amplifier state : " on" action : - action : media_player.volume_set target : entity_id : media_player.hegel_amplifier data : volume_level : 0.3
Ensure the following network access is available:
TCP port 50001 : Home Assistant → Hegel amplifier (for control commands)
UDP port 1900 : For SSDP discovery (optional, for automatic setup)
Multicast traffic : For UPnP discovery (optional)
For best reliability, configure your Hegel amplifier with a static IP address or DHCP reservation to prevent connection issues if the IP address changes.
Integration cannot find amplifier during automatic discovery:
Verify the amplifier is powered on and connected to the network
Check that UPnP/SSDP is enabled on your router
Ensure Home Assistant and the amplifier are on the same network segment
Try manual setup using the amplifier’s IP address
“Cannot connect to amplifier” error during setup:
Verify the IP address is correct
Test connectivity: telnet <amplifier_ip> 50001 should connect
Check firewall settings on your router and Home Assistant host
Ensure the amplifier model supports IP control
Try power cycling the amplifier
Integration frequently loses connection:
Check network stability between Home Assistant and amplifier
Verify the amplifier has a static IP or DHCP reservation
Check router logs for connection drops
Consider network infrastructure issues (Wi-Fi range, switch problems)
Delayed response to manual changes:
The integration uses push updates - delays suggest connection issues
Check debug logs for connection problems
Verify network latency between devices
Wrong input names or missing inputs:
Ensure you selected the correct Hegel model during setup
Different models have different available inputs
You can reconfigure the integration to change the model
Entity names can be customized in Home Assistant’s device settings
Volume or mute commands not working:
Verify the amplifier is powered on
Check for firmware issues - try manual control via front panel
Some models may have maximum volume limits set
Enable debug logging to diagnose connection and control issues:
logger : logs : homeassistant.components.hegel : debug
Debug logs show:
Connection attempts and status
Command transmission (TX) and responses (RX)
Push notification handling
Reconnection attempts with timing
Error conditions and recovery
Key log messages:
Opening connection to <ip>:50001 - Normal connection establishment
Connected to Hegel at <ip>:50001 - Successful connection
TX: <command> - Commands sent to amplifier
RX (push): <response> - Real-time updates from amplifier
Connection attempt failed: <error> — retrying in X.Xs - Temporary connection loss with automatic retry
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hegel Amplifier device was introduced in Home Assistant 2026.3, and it's used by
20 active installations.
Its IoT class is Local Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@boazca
Categories
Media player
Back to top
