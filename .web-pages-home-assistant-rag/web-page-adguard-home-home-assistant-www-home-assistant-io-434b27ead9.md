---
source_url: "https://www.home-assistant.io/integrations/adguard"
final_url: "https://www.home-assistant.io/integrations/adguard"
canonical_url: "https://www.home-assistant.io/integrations/adguard/"
source_handle: "web:www-home-assistant-io:434b27ead97b"
source_section: "integrations-adguard"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "55791c14bb61c6033829dee219a29ffcabdd1c6856adef982e593b110abafeed"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# AdGuard Home - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/adguard
- Final URL: https://www.home-assistant.io/integrations/adguard
- Canonical URL: https://www.home-assistant.io/integrations/adguard/
- Fetched at: 2026-06-28T02:26:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate AdGuard Home with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Sensors
Switches
Update
List of actions
Examples
Block social media during work hours
Enable strict filtering when guests arrive
Monitor DNS performance
Data updates
Known limitations
Troubleshooting
Integration fails to connect
Sensors show unavailable
Actions fail with “Filter URL not found”
Removing the integration
To remove an integration instance from Home Assistant
The AdGuard Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you monitor and control your AdGuard Home instance from Home Assistant.
AdGuard Home is network-wide software for blocking advertisements and tracking. It works at the DNS level, so once your devices use it as their DNS server, every phone, laptop, tablet, and smart device on your network is protected automatically, with nothing to install on each one. It blocks advertisements, trackers, and known malicious domains across the board.
With this integration, you can keep an eye on how much AdGuard Home is blocking right from your dashboard, and turn its protection features on or off without opening the AdGuard Home interface. Picture stricter filtering switching on the moment guests join your Wi-Fi, parental controls turning on while the kids do their homework, and a notification reaching you when DNS lookups start to slow down. Because every feature is available to your automations, you decide when and how your network protects itself.
Before you set up the integration, make sure you have:
AdGuard Home installed and running on your network
The IP address or hostname of your AdGuard Home instance
Admin access to AdGuard Home
To add the AdGuard Home service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AdGuard Home .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your AdGuard Home instance. For example: 192.168.1.100 or adguard.local .
Port
The port AdGuard Home is running on. Default is 3000 for the web interface.
Username
Your AdGuard Home admin username.
Password
Your AdGuard Home admin password.
Verify SSL certificate
Enable SSL certificate verification when connecting via HTTPS.
This integration provides sensors that give you insight into what AdGuard Home is doing on your network:
DNS queries : The total number of DNS lookups AdGuard Home has handled.
DNS queries blocked : How many of those lookups were blocked.
DNS queries blocked ratio : The share of all queries that were blocked, as a percentage.
Safe browsing blocked : The number of requests blocked for matching known phishing or malware sites.
Safe searches enforced : How many times safe search was enforced on search engines.
Parental control blocked : The number of requests blocked by parental control.
Rules count : The total number of active filter rules currently loaded.
Average processing speed : The average response time of the AdGuard Home DNS server, in milliseconds.
The integration provides switches to control AdGuard Home features:
Protection : The master switch that controls all AdGuard Home protection at once.
Filtering : Enables DNS filtering using your blocklists.
Safe browsing : Blocks known phishing and malware sites.
Parental control : Blocks adult content.
Safe search : Enforces safe search on search engines.
Query log : Records DNS queries, which AdGuard Home needs to produce statistics.
These switches enable powerful automations. For example, you could automatically enable parental controls during school hours or disable ad blocking for specific time periods.
The Protection switch acts as a master control. When turned off, it bypasses all AdGuard Home protection, regardless of the individual switch states.
Important
Turning off Query log stops all sensor updates. AdGuard Home requires query logging to provide statistics.
The integration provides an update An update entity is an entity that indicates if an update is available for a device or service. [Learn more] entity to check for and install AdGuard Home software updates.
Note
For Docker-based installations of AdGuard Home, no update entity is available for the AdGuard Home software. If you have installed the AdGuard Home app for Home Assistant (formerly known as AdGuard Home add-on) on Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. , Home Assistant provides an update entity for the AdGuard Home app for Home Assistant.
The AdGuard Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add URL ( adguard.add_url )
Adds a new filter subscription to AdGuard Home.
Disable URL ( adguard.disable_url )
Disables a filter subscription in AdGuard Home.
Enable URL ( adguard.enable_url )
Enables a filter subscription in AdGuard Home.
Refresh ( adguard.refresh )
Refreshes all filter subscriptions in AdGuard Home.
Remove URL ( adguard.remove_url )
Removes a filter subscription from AdGuard Home.
For an overview of every action across all integrations, see the actions reference .
This automation blocks social media sites during business hours:
automation : - alias : " Block social media during work" triggers : - trigger : time at : " 09:00:00" actions : - action : adguard.add_url data : name : " Social media blocklist" url : " https://raw.githubusercontent.com/example/social-media-blocklist/main/list.txt" - action : adguard.refresh - alias : " Unblock social media after work" triggers : - trigger : time at : " 17:00:00" actions : - action : adguard.remove_url data : url : " https://raw.githubusercontent.com/example/social-media-blocklist/main/list.txt"
Automatically enable all protection features when guests connect to your network:
automation : - alias : " Enable strict filtering for guests" triggers : - trigger : state entity_id : group.guest_devices from : " not_home" to : " home" actions : - action : switch.turn_on target : entity_id : - switch.adguard_parental_control - switch.adguard_safe_browsing - switch.adguard_safe_search
Send a notification if DNS response time exceeds threshold:
automation : - alias : " Alert on slow DNS" triggers : - trigger : numeric_state entity_id : sensor.adguard_average_processing_speed above : 50 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " DNS Performance Alert" message : " AdGuard DNS response time is {{ states('sensor.adguard_average_processing_speed') }}ms"
The AdGuard Home integration polls for updates every 10 seconds to provide near real-time statistics and ensure switch states remain synchronized.
AdGuard Home only filters devices that use it as their DNS server. A device on mobile data, connected through a VPN, or set to use a different DNS server bypasses AdGuard Home entirely. For those devices, your blocklists, parental controls, and safe browsing settings do not apply.
Symptom: “Cannot connect to AdGuard Home”
When setting up the integration, you receive a connection error.
Resolution
Verify AdGuard Home is running:
Access the AdGuard Home web interface at http://YOUR_IP:3000 .
Check the service status on your server.
Check network connectivity:
Ensure Home Assistant can reach the AdGuard Home instance.
Verify no firewall rules block port 3000.
Confirm credentials:
Test login via the AdGuard Home web interface.
Ensure you’re using admin credentials.
If sensors display as unavailable:
Check that Query log switch is enabled.
Verify AdGuard Home is processing DNS queries.
Ensure at least one device uses AdGuard Home as DNS server.
This error occurs when trying to enable, disable, or remove a non-existent filter URL. Verify the exact URL using the AdGuard Home web interface under Filters > DNS blocklists .
This integration follows standard integration removal. After removal, your AdGuard Home instance continues running with its current configuration.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AdGuard Home service was introduced in Home Assistant 0.95, and it's used by
4.3% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Network
Sensor
Switch
Back to top
