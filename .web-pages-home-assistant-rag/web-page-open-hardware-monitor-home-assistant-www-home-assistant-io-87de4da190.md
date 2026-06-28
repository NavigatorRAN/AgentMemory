# Open Hardware Monitor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/openhardwaremonitor
- Final URL: https://www.home-assistant.io/integrations/openhardwaremonitor
- Canonical URL: https://www.home-assistant.io/integrations/openhardwaremonitor/
- Fetched at: 2026-06-28T03:06:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Open Hardware Monitor within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Open Hardware Monitor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses your Open Hardware Monitor installation as a source for sensors that will display system information.
OpenHardwareMonitor must be running on the host, with “Remote web server” active. You also need to open inbound port (TCP 8085) on the host..
To open port (on Windows):
Navigate to Control Panel, System and Security and Windows Firewall.
Select Advanced settings and highlight Inbound Rules in the left pane.
Right click Inbound Rules and select New Rule.
Add the port you need to open and click Next.
Add the protocol (TCP) and the port number (8085) into the next window and click Next.
Select Allow the connection in the next window and hit Next.
Select the network type as you see fit and click Next.
Name the rule and click Finish.
To open port with firewalld (Linux):
sudo firewall-cmd --permanent --add-port = 8085/tcp
sudo firewall-cmd --reload
To add Open Hardware Monitor to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : openhardwaremonitor host : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or hostname of the system where Open Hardware Monitor is running.
port integer ( Optional )
The port of your Open Hardware Monitor API. Defaults to 8085.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Open Hardware Monitor integration was introduced in Home Assistant 0.48, and it's used by
226 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
