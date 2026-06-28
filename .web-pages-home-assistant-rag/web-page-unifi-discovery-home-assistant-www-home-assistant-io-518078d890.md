---
source_url: "https://www.home-assistant.io/integrations/unifi_discovery"
final_url: "https://www.home-assistant.io/integrations/unifi_discovery"
canonical_url: "https://www.home-assistant.io/integrations/unifi_discovery/"
source_handle: "web:www-home-assistant-io:518078d89032"
source_section: "integrations-unifi-discovery"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e4a67f0fbf39480c6914b1c02a9ad95c82217771ad0632709ba359fb88eb4ae9"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# UniFi Discovery - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/unifi_discovery
- Final URL: https://www.home-assistant.io/integrations/unifi_discovery
- Canonical URL: https://www.home-assistant.io/integrations/unifi_discovery/
- Fetched at: 2026-06-28T03:24:57Z
- Content type: text/html; charset=UTF-8

## Description

Discover UniFi devices on the network using the UniFi Discovery protocol.

## Extracted Text

On this page
How discovery works
Configuration
Discovered integrations
The UniFi Discovery integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] scans the local network for UniFi devices using the UniFi Discovery protocol. Discovered devices are automatically forwarded to their respective integrations, such as UniFi Access , UniFi Network , and UniFi Protect , for setup. Discovered integrations will show up in the discovered section on the integrations page in the configuration panel.
This is a system integration that runs in the background. It does not create any entities itself, but acts as a central discovery provider for UniFi-based integrations.
When Home Assistant starts, this integration begins scanning the local network for UniFi devices using the UniFi discovery protocol, similar to how the UniFi Network app finds devices. This scan repeats every 60 minutes. Additionally, the integration listens for devices joining the network through DHCP (using known Ubiquiti MAC address prefixes) and SSDP (UPnP announcements from UniFi consoles).
When a device is found, the integration checks the device’s advertised services and creates a discovery flow for the matching Home Assistant integration. For example, a device running UniFi Protect triggers a discovery flow for the UniFi Protect integration.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is by default enabled, unless you’ve disabled or removed the default_config: line from your configuration. If that is the case, the following example shows you how to enable this integration manually:
# Example configuration.yaml entry unifi_discovery :
The following integrations are automatically discovered by the UniFi Discovery integration:
UniFi Access
UniFi Network
UniFi Protect
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The UniFi Discovery system was introduced in Home Assistant 2026.5, and it's used by
2 active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@RaHehl
Categories
Network
Back to top
