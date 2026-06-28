# Z-Wave - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/zwave_js
- Final URL: https://www.home-assistant.io/integrations/zwave_js
- Canonical URL: https://www.home-assistant.io/integrations/zwave_js/
- Fetched at: 2026-06-28T03:31:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Z-Wave with Home Assistant via Z-Wave JS.

## Extracted Text

On this page
Getting started
Setting up a Z-Wave server in Home Assistant
Adding a new device to the Z-Wave network
Removing a device from the current Z-Wave network
Removing a device from a foreign Z-Wave network
Migrating a Z-Wave network to a new adapter
Prerequisites
To migrate a Z-Wave network to a new adapter
Migrating from Z-Wave JS UI to the Z-Wave JS app
Installing necessary apps
Downloading the backup from Z-Wave JS UI
Running the migration script
Reconfiguring the Z-Wave integration to use the Z-Wave JS app
Overriding the radio frequency region of the adapter in the Z-Wave JS app
To override the radio frequency region of your Z-Wave adapter
Backing up your Z-Wave network
To backup your Z-Wave network
Restoring your Z-Wave network from a backup
Restoring a Z-Wave network from backup
Updating the firmware of your Z-Wave device
To update firmware of a Z-Wave device
Resetting a Z-Wave adapter
To reset a Z-Wave adapter
Special Z-Wave entities
Entities available for every Z-Wave device
Conditional entities
Using advanced features (UI only)
Integration configuration panel
Integration menu
List of actions
Events
Node events (Notification)
Scene events (Value Notification)
Value updated events
List of triggers
Advanced installation instructions
Running Z-Wave JS Server
Installing and configuring the Z-Wave integration in Home Assistant
FAQ: Supported devices and Command Classes
FAQ: Installation and configuration
Which Z-Wave adapter should I buy?
Why was I (not) automatically prompted to install Z-Wave?
What happened to Zwavejs2Mqtt or the Z-Wave JS to MQTT app?
What happened to the Z-Wave JS UI app?
Should I use Secure Inclusion?
Where can I see the security keys in the Z-Wave JS app?
FAQ: Troubleshooting topics
I’m having a problem, what to do first?
My Z-Wave adapter isn’t recognized automatically during setup
I have an Aeotec Gen5 adapter, and it isn’t detected on my Raspberry Pi 4?
I do not see any entities created for my device in Home Assistant
My device doesn’t automatically update its status in Home Assistant if I control it manually
My device is recognized as Unknown Manufacturer and/or some functions don’t work with the Z-Wave integration
How do I get a dump of the current network state?
How do I address interference issues?
How do I access the Z-Wave logs?
Unsupported functionality
Setting the adapter into learn mode to receive network information
Including / excluding a adapter in an existing network using classic inclusion
Z-Wave association groups
Identification via Z-Wave
Z-Wave Command Classes Home Assistant responds to when queried
Z-Wave terminology
Association group
Classic inclusion versus SmartStart
SmartStart
Terminology mapping table
Removing Z-Wave JS from Home Assistant
To remove Z-Wave JS from Home Assistant
Related topics
The Z-Wave integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Z-Wave network from Home Assistant via the Z-Wave JS driver.
This section shows how to set up a Z-Wave network and how to add a Z-Wave end device to that network.
A Z-Wave network in Home Assistant includes the following elements:
a Z-Wave adapter (for example, Home Assistant Connect ZWA-2 )
a Z-Wave server (for example, the Z-Wave JS app (formerly known as an add-on))
this Z-Wave integration
Z-Wave end devices
This section shows how to set up a Z-Wave server using the Z-Wave JS app in Home Assistant.
For other ways to set up a Z-Wave server, refer to the advanced installation instructions .
Once you have set up the Z-Wave server, you can add devices to the network .
A supported Z-Wave adapter .
First-time user? For recommendations, refer to the what-to-buy-section .
To set up a Z-Wave server
Open the Home Assistant user interface.
Plug the Z-Wave adapter into the device running Home Assistant.
Most likely, your adapter will be recognized automatically.
In the dialog, select Recommended installation .
This will install the Z-Wave JS app on the Home Assistant server.
Add the device to an area An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. [Learn more] and select Finish .
Troubleshooting: If your adapter is not recognized, follow these steps .
Wait for the installation to complete.
Depending on your Home Assistant version, you may be prompted for network security keys.
If you are using Z-Wave for the first time, leave all the fields empty and select Submit . The system will generate network security keys for you.
If this Z-Wave adapter has already been paired with secure devices, you need to enter the previously used network key as the S0 network key. S2 security keys will be automatically generated for you.
Make sure that you keep a backup of these keys in a safe place in case you need to move your Z-Wave adapter to another device. Copy and paste them somewhere safe.
Wait for the Z-Wave JS app to start up.
Once the installation is complete, the Device info of the Z-Wave adapter is shown.
You successfully installed the Z-Wave integration and the Z-Wave JS app.
You can now add devices to the Z-Wave network.
Note
While your Z-Wave mesh is permanently stored on your adapter, the additional metadata is not. When the Z-Wave integration starts up the first time, it will interview your entire Z-Wave network. Depending on the number of devices paired with the Z-Wave adapter, this can take a while. You can speed up this process by manually waking up your battery-powered devices. Most of the time, this is a button press on those devices (see their manual). It is not necessary to exclude and re-include devices from the mesh.
In Home Assistant, go to Settings > Z-Wave .
Select Add device .
The Z-Wave adapter is now in inclusion mode.
Check if your device supports SmartStart:
On the packaging, check for the SmartStart label.
Find the QR code. It can be on the packaging or on the device itself.
Depending on whether your device supports SmartStart, follow the steps in either option 1 or 2:
Option 1: your device supports SmartStart :
Make sure the device is turned off.
Select Scan QR code and scan the QR code on your device.
Troubleshooting: If scanning does not work (for example due to missing HTTPS), paste the QR code content as text from a different QR reader and select Submit .
If the device supports Z-Wave Long Range, you’re prompted to choose the network type.
Long Range : If it is far away from other devices, or that spot has had connection issues in the past. It might also help preserve battery life.
Mesh : If you already have a mesh network. Adding it can enhance coverage and reliability of this network.
You can always remove and pair the device again to switch to the other network type.
Turn the device on and set it into inclusion mode.
If it was already on, you might need to power-cycle it.
Option 2: your device does not support SmartStart :
Set the device in inclusion mode. Refer to the device manual to see how this is done.
If your device is included using S2 security, you may be prompted to enter a PIN number provided with your device. Often, this PIN is provided with the documentation and is also printed on the device itself. For more information on secure inclusion, refer to this section .
The UI should confirm that the device was added. After a short while (seconds to minutes), the entities should also be created.
Troubleshooting: If the adapter fails to add/find your device, cancel the inclusion process.
In some cases, it might help to first remove a device (exclusion) before you add it, even when the device has not been added to this Z-Wave network yet.
Another approach would be to factory reset the device. Refer to the device manual to see how this is done.
Important:
Do not move your Z-Wave adapter to include devices. Moving the adapter is no longer necessary and leads to broken routes.
Do not initiate device inclusion from the Z-Wave adapter itself. This is no longer supported.
Do this before using the device with another adapter, or when you don’t use the device anymore. It removes the device from the Z-Wave network stored on the adapter. It also removes the device and all its entities from Home Assistant. You cannot join a device to a new network if it is still paired with an adapter.
In Home Assistant, go to Settings > Devices & services .
Select the Z-Wave integration.
Then, select the device you want to remove.
Under Device info , select the three-dot menu, then select Delete .
This opens a dialog with options for removing the device.
Select Remove a working device .
The Z-Wave adapter is now in exclusion mode.
Put the device you want to remove in exclusion mode. Refer to its manual to learn how this is done.
The UI should confirm that the device was removed and the device and entities will be removed from Home Assistant.
Do this when you have a device that is still paired with an adapter, but you don’t have access to that adapter anymore. If the device was not excluded from that adapter, you cannot join it to a new network. This process removes the device from the previous adapter’s network, allowing you to pair it with a new adapter.
Select Options .
Next to Remove foreign device , select Remove > Start exclusion .
Do this if you have an existing Z-Wave network and want to replace its adapter with a new adapter. The Z-Wave integration with all its entities will stay in Home Assistant. The new adapter is added to Home Assistant and paired with the existing network.
Tip
You cannot run two Z-Wave adapters at the same time with the same Z-Wave app instance. If you only want to use a single app instance, you need to migrate the network to the new adapter. If you want to use two adapters at the same time, you need a second Z-Wave JS Server instance. You can run this additional Z-Wave JS Server instance in a separate container, or run Z-Wave JS Server or Z-Wave JS UI on another system outside of Home Assistant.
Administrator rights in Home Assistant
Device-specific prerequisites
Migrating from a 500 series adapter
Before starting migration, you need to update the adapter to SDK 6.61+
Check the documentation of your device to see if and how they can be updated.
Steps to update Aeotec Z-Stick 5 .
Migrating from a Nortek HUSBZB-1 adapter
There is no easy way to update that device.
You need to set up a new network.
If you are comfortable with soldering:
Some users have reported that they were able to upgrade the firmware of the Nortek HUSBZB-1 with this update procedure (requires soldering) .
The procedure is very involved. Most likely, starting from scratch is quicker.
Under Migrate adapter , select Migrate .
When the Unplug your adapter dialog shows up, unplug your old adapter.
It is important to remove the old device now, as it might interfere with the new one. Even though it might not throw an error immediately, it might cause issues.
Connect the new adapter.
Select Submit .
In the Select your device dialog, select the Z-Wave adapter you just connected.
Typically, you can select the device you connected to a USB port.
To connect to a Z-Wave controller that you exposed elsewhere via TCP (such as Portable Z-Wave ), select the Use socket option.
The new adapter is now being paired with your existing Z-Wave network.
Troubleshooting: If the migration fails, it might be because you selected Use socket by mistake. If you were using a USB-based controller, plug the old adapter in again, and wait for the network to reload.
Once your old adapter is connected and the network is operational, repeat the migration steps.
Make sure to select the new controller this time (instead of Use socket ).
Once the migration has completed, check if you want to rename the adapter. If you have previously changed the name, the new adapter might keep the name of the old adapter.
In the top-left corner, select the back button to go back to the integration page.
In the list of devices, check the device name.
To change the device name, select the button.
If you have been using the Z-Wave JS UI app, you can migrate to the Z-Wave JS app without needing to re-pair your devices. The Z-Wave JS app is the successor of the Z-Wave JS UI app and provides a better experience and more features. The migration process involves installing the Z-Wave JS app, which will automatically take over from the Z-Wave JS UI app.
Your Z-Wave network is currently managed by the Z-Wave JS UI app
In Home Assistant, go to Settings > Apps > Z-Wave JS .
Install the Z-Wave JS app by selecting Install .
Do not start the app yet.
Install necessary helper apps:
Install the Terminal & SSH app so you can run commands on the Home Assistant host.
Install an app that lets you upload and edit files on the Home Assistant host, like the File Editor app or the Studio Code Server app .
Open Z-Wave JS UI web interface and go to the Store tab.
Download a backup:
In the bottom-right corner, select Download .
Stop the Z-Wave JS UI app.
Download the migration script .zip file from https://gist.github.com/AlCalzone/eb0947a39a3ff91c053f259f0ac4efc3#file-migrate_to_zwave_js_app-sh .
Extract the zip file and locate the migrate_to_zwave_js_app.sh script.
Locate the backup file you downloaded from the Z-Wave JS UI web interface. It should be a .zip file.
Open the Studio Code Server or SSH app.
Upload the backup file and the migration script into a temporary folder, ideally the /tmp folder.
Open the terminal, then use cd /tmp to navigate to the /tmp folder.
Make the script executable by running chmod +x ./migrate_to_zwave_js_app.sh
Run ./migrate_to_zwave_js_app.sh <backup-filename> , then follow the on-screen instructions:
Go to Settings > Devices & services .
Select the three dots menu, then choose Reconfigure .
Select Reconfigure the current adapter .
Depending on how your controller is connected, you might need to either select or clear the Use the Z-Wave Supervisor app checkbox.
Option 1: If you are using a USB-based or TCP-based controller:
Select the Use the Z-Wave Supervisor app checkbox.
In the next step, select your controller and select Submit .
Option 2: If you are using a GPIO module or if your controller is not showing up in the list:
Clear the Use the Z-Wave Supervisor app checkbox.
Enter the connection details for your Z-Wave JS app:
In the URL field, enter ws://core-zwave-js:3000 .
Remove the temporary files you uploaded to the /tmp folder for the migration.
Done! Your Z-Wave JS app is now managing your Z-Wave network. You can start the Z-Wave JS app and stop and uninstall the Z-Wave JS UI app.
The frequency used by Z-Wave devices depends on your region. For 700 and 800 series adapters, this frequency can be changed. The frequency of end devices cannot, so you need to make sure to buy devices specific to your region.
If you are using the Z-Wave JS app, Home Assistant automatically changes the radio frequency region to match the region/country you’re in. If needed, you can override this setting.
All your Z-Wave devices must be specified for that region
Note: this procedure only applies if your adapter is set up using the Z-Wave JS app
Go to Settings > Apps > Z-Wave JS .
Open the Configuration tab.
In the Options section, select the Radio Frequency Region .
Automatic sets the region based on the location defined under Settings > System > General .
For regions where Long Range is available, it uses Long Range if the adapter supports it.
If you set regions manually, choose one of the Long Range options where available:
Europe (Long Range) or USA (Long Range) .
Even with the Long Range option selected, you can still add devices that don’t support Long Range.
To apply your changes, select Save .
Your Z-Wave adapter is now ready to communicate with devices that were specified for your chosen region.
To return to the default setting and use the region defined by Home Assistant, under Radio Frequency Region choose Automatic .
It’s recommended to create a backup before making any major changes to your Z-Wave network. For example, before migrating from one adapter to another, or before resetting your adapter. The backup stores your Z-Wave adapter’s non-volatile memory (NVM), which contains your network information including paired devices. It is stored in a binary file that you can download.
Under Download backup , select Download .
Result : The backup file is downloaded to the device from which you initiated the download.
Done! Store the backup file somewhere safe in case you need it later to restore your Z-Wave network.
You can restore your Z-Wave network from a backup.
Have a backup downloaded
Under Restore from backup , select Restore .
Select the backup you want to restore from.
Result : The Z-Wave network is being restored and the devices that were part of the network should show up again.
Adapters and devices with the Firmware Update Metadata Command Class allow you to update the firmware by uploading a firmware file. In those cases, you can start the firmware update from the device page in Home Assistant. Refer to the documentation of the device manufacturer to find the corresponding firmware file. An example is the firmware page by Zooz .
Risk of damage to the device due to firmware update
A firmware update can damage your Z-Wave device.
Before updating your Z-Wave device, make sure an update is necessary, and that you have the correct firmware file matching your device.
Once you have started the update process, you must not interrupt the update process but let it complete.
The Home Assistant and Z-Wave JS teams do not take any responsibility for any damages to your device as a result of the firmware update and will not be able to help you if you render your device useless due to firmware update.
Downloaded the firmware file from the manufacturer website
Select Devices .
Then select the device you want to update.
Under Device info , select the three-dot menu, then select Update .
Select the firmware file that you previously downloaded to your computer.
Notice: Risk of damage to the device
Make sure you select the correct firmware file.
An incorrect firmware file can damage your device.
Once you start the update process, you must wait for the update to complete.
An interrupted update can damage your device.
Select Begin firmware update and wait for it to complete.
It is recommended to back up your Z-Wave network before resetting the device.
The adapter will forget all devices it is paired with.
All Z-Wave devices for this network will be removed from Home Assistant.
If there are any devices still paired with the adapter when it is reset, they will have to go through the exclusion process before they can be re-paired.
The device firmware will remain on the device.
Administrator rights on Home Assistant
Backup your Z-Wave network
Remove all devices that are paired with your adapter from the network .
Removing can be done by any adapter, not just the one that originally managed the network. In theory, this could also be done later.
Select the Z-Wave integration. Then, select the controller.
Under Device info , select the three-dot menu, then select Factory reset .
On the device info page, check the Activity panel. When you see that the status entity became unavailable, the reset process is finished.
You can now unplug the adapter and use it to start a new network, or pass it on to someone else.
If you no longer need the Z-Wave integration, you can remove it from Home Assistant.
The Z-Wave integration provides several special entities, some of which are available for every Z-Wave device, and some of which are conditional based on the device.
Node status sensor: This sensor shows the node status for a given Z-Wave device. The sensor is disabled by default. The available node statuses are explained in the Z-Wave JS documentation . They can be used in state change automations. For example to ping a device when it is dead, or refresh values when it wakes up.
Ping button: This button can be pressed to ping a device. It is an alternative to the zwave_js.ping action.
Adapter/node statistics sensors: Z-Wave JS collects statistics about communications between nodes and the adapter . The statistics can be used to troubleshoot RF issues in your environment. These statistics are available in the network configuration and device info panels. But they are also available as sensors which are disabled by default.
Button to manually idle notifications : Any Notification Command Class (CC) values on a device that have an idle state will get a corresponding button entity. This button entity can be used to manually idle a notification when it doesn’t automatically clear on its own. A device can have multiple Notification CC values. For example one for detecting smoke and one for detecting carbon monoxide.
While the integration aims to provide as much functionality as possible through existing Home Assistant constructs (such as entities, states, automations, and actions), there are some features that are only available through the UI.
All of these features can be accessed either in the Z-Wave integration configuration panel or in a Z-Wave device’s device panel.
The following features can be accessed from the integration configuration panel:
Add device : Button in the bottom-right corner. Allows you to pre-provision a SmartStart device or start the inclusion process for adding a new device to your network.
The My network section gives you access to the device and entity lists for your Z-Wave network.
Show map : Allows you to see a visual representation of your Z-Wave network, showing the devices and the routes between them. This can be helpful to troubleshoot issues in your network.
Options > Remove device : Starts the exclusion process for removing a foreign device from a network . This allows you to remove a device that is still paired to another Z-Wave adapter.
Options > Discover and assign new routes : Discovers new routes between the adapter and the device. This is useful when devices or the adapter have moved to a new location, or if you are having significant problems with your network. The discovery process generates a lot of network traffic and should be used sparingly.
Statistics : Provides statistics about communication between the adapter and other devices, allowing you to troubleshoot your network’s RF quality.
Logs : Provides access to Z-Wave JS logs, which can be helpful to troubleshoot issues with your network.
Analytics : Allows you to opt in or out of telemetry that the Z-Wave JS project collects to help development and manufacturers make informed decisions. This telemetry is disabled by default and has to be opted in to be activated.
Network information : Metadata about your Z-Wave network, such as the Home ID, server version, or server URL. This information can be helpful when troubleshooting your network or when contacting support.
Download backup : Create and download a backup of your Z-Wave network . The backup contains the non-volatile memory (NVM) of your Z-Wave adapter, which includes all paired devices. It is recommended to create a backup before making any major changes to your Z-Wave network, such as migrating to a new adapter or resetting your adapter.
Restore from backup : Restore your Z-Wave network from a backup file that you previously downloaded. This can be helpful when migrating to a new adapter, or when you want to restore your network after resetting your adapter.
Migrate adapter : Allows you to migrate your Z-Wave network to a new adapter .
About network information
The Network information section in the integration configuration panel shows metadata about your Z-Wave network and the software running it. This information is useful when troubleshooting issues or when contacting support.
Home ID : A unique identifier assigned to your Z-Wave network. Every device paired to your network shares this ID. It can be used to verify that a device belongs to your network or to identify your network when seeking help.
Driver version : The version of the Z-Wave JS driver running on your Z-Wave JS server. The driver is the core library that communicates directly with your Z-Wave adapter.
Server version : The version of the Z-Wave JS server running in your setup. The server acts as the bridge between the Z-Wave JS driver and Home Assistant.
Server URL : The WebSocket URL that Home Assistant uses to connect to your Z-Wave JS server, for example ws://homeassistant.local:3000 . This can be useful when you need to verify or reconfigure the connection between Home Assistant and the Z-Wave JS server.
Some features can be accessed from the menu of integration itself. As they are not specific to Z-Wave, they are not described here in detail.
Download diagnostics : Exports a JSON file describing the entities of all devices registered with this integration.
Network devices
The following features can be accessed from the device panel of any Z-Wave device on your network aside from the adapter:
Configure: Provides an easy way to look up and update configuration parameters for the device. While there is an existing action for setting configuration parameter values, this UI may sometimes be quicker to use for one-off changes.
Re-interview: Forces the device to go through the interview process again so that Z-Wave-JS can discover all of its capabilities. Can be helpful if you don’t see all the expected entities for your device.
Rebuild routes: Discovers new routes between the adapter and the device. Use this if you think you are experiencing unexpected delays or RF issues with your device. Your device may be less responsive during this process.
Delete: Opens a dialog with the following options for removing the device:
Removing it from the network using exclusion
Removing a failed device from the adapter without excluding it from the network
Statistics : Provides statistics about communication between this device and the adapter, allowing you to troubleshoot RF issues with the device.
Update: Updates a device’s firmware using a manually uploaded firmware file. Only some devices support this feature (adapters and devices with the Firmware Update Metadata Command Class).
Download diagnostics: Exports a JSON file describing the entities of this specific device.
The Z-Wave integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Bulk set partial configuration parameters ( zwave_js.bulk_set_partial_config_parameters )
Sets multiple partial configuration parameters on a Z-Wave device at once.
Clear lock user code ( zwave_js.clear_lock_usercode )
Clears the user code from a code slot on a Z-Wave lock.
Delete all credentials ( zwave_js.delete_all_credentials )
Removes every credential belonging to a single user on a Z-Wave lock.
Delete all users ( zwave_js.delete_all_users )
Deletes every access-control user and their credentials from a Z-Wave lock.
Delete credential ( zwave_js.delete_credential )
Removes a single credential from a user on a Z-Wave lock.
Delete user ( zwave_js.delete_user )
Deletes an access-control user and all their credentials from a Z-Wave lock.
Get credential capabilities ( zwave_js.get_credential_capabilities )
Queries the user and credential management capabilities of a Z-Wave lock.
Get lock user code ( zwave_js.get_lock_usercode )
Gets user codes from a Z-Wave lock.
Get users ( zwave_js.get_users )
Lists all access-control users and their credential references on a Z-Wave lock.
Invoke a Command Class API on a node ( zwave_js.invoke_cc_api )
Calls a Command Class API directly on a Z-Wave node.
Set a value on multiple devices via multicast ( zwave_js.multicast_set_value )
Changes a value on multiple Z-Wave devices at once using multicast.
Refresh notifications on a node ( zwave_js.refresh_notifications )
Refreshes notifications on a Z-Wave node that supports the Notification Command Class.
Refresh values ( zwave_js.refresh_value )
Forces a refresh of the values of a Z-Wave entity.
Reset meters on a node ( zwave_js.reset_meter )
Resets the meters on a Z-Wave node that supports the Meter Command Class.
Set device configuration parameter ( zwave_js.set_config_parameter )
Changes a configuration parameter on a Z-Wave device.
Set credential ( zwave_js.set_credential )
Adds or updates a PIN code or password for an existing user on a Z-Wave lock.
Set lock configuration ( zwave_js.set_lock_configuration )
Sets the configuration of a Z-Wave lock.
Set lock user code ( zwave_js.set_lock_usercode )
Sets a user code in a code slot on a Z-Wave lock.
Set user ( zwave_js.set_user )
Creates or updates an access-control user on a Z-Wave lock.
Set a value ( zwave_js.set_value )
Changes any value that Z-Wave recognizes on a Z-Wave device.
For an overview of every action across all integrations, see the actions reference .
There are two types of events that are fired, notification events and value notification events. You can test what events come in using the event developer tools in Home Assistant and subscribing to the zwave_js_notification or zwave_js_value_notification events respectively. Once you know what the event data looks like, you can use this to create automations.
Check the Z-Wave JS notification event documentation for an explanation of the notification event data. These events fire with the zwave_js_notification event type.
Notification event data can be used to trigger automations, both in the automation UI and in YAML, using the event platform. Check the details of an event by subscribing to the zwave_js_notification event in the Developers Tools .
# Fires whenever the lock is unlocked by the keypad. triggers : - trigger : event event_type : zwave_js_notification event_data : node_id : 14 event_label : " Keypad unlock operation"
Notification Command Class
These are notification events fired by devices using the Notification Command Class. The parameters attribute in the example below is optional, and when it is included, the keys in the attribute will vary depending on the event.
{ "domain" : "zwave_js" , "node_id" : 1 , "endpoint" : 0 , "home_id" : "974823419" , "device_id" : "ad8098fe80980974" , "command_class" : 113 , "command_class_name" : "Notification" , "type" : 6 , "event" : 5 , "label" : "Access Control" , "event_label" : "Keypad lock operation" , "parameters" : { "userId" : 1 } }
Multilevel Switch Command Class
These are notification events fired by devices using the Multilevel Switch Command Class. There are events for start level change and stop level change. These would typically be used in a device like the Aeotec Nano Dimmer with an external switch to respond to long button presses.
Start level change
{ "domain" : "zwave_js" , "node_id" : 1 , "endpoint" : 0 , "home_id" : 974823419 , "device_id" : "2f44f0d4152be3123f7ad40cf3abd095" , "command_class" : 38 , "command_class_name" : "Multilevel Switch" , "event_type" : 4 , "event_type_label" : "label 1" , "direction" : "up" } ,
Stop level change
{ "domain" : "zwave_js" , "node_id" : 8 , "endpoint" : 0 , "home_id" : 3803689189 , "device_id" : "2f44f0d4152be3123f7ad40cf3abd095" , "command_class" : 38 , "command_class_name" : "Multilevel Switch" , "event_type" : 5 , "event_type_label" : "label 2" , "direction" : null } ,
Entry Control Command Class
These are notification events fired by devices using the Entry Control Command Class.
{ "domain" : "zwave_js" , "node_id" : 1 , "endpoint" : 0 , "home_id" : "974823419" , "device_id" : "ad8098fe80980974" , "command_class" : 111 , "command_class_name" : "Entry Control" , "event_type" : 6 , "event_type_label" : "label 1" , "data_type" : 5 , "data_type_label" : "label 2" , "event_data" : "555" }
Value Notifications are used for stateless values, like Central Scenes and Scene Activation . These events fire with the zwave_js_value_notification event type.
Value Notification example:
{ "domain" : "zwave_js" , "node_id" : 1 , "home_id" : "974823419" , "endpoint" : 0 , "device_id" : "ad8098fe80980974" , "command_class" : 91 , "command_class_name" : "Central Scene" , "label" : "Event value" , "property" : "scene" , "property_name" : "scene" , "property_key" : "001" , "property_key_name" : "001" , "value" : "KeyPressed" , "value_raw" : 0 }
Due to some devices not following the Z-Wave Specification, there are scenarios where a device will send a value update but a state change won’t be detected in Home Assistant. To address the gap, the zwave_js_value_updated event can be listened to to capture any value updates that are received by an affected entity. This event is enabled on a per device and per entity domain basis , and the entities will have assumed_state set to true . This change will affect how the UI for these entities look; if you’d like the UI to match other entities of the same type where assumed_state is not set to true , you can override the setting via entity customization .
The following devices currently support this event:
Make Model Entity Domain Vision Security ZL7432 In Wall Dual Relay Switch switch
Value Updated example:
{ "node_id" : 4 , "home_id" : "974823419" , "device_id" : "ad8098fe80980974" , "entity_id" : "switch.in_wall_dual_relay_switch" , "command_class" : 37 , "command_class_name" : "Switch Binary" , "endpoint" : 0 , "property" : "currentValue" , "property_name" : "currentValue" , "property_key" : null , "property_key_name" : null , "value" : 0 , "value_raw" : 0 }
This event can be used to trigger a refresh of values when the new state needs to be retrieved. Here’s an example automation:
triggers : - trigger : event event_type : zwave_js_value_updated event_data : entity_id : switch.in_wall_dual_relay_switch actions : - action : zwave_js.refresh_value data : entity_id : - switch.in_wall_dual_relay_switch_2 - switch.in_wall_dual_relay_switch_3
The Z-Wave integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Z-Wave event ( zwave_js.event )
Triggers on Z-Wave JS controller, driver, or node events, including events that are not handled by Home Assistant automatically.
Z-Wave value updated ( zwave_js.value_updated )
Triggers when a Z-Wave value updates, including values that are not exposed as Home Assistant entities.
For an overview of every trigger across all integrations, see the triggers reference .
If you are using Home Assistant Container or you do not want to use the built-in Z-Wave JS app, you need to run the Z-Wave JS Server yourself, which the Z-Wave integration will connect to.
This application provides the connection between your Z-Wave adapter and Home Assistant. The Home Assistant Z-Wave integration connects to this server via a WebSocket connection. You need to run this Z-Wave JS server before you can use the integration.
There are multiple ways to run this server:
The chart below illustrates Options 1 and 3, which are available for Home Assistant OS only.
Option 1: The official Z-Wave JS app, as described above
This option is only available for Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. (the recommended installation type) installations.
This app (formerly known as an add-on) can only be configured via the built-in Z-Wave control panel in Home Assistant. If you followed the standard installation procedure , this is how you are running the Z-Wave JS server.
Option 2: The Z-Wave JS UI Docker container
This is the recommended approach if you’re running Home Assistant Container. See the Z-Wave JS UI documentation for instructions.
This method provides the same server application and UI as the Z-Wave JS UI app. After installing the Docker image, make sure you enable the WS Server in the Home Assistant section of the Settings page.
Option 3: Run the Z-Wave JS server yourself
This is considered a more involved use case. In this case, you run the Z-Wave JS Server or Z-Wave JS UI NodeJS application directly. Installation and maintaining this is out of scope for this document. See the Z-Wave JS server or Z-Wave JS UI GitHub repository for information.
Supported Z-Wave adapter . The Z-Wave adapter should be connected to the same host as where the Z-Wave JS server is running. In the configuration for the Z-Wave JS server, you need to provide the path to this adapter. It’s recommended to use the /dev/serial-by-id/yourdevice version of the path to your adapter, to make sure the path doesn’t change over reboots. The most common known path is /dev/serial/by-id/usb-0658_0200-if00 .
Network keys are used to connect securely to compatible devices. The network keys consist of 32 hexadecimal characters, for example, 2232666D100F795E5BB17F0A1BB7A146 (do not use this one, pick a random one). Without network keys security enabled devices cannot be added securely and will not function correctly. You must provide these network keys in the configuration part of the Z-Wave JS Server.
For new installations, unique default keys will be auto-generated for you by the Z-Wave JS app.
Make sure that you keep a backup of these keys in a safe place. You will need to enter the same keys to be able to access securely paired devices.
Once you have the Z-Wave JS server up and running, you need to install and configure the integration in Home Assistant (as described above).
If you’re running full Home Assistant with supervisor, you will be presented with a dialog that asks if you want to use the Z-Wave JS Supervisor app. You must uncheck this box if you are running the Z-Wave JS server in any manner other than the official Z-Wave JS app, including using Z-Wave JS UI app.
If you’re not running the supervisor or you’ve unchecked the above-mentioned box, you will be asked to enter a WebSocket URL (defaults to ws://localhost:3000). It is very important that you fill in the correct (Docker) IP/hostname here. For example for the Z-Wave JS UI app this is ws://a0d7b954-zwavejs2mqtt:3000 .
For a list of supported devices, refer to the Z-Wave JS device database .
While there is support for the most common devices, some Command Classes are not yet (fully) implemented in Z-Wave JS. You can track the status here .
You can also check the list of Z-Wave Command Classes Home Assistant responds to when queried towards the end of this page.
You can also keep track of the road map for the Z-Wave integration here .
Z-Wave supports all known 500, 700, and 800 series Z-Wave adapters. If you are just starting out, we recommend that you purchase a 800-series adapter (with firmware updated to >=7.23.2).
For more information, see Supported Z-Wave adapters
Some Z-Wave adapters can be auto-discovered, which can simplify the Z-Wave setup process. The following devices have been tested with discovery, and offer a quick setup experience; however, these are not all of the devices supported by Z-Wave:
Device Identifier Vendor Aeotec Z-Stick Gen5+ 0658:0200 https://aeotec.com/products/aeotec-z-stick-gen5/ Nortek HUSBZB-1 10C4:8A2A https://www.nortekcontrol.com/products/2gig/husbzb-1-gocontrol-quickstick-combo/ Zooz ZST10 10C4:EA60 https://www.getzooz.com/zooz-zst10-s2-stick/ Z-WaveMe UZB 0658:0200 https://z-wave.me/products/uzb/
Additional devices may be discoverable, however only devices that have been confirmed discoverable are listed above.
Zwavejs2Mqtt was renamed Z-Wave JS UI in September 2022. They are synonymous with no difference between their capabilities.
The Z-Wave JS UI app is being phased out, as its feature-rich UI is now included in the Z-Wave JS app. The Z-Wave JS UI app will continue to be supported for a while, but users are encouraged to switch to the Z-Wave JS app.
Should I use Secure Inclusion ?
That depends. There are two generations of Z-Wave encryption, Security S0, and Security S2. Both provide encryption and allow detecting packet corruption.
Security S0 imposes significant additional traffic on your mesh and is recommended only for older devices that do not support Security S2 but require encryption to work, such as door locks.
Security S2 does not impose additional network traffic and provides additional benefits. For example, end devices using S2 require the hub to report whether it has received and understood their reports.
By default, Z-Wave prefers Security S2, if supported. Security S0 is used only when absolutely necessary.
After the initial setup of the Z-Wave adapter, you can view the security keys in the Z-Wave JS app. Go to Settings > Apps > Z-Wave JS and open the Configuration tab. You can now see the three S2 keys and the S0 key. The network security key is a legacy configuration setting, identical to the S0 key.
Many reported issues result from RF interference caused by the system’s USB ports. This can manifest in many ways, including devices that won’t include at all, devices that won’t include securely, sensors with erroneous values (packets corrupted), delayed control of devices, or no ability to control devices.
All users are encouraged to use a USB extension cable to prevent such interference. Please try such a cable before opening an issue or requesting support on Discord. It will nearly always be the first troubleshooting step that we ask you to take anyway.
After ensuring you are using an extension cable, rebuild network routes.
The combination of these two steps corrects many reported difficulties.
If your Z-Wave adapter doesn’t show up in the Discovered section automatically, try adding it manually:
Check the hardware:
Make sure the adapter is powered on.
Make sure the cable you are using supports data, not power only.
In the bottom right, select the
Add Integration button and select Z-Wave .
Follow the instructions on screen to complete the setup.
If it is still not discovered, check for interference .
The first-generation Gen5 adapter has a known bug when plugged into a Pi 4 and possibly other systems. Aeotec released the Gen5+ stick to correct this bug. Gen5 users can plug their adapters into a USB 2.0 hub to overcome the issue.
Entities will be created only after the node is ready (the interview is completed). Also, note that some devices (like button remotes) do not create any entities but will only provide events when a button is pressed. See the events section on how to handle those events in your automations.
If you are certain that your device should have entities and you do not see them (even after a restart of Home Assistant Core), create an issue about your problem on the GitHub issue tracker.
Your device might not send automatic status updates to the adapter. While the best advice would be to update to recent Z-Wave Plus devices, there is a workaround with active polling (request the status).
Z-Wave does not automatically poll devices on a regular basis. Polling can quickly lead to network congestion and should be used very sparingly and only where necessary.
We provide a zwave_js.refresh_value action to manually poll a value, for example from an automation that only polls a device when there is motion in that same room.
Z-Wave JS allows you to configure scheduled polling on a per-value basis, which you can use to keep certain values updated. It also allows you to poll individual values on-demand from your automations, which should be preferred over blindly polling all the time if possible.
Warning
Polling should only be used as a last resort. You must use it with care and accept the negative impact on your network. Z-Wave is a very low speed network and poll requests can easily flood your network and slow down your commands.
When your device is not yet fully interviewed, this info will not yet be present. So make sure your device is interviewed at least once.
If the interview is complete, then the device does not yet have a device file for Z-Wave JS. Unlike other Z-Wave drivers, your device may very well work as intended even without such a file. If your device not fully supported, consider contributing the device configuration file .
When trying to determine why something isn’t working as you expect, or when reporting an issue with the integration, it is helpful to know what Z-Wave JS sees as the current state of your Z-Wave network. To get a dump of your current network state, follow these steps:
Select the Z-Wave integration. Then, select the three-dot menu.
From the dropdown menu, select Download diagnostics .
Many users have reported issues with interference when the adapter was directly connected to the machine (proximity). If you are having issues, try to use a short USB 2.0 A (male to female) extension cord.
The easy way Enable Z-Wave JS logging
Go to the Z-Wave integration panel:
In the top-right corner, select the three dots menu and select Enable debug logging .
Result : The log level will be set to debug for the integration, library, and optionally the driver (if the driver log level is not already set to verbose , debug , or silly ), and all Z-Wave JS logs will be added to the Home Assistant logs.
If you want to change the log level, on the Z-Wave integration panel: , select the cogwheel .
Select the Logs tab, then select the log level.
Disable Z-Wave JS logging
In the top-right corner, select the three dots menu and select Disable debug logging .
Result : The log level will be reset to its previous value for the integration, library, and driver, and the Home Assistant frontend will automatically send you the Z-Wave logs generated during that time period for download.
The advanced way Enable Z-Wave JS logging manually, or via an automation
Set the log level for zwave_js_server to debug . This can either be done in your configuration.yaml in the logger section, or using the logger.set_level action. When the integration detects that the log level has been set to debug , it will also set the Z-Wave JS logs to debug if the level isn’t already verbose , debug , or silly and will include those logs in the Home Assistant logs. The Z-Wave JS logs can be found under the logger name zwave_js_server.server .
Disable Z-Wave JS logging manually, or via an automation
Set the log level for zwave_js_server to a level higher than debug . This can either be done in your configuration.yaml in the logger section, or using the logger.set_level action. The Z-Wave JS logs will no longer be included in the Home Assistant logs, and if the log level of Z-Wave JS was changed by the integration, it will automatically change back to its original level.
This sections lists functionality that is available in Z-Wave but that is not currently supported in Home Assistant.
In Home Assistant, it is currently not possible to set the Z-Wave controller into learn mode to receive network information from another controller.
A Z-Wave controller that manages an empty network can also join a different network and act as a secondary controller there. However, with Home Assistant, this is not possible. Home Assistant does not allow the Z-Wave controller to join another network, because Home Assistant acts as the central hub.
In Home Assistant, a single association group is implemented:
Group 1 : This is an association group that includes only one device. It is used after a factory reset , to send a Device Reset Locally Notification .
This association group is used when Home Assistant resets the Z-Wave adapter .
Under normal circumstances, it is not necessary to add a device to this group.
Other Z-Wave devices can instruct a Home Assistant instance to identify itself by sending the following Indicator Set Z-Wave command (all bytes are hexadecimal):
87010003500308500403500506
~~ ~~ ~~
The bytes underlined with ~ can also have any other value.
When receiving such a command, Home Assistant will show a notification in its sidebar, mentioning which node sent the command.
The following table lists the Command Classes together with the implemented version and required security class. These are the Command Classes that Home Assistant will respond to when queried by other devices.
Command Class Version Security Class Association 4 Highest granted Association Group Information 3 Highest granted CRC-16 Encapsulation 1 None Device Reset Locally 1 Highest granted Firmware Update Meta Data 8 Highest granted Inclusion Controller 1 None Indicator 4 Highest granted Manufacturer Specific 2 Highest granted Multi Channel Association 5 Highest granted Multi Command 1 None Power Level 1 Highest granted Security 1 None Security 2 1 None Supervision 2 None Transport Service 2 None Version 3 Highest granted Z-Wave Plus Info 2 None
Home Assistant and Z-Wave JS will never return a “Working” or “Fail” status for a valid and supported command of the Supervision Command Class.
This section explains some Z-Wave terms and concepts you might find in Z-Wave product documentation.
An association in Z-Wave terminology is when two or more Z-Wave products communicate directly. This enables devices to communicate with each other without the need to communicate via a hub, or to send unsolicited reports to the central hub.
An association group in Z-Wave terminology is a group of devices that another one will send commands to in certain situations. Association groups and their functionality are specific to the device that sends the commands. Refer to the device manual for details.
Home Assistant supports both classic inclusion and SmartStart . Classic inclusion means you set both the hub and the device to be included into the corresponding mode. The alternative is SmartStart , where the hub is constantly listening for inclusion requests from devices that want to join the network.
SmartStart enabled products can be added into a Z-Wave network by scanning the Z-Wave QR Code present on the product with an adapter supporting SmartStart inclusion.
No further action is required and the SmartStart product will be added automatically within 10 minutes of being switched on in the network vicinity. Not all devices support SmartStart. Some devices require classic inclusion . For documentation on adding a device to Home Assistant, refer to adding a new device to the Z-Wave network .
Throughout this documentation, Home Assistant terminology is used. For some of the concepts, the terminology does not correspond to the terminology used in Z-Wave documentation. The table below provides equivalents for some of those terms.
Z-Wave functionality Home Assistant Definition barrier operator cover controller adapter, when referring to the hardware device that provides the Z-Wave functionality. The term controller is still used when referring to the network role (such as primary, secondary controller) exclusion remove The process of removing a node from the Z-Wave network inclusion add The process of adding a node to the Z-Wave network multilevel switch represented by different entity types, such as light or fan. replication copy (not supported in Home Assistant) The process of copying network information from one adapter to another. Not supported in Home Assistant. window covering cover
This removes all paired Z-Wave devices and their entities, the Z-Wave JS app, and the Z-Wave integration from Home Assistant.
Remove the device from your Z-Wave network .
Do this for each device that is joined to your network so that it is no longer paired to the adapter.
You cannot add a device to a new adapter while it is still paired with an old one.
Alternatively, you can factory reset each device. Refer to the device manual to see how this is done.
This usually involves finding the device in your household and pressing a button.
Remove the Z-Wave integration.
Go to Settings > Devices & services and select the integration card.
Next to the integration entry, select the three dots menu.
Select Delete .
If it hasn’t been deleted automatically, remove the Z-Wave JS app.
Select Uninstall .
Decide whether to also delete the data related to the app or whether to keep it.
Done. Z-Wave JS is now completely removed from your Home Assistant server.
You can now use your Z-Wave devices and adapter on a new server.
Other z wave adapters
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Z-Wave hub was introduced in Home Assistant 2021.2, and it's used by
8.5% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Binary sensor
Button
Climate
Cover
Event
Fan
Hub
Humidifier
Light
Lock
Number
Select
Sensor
Siren
Switch
Update
Back to top
