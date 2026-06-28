# DHCP discovery - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dhcp
- Final URL: https://www.home-assistant.io/integrations/dhcp
- Canonical URL: https://www.home-assistant.io/integrations/dhcp/
- Fetched at: 2026-06-28T02:37:09Z
- Content type: text/html; charset=UTF-8

## Description

Discover integrations on the network using DHCP protocol.

## Extracted Text

On this page
Configuration
Troubleshooting
DHCP Browser
The DHCP discovery integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will watch the network for DHCP requests for supported devices and services. Discovered integrations will show up in the discovered section on the integrations page in the configuration panel.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is by default enabled, unless you’ve disabled or removed the default_config: line from your configuration. If that is the case, the following example shows you how to enable this integration manually in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry dhcp :
The DHCP Browser displays devices discovered by Home Assistant using various network methods, such as DHCP, ARP + PTR lookups, and router-based device trackers. When a device connects to the network and requests an IP address via DHCP (Dynamic Host Configuration Protocol), Home Assistant can automatically detect it. All devices discovered through these methods will appear in the DHCP Browser.
To open the DHCP Browser, go to:
Settings > System > Network > DHCP Browser
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DHCP discovery system was introduced in Home Assistant 2021.2, and it's used by
1.2% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
Categories
Network
Back to top
