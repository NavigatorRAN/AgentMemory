---
source_url: "https://www.home-assistant.io/integrations/tplink_omada"
final_url: "https://www.home-assistant.io/integrations/tplink_omada"
canonical_url: "https://www.home-assistant.io/integrations/tplink_omada/"
source_handle: "web:www-home-assistant-io:4fec9dbd0866"
source_section: "integrations-tplink-omada"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a12b169c207f4e4bebb50e0f1efe711107a76e75560f573cd84827f75116274b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# TP-Link Omada - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tplink_omada
- Final URL: https://www.home-assistant.io/integrations/tplink_omada
- Canonical URL: https://www.home-assistant.io/integrations/tplink_omada/
- Fetched at: 2026-06-28T03:23:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on integrating TP-Link Omada SDN networking devices to Home Assistant.

## Extracted Text

On this page
Prerequisites
Supported Controllers
Configuration
Multiple Sites
Supported Omada devices
Network switches
Internet gateways
Device trackers
Data updates
List of actions
Removing the integration
To remove an integration instance from Home Assistant
The TP-Link Omada integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your TP-Link Omada SDN Devices such as network switches, access points, and internet gateways.
The integration provides basic configuration and status of Omada devices controlled by the controller. All supported devices connected to the controller will be added to Home Assistant.
You need a local TP-Link Omada SDN infrastructure
A local Omada controller
The TP-Link Omada Cloud Management SaaS Platform is not supported
It is recommended to create a dedicated account for Home Assistant to use
The user needs permissions to view and configure the site that you want to manage
Note
A local account must be used for login. Do not turn on two-factor authentication for local accounts, or the integration will not be able to log in.
TP-Link Omada Controller:
OC200
OC220
OC300
Software Controller
Controller versions 5.1.0 and later are supported.
To add the TP-Link Omada hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select TP-Link Omada .
Follow the instructions on screen to complete the setup.
Host
Enter the URL of the Omada management interface. You can get this from your Omada web management interface.
Verify SSL Certificates
Un-check this box if you are using an HTTPS URL and you have not installed a matching device certificate for the Omada controller.
Username
Enter the username of the Omada controller user for Home Assistant to connect as. Make sure the user has sufficient privileges to manage the Omada network.
Password
Enter the password for the user.
Site
If your controller manages multiple sites, you will need to select which site to manage from the drop-down.
The integration manages all of the devices in an Omada site. If you have multiple sites managed by your controller, you can set up an instance of the integration to manage each site, if needed.
All adopted Omada devices expose:
Device status sensors
CPU and Memory percentage sensors
Firmware updates
Support for enabling/disabling Power over Ethernet on a per-port basis
WAN/LAN Port connectivity sensors
WAN Port Online detection sensors
WAN Port Connect/Disconnect switches
LAN Port PoE activity sensor
The integration can track Wi-Fi devices connected to access points managed by the TP-Link Omada controller. All known Wi-Fi clients will be initially created in a disabled state. You then need to enable the entities that you want to track.
The TP-Link Omada integration fetches data from the Omada Controller every 5 minutes by default. If you want to increase the polling frequency of client updates, follow these instructions . You only need to request a refresh from one of the tracked devices, all of the tracked devices will be refreshed at the same time.
Note: The TP-Link Omada controller takes a few minutes to detect when a client disconnects from the Wi-Fi network, even with more regular polling updates.
The TP-Link Omada integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reconnect wireless client ( tplink_omada.reconnect_client )
Forces a wireless client to reconnect to the Omada network.
For an overview of every action across all integrations, see the actions reference .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
If you created a user account on your Omada controller for the integration to use, you could remove this.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The TP-Link Omada hub was introduced in Home Assistant 2023.3, and it's used by
3033 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@MarkGodwin
Categories
Hub
Update
Back to top
