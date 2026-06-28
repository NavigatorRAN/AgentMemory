# Sure Petcare - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/surepetcare
- Final URL: https://www.home-assistant.io/integrations/surepetcare
- Canonical URL: https://www.home-assistant.io/integrations/surepetcare/
- Fetched at: 2026-06-28T03:19:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Sure Petcare cat and pet flaps into Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Pets
Pet and cat flaps
Feeders
Felaqua
Hub
List of actions
Blueprints
Pet select location (template entity)
The Sure Petcare integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to get information on your Sure Petcare Connect Pet or Cat Flap.
To add the Sure Petcare hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sure Petcare .
Follow the instructions on screen to complete the setup.
These are the entities available in the Sure Petcare integration.
Binary sensors
Presence : Whether the pet is inside (presence).
Sensors
Last seen flap device ID : Last flap device ID used by the pet (useful for the pet select location blueprint ). unknown if the last status is not from a flap update. This sensor is disabled by default.
Last seen user ID : Last user ID that manually changed the pet location (useful for the pet select location blueprint ). unknown if the last status is not from a manual update. This sensor is disabled by default.
Connectivity : Device connectivity (online); shows device RSSI when available.
Locks
Locked in : Lock state: flap locked to allow entry only.
Locked out : Lock state: flap locked to allow exit only.
Locked all : Lock state: flap locked both ways.
Battery level : Battery level percentage (derived from battery voltage).
Connectivity : Feeder connectivity (online); shows device RSSI when available.
Connectivity : Felaqua connectivity (online); shows device RSSI when available.
Felaqua : Water remaining in the bowl.
Connectivity : Hub connectivity (online); attributes include led_mode and pairing_mode .
The Sure Petcare integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set lock state ( surepetcare.set_lock_state )
Changes the locking state of a Sure Petcare flap.
Set pet location ( surepetcare.set_pet_location )
Manually sets the location of a pet to inside or outside.
For an overview of every action across all integrations, see the actions reference .
Create a select entity for a pet representing its current location.
This is especially useful if you have multiple flaps that do not directly lead outside and the existing binary sensors can’t accurately reflect your pets’ locations.
Supports up to 10 flaps.
The sync is one-way only. While the pet select location is synced from the pet binary sensor, manually changing the select entity state won’t impact the pet binary sensor (thus no impact in Sure Petcare).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sure Petcare hub was introduced in Home Assistant 0.104, and it's used by
1997 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@benleb
@danielhiversen
Categories
Binary sensor
Lock
Sensor
Back to top
