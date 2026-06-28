# Lutron - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lutron
- Final URL: https://www.home-assistant.io/integrations/lutron
- Canonical URL: https://www.home-assistant.io/integrations/lutron/
- Fetched at: 2026-06-28T02:58:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Lutron devices with Home Assistant.

## Extracted Text

On this page
Configuration
Keypad buttons
Keypad LEDs
Scene
Occupancy sensors
Example automations
Lutron is an American lighting control company. They have several lines of home automation devices that manage light switches/dimmers, occupancy sensors, and HVAC controls. The lutron integration in Home Assistant is responsible for communicating with the main hub for these systems.
Presently, there’s only support for communicating with the RadioRA 2 Main Repeater and only handle light switches, dimmers, and seeTouch keypad scenes.
When configured, the lutron integration will automatically discover the rooms and their associated switches/dimmers as configured by the RadioRA 2 software from Lutron. Each room will be treated as a separate group.
To use Lutron RadioRA 2 devices in your installation, you’ll need to first create a username/password in your Lutron programming software. Once a telnet username/password has been programmed, you can follow the instructions from the next chapter.
To add the Lutron hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Lutron .
Follow the instructions on screen to complete the setup.
Tip
It is recommended to assign a static IP address to your main repeater. This ensures that it won’t change IP addresses, so you won’t have to change the host if it reboots and comes up with a different IP address.
Important
If you are using RadioRA2 software version 12 or later, the default lutron user with password integration is not configured by default. To configure a new telnet user, go to Settings > Integration in your project and add a new telnet login. Once configured, use the transfer tab to push your changes to the RadioRA2 main repeater(s).
Keypad buttons actions are provided in event entities.
Each full-width button on a Lutron seeTouch, Hybrid seeTouch, and Tabletop seeTouch keypad has an LED that can be controlled by Home Assistant.
Keypad LEDs are exposed as select entities, which allow you to choose from the following options:
Off : The LED is extinguished.
On : The LED is illuminated.
Slow Flash : The LED flashes once per second (1 Hz).
Fast Flash : The LED flashes ten times per second (10 Hz).
To control these from an automation or script, use the select.select_option action and provide the option name exactly as listed above.
Legacy switch entities are also provided for backward compatibility. Performing an action of switch.turn_off or switch.turn_on will control the keypad LED. These entities are deprecated and will be removed in a future release.
Keep in mind that the Lutron system will also control the LED state independent of Home Assistant, according to the programming of the RadioRA2 system. This also means you can query LED states to determine if a certain scene is active, since the LED will have been illuminated by the RadioRA2 repeaters. This includes the “phantom” LEDs of Main Repeater keypad buttons; even though there is no physical button or LED, the RadioRA2 system tracks the scenes and will “light” the LED that can be queried.
If a button is not programmed to control any lights or other devices in the RadioRA2 system but is given a name in the programming software, it will be available to fire events in Home Assistant. However, since there is no way to have a scene “active” on a button with no devices associated, the Main Repeater will automatically extinguish the keypad LED a few seconds after the button press. If you wish to have Home Assistant light the LED after a button press, you will need to delay your action to light the LED for several seconds, so it arrives after the Main Repeater has sent the command to turn it off.
This integration uses keypad programming to identify scenes. Currently, it works with seeTouch, Hybrid seeTouch, Main Repeater, Homeowner keypad, Pico, and seeTouch RF tabletop keypads.
The Lutron scene platform allows you to control scenes programmed into your seeTouch keypads.
After setup, scenes will appear in Home Assistant using the area, keypad and button name.
Any configured Powr Savr occupancy sensors will be added as occupancy binary sensors. Lutron reports occupancy for an area, rather than reporting individual sensors. Sensitivity and timeouts are controlled on the sensors themselves, not in software.
- alias : " keypad button pressed notification" triggers : - trigger : event event_type : lutron_event event_data : id : office_pico_on action : single actions : - action : notify.telegram data : message : " pico just turned on!"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Lutron hub was introduced in Home Assistant 0.37, and it's used by
219 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@cdheiser
@wilburCForce
Categories
Binary sensor
Cover
Event
Fan
Hub
Light
Select
Switch
Back to top
