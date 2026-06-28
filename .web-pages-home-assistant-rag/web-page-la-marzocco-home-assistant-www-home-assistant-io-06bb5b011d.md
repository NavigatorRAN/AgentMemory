# La Marzocco - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lamarzocco
- Final URL: https://www.home-assistant.io/integrations/lamarzocco
- Canonical URL: https://www.home-assistant.io/integrations/lamarzocco/
- Fetched at: 2026-06-28T02:55:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your La Marzocco coffee machine with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Options
Data updates
Buttons
Numbers
Switches
Binary sensors
Sensors
Updates
Selects
Calendar
Supported devices
Possible use-cases
Automations
Turn steamboiler on when machine is turned on
Known Limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] interacts with La Marzocco coffee machines through calls to the La Marzocco cloud API.
If your Home Assistant host can perform DHCP discovery , your machine will be discovered automatically. Otherwise, if your machine is in Bluetooth range to your Home Assistant host and the Bluetooth integration is fully loaded, the machine will be discovered as well.
To be able to configure your machine in Home Assistant, your machine needs to be added to your account using the official La Marzocco app first.
Only login with username & password is supported. If you are currently using a social login, you need to create a new La Marzocco account and transfer your machine to it to be able to use this integration.
To add the La Marzocco device to your Home Assistant instance, use this My button:
La Marzocco can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select La Marzocco .
Follow the instructions on screen to complete the setup.
Username
Your username you use to log into the La Marzocco app.
Password
Password you use to log into the La Marzocco app.
To define options for La Marzocco, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of La Marzocco are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Use Bluetooth
Allows you to manually disable Bluetooth communication with the machine (if available). This can be used to avoid longer timeouts, e.g., when your machine is only sometimes in range.
Offline mode
Allows you to enable the offline mode manually. Requires use of Bluetooth. Also see Data updates .
By default, this integration will receive push updates from the cloud about its general status. If that is not possible it will query the cloud every 15 seconds for an update of general machine information, every 15 minutes for new statistics, every 30 minutes for updated schedules and every 8 hours for a firmware update.
If your host has access to a Bluetooth adapter and your machine is within range, the integration can request updates through Bluetooth. This Bluetooth mode starts automatically if internet access is not available, or when you enable the offline mode option.
In offline mode , most entities will become unavailable. Only those marked with in the table below ( Available platforms & entities ) will remain available. While in offline mode , Home Assistant requests an update from your machine every 60 seconds.
Available platforms & entities
= La Marzocco Cloud
= Bluetooth
Button name Description Available for machines Controllable through Start backflush Starts the backflush process on your machine. You got 15 seconds to turn the paddle after activation. all
Number name Description Available for machines Controllable through Remarks Coffee target temperature Temperature the coffee boiler is set to all - Steam target temperature Temperature the steam boiler is set to GS3 AV , GS3 MP - Smart standby time Time until the machine will automatically stand by (if enabled) all - Preinfusion time Duration of preinfusion Linea Micra , Linea Mini , Linea Mini R only available when machine is in mode Preinfusion Prebrew time on Duration which prebrew will be on Linea Micra , Linea Mini , Linea Mini R only available when machine is in mode Prebrew Prebrew time off Duration which prebrew will wait Linea Micra , Linea Mini , Linea Mini R only available when machine is in mode Prebrew Brew by weight Dose 1 Weight when the machine will stop while being in Dose 1 for Brew by weight Linea Mini , Linea Mini R only available when machine is paired with a scale Brew by weight Dose 2 Weight when the machine will stop while being in Dose 2 for Brew by weight Linea Mini , Linea Mini R only available when machine is paired with a scale
Switch name Description Available for machines Controllable through Main Allows you to turn machines on-/off all Steam boiler Allows you to enable/disable the steam boiler all Smart standby enabled Whether smart standby is on (machine will automatically stand by after given time) all
Binary sensor name Description Available for machines Retrievable from Remarks Water tank empty Indicates whether the water tank needs a refill. all - Brewing active Is on if you are in the process of making coffee. all - Backflush enabled Is on if you started the backflushing process. all - WebSocket connected Track your connection to the cloud WebSocket for real time updates. all Disabled by default.
Sensor name Description Available for machines Retrievable from Remarks Coffee boiler ready time Indicates when the coffee boiler will be ready for brewing. all - Steam boiler ready time Indicates when the steam boiler will be ready for brewing. all - Brew start time If a brew is running, tells the exact start time of that brew. all - Total coffees made How many coffees have been made in total. all - Total flushes done How often the machine has been flushed. all - Last cleaning time Indicates when the machine was last cleaned with a Backflush . all -
Update name Description Available for machines Retrievable from Gateway firmware Firmware status of the gateway all Machine firmware Firmware status of the machine all
Select name Description Options Available for machines Controllable through Prebrew/-infusion mode Whether to use prebrew, preinfusion, or neither Disabled , Prebrew , Preinfusion Linea Micra , Linea Mini , GS3 AV Steam level The level your steam boiler should run at 1 , 2 , 3 Linea Micra , Linea Mini R Smart standby mode The smart standby mode, that decides from which events the timer to standby will run. Last brewing , Power on all Brew by weight dose mode Select the brew by weight mode of your machine Continuous , Dose 1 , Dose 2 Linea Mini , Linea Mini R
The integration exposes a calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] for the machine’s auto-on/off schedule. It only displays the schedule; you can’t make changes to the schedule from the calendar.
The schedule will be displayed recurrently: If you set the machine to start up on Mondays at 8:00 and shut down at 9:00, you will get events for all Mondays in your calendar. On days when you have the auto on/off feature disabled, you will not get an event in the calendar. Also, if you have the auto on/off feature disabled globally (for example, through the switch “Auto on/off”), there will be no events in the calendar.
Currently, only devices from the “Home” range are supported:
Linea Mini
Linea Mini R
Linea Micra
GS3 AV
GS3 MP
Control your machine through voice, allowing you to change boiler temperatures quickly without opening the app.
Control your smart coffee scales (tare/timer start) when a brew starts.
Turn on lights next to the machine while a brew is running.
Get started with these automation examples.
I often drink milk beverages in the morning and espresso in the afternoon, but forget to re-enable the steamboiler again, so this automation ensures that the steam boiler is always turned on, when the machine is turned on.
Example YAML configuration
alias : Turn steamboiler on when machine is turned on description : Ensure the steamboiler is on, when the machine gets turned on triggers : - trigger : state entity_id : - switch.mr000000 from : " off" to : " on" conditions : - condition : state entity_id : switch.mr000000_steam_boiler state : " off" actions : - action : switch.turn_on target : entity_id : switch.mr000000_steam_boiler data : {} mode : single
Only La Marzocco native app accounts are supported, social logins (Google, Apple & WeChat) are not supported
Currently it is only possible to view the schedules configured in the La Marzocco Home app, but not to edit the schedules from Home Assistant. You can, of course, build Home Assistant native automations to reflect the same functionality in Home Assistant.
Problem: Connection to machine is not possible
Check the La Marzocco Home app to see if you can connect to your machine there. If not, remove the machine and add it again (follow the instructions in the La Marzocco App).
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The La Marzocco device was introduced in Home Assistant 2024.2, and it's used by
287 active installations.
Its IoT class is Cloud Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@zweckj
Categories
Binary sensor
Number
Select
Sensor
Switch
Update
Back to top
