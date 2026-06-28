---
source_url: "https://www.home-assistant.io/integrations/switcher_kis"
final_url: "https://www.home-assistant.io/integrations/switcher_kis"
canonical_url: "https://www.home-assistant.io/integrations/switcher_kis/"
source_handle: "web:www-home-assistant-io:88762a2c1a06"
source_section: "integrations-switcher-kis"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d520e83583147f9f2706ad7635e4367d7843d55fa83d86eb5f0419d9acffec9a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Switcher - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/switcher_kis
- Final URL: https://www.home-assistant.io/integrations/switcher_kis
- Canonical URL: https://www.home-assistant.io/integrations/switcher_kis/
- Fetched at: 2026-06-28T03:20:04Z
- Content type: text/html; charset=UTF-8

## Description

Integrate Switcher devices.

## Extracted Text

On this page
Prerequisites
Configuration
Buttons
Covers
Lights
Sensors
Switches
List of actions
Notes
Removing the integration
To remove an integration instance from Home Assistant
The Switcher integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Switcher Devices .
Supported devices:
Switcher Power Plug
Switcher Touch (from firmware 1.51)
Switcher V2 (Espressif chipset - from firmware 3.21)
Switcher V2 (Qualcomm chipset - from firmware 72.32)
Switcher V4
Switcher Mini
Switcher Breeze
Switcher Runner
Switcher Runner S11
Switcher Runner S12
Switcher Light SL01
Switcher Light SL01 Mini
Switcher Light SL02
Switcher Light SL02 Mini
Switcher Light SL03
Switcher Heater
Devices that require a token:
If you completed the integration setup but are still unable to control the device, please make sure your device’s firmware is up-to-date.
Before the integration can find a device, you need to connect it to your network using the Switcher app.
To enhance security, certain Switcher devices require a token for operation. To integrate your token-based Switcher devices with Home Assistant, you’ll need the following information:
The username of your Switcher Account : To find the username, open the Switcher app.
Local control key token : To find the local control key token, browse to the
Switcher GetKey API , enter your Switcher account username (which is an email address), and press
Send Me The Code .
The token will be sent to you by email. It will look something like this: zvVvd7JxtN7CgvkD1Psujw==
To add the Switcher hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Switcher .
Follow the instructions on screen to complete the setup.
For Switcher Breeze the integration provides the following buttons:
For devices that are also controlled in other ways or often go out of sync with Switcher Breeze, there are Assume on & Assume off buttons which you can use to can tell Switcher Breeze if your device is currently running or not without sending a new command to the device.
For devices which do not support swing status for the vertical swing, the integration provides separate Vertical swing on & Vertical swing off buttons.
For Switcher cover control devices (Switcher Runner, Switcher Runner S11, Switcher Runner S12) the integration allows you to control its covers open/close state, set specific covers position and get information about the cover direction (UP/DOWN/STOP).
For Switcher light control devices (Switcher Runner S11, Switcher Runner S12, and Switcher Lights), the integration allows you to control its lights on/off state.
For Switcher power control devices (Switcher Power Plug, Switcher Touch, Switcher V2/V4, Switcher Heater) the integration provides the following sensors:
Sensor Name Description Example Auto Shutdown * The auto shutdown time limit configured on the device 01:30:00 Remaining Time * Time remaining to shutdown (auto or timer) 01:29:41 Electric Current The electric current in amps 12.5 A Power Consumption The power consumption in watts 2756 W
*Currently not supported for Switcher Power Plug
For Switcher Breeze the integration provides the following sensor:
Sensor Name Description Example Current temperature The current temperature in celsius 25.0 °C
For Switcher cover control devices (Switcher Runner, Switcher Runner S11, Switcher Runner S12), the integration allows you to control its child lock state; ON means locked, and OFF means unlocked.
The Switcher integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set auto-off ( switcher_kis.set_auto_off )
Sets the auto-off time for a Switcher power device.
Turn on with timer ( switcher_kis.turn_on_with_timer )
Turns on a Switcher power device for a set number of minutes.
For an overview of every action across all integrations, see the actions reference .
Make sure that Home Assistant host’s firewall allows incoming traffic on UDP ports 10002, 10003, 20002 & 20003 and outgoing connections to Switcher device(s) on TCP ports 9957 & 10000.
If Home Assistant and the Switcher device(s) are not on the same network, you will also need to have their traffic properly forwarded between the two networks.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Switcher hub was introduced in Home Assistant 0.93, and it's used by
563 active installations.
Its IoT class is Local Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@thecode
@YogevBokobza
Categories
Climate
Cover
Sensor
Switch
Back to top
