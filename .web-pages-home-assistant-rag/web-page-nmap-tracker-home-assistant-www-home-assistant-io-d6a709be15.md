# Nmap Tracker - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nmap_tracker
- Final URL: https://www.home-assistant.io/integrations/nmap_tracker
- Canonical URL: https://www.home-assistant.io/integrations/nmap_tracker/
- Fetched at: 2026-06-28T03:03:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Nmap into Home Assistant.

## Extracted Text

On this page
Configuration
As an alternative to the router-based device tracking, it is possible to directly scan the network for devices by using Nmap. The IP addresses to scan can be specified in any format that Nmap understands, including the network-prefix notation ( 192.168.1.1/24 ) and the range notation ( 192.168.1.1-255 ).
Note
Please keep in mind that modern smart phones will usually turn off WiFi when they are idle. Simple trackers like this may not be reliable on their own.
To add the Nmap Tracker integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nmap Tracker .
Follow the instructions on screen to complete the setup.
An example of how the Nmap scanner can be customized:
Network addresses to scan
Network range to scan using CIDR notation . In the example above it will scan addresses from 192.168.100.0 to 192.168.103.255 .
Minimum number of minutes between scans of active devices
Frequency of the scans. The lower the number, the quicker it will detect devices connected and disconnected usually at the cost of the devices battery life. The example above will scan every minute.
Network addresses to exclude from scanning
A comma-separated list of IP addresses not to scan. The above example will skip 192.168.100.150 .
Raw configurable scan options for Nmap
Nmap command line parameters which can be used to configure how Nmap scans the network. For more details see Nmap reference guide .
See the device tracker integration page for instructions how to configure the people to be tracked.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nmap Tracker integration was introduced in Home Assistant 0.7, and it's used by
1.5% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
