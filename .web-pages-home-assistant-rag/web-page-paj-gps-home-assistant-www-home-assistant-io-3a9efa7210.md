---
source_url: "https://www.home-assistant.io/integrations/paj_gps"
final_url: "https://www.home-assistant.io/integrations/paj_gps"
canonical_url: "https://www.home-assistant.io/integrations/paj_gps/"
source_handle: "web:www-home-assistant-io:3a9efa72109e"
source_section: "integrations-paj-gps"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "dcf9da6f7ce79002886427370f18668645ca40cbd3fabb8a496f05782d4994a7"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# PAJ GPS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/paj_gps
- Final URL: https://www.home-assistant.io/integrations/paj_gps
- Canonical URL: https://www.home-assistant.io/integrations/paj_gps/
- Fetched at: 2026-06-28T03:07:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate PAJ GPS devices into Home Assistant.

## Extracted Text

On this page
Possible use cases
Supported devices
Prerequisites
Configuration
Supported functionality
Device tracker
Sensors
Examples
Data updates
Known limitations
Troubleshooting
No battery level sensor available
Removing the integration
To remove an integration instance from Home Assistant
The PAJ GPS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to incorporate PAJ GPS devices from <www.paj-gps.de> into your Home Assistant.
It provides entities for tracking the location of your PAJ GPS devices and monitoring their speed.
Track the location of your PAJ GPS devices on a map in Home Assistant.
Create automations based on the location or status of your PAJ GPS devices (for example, open garage door when car is near).
All PAJ GPS devices that are compatible with the PAJ GPS cloud platform (<www.v2.finder-portal.com>) should work with this integration.
The integration is using official API provided by PAJ GPS, so it should be compatible with all devices that are supported by the API.
If you encounter any issues with PAJ GPS devices, please report them.
To use this integration you need to have an account on <www.v2.finder-portal.com> and your device must be properly configured and connected to the platform.
You then authenticate the integration with the same credentials you use to log in on <www.v2.finder-portal.com>. This data will be saved only in your Home Assistant and is required to generate API tokens.
To add the PAJ GPS hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select PAJ GPS .
Follow the instructions on screen to complete the setup.
Email
Email address used to log in on <www.v2.finder-portal.com>.
Password
Password used to log in on <www.v2.finder-portal.com>.
The PAJ GPS integration provides the following entities.
The PAJ GPS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will track the location of each device registered to your account. The integration provides real-time GPS coordinates (latitude and longitude) for your PAJ GPS devices.
Speed
Description : The current speed of the PAJ GPS device in km/h, as reported by the GPS module.
Opening the garage door when a car with a PAJ GPS device is near using automations:
alias : Open garage door for the car description : " If car enters the home zone, open the garage door" triggers : - trigger : zone entity_id : person.car_tracker zone : zone.home event : enter actions : - action : button.press target : entity_id : button.garage_door_open
The location updates are not real-time and depend on the polling intervals, so there may be a small delay (up to 30 seconds) in receiving updates about the device’s location or status.
The integration relies on the PAJ GPS cloud API, so if there are any issues with the API or your internet connection, the integration may not work properly.
PAJ GPS devices also rely on GPS and cellular signals, so if the device is in an area with poor signal, the location updates may be inaccurate or delayed.
The battery level sensor is not currently available in this integration.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The PAJ GPS hub was introduced in Home Assistant 2026.6, and it's used by
18 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@skipperro
Categories
Sensor
Back to top
