# SwitchBot Bluetooth - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/switchbot
- Final URL: https://www.home-assistant.io/integrations/switchbot
- Canonical URL: https://www.home-assistant.io/integrations/switchbot/
- Fetched at: 2026-06-28T03:19:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up SwitchBot Devices.

## Extracted Text

On this page
How you can use this integration
Prerequisites
Add mode
Adding encrypted SwitchBot devices
Configuration
Supported devices
Plugs and switches
Cover
Lights
Locks
Humidifiers
Sensors
Hubs
Fans
Vacuums
Air purifiers
Climates
Buttons
Keypad Visions
Works with Home Assistant
Supported functionality
Common
Air Purifiers
List of actions
Data updates
Known limitations
Slow connection times
Device names not synced
Battery level
Lock state
Vacuum state
Troubleshooting
Examples
Automation ideas
Removing the integration
To remove an integration instance from Home Assistant
The SwitchBot Bluetooth integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control SwitchBot devices such as sensors, locks, shades, lights, plugs, robot vacuums, and hubs.
The SwitchBot integration lets you do many things, such as switching devices on and off, changing device modes, monitoring sensor data and energy usage in the Home Assistant dashboards, and controlling device configurations manually or via automations.
To use this integration, it is required to have working Bluetooth set up on the device running Home Assistant. A SwitchBot Hub is not required for this integration.
If you have multiple devices of the same type, you need to get the BTLE MAC address of your device to tell your devices apart. You can find the address for your device using the following steps:
Open the SwitchBot app.
Open device settings.
Click on “Device Info”.
Write down the BTLE MAC address of your device.
Device names configured in the SwitchBot app are not transferred into Home Assistant.
Some SwitchBot devices need to be configured within the app before being controlled by Home Assistant, such as calibrating the cover open/close limits or pairing two covers to move together.
Before adding SwitchBot devices over Bluetooth, confirm whether your Bluetooth adapter is set to Active or Passive mode in the Bluetooth integration configuration.
To open the Bluetooth integration settings, go to Settings > Devices & services and select Integrations , then find and open the Bluetooth integration to check the adapter mode.
Active mode
Devices are normally discovered automatically.
If a device is not discovered automatically:
For devices with a physical button, press and hold the button to enter pairing mode.
For devices without a button, power-cycle the device to trigger pairing mode.
If the device still cannot be discovered, try syncing devices from your SwitchBot account by selecting the SwitchBot integration and signing in.
Passive mode
Devices cannot be discovered via local Bluetooth scanning and must be synchronized through your SwitchBot account.
To sync devices from your account, go to Settings > Devices & services , open Integrations , select SwitchBot , select the integration to open the login window, and sign in. If the local Bluetooth scan detects devices that are linked to your SwitchBot account and within range, you can add them after signing in.
If you still cannot add a device, make sure it is powered on, within Bluetooth range, and not connected to another app. If necessary, follow the manufacturer’s reset instructions or consult SwitchBot support.
Some types of the SwitchBot devices are encrypted for improved security. More types and models will be added as encrypted devices in the future.
An encrypted SwitchBot device can be set up in Home Assistant in two different ways.
You can enter the key ID and encryption key yourself, or Home Assistant can import them from your SwitchBot account.
SwitchBot account (recommended)
Using this option you can provide your SwitchBot account login credentials and Home Assistant will import the appropriate encryption key from your account.
Username
SwitchBot account username
Password
SwitchBot account password
Important
This integration doesn’t support SSO accounts (such as Login with Google) only username and password accounts.
Enter the lock encryption key manually
This option is for those that would rather obtain the encryption key themselves, and/or want to know exactly where and how are their account credentials used.
Key ID
Locks’ encryption key ID
Encryption key
Locks’ encryption key
For instructions on how to obtain the encryption key, see README in PySwitchbot project.
To add the SwitchBot Bluetooth device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SwitchBot Bluetooth .
Follow the instructions on screen to complete the setup.
Bot (WoHand)
Plug Mini (WoPlug)
Plug Mini (HomeKit Enabled)
Relay Switch 1
Relay Switch 1PM
Plug Mini EU
Relay Switch 2PM
Curtain (WoCurtain) (version 1 & 2)
Curtain 3 (WoCtn3)
Blind Tilt (WoBlindTilt)
Roller Shade
Garage Door Opener
Color Bulb (WoBulb)
Light Strip (WoStrip)
Smart Ceiling Light (WoCeiling)
Strip Light 3
Floor Lamp
RGBICWW Strip Light
RGBICWW Floor Lamp
Permanent Outdoor Light
Lock (WoLock)
Lock Pro (WoLockPro)
Lock Ultra (WoLockUltra)
Lock Lite (WoLockLite)
Lock Vision
Lock Vision Pro
Lock Pro Wifi
Humidifier (WoHumi)
Evaporative Humidifier
Meter
Meter Plus (WoSensorTH)
Indoor/Outdoor Meter (WoIOSensorTH)
Meter Pro
Meter Pro CO2 Monitor
Contact Sensor (WoContact)
Motion Sensor (WoPresence)
Water Leak Detector
Remote (WoRemote) (currently only supports battery level monitoring)
Climate Panel (currently only supports retrieving sensor data, does not yet support device control)
Presence Sensor
Weather Station (currently only supports retrieving sensor data)
Hub 2 (WoHub2) (currently only supports retrieving sensor data, does not yet support device control)
Hub Mini Matter Enabled (currently only supports retrieving sensor data, does not yet support device control)
Hub 3 (WoHub3) (currently only supports retrieving sensor data, does not yet support device control)
Circulator Fan
K10+
K10+ Pro
K10+ Pro Combo
K11+
K20
S10
S20
Air Purifier
Air Purifier Table
Smart Radiator Thermostat
Art Frame
Keypad Vision
Keypad Vision Pro
SwitchBot is committed to making sure their products are up-to-date and ready to use in Home Assistant.
Devices are certified for both Bluetooth and Matter.
The following devices are certified for Bluetooth:
SwitchBot Lock Ultra
SwitchBot Air Purifier
SwitchBot Air Purifier Table
SwitchBot Leak Detector
SwitchBot Meter
SwitchBot Meter Pro
SwitchBot Meter Pro CO2
SwitchBot Indoor/Outdoor Thermo-Hygrometer
SwitchBot Curtain 3
SwitchBot Contact Sensor
SwitchBot Roller Shade
SwitchBot Lock Pro
To see the list of SwitchBot Matter-certified devices, visit the SwitchBot Matter page.
Options
Retry count : How many times to retry sending commands to your SwitchBot devices.
Attributes
last_run_success : Returns true if the last action sent to the SwitchBot succeeded. This attribute is useful for error trapping when Bluetooth connectivity is intermittent. If false , see the Home Assistant logs for specific error messages.
Switch entities are added for Bot, Plug Mini, and Relay Switch.
Bot
Password protection: You can set a device password in the SwitchBot app to prevent people nearby take control of your device. When a password is set, you need to enter the correct password to add it to the integrations.
Features:
turn on or off
press
get battery level
Attributes:
Switch mode : Specifies the mode of the device. If true , the device is in Pull/Retract mode for toggle switches otherwise the device is in momentary switch mode.
Plug Mini
get power consumption readings
This is an encrypted device.
get power
get voltage
get current
get electricity consumption
This is an encrypted device, and it has two switch channels, you can set them independently.
Cover entities are added for Curtain, Curtain 3, Blind Tilt, Roller Shade, and Garage Door Opener.
Curtain
open/close/pause
set position
get position
get light level
get calibration state
Curtain 3
set curtain movement speed
Curtain movement speed is configured from the device options. Curtain movement speed is primarily designed for Curtain 3 models. Older Curtain models may ignore the setting.
To set Curtain movement speed , go to Settings > Devices & services .
Find the SwitchBot integration and select the curtain device you want to configure.
Select Configure for that device.
In the Options dialog, set Curtain movement speed to a number between 0-255. The default is 255.
Blind Tilt
close up/close down/pause
The blind tilt is exposed as a cover entity with control of the tilt position only:
Tilt Position Blind State 100% Closed Up 50% Fully Open 0% Closed Down
The close button will close the blinds to the closest closed position (either 0% or 100%), and defaults to closing down if the blinds are fully open. Because Home Assistant believes 100% is open, the default cards will disable the open button when the tilt is at 100%, but the action will still work and open the blind to 50%.
Simple cover template entity
Some integrations may expose your SwitchBot Blind Tilt to other actions which expect that 100% is open and 0% is fully closed. Using a Cover Template , a proxy entity can be created which will be open at 100% and closed at 0%. This template entity is limited to closing in one direction.
# Example configuration.yaml entry cover : - platform : template covers : example_blinds_simple : device_class : blind friendly_name : Example Blinds (Simple Down) open_cover : action : cover.set_cover_tilt_position data : tilt_position : 50 target : entity_id : cover.example_blinds close_cover : action : cover.set_cover_tilt_position data : tilt_position : 0 target : entity_id : cover.example_blinds position_template : > {{ int(states.cover.example_blinds.attributes.current_tilt_position)*2 }} set_cover_position : action : cover.set_cover_tilt_position data : tilt_position : " {{position/2}}" target : entity_id : cover.example_blinds
The Roller Shade is exposed as a cover entity with control of the position only:
position Roller Shade state <=20% Open >20% Close
open/close
Sensor entiteis are added for thermometer and hygrometer devices, motion sensor, contact sensor, leak sensor, presence sensor, remote button and climate panel.
get temperature
get humidity
Meter Plus
Indoor/Outdoor Meter
get carbon dioxide
set display time format (12h/24h)
set display time offset
sync the device date and time with Home Assistant
Setting display time offset
Display time offset entity shifts the time shown on the device display without altering the device’s internal timekeeping. The offset can be negative and it is applied independently: for example, pressing the Sync date and time button will update the internal clock to match Home Assistant but will not change or reset your custom offset. This allows you to maintain a specific time offset while still using automations to prevent hardware time drift.
Syncing the device date and time with Home Assistant automatically
The integration adds a Sync date and time button to the device’s details page. You can set up your own automation that triggers that button regularly. That helps to mitigate the time drift on the device. Here’s a simple example for configuration.yaml :
automation : - alias : " Daily SwitchBot CO2 Time Sync" description : " Sync date and time sync for the Meter Pro CO2 every night." trigger : triggers : - trigger : time # Ensures the time is in sync after a DST (summer/winter) time change. at : " 03:00:00" actions : - action : button.press target : # Replace with your actual entity ID entity_id : button.<your_device_name>_sync_date_and_time
Contact Sensor
open or closed state
motion detection state
Motion Sensor
Note: Device battery data is stored in service data, not broadcast. This data can only be retrieved when Bluetooth is in active mode.
Feature
get battery
get occupancy state
leak or dry state
Remote
Climate Panel
light detection state
Keypad Vision (Pro)
This is an encrypted device. For testing, you can execute the actions that this device supports individually within the development tools.
Note: Users need to bind the device to the lock before the doorbell event can be triggered.
get tamper alarm
get doorbell event
This device supports the Add password action.
Light entities are added for Color Bulb, LED Strip Light, and Ceiling Light.
Ceiling Light
change brightness
change color temperature
Color Bulb
change color
set effect
LED Strip Light
Note: The integration currently only uses the primary lock state; in dual lock mode, not all things might work properly.
Lock
Lock or unlock
auto-lock paused state
calibration state
Options:
To enable nightlatch operation mode, go to Settings > Devices & services .
Under Integration entries , find the lock and select Configure .
In the Options dialog, configure the nightlatch operation mode.
Lock Pro (Wifi)
Lock Ultra
This is an encrypted device. Half-lock is supported only on European Union (EU) models. To use it, you need to enable nightlatch operation mode. See the Options section below.
half-lock
Lock Lite
Some of the hubs can be served as a bridge while the sensor data can be retrieved via Bluetooth connection. Hub 2 displays temperature and humidity through a sensor cable. Without a digital display, Hub Mini Matter Enabled can also read from a sensor cable.
Hub 2
Hub Mini Matter Enabled
Hub3
Fan entities are added for Battery Circulator Fan/Circulator Fan
Battery Circulator Fan/Circulator Fan
turn on
turn off
set speed
set mode
oscillate left and right
get battery level (Battery Circulator Fan only)
Fan entities are added for Air Purifier, and Air Purifier Table.
Air purifier currently supports three speed levels, which you can adjust by setting the mode.
Vacuum entities are added for K10+, K10+ Pro, K10+ Pro Combo, K20, S10, K11+, S20.
get states, including cleaning , docked , idle , paused , returning , and error ; refer to Known limitations for more details
start
return to base
Humidifier entities are added for Humidifier and Evaporative Humidifier.
Humidifier
set humidity
Note: Not all modes support unless you bind the temperature and humidity sensor.
climate entities are added for smart radiator thermostat
set target temperature
button entities are added for art frame.
Note: Users need to preset images in the app.
next image
previous image
The SwitchBot Bluetooth integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add password ( switchbot.add_password )
Adds a password to a SwitchBot Keypad Vision device.
For an overview of every action across all integrations, see the actions reference .
SwitchBot devices use a ​​local push ​​ strategy to maintain real-time status updates. When devices detect state changes, they actively push updates to Home Assistant for immediate synchronization. For user-initiated actions through Home Assistant (for example, when turning a device on/off), the integration performs an additional proactive status fetch to ensure instant confirmation of the new state.
The integration connects locally to the devices without going via the SwitchBot Cloud.
Move the device closer, or replace the Bluetooth adapter with a faster one. See Improving connection times for more information.
Due to firmware limitations, early models such as Lock and Lock Lite report the battery level in coarse ranges rather than an exact value:
< 10 % → 10
10 % – 20 % → 20
20 % – 60 % → 60
≥ 60 % → 100
Refer to the latest version of the OpenAPI doc for precise definitions.
The integration currently only uses the primary lock state; in dual lock mode, not all things might work properly.
For robot vacuum K10+ and K10+ Pro, due to firmware implementation, it only returns these states, cleaning and docked
The SwitchBot integration will automatically discover devices once the Bluetooth integration is enabled and functional.
Config flow could not be loaded
Possible custom integration conflict, using a different version of PySwitchbot; Try uninstalling the custom integration.
No unconfigured devices found
Make sure your devices are powered on and are in range.
You can create all sort of automations using sensors as triggers and switches, shades, and lights as actions.
Turn on or turn off lights and switches when motion is detected.
Turn on or turn off the Bot to control a fan, AC remote, or circulator when temperature or humidity are too low.
Close the curtain when the temperature is too high.
Turn off Relay Switch when power consumption is too high.
Change the color of LED Strip Lights or Color Bulb or turn on the circulator using Bot or Relay Switch if carbon dioxide is too high.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SwitchBot Bluetooth device was introduced in Home Assistant 0.78, and it's used by
4.3% of the active installations.
Its IoT class is Local Push.
🥇 Gold quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@danielhiversen
@RenierM26
@murtas
@Eloston
@dsypniewski
@zerzhang
Categories
Binary sensor
Button
Climate
Fan
Light
Select
Sensor
Switch
Vacuum
Back to top
