---
source_url: "https://www.home-assistant.io/integrations/subaru"
final_url: "https://www.home-assistant.io/integrations/subaru"
canonical_url: "https://www.home-assistant.io/integrations/subaru/"
source_handle: "web:www-home-assistant-io:4a0e1add001c"
source_section: "integrations-subaru"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b270ffae2d2e281f17e50c7543c7200f230ef5f11e5b4da9dc0aafce81310e8c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Subaru - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/subaru
- Final URL: https://www.home-assistant.io/integrations/subaru
- Canonical URL: https://www.home-assistant.io/integrations/subaru/
- Fetched at: 2026-06-28T03:19:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up your Subaru account with Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Lock
Unlock specific door
Device tracker
Remote start
Climate preset selection
Options
FAQ - Troubleshooting
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] retrieves vehicle information and actuates remote services provided by MySubaru Connected Services (formerly known as Subaru STARLINK). This service is currently only available in the USA and Canada.
This integration requires a telematics equipped Subaru and an active vehicle subscription to the MySubaru service. Before using this integration, you must first register and have login credentials to MySubaru .
Subaru has deployed three generations of telematics with different feature sets. Use the table below to determine your vehicle’s telematics generation and capabilities. This table is a best guess.
Model Gen 1 Gen 2 Gen 3 Ascent — 2019-2023 2024+ BRZ — 2022-2023 — Crosstrek 2016-2018 2019+ — Forester 2016-2018 2019+ — Impreza 2016-2018 2019-2022 2023+ Legacy 2016-2019 2020-2022 2023+ Outback 2016-2019 2020-2022 2023+ WRX 2017-2021 2022-2023 —
Note
This integration does not support the Subaru Solterra EV or any other Subaru that uses the SubaruConnect service.
In addition to the telematics generational differences, there are differing levels of MySubaru subscriptions. Remote services (such as locks and location tracking) require either a “Companion+” or “Security” level subscription.
To add the Subaru hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Subaru .
Follow the instructions on screen to complete the setup.
Important
If your account includes multiple vehicles, the same PIN will be used for all vehicles. Ensure that you have configured all vehicles in your account to have the same PIN.
Available sensors will vary by model, year, and subscription type. The integration will add all supported sensors for your vehicle. Sensor data is usually only updated when the vehicle is turned off unless the polling option is enabled.
Sensor Gen 1 Gen 2 Gen 3 Average fuel consumption ✓ ✓ Distance to empty ✓ ✓ EV battery level ✓ ✓ EV range ✓ ✓ EV time to full charge ✓ ✓ Odometer ✓* ✓ ✓ Tire pressures ✓ ✓
* Gen 1 odometer only updates every 500 miles
This integration supports remote locking and unlocking of vehicle doors. If doors are remotely unlocked, they will automatically relock if a door is not opened within a minute. There is no remote notification of this automatic relock.
This integration does not yet support tracking the current lock/unlock state.
In addition to the standard actions built into the lock entity, this integration also provides a subaru.unlock_specific_door action to specify a door to unlock.
The action requires the door parameter which may be set to one of the following:
all : unlocks all doors
driver : unlocks only the driver’s door
tailgate : unlocks only the tailgate (not all vehicles support this option)
Tracks the most recently reported location of the vehicle. The vehicle reports its location when it is turned off. If enabled, the polling option will also update the vehicle location.
Remote start and stop is available on supported Gen 2/3 vehicles.
Currently the Remote Start action will use the built-in “Auto” climate preset. Support for selecting a climate preset will be added in the future.
Subaru integration options are set via:
Settings > Devices & services > Subaru > Options .
Enable vehicle polling [Default: off] : When enabled, vehicle polling will send a remote command to your vehicle every 2 hours to obtain new sensor data. This involves “waking” your vehicle and requesting that it send new data to Subaru servers. Without vehicle polling, new sensor data is only received when the vehicle automatically pushes data (normally after engine shutdown). This option only applies to vehicles with Security Plus subscriptions because it uses a “locate” command to request the data.
Warning
Vehicle polling draws power from the 12V battery. Long term use without driving may drain the battery resulting in the inability to start.
Q: How do I use the locator, and remote light/horn features in Home Assistant?
A: Those features are supported by the underlying subarulink Python package, and will be integrated into Home Assistant soon.
Q: Why do I need to enter my PIN during configuration?
A: The PIN is saved to your configuration to support vehicle polling, since a remote update command is being sent to your vehicle. In addition, the PIN is used to support the lock platform and will be used for the remote start, locator, and lights/horn functions in the future.
Q: Why wasn’t I asked to enter my PIN during configuration?
A: A PIN is only required to send a remote command. If you do not have a subscription that supports remote commands, you will not be prompted for a PIN.
Q: Why don’t my sensor readings appear to change in “real-time”?
A: Gen 2/3 telematics vehicles will send updated data when the vehicle is shutdown. After about 5 minutes, the data should be reflected in Home Assistant. In addition, some data, such as tire pressures, are only measured while the vehicle is in motion. The pressures reported are the last reading when the vehicle is shutdown.
Q: Should I enable the vehicle polling option?
A: Probably not. One use case is if you have a PHEV and want to monitor your charging progress. Otherwise, the data isn’t going to change much after you’ve shutdown your vehicle (tire pressures are only updated when the vehicle is in motion). A future revision will expose vehicle polling as an action to enable incorporation into automations.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Subaru hub was introduced in Home Assistant 2021.3, and it's used by
526 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@G-Two
Categories
Car
Presence detection
Sensor
Back to top
