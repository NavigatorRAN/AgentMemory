# Novy Cooker Hood - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/novy_cooker_hood
- Final URL: https://www.home-assistant.io/integrations/novy_cooker_hood
- Canonical URL: https://www.home-assistant.io/integrations/novy_cooker_hood/
- Fetched at: 2026-06-28T03:04:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Novy cooker hoods into Home Assistant.

## Extracted Text

On this page
Supported devices
Unsupported devices
Supported functionality
Fans
Lights
Prerequisites
Configuration
Examples
Set the extractor speed to 50% when the hob is in use
Data updates
Known limitations
Home Assistant does not know what the hood is doing
Two Novy hoods need different codes
Other 433 MHz devices can interfere
Troubleshooting
The hood does not react when you control it from Home Assistant
The setup verification fails with “Could not send the test command”
The light or fan state in Home Assistant does not match the hood
Removing the integration
To remove an integration instance from Home Assistant
The Novy Cooker Hood integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control the light and extractor of a Novy cooker hood over 433.92 MHz radio, through a compatible RF transmitter. You can automatically run the extractor when the hob is in use, for example at 50%, as soon as a smart plug reports power draw, and switch the light by voice through Assist, which is handy when your hands are full in the kitchen.
The integration controls Novy cooker hoods that ship with the white RF remote, model 840029.
The following devices are not supported:
Higher-end Novy cooker hoods that ship with a remote other than the 840029.
Newer Novy hoods that use the Novy Connect app (different protocol).
Novy hoods without an RF remote, such as touch-only or wired-only models.
The Novy Cooker Hood integration provides the following entities. State is assumed and restored across restarts. See Known limitations .
Fan
Description : Controls the extractor with four speeds (25%, 50%, 75%, 100%).
Light
Description : Toggles the cooker hood light on or off.
Set up a hardware integration (for example, ESPHome or Broadlink ) that provides a Radio Frequency entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] supporting 433.92 MHz OOK transmissions.
Identify the pairing code of your hood. New hoods are paired with code 1; if yours was changed, follow the button combination in your Novy manual to read it back. The remote’s green LED flashes once for code 1, twice for code 2, and so on up to 10.
To add the Novy Cooker Hood device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Novy Cooker Hood .
Follow the instructions on screen to complete the setup.
Radio frequency transmitter
The RF transmitter Home Assistant uses to send commands. Only transmitters that support 433.92 MHz OOK transmissions are shown.
Code
The pairing code (1 to 10) the hood is paired with. Use code 1 if you have not changed the factory default. The 10 codes let two hoods or other 433 MHz devices coexist without interfering.
Home Assistant then toggles the light on and off so you can confirm the code. Select Finish if the light reacted, or Retry to try another code.
Use a hob smart plug to turn the extractor on at 50% when cooking starts and off a few minutes after it ends.
- alias : " Hood follows the hob" triggers : - trigger : numeric_state entity_id : sensor.hob_power above : 50 id : hob_on - trigger : numeric_state entity_id : sensor.hob_power below : 10 for : minutes : 5 id : hob_off actions : - choose : - conditions : - condition : trigger id : hob_on sequence : - action : fan.turn_on target : entity_id : fan.novy_cooker_hood data : percentage : 50 - conditions : - condition : trigger id : hob_off sequence : - action : fan.turn_off target : entity_id : fan.novy_cooker_hood
Replace sensor.hob_power with your hob’s activity entity, and adjust the thresholds for your appliance.
The hood uses a one-way 433.92 MHz protocol: Home Assistant only sends commands and does not receive any data back. The state shown in Home Assistant is the last command sent, and is restored across restarts.
The hood does not report its state back. If you change the light or fan speed from the physical remote, the values in Home Assistant will be wrong until you control the hood from Home Assistant again.
If two hoods share the same transmitter, set each to a different pairing code so they don’t react to each other’s commands.
Weather stations, doorbells, and garage door openers share the same frequency. Distance and walls between the transmitter and the hood can also reduce reliability.
Check the configured code matches the hood’s. Read the current code from the remote with the button combination in your Novy manual (the green LED flashes once per code). If unsure, re-add the integration trying each code (1-10) until verification succeeds.
Check the RF transmitter entity is available from Settings > Devices & services .
Move the transmitter closer to the hood, or remove obstacles between them. Metal kitchen appliances and dense walls can attenuate 433 MHz signals.
Check whether another 433 MHz device, or a neighbor’s hood on the same code, is generating interference.
The RF transmitter could not send the command. Check it is online and reachable, restart it if needed, then select Retry .
Home Assistant has no way to read the hood’s real state. To resync, control the entity from Home Assistant so the assumed state matches reality. To avoid future desync, prefer using Home Assistant or the remote consistently.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Novy Cooker Hood device was introduced in Home Assistant 2026.5, and it's used by
34 active installations.
Its IoT class is Assumed State.
🥇 Gold quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@piitaya
Categories
Back to top
