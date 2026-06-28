---
source_url: "https://www.home-assistant.io/integrations/autoskope"
final_url: "https://www.home-assistant.io/integrations/autoskope"
canonical_url: "https://www.home-assistant.io/integrations/autoskope/"
source_handle: "web:www-home-assistant-io:487ac94891d9"
source_section: "integrations-autoskope"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0c4bfdeab67316977d5916067d8f25789e3322c9ec37d0aaf2e4d9f5cb284335"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Autoskope - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/autoskope
- Final URL: https://www.home-assistant.io/integrations/autoskope
- Canonical URL: https://www.home-assistant.io/integrations/autoskope/
- Fetched at: 2026-06-28T02:30:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Autoskope devices into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Entities
Examples
Notify when the vehicle arrives home
Data updates
Known limitations
Troubleshooting
Connection failed during setup
Vehicles not appearing
Removing the integration
To remove an integration instance from Home Assistant
The Autoskope integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Autoskope vehicle tracking devices with Home Assistant. Autoskope provides GPS tracking devices and cloud services for vehicles and other assets, offering GPS-based vehicle location tracking.
This integration works with all hardware devices offered by Autoskope.
You need an active Autoskope account with at least one vehicle registered in the Autoskope web portal .
To add the Autoskope hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Autoskope .
Follow the instructions on screen to complete the setup.
Username
Your Autoskope account username.
Password
Your Autoskope account password.
Host
The URL of the Autoskope API server. For most users, the default value https://portal.autoskope.de is correct.
The Autoskope integration provides the following entities for each vehicle registered in your account.
Device trackers
A device tracker entity is created for each vehicle. It tracks the current location of the vehicle and reports the zone it is in ( home , not_home , or a custom zone name). If no position data is available, the state is unavailable .
The following attributes are provided:
source_type : Source of the location data (for example, gps ).
latitude : Latitude coordinate of the vehicle.
longitude : Longitude coordinate of the vehicle.
gps_accuracy : Estimated accuracy of the GPS signal in meters.
alias : " Notify when vehicle arrives home" triggers : - trigger : state entity_id : device_tracker.my_vehicle to : " home" actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " The vehicle has arrived home."
The Autoskope integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Autoskope API every 60 seconds to retrieve the latest location and status data for all registered vehicles.
Due to the 60-second polling interval, there will be a delay of up to 60 seconds before location or status changes are reflected in Home Assistant.
Make sure the Host URL is correct. For most users, the default value https://portal.autoskope.de is correct. Also verify your username and password, and confirm that your Home Assistant instance can reach the Autoskope host (no firewall or DNS issues).
Log in to the Autoskope web portal or app and confirm that the vehicle is correctly registered, active, and associated with the account you used to set up the integration.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Entities and devices associated with vehicles that are removed from your Autoskope account will be automatically removed from Home Assistant during the next update cycle.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Autoskope hub was introduced in Home Assistant 2026.4, and it's used by
4 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mcisk
Categories
Device tracker
Back to top
