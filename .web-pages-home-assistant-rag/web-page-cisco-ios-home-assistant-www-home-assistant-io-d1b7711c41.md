---
source_url: "https://www.home-assistant.io/integrations/cisco_ios"
final_url: "https://www.home-assistant.io/integrations/cisco_ios"
canonical_url: "https://www.home-assistant.io/integrations/cisco_ios/"
source_handle: "web:www-home-assistant-io:d1b7711c414e"
source_section: "integrations-cisco-ios"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "099132c94b306a2ac4e816f20138a7d11d88f6de7f04d00448018a76cd6d8057"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Cisco IOS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cisco_ios
- Final URL: https://www.home-assistant.io/integrations/cisco_ios
- Canonical URL: https://www.home-assistant.io/integrations/cisco_ios/
- Fetched at: 2026-06-28T02:33:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Cisco IOS routers into Home Assistant.

## Extracted Text

On this page
Related topics
This is a presence detection scanner for Cisco IOS devices.
Important
This device tracker needs SSH to be enabled on the router.
Before using this scanner it is recommended that you lower the ARP cache timeout on your router, as Cisco IOS normally comes with a 4 hour default ARP cache timeout.
For example, the following commands will lower the timeout to 2 minutes on Vlan1:
# 1. use this command to see what Vlan your devices are on
show ip arp
# 2. Go into configure mode
conf t
# 3. Use the Vlan name as you see it from step 1 above
interface Vlan1
# 4. Set a new arp cache timeout
arp timeout 120
# 5. Exit # Press <ctrl+c> to exit configure mode # 6. Don't forget to save the new config, so that it will survive a reboot
copy running-config startup-config
Note
If you have a very large number of devices on your VLan (+1000), then you may want to adjust the ARP cache timeout to suit your needs. See this discussion to learn more.
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : cisco_ios host : ROUTER_IP_ADDRESS username : YOUR_ADMIN_USERNAME password : YOUR_ADMIN_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your router, for example, 192.168.1.1 .
username string Required
The username of a user with administrative privileges.
password string Required
The password for your given admin account.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Cisco IOS integration was introduced in Home Assistant 0.33, and it's used by
11 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fbradyirl
Categories
Presence detection
Back to top
