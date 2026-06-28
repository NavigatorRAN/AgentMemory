# Roborock - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/roborock
- Final URL: https://www.home-assistant.io/integrations/roborock
- Canonical URL: https://www.home-assistant.io/integrations/roborock/
- Fetched at: 2026-06-28T03:12:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Roborock vacuums into Home Assistant

## Extracted Text

On this page
Supported devices
Robot vacuums (local polling with cloud fallback)
Non-vacuum appliances (cloud-dependent)
Prerequisites
Configuration
Options
Data Updates
Supported functionality
Robovac devices
Dyad devices
Zeo Entities
List of actions
Removing the integration
To remove an integration instance from Home Assistant
FAQ
Can I use the Mi home app with this integration?
Can I block internet access for this device?
What devices are supported?
What features will you support?
How can I clean a specific room?
Known limitations
The vacuum supports polling only
The vacuum requires cloud access
Rate limiting on the cloud API
Troubleshooting
I get a invalid or no user agreement error - but nothing shows up in my app
The integration tells me it cannot reach my vacuum and is using the cloud API and that this is not supported or I am having any networking issues
My Device goes unavailable for a short period of time randomly - how can I fix this?
The integration tells me no devices were found even though I have devices on my account.
When I try to add the integration - it says my region is incorrect
Roborock integration automations
Automation: clean when leaving the house
Automation: post-cooking kitchen cleanup
The Roborock integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Roborock robotic vacuums to your Home Assistant. Roborock vacuums are
intelligent home cleaning robots and, depending on the specific device, may have features
like mopping capabilities, laser navigation, and options for changing cleaning
performance or location in the home. This integration enables you to control and
monitor your Roborock vacuum directly from Home Assistant.
The integration also allows for automation and integration with other smart home
devices. For example, you could send a notification when the vacuum is stuck, or
pause the vacuum when a media player starts playing music.
This integration communicates with devices paired to the official Roborock app. While it was originally developed for robot vacuums, it also supports other smart home appliances in the Roborock ecosystem.
Most robotic vacuums use a hybrid communication model. Home Assistant uses local communication for commands and polling but relies on the cloud for setup and fallback control.
S, QV, Qrevo, and Saros series: Fully supported.
Q-Series: Compatibility varies. While many Q-series models are supported, newer variants may have a different protocol that may fail to connect properly. If your model is unsupported, it may feature partial local control using the native Matter integration.
Non-vacuum products paired with the Roborock app communicate strictly by using an outbound MQTT connection. These devices do not support local communication with Home Assistant and are entirely cloud-dependent:
Roborock wet/dry vacuums (Dyad Series): Currently exposes a select number of telemetry and cleaning sensors.
Roborock Zeo One (smart washer/dryer): Exposes cycle states, remaining times, and specific appliance entities.
Download the Roborock App for iOS or Android.
Create an account and log in.
Add your Roborock device to the Roborock App (for example, by scanning a QR code).
To add the Roborock hub to your Home Assistant instance, use this My button:
Roborock can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Roborock .
Follow the instructions on screen to complete the setup.
Email address
The email address used to sign in to the Roborock app. A verification code will be sent to this email address when adding the Roborock integration.
Roborock server Region
The region that your Roborock account was created in. Leave this set to Auto unless you are having issues. See troubleshooting steps below.
Verification code
The verification code that is sent to your email address when adding the Roborock integration.
To define options for Roborock, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Roborock are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
The integration can be configured to specify which Roborock App features are drawn
on the map.
Charger
Show the charger on the map.
Cleaned area
Show the area cleaned on the map.
Go-to path
Show the go-to path on the map.
Ignored obstacles
Show ignored obstacles on the map.
Ignored obstacles with photo
Show ignored obstacles with photos on the map.
Mop path
Show the mop path on the map.
No carpet zones
Show the no carpet zones on the map.
No-go zones
Show the no-go zones on the map
No mopping zones
Show the no-mop zones on the map.
Obstacles
Show obstacles on the map.
Obstacles with photo
Show obstacles with photos on the map.
Path
Show the path on the map.
Predicted path
Show the predicted path on the map.
Vacuum position
Show the vacuum position on the map.
Virtual walls
Show virtual walls on the map.
Zones
Show zones on the map.
Show background
Show a blue background behind the map instead of a transparent background.
Show walls
Show the walls on the map.
Show rooms
Show the rooms on the map.
This integration uses both local and cloud polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] and also receives
cloud push events using MQTT. Local communication is preferred when possible.
Map data and routines are always fetched through the cloud, and Dyad and Zeo devices are cloud only.
The integration will automatically discover your Roborock devices using the cloud APIs and get
the needed information to communicate locally with them, if supported. Please ensure your Home Assistant
instance can communicate with the local IP of your device. We recommend setting a static IP
for your Roborock Vacuum to help prevent future issues. The device communicates on port 58867.
Depending on your firewall, you may need to allow communication from Home Assistant to your vacuum on that port.
Roborock devices have a variety of features that are supported on some devices but not on others. Only entities that your device supports will be added to your integration.
Vacuum
The vacuum entity holds the ability to control most things the vacuum can do, such as start a clean, return to the dock, or set the fan speed.
Image
Map
Description : Displays a live map of your Roborock vacuum’s cleaning area.
Select
Mop mode
Description : Describes how to mop the floor. On some firmware, it is called ‘mop route’.
Mop intensity
Description : How hard you would like your vacuum to mop.
Selected map
Description : Choose the map that is loaded on the vacuum.
Empty mode
Description : You can set the “empty mode” setting including Max, Light, Balanced, and Smart.
Availability : For vacuum equipped with an auto-empty dock
Binary sensor
Charging
Description : States if the vacuum is currently charging or not.
Cleaning
Description : States if the vacuum is currently cleaning or not. This is on when the robot is actively moving around or when the robot returns to the dock when the battery is low but a clean is still active and will resume later.
Mop attached
Description : States if the mop is currently attached.
Mop drying status
Description : Only available on docks with drying capabilites - States if the mop is currently being driven.
Water box attached
Description : States if the water box is currently attached.
Water shortage
Description : States if the water box is low on water - ‘Ok’ if it has not detected a water shortage.
Cleaning fluid
Description : Only available on docks with cleaning fluid capabilities - States if the dock is low on cleaning fluid, or the cleaning fluid container is not installed.
Clean water box
Description : Only available on docks with water tanks built-in. States if the dock is out of clean water, or if the clean water box is not installed.
Dirty water box
Description : Only available on docks with dirty water tanks built-in. States if the dirty water tank is full, or if the dirty water box is not installed.
Sensor
Cleaning area
Description : How much area the vacuum has cleaned in its current run. If the vacuum is not currently cleaning, how much area it has cleaned during its last run.
Cleaning time
Description : How long the vacuum has been cleaning for. If the vacuum is not currently cleaning, how long it cleaned for in its last run.
Cleaning progress
Description : Only available on some newer devices - what percent of the current cleaning is completed.
Dock error
Description : Only available on the non-basic docks - The current error of the vacuum or ‘Ok’ if none exists.
Main brush time left
Description : How much time is left before Roborock recommends you replace your main brush.
Mop drying remaining time
Description : Only available on the non-basic docks - How much time is left until the mop is dry and ready to continue cleaning.
Side brush time left
Description : How much time is left before Roborock recommends you replace your side brush.
Filter time left
Description : How much time is left before Roborock recommends you replace your vacuum’s air filter.
Maintenance brush time left
Description : How much time is left before Roborock recommends you replace your dock’s maintenance brush.
Strainer time left
Description : How much time is left before Roborock recommends you replace your dock’s strainer. This can refer to the water filter or the cleaning tray depending on your device.
Status
Description : The current status of your vacuum. This typically describes the action that is currently being run. For example, ‘spot_cleaning’ or ‘docking’.
Last clean begin
Description : the last time that your vacuum started cleaning.
Last clean end
Description : The last time that your vacuum finished cleaning.
Total cleaning time
Description : The lifetime cleaning duration of your vacuum.
Total cleaning area
Description : The lifetime cleaning area of your vacuum.
Total cleaning count
Description : The lifetime cleaning count of your vacuum.
Vacuum error
Description : The current error with your vacuum, if there is one.
Time
Do not disturb begin
Description : When Do not disturb is enabled, the vacuum does not run or speak after this point.
Do not disturb end
Description : When Do not disturb is enabled, the vacuum does not run or speak before this point.
Switch
Child lock
Description : This disables the buttons on the vacuum. Nothing happens when the buttons are pushed.
Status indicator light
Description : This is the LED on the top of your vacuum. The color changes depending on the status of your vacuum.
Do not disturb
Description : This enables Do not disturb during the time frame you have set in the app or on the time entity. When Do not disturb is enabled, the vacuum does not run or speak.
Number
Volume
Description : This allows you to control the volume of the robot’s voice. For example, when it states “Starting cleaning”. This allows you to set the volume to 0%, while the app limits it to 20%.
Button
There are currently four buttons that allow you to reset the various maintenance items on your vacuum. Pressing the button cannot be undone. For this reason, the buttons are disabled by default to make sure they are not pressed unintentionally.
Reset sensor consumable
Description : The sensors on your vacuum are expected to be cleaned after 30 hours of use.
Reset side brush consumable
Description : The side brush is expected to be replaced every 200 hours.
Reset main brush consumable
Description : The main brush/ roller is expected to be replaced every 300 hours.
Reset air filter
Description : The air filter is expected to be replaced every 150 hours.
In addition, some vacuums allow routines to be set up in the app. For each of those routines, a button entity will be created, allowing you to trigger it.
Roborock wet/dry vacuums currently expose some entities through an MQTT connection - it is currently cloud dependent.
Description : The current status of your vacuum. This typically describes the action that is currently being run. For example, ‘drying’ or ‘charging’.
Battery
Description : The current charge of your device.
Description : how long until Roborock recommends cleaning/replacing your filter.
Brush time left
Description : how long until Roborock recommends cleaning/replacing your brush.
Error
Description : the current error of the device - if one exists - “None” otherwise.
Description : how long you have cleaned with your wet/dry vacuum.
Roborock Zeo One currently exposes some entities through an MQTT connection - it is currently cloud dependent.
State
Description : The current state of your washing machine. For example, ‘washing’ or ‘rinsing’.
Countdown
Description : Countdown for how long until the machine starts.
Washing left
Description : The amount of time until your machine is done washing.
Description : The current error of the Zeo, if one exists.
The Roborock integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get maps ( roborock.get_maps )
Retrieves the map and room information of a Roborock vacuum.
Get current position ( roborock.get_vacuum_current_position )
Retrieves the current position of a Roborock vacuum.
Go to position ( roborock.set_vacuum_goto_position )
Sends a Roborock vacuum to a specific position.
For an overview of every action across all integrations, see the actions reference .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
No. This integration requires information from your Roborock app to set up and uses Roborock’s protocols to communicate with your device. You must have your vacuum synced to the Roborock app.
No. When the vacuum is disconnected from the internet, it blocks its local API until it can reach the Roborock servers. However, when connected by using Matter, the vacuum can work fully offline, but the controls and sensors are limited.
If you can add your device to the Roborock app - it is supported. However, some older vacuums like the Roborock S5 must be connected using the Mi Home app and can be set up in Home Assistant through the Xiaomi Miio integration.
We are working on adding a lot of features to the core integration. We have reverse-engineered over 100 commands . The documentation is currently very bare-bones, and we are looking for users to help us make it more complete. The following are some of the functionalities we plan to add to Home Assistant Core. We ask that you are patient with us as we add them.
Dock controls
Manual vacuum remote control
Viewing the camera
Go to the vacuum entity of your Roborock device.
Select the gear icon button.
Select Map vacuum segments to areas .
Map the Roborock areas to your Home Assistant areas and select Save .
Go back to the vacuum entity and select Cleaning by area .
Select your areas and select Clean .
Note
Roborock vacuums do not support cleaning in a specific room order.
The Roborock integration polls your robot vacuum every 30 seconds with no push-based updates from the vacuum itself. The app also polls the robot vacuum approximately every 2 seconds. This means that push-based updates are not possible. If you want pushed based updates from your robot vacuum you can connect it using Matter, however only a few entities are supported.
Despite this integration’s IoT class being local polling, cloud access is required for it to work just like any other cloud based integration.
The Roborock cloud allows a certain number of requests to its cloud, until it decides to ban your IP address. To counter this, there is rate limiting built into the Python package that this integration is built on. This is to try to help prevent your instance from overwhelming the Roborock servers and resulting in any kind of IP ban.
Causes
If your vacuum runs out of battery, hibernates or shutsdown, then Home Assistant may contact the cloud API. If you have a script that automatically reloads the integration if it goes unavailable, then you are frequently reloading and that causes rate limits.
Home Assistant actions like get vacuum current position use the cloud API and may trigger a rate limit if used frequently
Symptoms
Home Assistant will notify you about this as a repair issue unless if you decide to ignore it, and will give information about rate limiting in your logs. After enough polls the rate limiting will kick in and will stop polling the cloud which will cause all the entities to go unavailable.
For info on how to fix this
Roborock servers require accepting a user agreement before using the API, which may block Home Assistant during setup. Additionally, the Roborock may ask you to re-enter the user agreement, even if you have entered it before. To allow Home Assistant to use the Roborock API, you need to take the following steps:
Open your Roborock app.
Open Profile > About Us > User Agreement & Privacy Policy .
Hit Revoke authorization .
Log back in and accept the policy.
Reload the Roborock integration!
Info about the causes and symptoms of this issue
The steps needed to fix this issue are specific to your networking setup. Here are some general troubleshooting steps:
Ensure your vacuum has outbound access via port 8883 (MQTT) to communicate with the cloud servers.
Ensure your vacuum is allowed to communicate directly with your Home Assistant instance’s internal IP address over TCP 58867 and UDP 58866.
If you use a network-wide ad or DNS-blockers (such as Pi-hole, AdGuard Home, or NextDNS), ensure that your Roborock vacuum’s IP address is entirely exempted from filtering. Overly aggressive ad-blocking lists can inadvertently break the local handshake protocol, forcing Home Assistant to connect to it over the cloud.
Roborock vacuums heavily rely on stable local handshakes. It is recommended to log into your router’s admin interface and assign a Static IP / DHCP reservation to your vacuum to prevent connection drops when DHCP leases renew.
Check your router’s webpage. If the device is losing connection, you need to focus on increasing your Wi-Fi network’s performance.
If you cannot log into your router’s webpage, in the Roborock app, go to Settings > Product Info > Wi-Fi Name , and you should see its signal strength.
The vacuum randomly disconnects from the internet for about one minute and automatically reconnects. This causes the integration to go unavailable until the vacuum is reachable again. This is not an issue with the integration but rather the integration is reacting to the device’s status.
Some devices are not supported yet as they use a different protocol than other devices. Make sure you are on the latest version of Home Assistant.
We recommend using the “Auto” setting for your region. If that doesn’t work because you have accounts in multiple regions, try the following steps:
If you ever accidentally created a Roborock account in the wrong Roborock server region, delete it using the Roborock App.
The Roborock server region for your account may not always be associated with your actual country. While setting up the integration, you may select the Roborock server region that you want to sign in with, with four available options: US, EU, RU, or CN, and you may need to try a different region than the one you expect. Most users outside of Russia or China are in the US and EU Roborock server regions.
The “Region” that is shown in the app is actually the country your account is registered to. It does not always match the region the integration is looking for.
The Roborock integration allows for direct control of your vacuum, but its true potential is unlocked when connected to the broader Home Assistant ecosystem.
Instead of scheduling your vacuum to run at a fixed time when you might be home or on a work call, you can trigger a full clean automatically the moment your alarm system is armed to “Away.”
Warning
Running a robot vacuum while your alarm system is armed can falsely trigger motion sensors (PIRs) and cause accidental alarms. Only use this automation if your motion sensors are pet-immune, positioned out of the vacuum’s path, or if you can reliably verify your home’s security remotely (e.g., via security cameras) to confirm if a burglary is occurring before emergency services are dispatched.
Trigger : alarm_control_panel.home_alarm gets set to "armed_away" .
Conditions : vacuum.roborock_s8 is "docked" .
Actions : vacuum.start to start the robot vacuum to clean the house while everyone is away.
YAML example for cleaning the house after the alarm is set to armed away
alias : " Vacuum: Clean when house is empty" description : " Triggers a full clean when the house alarm is armed to away." trigger : - platform : state entity_id : alarm_control_panel.home_alarm to : " armed_away" condition : - condition : state entity_id : vacuum.roborock_s8 state : " docked" action : - service : vacuum.start target : entity_id : vacuum.roborock_s8 mode : single
Cooking often leaves crumbs or spills near the stove. You can automate your Roborock to head straight to the kitchen to tidy up when your smart stove or oven is turned off.
Trigger : switch.smart_hob_power gets switched to "off" for a minute.
Actions : vacuum.clean_area with cleaning_area_id: kitchen to start the robot vacuum to clean kitchen after cooking is done.
YAML example for cleaning the kitchen after the hob is turned off for a minute
alias : " Vacuum: Clean kitchen after cooking" description : " Sends the vacuum to the kitchen zone 1 minute after the stovetop turns off." mode : single trigger : - platform : state entity_id : switch.smart_hob_power from : " on" to : " off" for : minutes : 1 minute condition : - condition : state entity_id : vacuum.roborock_s8 state : " docked" action : - service : vacuum.clean_area target : entity_id : vacuum.roborock_s8 data : cleaning_area_id : kitchen
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Roborock hub was introduced in Home Assistant 2023.5, and it's used by
9.1% of the active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Lash-L
@allenporter
Categories
Back to top
