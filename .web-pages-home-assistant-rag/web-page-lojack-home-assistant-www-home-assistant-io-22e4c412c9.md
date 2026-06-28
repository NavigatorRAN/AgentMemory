---
source_url: "https://www.home-assistant.io/integrations/lojack"
final_url: "https://www.home-assistant.io/integrations/lojack"
canonical_url: "https://www.home-assistant.io/integrations/lojack/"
source_handle: "web:www-home-assistant-io:22e4c412c972"
source_section: "integrations-lojack"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7a53a7ecc6d1bfeb8f2e94fea0a8617818b70767716fbb3a64139371f37e60e0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# LoJack - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lojack
- Final URL: https://www.home-assistant.io/integrations/lojack
- Canonical URL: https://www.home-assistant.io/integrations/lojack/
- Fetched at: 2026-06-28T02:57:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your LoJack by Spireon vehicle tracking account with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Reauthentication
Reconfiguration
Supported functionality
Entities
Data updates
Examples
Arrival and departure notifications
Known limitations
Troubleshooting
Can’t connect to LoJack servers
Invalid credentials
Stale location data
Vehicle not appearing
Enabling debug logging
Removing the integration
To remove an integration instance from Home Assistant
The LoJack integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects Home Assistant to vehicles equipped with LoJack by Spireon GPS tracking hardware. After you authenticate with your Spireon/LoJack account credentials, the integration automatically discovers every vehicle registered to your account and creates a device for each one, with a device tracker entity that shows the vehicle’s current or last known GPS location on the map.
LoJack/Spireon is a vehicle tracking and recovery service primarily available in the United States. The hardware is typically installed by a dealership at the time of vehicle purchase. You need an active Spireon/LoJack account with at least one enrolled vehicle to use this integration.
The integration supports any vehicle enrolled in a Spireon/LoJack account, including:
Vehicles with factory-installed LoJack hardware
Vehicles with dealer-installed LoJack devices
Vehicles tracked through the Spireon fleet management platform (consumer accounts)
Each vehicle registered to your account is represented as a separate device in Home Assistant, named after its year, make, and model (for example, “2021 Toyota Camry”). The manufacturer is listed as Spireon LoJack, and the vehicle’s VIN is used as the serial number.
Before setting up the integration, make sure you have the following:
An active Spireon/LoJack account with valid credentials (username and password)
At least one vehicle enrolled and active on the account
A working internet connection (the integration communicates with the Spireon cloud API)
No additional hardware is required on the Home Assistant side. The LoJack GPS hardware is installed in the vehicle.
To add the LoJack hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LoJack .
Follow the instructions on screen to complete the setup.
Username
The username (typically an email address) for your Spireon/LoJack account.
Password
The password for your Spireon/LoJack account.
If your credentials expire or you change your password, Home Assistant prompts you to re-authenticate:
Go to Settings > Devices & services and find the LoJack integration. It will show a Re-authenticate message.
Select the Reconfigure button or the re-authenticate prompt.
Enter your new password .
Select Submit .
The integration verifies the password against the same account. Your username cannot be changed during reauthentication. On success, the integration reloads automatically.
If you need to update both your username and password (for example, if you changed your Spireon account email):
Go to Settings > Devices & services and find the LoJack integration.
Select the three-dot menu and choose Reconfigure .
Update your username and/or password .
Note
If you change the username to a different account, the reconfiguration will abort with an “account mismatch” error. Each LoJack account must be a separate config entry.
The LoJack integration provides the following entities for each vehicle.
Device tracker
Each vehicle gets a device tracker entity named after the vehicle. It uses GPS as its source type and reports home , not_home , or a zone name based on the vehicle’s GPS coordinates.
The LoJack integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the Spireon cloud API every 5 minutes by default. Each poll retrieves the last known location cached on the Spireon server. It does not command the vehicle’s hardware to obtain a new GPS fix. The server-side cache is updated whenever the vehicle’s LoJack hardware periodically reports in (the reporting interval is determined by the LoJack hardware and firmware and is not configurable).
Calling the homeassistant.update_entity action re-fetches the last known location already stored on the Spireon server. This is fast and lightweight but only returns whatever location the server already has. If the vehicle has not reported in recently, you will get stale data. Use this approach when you want to check the location more frequently than every 5 minutes, or when you need a quick, low-overhead update.
automation : - alias : " Notify when vehicle arrives home" triggers : - trigger : state entity_id : device_tracker.lojack_camry to : " home" actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " Your vehicle has arrived home."
All data flows through the Spireon cloud API. If the Spireon servers are down, the integration cannot retrieve location data.
The integration uses cloud polling. There is no webhook or push mechanism, so location updates depend on the polling interval.
The LoJack hardware reporting interval is determined by the LoJack firmware and is not configurable by the user or the integration.
LoJack by Spireon is primarily available in the United States. International availability may vary.
The integration does not support creating or managing LoJack geofences. Use Home Assistant zones Zones allow you to specify certain regions on a map. They enable zone presence-detection and can be used in automations. For example, to start the vacuum after you left home or start the heating at home when you leave the office. [Learn more] for geofence functionality instead.
The integration does not support remote commands (no remote start, lock/unlock, or similar vehicle commands).
Each LoJack/Spireon account requires its own config entry. You cannot merge vehicles from multiple accounts into a single entry.
Symptom: “Failed to connect to LoJack servers”
When trying to set up or use the integration, you see a “Failed to connect to LoJack servers” error.
Description
This means the integration is unable to reach the Spireon cloud API. The issue could be with your internet connection or a temporary Spireon server outage.
Resolution
To resolve this issue, try the following steps:
Verify your internet connection is working.
Check that the Spireon/LoJack API is online by trying to log in at the Spireon website or mobile app.
If the Spireon API is experiencing a temporary outage, try again later.
Symptom: “Invalid username or password”
When trying to set up the integration, you see an “Invalid username or password” error.
The credentials you entered do not match any active Spireon/LoJack account.
Verify your credentials work on the official Spireon/LoJack website or mobile app.
Ensure you are using the correct username format (typically an email address).
If you recently changed your password, use the reauthentication flow .
If the location data seems outdated:
Keep in mind that the default polling interval is 5 minutes, so data may be up to 5 minutes old.
The Spireon server may have cached old data if the vehicle’s hardware hasn’t reported in recently. The vehicle hardware reports in on its own schedule, which is not configurable.
Use the homeassistant.update_entity action to re-fetch the latest cached location from the server.
If a vehicle on your account does not appear in Home Assistant:
Verify the vehicle is enrolled and active on your Spireon/LoJack account.
Check that the vehicle appears when you log in to the Spireon website.
Try removing and re-adding the integration.
For more information about how to enable and use debug logs, refer to the debug logs and diagnostics documentation.
To enable debug logging for the LoJack integration, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
logger : default : info logs : homeassistant.components.lojack : debug lojack_api : debug
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Removing the integration disconnects Home Assistant from the Spireon/LoJack service. Your Spireon/LoJack account and vehicle enrollment are not affected.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LoJack hub was introduced in Home Assistant 2026.4, and it's used by
9 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@devinslick
Categories
Car
Presence detection
Back to top
