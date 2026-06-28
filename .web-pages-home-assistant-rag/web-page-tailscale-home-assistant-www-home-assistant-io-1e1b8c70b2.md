---
source_url: "https://www.home-assistant.io/integrations/tailscale"
final_url: "https://www.home-assistant.io/integrations/tailscale"
canonical_url: "https://www.home-assistant.io/integrations/tailscale/"
source_handle: "web:www-home-assistant-io:1e1b8c70b276"
source_section: "integrations-tailscale"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b5a3b7176e9014bb5f0d3c94a090443a12bbd80d41db87e61112535bc018b63e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Tailscale - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tailscale
- Final URL: https://www.home-assistant.io/integrations/tailscale
- Canonical URL: https://www.home-assistant.io/integrations/tailscale/
- Fetched at: 2026-06-28T03:20:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Tailscale within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Sensors
Binary sensors
Examples
Notify when a Tailscale client update is available
Data updates
Known limitations
Troubleshooting
Integration fails to connect
Removing the integration
To remove an integration instance from Home Assistant
The Tailscale integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] monitors the devices in your Tailscale network (Tailnet) from Home Assistant. Tailscale is a VPN service that creates secure connections between your devices using WireGuard.
For each device in your Tailnet, the integration shows details such as when the device was last seen, its Tailscale IP address, when its key expires, and whether a client update is available. You can use this to keep an eye on your network, or to get notified when a device needs attention, such as an update or an expiring key.
Important
This integration monitors your Tailscale network. It does not make Home Assistant itself reachable over Tailscale.
To reach Home Assistant remotely through Tailscale, install Tailscale on your Home Assistant device by following the Tailscale installation guide .
To set up the integration, you need two things from the Tailscale admin console :
API access token : Create one under Settings > Keys in the admin console. Select Generate access token , then copy the token. Tailscale API access tokens are valid for 90 days, after which Home Assistant asks you to enter a new one.
Tailnet name : The name of your Tailscale network. You can find it in the top-left corner of the admin console, next to the Tailscale logo. It is usually an email address or an organization name.
To add the Tailscale hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tailscale .
Follow the instructions on screen to complete the setup.
API key
Your Tailscale API access token from the admin console.
Tailnet
The name of your Tailnet, such as an email address or organization name.
The integration creates a device in Home Assistant for each device in your Tailnet, with the following entities.
Last seen : The date and time the device was last seen on your Tailnet.
IP address : The Tailscale IP address of the device.
Expires : The date and time the device’s key expires.
Client : Whether a Tailscale client update is available for the device.
Key expiry disabled : Whether key expiry is turned off for the device, meaning its key does not expire.
Supports IPv6 : Whether the device’s client supports IPv6.
Supports UDP : Whether the device’s client supports UDP.
Supports UPnP : Whether the device’s client supports UPnP.
Supports NAT-PMP : Whether the device’s client supports NAT-PMP.
Supports PCP : Whether the device’s client supports PCP.
Send a notification when an update becomes available for one of your devices, so you can keep your Tailscale clients up to date:
alias : " Tailscale update available" triggers : - trigger : state entity_id : binary_sensor.work_laptop_client to : " on" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Tailscale" message : " A Tailscale client update is available for the work laptop."
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Tailscale API every minute for the latest device and network information.
The integration is read-only. You cannot change devices or your Tailnet from Home Assistant.
There is no online or offline sensor for devices. To tell whether a device is currently connected, use the Last seen sensor.
Tailscale API access tokens are valid for 90 days. When a token expires, the integration stops updating and asks you to enter a new token.
If setup fails with a connection or authentication error:
Make sure the API access token is copied correctly, without extra spaces.
Check that the token has not expired. Tailscale API access tokens are valid for 90 days. Create a new one in the Tailscale admin console if needed.
Confirm that the Tailnet name matches the one shown in the top-left corner of the admin console.
Make sure your Home Assistant instance can reach the internet.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Removing the integration does not revoke your Tailscale API access token. If you no longer need it, revoke it in the Tailscale admin console .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tailscale hub was introduced in Home Assistant 2021.12, and it's used by
4383 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Binary sensor
Network
Sensor
Back to top
