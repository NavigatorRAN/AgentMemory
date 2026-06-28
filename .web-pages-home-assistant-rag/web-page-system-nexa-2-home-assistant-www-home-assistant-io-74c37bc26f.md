---
source_url: "https://www.home-assistant.io/integrations/systemnexa2"
final_url: "https://www.home-assistant.io/integrations/systemnexa2"
canonical_url: "https://www.home-assistant.io/integrations/systemnexa2/"
source_handle: "web:www-home-assistant-io:74c37bc26fa8"
source_section: "integrations-systemnexa2"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "29eff91b9b4507b7eccffc3e8f001a6d438b3a412401a080c110f2862bae5b01"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# System Nexa 2 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/systemnexa2
- Final URL: https://www.home-assistant.io/integrations/systemnexa2
- Canonical URL: https://www.home-assistant.io/integrations/systemnexa2/
- Fetched at: 2026-06-28T03:20:34Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate System Nexa 2 devices within Home Assistant.

## Extracted Text

On this page
Use cases
Supported devices
Prerequisites
Configuration
Supported functionality
Lights
Sensors
Switches
Known limitations
Data updates
Examples
Turn off LEDs at night
Car heater automation based on temperature
Troubleshooting
Cannot add device
Reconfiguration
Removing the integration
To remove an integration instance from Home Assistant
The System Nexa 2 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate with the System Nexa 2 devices from Nexa .
The System Nexa 2 integration brings your lights, switches, and smart plugs into Home Assistant, enabling you to create a truly smart home. Here are some ways you can benefit from this integration:
Automate your lighting and appliances
Create automations to turn lights on at sunset, turn off devices when you leave home, or control your car heater based on outdoor temperature and your calendar to ensure a warm car before your morning commute.
Enhance privacy and security
Disable cloud access to keep all communication local, ensuring your devices work without internet connectivity.
Reduce light pollution
Turn off indicator LEDs on devices in your bedroom at night to create a better sleeping environment.
Child-proof your smart home
Disable physical buttons on specific devices to prevent children from turning critical equipment on or off.
Integrate with existing remotes
Enable 433 MHz communication to continue using your existing remote controls alongside Home Assistant automation.
The following devices are known to be supported by the integration:
WBD-01 In-Wall Dimmer
WBR-01 In-Wall Switch/Relay
WPO-01 Outdoor Smart Plug
WPR-01 Indoor Smart Plug
WPD-01 Indoor Dimmer Plug
Open the app store and install the Nexa Hem app.
Create an account.
Add the device by onboarding it to your Wi-Fi, making sure it’s on a network reachable from Home Assistant.
To add the System Nexa 2 device to your Home Assistant instance, use this My button:
System Nexa 2 can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select System Nexa 2 .
Follow the instructions on screen to complete the setup.
Host
The IP Address/hostname of your device. You can find it in your Nexa Hem app by selecting your device > Network > IP .
Dimmer
Description : Control dimmable lights with adjustable brightness levels.
Available for devices : WBD-01, WPD-01
Remarks : Supports brightness control from 0-100%
Signal strength
Description : Wi-Fi signal strength (dBm).
Available for devices : all
Remarks : Disabled by default.
Relay
Description : Turn on or off switch relay.
Available for devices : WBR-01, WPO-01, WPR-01
433 MHz
Description : Controls whether device should use 433 MHz communication.
Cloud Access
Description : Controls whether to allow cloud access for device.
Physical Button
Description : Controls whether the onboard button should have any effect on the device.
LED
Description : Controls whether the onboard LED should be lit at any time.
Currently this integration does not support the following functionality:
Dimming configuration (lowest/highest brightness level, dimming mode)
Device local scheduling/timers (can however be done via Home Assistant)
Adding remote control transmitters to control devices
Setting mode after power loss
Updating Wi-Fi settings
Firmware upgrade
Local authentication
System Nexa 2 devices push data directly to Home Assistant, enabling immediate updates for device state changes such as relay state and settings (433 MHz, cloud access, physical button, and LED).
Automatically turn off device indicator LEDs during nighttime to reduce light pollution in bedrooms.
automation : - alias : " Turn off bedroom device LEDs at night" triggers : - trigger : time at : " 22:00:00" actions : - action : switch.turn_off target : entity_id : - switch.bedroom_switch_led - switch.bedroom_dimmer_led - alias : " Turn on bedroom device LEDs in morning" triggers : - trigger : time at : " 07:00:00" actions : - action : switch.turn_on target : entity_id : - switch.bedroom_switch_led - switch.bedroom_dimmer_led
Start the car heater automatically before your morning commute when outdoor temperature is low.
automation : - alias : " Preheat car on cold mornings" triggers : - trigger : time at : " 06:30:00" conditions : - condition : numeric_state entity_id : sensor.outdoor_temperature below : 5 - condition : time weekday : - mon - tue - wed - thu - fri actions : - action : switch.turn_on target : entity_id : switch.garage_car_heater - delay : minutes : 30 - action : switch.turn_off target : entity_id : switch.garage_car_heater
Symptom: Device is not discovered
When trying to set up the integration, the device is not automatically discovered.
Description
The device may not be discoverable due to network issues or because automatic discovery is not working properly on your network.
Resolution
To resolve this issue, try the following steps:
Open the Nexa Hem app and verify that your device is connected and working properly.
If the device appears in the app:
Open the device details in the Nexa Hem app.
Go to Network > IP to find the IP address of your device.
In Home Assistant, manually add the integration:
Select Add integration and search for System Nexa 2 .
Enter the IP address you found in the Nexa Hem app.
Once set up, the hostname or IP address used to access the System Nexa 2 device can be changed by reconfiguring the integration.
Select the System Nexa 2 integration entry that you want to update.
Open the three dots menu next to that entry, then select Reconfigure .
Enter a new hostname or IP address.
Select Submit to complete the reconfiguration.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The System Nexa 2 device was introduced in Home Assistant 2026.3, and it's used by
11 active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@konsulten
Categories
Light
Sensor
Switch
Back to top
