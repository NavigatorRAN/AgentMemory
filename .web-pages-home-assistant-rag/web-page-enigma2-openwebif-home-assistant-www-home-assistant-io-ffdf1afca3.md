---
source_url: "https://www.home-assistant.io/integrations/enigma2"
final_url: "https://www.home-assistant.io/integrations/enigma2"
canonical_url: "https://www.home-assistant.io/integrations/enigma2/"
source_handle: "web:www-home-assistant-io:ffdf1afca31f"
source_section: "integrations-enigma2"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c2f431dee5d3b2dbbb85fe53c32bd957d45a9aea51aa75cf44ce69aa48f71a1f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Enigma2 (OpenWebif) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/enigma2
- Final URL: https://www.home-assistant.io/integrations/enigma2
- Canonical URL: https://www.home-assistant.io/integrations/enigma2/
- Fetched at: 2026-06-28T02:40:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an Enigma2 based box running OpenWebif into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Configuration options
Entities
Media player
Data updates
Troubleshooting
Getting a 403.6 IP address rejected error on setup
Removing the integration
To remove an integration instance from Home Assistant
The Enigma2 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Linux based set-top box which is running Enigma2 with the OpenWebif plugin installed.
OpenWebif is an open-source web interface for Enigma2 based set-top boxes.
Your device needs to have the OpenWebif plugin installed. On most devices it is installed by default, if not, it is available via the Plugins menu within your Enigma2 distribution.
Please beware that the OpenWebif setting “Require client cert for HTTPS” is not supported.
To add the Enigma2 (OpenWebif) device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Enigma2 (OpenWebif) .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your device.
Port
The port number of the OpenWebif service running. (default: 80).
Username
The username, if HTTP(S) authentication is enabled.
Password
The password, if HTTP(S) authentication is enabled.
Uses an SSL certificate
Whether HTTPS is enabled.
Verify SSL certificate
Whether the SSL certificate should be verified.
The integration provides the following configuration options:
Turn off to deep standby
Shuts the device down (called Deep Standby) on turning off the device. Important : When the device is in Deep Standby , it can no longer be reached! Turning on the device is only possible via one of the following methods: Wake on LAN, Power button on the device, or the Remote control.
Bouquet to use as media source
Sets the bouquet to use for the source list.
Currently, the following entity is exposed:
The following actions are supported:
Play/Pause
Channel up and down (using the previous/next track buttons in the media player controls)
Volume control
Channel switching via source list
The bouquet for the source list can be configured via the Configuration options.
This integration fetches data from the device every 15 seconds by default.
Description
OpenWebif has a protection by default, so that only devices in the same subnet can connect to the device.
Resolution
There are two possible solutions to resolve this problem:
Enable HTTP(S) authentication (recommended for security)
Enable the OpenWebif setting “Enable access from VPNs”
Note
If you choose to enable VPN access without authentication, ensure your network is properly secured as OpenWebif is not designed for publicly facing the internet.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Enigma2 (OpenWebif) device was introduced in Home Assistant 0.90, and it's used by
1214 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@autinerd
Categories
Back to top
