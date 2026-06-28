# Fumis - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fumis
- Final URL: https://www.home-assistant.io/integrations/fumis
- Canonical URL: https://www.home-assistant.io/integrations/fumis/
- Fetched at: 2026-06-28T02:44:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Fumis-based pellet stove with Home Assistant.

## Extracted Text

On this page
Supported devices
Unsupported devices
Prerequisites
Configuration
Supported functionality
Entities
Alert codes
Error codes
Examples
Warming up your home in the morning
Turning off the stove at bedtime
Turning off the stove when everyone leaves
Getting a notification when fuel is running low
Data updates
Known limitations
Troubleshooting
Can’t set up the stove
Changes take a long time to apply
Stove shows as unavailable
Removing the integration
To remove an integration instance from Home Assistant
The Fumis integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects your pellet stove to Home Assistant through the Fumis online service. Fumis, by ATech Electronics in Slovenia, makes the combustion controllers found in pellet stoves from many different manufacturers. The Fumis WiRCU Wi-Fi module connects your stove to the internet, making it possible to monitor and control your stove from anywhere.
With this integration, you can keep an eye on your room temperature, set a comfortable target temperature, and turn your stove on or off right from your Home Assistant dashboard. Imagine coming home on a cold winter evening to a warm and cozy living room, with your pellet stove already running at just the right temperature. Or waking up on a chilly morning to a home that’s been warmed up for you.
By including your stove in your automations, you can create a personalized heating schedule that fits your daily routine. Smart heating helps you reduce pellet consumption by only burning when you actually need the warmth, which saves you money on fuel and is better for the environment. Or simply enjoy the peace of mind that comes from knowing your stove turns off automatically when everyone goes to bed or has left the home.
Any pellet stove, pellet boiler, or hybrid wood and pellet stove equipped with a Fumis WiRCU Wi-Fi module is expected to work with this integration. The integration has been designed to work with the following brands and models:
Austroflamm
Clou Duo (hybrid wood and pellet stove)
MO DUO (hybrid wood and pellet stove)
Polly 2.0 (pellet stove)
Eco Spar
Auriga (pellet boiler)
Solara (pellet stove)
Tukana (pellet stove)
Karina (pellet stove)
Nova (pellet boiler)
HAAS+SOHN
Heta
Scan-Line Green 200 (pellet stove)
If your stove has a Fumis WiRCU module but is not listed here, it is still likely to work. You can identify the WiRCU module by the label on the device, which shows a MAC address and PIN code.
Stoves that use a Fumis Alpha controller without the WiRCU Wi-Fi module are not supported by this integration. These stoves connect through a serial interface and do not use the Fumis online service. Brands that commonly use this serial connection include Palazzetti, Jotul, TurboFonte, Godin, Fonte Flamme, and Invicta.
To set up this integration, you need a pellet stove with a Fumis WiRCU Wi-Fi module.
Make sure the WiRCU module is connected to your home Wi-Fi network. If you haven’t set this up yet, follow the instructions included with the module.
Locate the MAC address and PIN code on the label of your WiRCU module. The MAC address is a unique code of letters and numbers that identifies your stove. You will need both during setup.
To add the Fumis device to your Home Assistant instance, use this My button:
Fumis can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fumis .
Follow the instructions on screen to complete the setup.
MAC address
You can find the MAC address on the label of the Fumis WiRCU Wi-Fi module connected to your stove.
PIN code
You can find the PIN code on the label of the Fumis WiRCU Wi-Fi module connected to your stove.
This integration supports multiple stoves. If you have more than one stove with a Fumis WiRCU module, you can set up the integration once for each stove.
The Fumis integration provides a climate entity, as well as binary sensor, button, sensor, and switch entities, for your pellet stove.
Climate
The climate entity lets you monitor and control your stove’s heating. It provides the following features:
Current temperature : The room temperature as measured by your stove’s built-in sensor.
Target temperature : Set the desired room temperature between 10°C and 35°C, in 0.5°C steps.
HVAC modes : Turn the stove on (heat) or off.
Heating status : Shows the current phase of your stove:
Off : The stove is turned off or a heating cycle has ended.
Preheating : The stove is starting up. This includes the ignition phase, where the stove lights the pellets and brings the combustion chamber up to temperature.
Heating : The stove is actively burning pellets and heating your room.
Idle : The stove is in a cooling-down phase after a heating cycle.
Sensors
The integration provides sensors that give you insight into your stove’s operation and health. The available sensors depend on your stove model and its capabilities.
Temperature : The current room temperature as measured by your stove.
Stove status : A simplified view of what your stove is doing (off, heating up, ignition, burning, eco, or cooling).
Detailed stove status : The precise operational phase of your stove, useful for automations.
Alert : The currently active alert on your stove. Shows “No alert” when there are no warnings. See the alert codes below.
Error : The currently active error on your stove. Shows “No error” when everything is fine. See the error codes below.
Fuel level : How much fuel is left in the pellet hopper, shown as a percentage.
Power output : The current thermal output of your stove in kilowatts.
Combustion chamber : The temperature inside the combustion chamber.
WiRCU module : The temperature of the Wi-Fi module itself.
Wi-Fi signal strength : How strong the Wi-Fi connection of your stove’s module is.
Uptime : When your stove was last powered on.
Burning time : Total time your stove has been actively burning.
Fuel consumed : Total amount of fuel your stove has used.
Igniter starts : How many times the igniter has been activated.
Overheatings : Number of overheating events recorded.
Misfires : Number of failed ignition attempts.
Time to service : Hours remaining until the next scheduled maintenance.
Some additional sensors are available but disabled by default because they are primarily useful for troubleshooting: fan speeds, Wi-Fi RSSI, and combustion chamber pressure. You can enable them from the entity settings if needed.
Binary sensors
Door : Shows whether the combustion chamber door is open or closed. This sensor is only available on stoves that have a door sensor (like the Austroflamm Clou Duo).
Buttons
Sync clock : The Fumis WiRCU module does not synchronize its internal clock from the internet. Over time, the clock can drift, and it does not automatically adjust for daylight saving time changes. This button sends the current time from Home Assistant to your stove’s controller, keeping its clock accurate. This is especially useful for stoves that use the built-in weekly timer schedule. You can automate this by pressing the button on a regular basis, for example, after a daylight saving time change.
Switches
Eco mode : Turn eco mode on or off. When eco mode is active and the room temperature exceeds the target temperature, the stove turns off automatically and restarts when the room temperature drops below the target temperature again. This switch is only available on stoves that support eco mode.
Timer : Enable or disable the weekly timer schedule. When enabled, the stove follows the programmed schedule to turn on and off at set times throughout the week.
Numbers
Power level : Set the stove’s heating power from level 1 (lowest) to 5 (highest). A higher power level means more pellets are fed into the combustion chamber, producing more heat. The actual thermal output in kilowatts adjusts gradually after changing the power level.
Fan speed : Adjust the fan speed from 0 to 5. This controls the airflow through the stove and should typically not need to be changed. This entity is disabled by default and only available on stoves with a controllable fan.
The alert sensor shows the currently active alert on your stove. Alerts are less critical than errors and typically indicate something that needs your attention. The following alert codes are recognized:
Low fuel level (A001): The pellet tank is running low. Time to refill.
Service due (A002): Your stove is due for regular maintenance.
Flue gas temperature warning (A003): The flue gas temperature is elevated. Consider cleaning the chimney or heat exchanger.
Low battery (A004): The controller battery is low. Contact your service technician for a replacement.
Speed sensor failure (A005): The speed sensor is not working correctly. Contact your service technician.
Door open (A006): The combustion chamber door is open. Close the door.
Airflow sensor malfunction (A007): The airflow sensor is malfunctioning. The stove is operating in a limited mode.
The error sensor shows the currently active error on your stove. When an error occurs, the sensor state changes to a descriptive name, and the original device error code is available as a code attribute on the sensor. The following error codes are recognized:
Ignition failed (E101): Ignition failed, water overtemperature, or backfire protection triggered.
Chimney or burning pot dirty (E102): The chimney or burning pot needs cleaning, or the stove was manually stopped before flame detection.
Sensor T02 malfunction (E105): Temperature sensor T02 is malfunctioning or disconnected.
Sensor T03/T05 malfunction (E106): Temperature sensor T03 or T05 is malfunctioning or disconnected.
Sensor T04 malfunction (E107): Temperature sensor T04 is malfunctioning or disconnected.
Safety switch tripped (E108): The safety thermostat (STB) has tripped. Reset and restart the stove.
Pressure sensor off (E109): The pressure sensor has switched off. Reset and restart the stove.
Sensor T01/T02 malfunction (E110): Temperature sensor T01 or T02 is malfunctioning or disconnected.
Sensor T01/T03 malfunction (E111): Temperature sensor T01 or T03 is malfunctioning or disconnected.
Flue gas overtemperature (E113): The flue gas temperature is too high. Clean the chimney or heat exchanger.
Fuel ignition timeout (E114): The fuel did not ignite in time. The burning pot may be empty, or the pellet tank needs refilling.
General error (E115): A general error has occurred. Contact your service technician.
Your pellet stove works with all the features Home Assistant has to offer. Here are a couple of automation examples to get you started. You could also combine your stove with presence detection to heat only when someone is home, pair it with a weather forecast to prepare for cold nights, or use voice commands to adjust the temperature from the couch.
Nobody likes stepping out of bed into a cold house. With this automation, your stove starts warming up your living room before your alarm goes off, so your home is already cozy when you start your day.
- alias : " Warm up the living room in the morning" triggers : - trigger : time at : " 06:30:00" actions : - action : climate.set_temperature target : entity_id : climate.pellet_stove data : temperature : 22 hvac_mode : heat
Save energy and enjoy peace of mind by having your stove turn off automatically each evening. No more wondering whether you forgot to turn off the stove before going to sleep.
- alias : " Turn off the stove at bedtime" triggers : - trigger : time at : " 22:00:00" actions : - action : climate.turn_off target : entity_id : climate.pellet_stove
Why heat an empty house? This automation turns off your stove when the last person leaves home, saving pellets and energy while you’re away.
- alias : " Turn off the stove when nobody is home" triggers : - trigger : numeric_state entity_id : zone.home below : 1 actions : - action : climate.turn_off target : entity_id : climate.pellet_stove
Never run out of pellets unexpectedly. This automation sends you a notification when the fuel level drops below 20%, giving you plenty of time to refill the hopper.
- alias : " Notify when pellet fuel is running low" triggers : - trigger : numeric_state entity_id : sensor.pellet_stove_fuel_level below : 20 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Pellet stove" message : " Fuel level is running low. Time to refill the hopper."
The Fumis integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the Fumis online service every 30 seconds. This matches the rate at which the WiRCU module sends updates, so polling more frequently would not provide fresher data.
When you change a setting, for example adjusting the target temperature or turning the stove on, the command is sent to the Fumis online service. The online service then relays the command to your stove on the next update cycle.
The integration communicates with your stove through the Fumis online service. Both your Home Assistant instance and your stove’s WiRCU module need an active internet connection. If either loses connectivity, the integration cannot communicate with your stove.
After sending a command to your stove, such as changing the target temperature or turning it on, it can take up to a few minutes for the change to take effect. The command travels from Home Assistant to the Fumis online service and then to your stove on the next update cycle.
Symptom: “Invalid authentication”
When trying to set up the integration, the form shows the error message “Invalid authentication”.
Description
The MAC address or PIN code you entered does not match any registered stove in the Fumis online service.
Resolution
To resolve this issue, try the following steps:
Double-check the MAC address and PIN code on the label of your WiRCU module.
Make sure you enter the MAC address exactly as shown on the label, including all letters and numbers.
Make sure the PIN code is entered correctly.
If your stove was recently installed, it may take some time for it to register with the Fumis online service. Wait a few minutes and try again.
Symptom: “Your stove’s Fumis WiRCU Wi-Fi module is not connected to the internet”
When trying to set up the integration, the form shows this error message.
The Fumis online service cannot reach your stove’s WiRCU module. The module is either powered off, not connected to Wi-Fi, or unable to reach the internet.
Make sure your stove is powered on.
Check that the WiRCU module is properly connected to your Wi-Fi network.
Verify that your Wi-Fi network has internet access.
Try restarting the WiRCU module by briefly disconnecting and reconnecting its power supply.
If the issue persists, check whether you can reach your stove through the manufacturer’s mobile app. If the app also cannot reach the stove, the issue is with the WiRCU module or your network.
After adjusting the target temperature or turning the stove on or off, the change does not seem to take effect immediately.
This is expected behavior. Commands travel from Home Assistant to the Fumis online service, and then to your stove on the next update cycle. This process can take up to a few minutes. The state shown in Home Assistant updates once the stove confirms the change.
If your stove entity shows as unavailable in Home Assistant, the integration cannot reach the Fumis online service, or your stove’s WiRCU module has gone offline.
Check your internet connection.
Verify that the WiRCU module is connected to your Wi-Fi network.
Check whether you can control your stove through the manufacturer’s mobile app. If the app also cannot reach the stove, the issue is with the WiRCU module or your network, not with the Home Assistant integration.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fumis device was introduced in Home Assistant 2026.5, and it's used by
23 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Back to top
