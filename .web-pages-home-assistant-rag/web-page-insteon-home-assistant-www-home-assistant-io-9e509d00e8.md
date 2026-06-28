# Insteon - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/insteon
- Final URL: https://www.home-assistant.io/integrations/insteon
- Canonical URL: https://www.home-assistant.io/integrations/insteon/
- Fetched at: 2026-06-28T02:52:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up an Insteon Modem (PLM or Hub) locally within Home Assistant.

## Extracted Text

On this page
Configuration
Autodiscovery
Insteon configuration panel
Add device
Managing Insteon scenes
Device properties
Device All-Link Database
Utilities
Controlling Insteon scenes
Events and Mini-Remotes
Actions
Device overrides
Recovering after factory resetting the hub
Important
The Insteon apps (Director or Insteon for Hub) are a paid service using the Insteon cloud to control an Insteon Hub. Home Assistant does not require the use of the Insteon app but can operate in conjunction with the app if desired.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds support for integrating your Insteon network with Home Assistant. It has been tested with all USB and serial PowerLinc Modems (PLM) including 2413U , 2448A7 , 2413S and 2412S models. It has also been tested to work with the 2242 and 2245 Hubs.
If you have factory reset your device, please see the instructions Recovering After Factory Resetting The Hub for how to proceed.
To add the Insteon hub to your Home Assistant instance, use this My button:
Insteon can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Insteon .
Follow the instructions on screen to complete the setup.
Overview of supported Insteon modems & hubs
The first time autodiscovery runs, any device that is already linked to the modem will be identified. This process may require up to 60 seconds per device. Subsequent startups will occur much quicker using cached device information. If a device is not recognized during autodiscovery, trigger the device—for example, by toggling a button—to force the device to send a message to the modem. The device will then be discovered. You may need to trigger the device a few times. If the device is still not identified, relink the device to the modem following the linking instructions using the Insteon configuration panel .
The Insteon configuration panel allows for product specific configuration of Insteon devices and Insteon scenes.
To open the Insteon configuration panel:
Select the Insteon integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] . Then, select Configure to open the Insteon configuration panel.
The following capabilities are available in the Insteon configuration panel:
In order for any two Insteon devices to talk with one another, they must be linked. For an overview of device linking, please read the Insteon page on understanding linking . To add an Insteon device:
Open the Insteon configuration panel .
Press the Add device button on the bottom right corner of the screen.
Fill in the Add device dialog using the following options:
Device address : Enter the Insteon address of the device, such as 1A.2B.3C , to link a specific device remotely. Not all devices support remote linking. If a device does not support remote linking, press the Set button on the device to put the device in linking mode.
Link multiple : To add multiple devices in a single session, select the Add multiple checkbox.
Insteon scenes can be created, changed, or deleted using the Scenes tab of the Insteon configuration panel . To control an Insteon scene, see Controlling Insteon scenes below.
Insteon device properties, such as the LED brightness, can be managed using the Insteon configuration panel. To see the available properties of a device, select the device from the list of devices in the Insteon configuration panel. This will display the list of available properties for the specific device on the Properties tab. Each device type will have a different set of properties and not all devices have properties.
Read device properties : Reads the properties from the device.
Change device properties : Allows you to select a specific property from a list of properties and edit the property values. This does not write the change to the device.
Write property changes : Use the Write to device menu option to save the property changes to the device.
Undo changes : Undoes property changes before they are written to the device.
Delete device : Deletes the Insteon device from Home Assistant and removes all references to the device in the modem. Optionally, it can remove any references to the device in other Insteon devices.
The Insteon All-Link Database (ALDB) contains the list of links to other devices in the Insteon network. The All-Link Database can be managed using the Insteon configuration panel. To see the All-Link Database of a device, select the device from the list of devices in the Insteon configuration panel and select the All-Link Database tab.
Read the All-Link Database : Use the Load from device menu option to read the current ALDB records from the device.
Add a record : Use the Create ALDB record menu option to add a record to the All-Link Database. This does not write to the device.
Modify a record : To modify an existing record, select the record and use the dialog box to change the record as needed. This does not write to the device.
Add default links : There are a set of default records that need to exist in the ALDB in order for a device to communicate correctly to the modem. Use the Add default links menu option to add these links to the device. This does write to the device.
Write changes to the device : Writes added or changed records to the device.
Undo changes : Undoes ALDB record changes before they are written to the device.
Tip
If you choose to use the Insteon app, it is recommended to add devices and scenes using the Insteon app. Home Assistant will see the devices and scenes as well. Devices and scenes added in Home Assistant will not be available in the Insteon app.
Warning
Editing a device’s All-Link Database can cause the device to become unresponsive. If this occurs, simply relink the device to the modem using the Add device directions above.
Change the modem connection : Reconfigure the modem connection information such as USB port or Hub IP address.
Configure device overrides : Add or remove device overrides. See Device overrides below.
Delete device : Delete an Insteon device from the network using the device’s Insteon address.
Controlling an Insteon scene on or off is done via automations. Two actions are provided to support this feature:
insteon.scene_on
group : (required) The Insteon scene number to trigger.
insteon.scene_off
group : (required) The Insteon scene to turn off
automation : # Control an Insteon scene 25 - alias : " Turn on scene 25" actions : - action : insteon.scene_on data : group : 25
Mini-Remote devices do not appear as Home Assistant entities, they generate events. The following events are available:
insteon.button_on
address : (required) The Insteon device address in lower case without dots (e.g., 1a2b3c)
button : (Optional) The button id in lower case. For a 4-button remote the values are a to d . For an 8 button remote the values are a to h . For a one-button remote this field is not used.
insteon.button_off
button : (Optional) The button id in lower case. For a 4-button remote the values are a to d. For an 8 button remote the values are a to h . For a one-button remote this field is not used.
This allows the mini-remotes to be configured as triggers for automations. Here is an example of how to use these events for automations:
automation : # 4 or 8 button remote with button c pressed - alias : " Turn a light on" triggers : - trigger : event event_type : insteon.button_on event_data : address : 1a2b3c button : c conditions : - condition : state entity_id : light.some_light state : " off" actions : - action : light.turn_on target : entity_id : light.some_light # single button remote - alias : " Turn a light off" triggers : - trigger : event event_type : insteon.button_on event_data : address : 1a2b3c conditions : - condition : state entity_id : light.some_light state : " off" actions : - action : light.turn_on target : entity_id : light.some_light
The following actions are available:
insteon.add_all_link : Puts the Insteon Modem (IM) into All-Linking mode. The IM can be set as a controller or a responder. If the IM is a controller, put the IM into linking mode then press the SET button on the device. If the IM is a responder, press the SET button on the device then put the IM into linking mode.
insteon.delete_all_link : Tells the Insteon Modem (IM) to remove an All-Link record from the All-Link Database of the IM and a device. Once the IM is set to delete the link, press the SET button on the corresponding device to complete the process.
insteon.load_all_link_database : Load the All-Link Database for a device. WARNING - Loading a device All-Link database may take a LONG time and may need to be repeated to obtain all records.
insteon.print_all_link_database : Print the All-Link Database for a device. Requires that the All-Link Database is loaded first.
insteon.print_im_all_link_database : Print the All-Link Database for the Insteon Modem (IM).
insteon.add_default_links : Add a set of default links between the modem and the device to facilitate proper communication between them.
Device overrides are not used to add a device to the Insteon integration. They are only used if a device that was linked correctly to the Insteon Modem but is not appearing in Home Assistant.
There are two primary uses for the device override feature:
Devices that do not respond during autodiscovery. This is common for battery operated devices. Before using a device override, please trigger the device a few times and it will likely be discovered by Home Assistant.
Devices that have not been fully developed. This allows an unknown device to be mapped to a device that operates similarly to another device.
Device overrides can be set up using the Insteon configuration panel .
Many users tried to factory reset their Insteon Hub when the Insteon app stopped working in April 2022. If you are one of those users, you can perform the following steps to connect it to Home Assistant and get all of your devices up and working again.
Log into Home Assistant and add the Insteon integration. Select Insteon Hub v2 if you have a 2245-xxx or Hub V1 if you have a 2242-xxx.
Follow the instructions on screen to add the integration.
You will need the IP address of the Hub which you should be able to find on your network router. See the documentation for your specific router for instructions.
If you have a Hub v2 you will need the default username and password which are printed on the bottom of the Hub
Add devices to the Hub using the instructions for adding devices to the Insteon integration using the Insteon configuration panel
Once your devices are linked to the Hub again they will appear in Home Assistant automatically.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Insteon hub was introduced in Home Assistant 0.39, and it's used by
1285 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@teharris1
@ssyrell
Categories
Binary sensor
Cover
Fan
Hub
Light
Sensor
Switch
Back to top
