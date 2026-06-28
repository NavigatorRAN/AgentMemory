---
source_url: "https://www.home-assistant.io/integrations/libre_hardware_monitor"
final_url: "https://www.home-assistant.io/integrations/libre_hardware_monitor"
canonical_url: "https://www.home-assistant.io/integrations/libre_hardware_monitor/"
source_handle: "web:www-home-assistant-io:c76f6efefbb5"
source_section: "integrations-libre-hardware-monitor"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7e30bf276fbd57d8f57f219033f6e1972c3e42093288dd5a750cdcf34037632d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Libre Hardware Monitor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/libre_hardware_monitor
- Final URL: https://www.home-assistant.io/integrations/libre_hardware_monitor
- Canonical URL: https://www.home-assistant.io/integrations/libre_hardware_monitor/
- Fetched at: 2026-06-28T02:56:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Libre Hardware Monitor within Home Assistant.

## Extracted Text

On this page
Prerequisites
To open a port (on Windows Firewall)
Configuration
Configuration options
Supported devices
Troubleshooting
Problem with connection during setup
Sensors change to unavailable status
Integration stops working
Removing the integration
To remove an integration instance from Home Assistant
The Libre Hardware Monitor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses your Libre Hardware Monitor installation as a source for sensors to display that system information in Home Assistant.
Libre Hardware Monitor, a fork of Open Hardware Monitor, is free software that can monitor the temperature sensors, fan speeds, voltages, load and clock speeds of your computer.
Libre Hardware Monitor is installed on the system (host) you want to monitor.
Libre Hardware Monitor must be running during setup.
In Libre Hardware Monitor, make sure Options > Remote web server > Run is active.
Optionally, set up authentication for the web server. You might have to restart the server for this to take effect.
Make sure to open the inbound port (8085 by default) on the host system’s firewall.
In Libre Hardware Monitor, go to File > Hardware and check the devices you want to monitor.
In Windows, navigate to Control Panel > System and Security > Windows Defender Firewall .
Select Advanced settings and highlight Inbound Rules in the left pane.
Right-click Inbound Rules and select New Rule .
Add the port you need to open and select Next .
Add the protocol (TCP) and the port number (8085 by default) into the next window and select Next .
In the next window, select Allow the connection , then select Next .
Select the network type as you see fit and select Next .
Name the rule and select Finish .
To add the Libre Hardware Monitor device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Libre Hardware Monitor .
Follow the instructions on screen to complete the setup.
Host
IP address or hostname of the system where Libre Hardware Monitor is running. This is the system you want to monitor.
Port
The port of your Libre Hardware Monitor API. Defaults to 8085.
The integration provides the following configuration options only if authentication is required:
Username
The username used to access the Libre Hardware Monitor server. Note that this is not your Windows username.
Password
The password used to access the Libre Hardware Monitor server. Note that this is not your Windows password.
Any device that is detected by Libre Hardware Monitor is supported.
All sensors will be grouped by the device they belong to.
If you do not want all sensors for a device, you can disable entities via the UI after setup.
Check if the Libre Hardware Monitor remote web server is running and accessible.
On a device that is not the device running Libre Hardware Monitor (a smartphone is sufficient), open a browser and navigate to http://<IP address>:<Port> .
Make sure you can see and refresh the data there.
This is expected behavior when the system you are monitoring is not reachable. Usually, because it is turned off.
Sensors will resume their data readings once the system is reachable again.
Note that connection loss to the host will not trigger error logs. If you want to be notified in case the connection is lost,
you can create an automation that triggers if a sensor’s state switches to unavailable .
Make sure the IP address of the system you are monitoring has not changed. Ideally, set a static IP address for that system in your router.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Libre Hardware Monitor device was introduced in Home Assistant 2025.10, and it's used by
301 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Sab44
Categories
System monitor
Back to top
