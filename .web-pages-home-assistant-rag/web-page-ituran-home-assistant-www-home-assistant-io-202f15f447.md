---
source_url: "https://www.home-assistant.io/integrations/ituran"
final_url: "https://www.home-assistant.io/integrations/ituran"
canonical_url: "https://www.home-assistant.io/integrations/ituran/"
source_handle: "web:www-home-assistant-io:202f15f447ba"
source_section: "integrations-ituran"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6f5c7f4bbf1b615609c8f415e2abe99ec584fcaed92665ce42a5c116bbb75e41"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Ituran - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ituran
- Final URL: https://www.home-assistant.io/integrations/ituran
- Canonical URL: https://www.home-assistant.io/integrations/ituran/
- Fetched at: 2026-06-28T02:53:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Ituran to Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Data updates
Supported functionality
Binary sensor
Device tracker
Sensor
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Ituran integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to retrieve information from your Ituran-equipped vehicle using the Ituran APP service . It pulls information from the Ituran web service regarding the vehicle’s location.
You must have an Ituran account for use with the Ituran APP ( Android / iOS ). All devices that work with the app, should work with this integration as well.
To add the Ituran hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ituran .
Follow the instructions on screen to complete the setup.
ID or passport number
Your government ID or passport number used to sign-up with Ituran.
Mobile phone number
The mobile phone number used to sign-up with Ituran. A one-time-password will be sent to this number.
The information is pulled every 5 minutes from the Ituran web service; however, the data is updated at intervals determined by Ituran based on whether the vehicle is stationary or not.
The Ituran integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] exposes the following binary sensors for each registered vehicle:
Charging - Only for EV’s. The charging state of the vehicle
The Ituran integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will track the location of each vehicle registered to your account.
The Ituran integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] also exposes the following sensors for each registered vehicle:
Address - The address that corresponds with the vehicle’s location, as determined by Ituran
Battery level - Only for EV’s. The battery level (%) of the vehicle
Battery voltage - The measured voltage (V) of the car battery. If not supported by the installation, the value will be set to -1
Heading - The direction (0-359°) that the vehicle is pointing to
Last update from vehicle - The time from when the vehicle last published its information to the Ituran cloud
Mileage - The distance (km) the vehicle has traveled
Remaining range - The distance (km) the vehicle can travel until the battery is depleted
Speed - The current speed (km/h) of the vehicle
While this integration is configured with your account, you won’t be able to use the official app, as only one connection at a time is supported
As a workaround, it’s possible to add another user from the app, with a different ID and mobile phone number that will be dedicated for Home Assistant use.
The vehicle’s heading value is unreliable when it’s not in motion
The mileage value is not read from the vehicle’s odometer but is calculated from GPS, which may result in slight variations from the actual odometer reading
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ituran hub was introduced in Home Assistant 2025.1, and it's used by
20 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@shmuelzon
Categories
Car
Device Tracker
Presence detection
Back to top
