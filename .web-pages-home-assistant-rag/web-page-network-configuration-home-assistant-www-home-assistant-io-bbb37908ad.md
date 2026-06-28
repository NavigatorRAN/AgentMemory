# Network Configuration - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/network
- Final URL: https://www.home-assistant.io/integrations/network
- Canonical URL: https://www.home-assistant.io/integrations/network/
- Fetched at: 2026-06-28T03:02:50Z
- Content type: text/html; charset=UTF-8

## Description

Network configuration for Home Assistant

## Extracted Text

On this page
Auto detection
Configuration
The Network configuration integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides network configuration for integrations such as Zeroconf . It is managed by going to Settings > System > Network .
Auto detection is based on the system routing next hop for the mDNS broadcast address ( 224.0.0.251 ).
If the next-hop has non-loopback, non-link-local, non-multicast addresses, auto detection will use the interface that corresponds to the next-hop (commonly referred to as the default interface).
If the next-hop cannot be detected or is a loopback address, auto detection will use all interfaces with non-loopback, non-link-local, non-multicast addresses.
This integration is by default enabled, unless you’ve disabled or removed the default_config: line from your configuration. If that is the case, the following example shows you how to enable this integration manually:
Add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry network :
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Network Configuration system was introduced in Home Assistant 2021.6, and it's used by
1.1% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Other
Back to top
