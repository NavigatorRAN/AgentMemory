# Traccar Server - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/traccar_server
- Final URL: https://www.home-assistant.io/integrations/traccar_server
- Canonical URL: https://www.home-assistant.io/integrations/traccar_server/
- Fetched at: 2026-06-28T03:23:29Z
- Content type: text/html; charset=UTF-8

## Description

Documentation for the Traccar Server integration.

## Extracted Text

On this page
Configuration
Events
Devices
Entities
Binary Sensor - Motion
Binary Sensor - Status
Device Tracker
Sensor - Address
Sensor - Altitude
Sensor - Battery
Sensor - Geofence
Sensor - Speed
Examples
Automations
Traccar uses GPS for tracking and has support for over 1500 different types of devices. You can use the Traccar Server integration to communicate with your own Traccar Server , which is also available as Home Assistant add-on .
Tip
Looking for documentation on how to set up the Traccar Client with webhooks in Home Assistant? See the Traccar Client integration documentation.
To add the Traccar Server integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Traccar Server .
Follow the instructions on screen to complete the setup.
The Traccar Server integration options allow you to define a list of events you want to listen for. These events will be sent to Home Assistant as events .
All events will be prefixed with traccar_ followed by a snake_cased version of the event name.
Examples:
The deviceMoving will be fired in Home Assistant as traccar_device_moving .
The geofenceExit will be fired in Home Assistant as traccar_geofence_exit .
The alarm will be fired in Home Assistant as traccar_alarm .
All events will also have the following data:
Device ID
( device_traccar_id ) This will be the device ID that the event is related to.
Device name
( device_name ) This will be the name of the device that the event is related to.
Type
( type ) This will be the type of the event.
Server time
( serverTime ) This will be the time the event was received by the Traccar Server.
Attributes
( attributes ) This will be a dictionary of attributes related to the event.
Example
{ "device_traccar_id" : 24 , "device_name" : "My Device" , "type" : "alarm" , "serverTime" : "1970-01-01T00:00:00.000Z" , "attributes" : { "custom_attribute" : "value" }, }
The Traccar Server integration will create devices for each device registered in the Traccar Server with at least one position update.
These device representations in Home Assistant will have entities associated with them, which you can use in automations , scripts , and display on your dashboard .
The traccar server integration will create entities in with the following domains:
Binary Sensor
Sensor
For more details about each of these, see the sections below.
The Traccar Server integration will create a binary_sensor entity for each device registered in Traccar Server to show the motion reported by the Traccar Server.
This entity is disabled by default.
Name
The name of the sensor will be set to what you have named it in Traccar Server, followed by the term “Motion”. If your device is named “Millennium Falcon”, this will be “Millennium Falcon Motion”.
Entity ID
This will be a slugified version of the name.
Unique ID
This will be the unique ID of the device tracker in Traccar Server followed by position_attributes_motion .
State
This will be Moving if the Traccar Server reports that the device is moving, if not this will be Stopped .
This entity does not have any attributes.
The Traccar Server integration will create a binary_sensor entity for each device registered in Traccar Server to show the status reported by the Traccar Server.
The name of the sensor will be set to what you have named it in Traccar Server followed by the term “Status”. If your device is named “Millennium Falcon”, this will be “Millennium Falcon Status”.
This will be the unique ID of the device tracker in Traccar Server followed by device_status .
This will be Online if the Traccar Server reports that the device is online. This will be Offline if it reports it being offline, or Unknown if it is not sure.
The Traccar Server integration will create a device tracker entity for each device registered in Traccar Server.
The name of the device tracker will be set to what you have named it in Traccar Server.
This will be a slugified version of the name of the device tracker.
This will be the unique ID of the device tracker in Traccar Server.
As a device tracker, the state will be home or not_home .
In addition to the custom attributes you can define in the Traccar Server integration options, the device tracker entity will have the following attributes:
Category
The category of the device in Traccar if defined.
Traccar ID
The ID of the device in Traccar.
Tracker
Just a string that says traccar_server .
The Traccar Server integration will create a sensor entity for each device registered in Traccar Server to show the address reported by the Traccar Server.
The name of the sensor will be set to what you have named it in Traccar Server followed by Address. If your device is named “Millennium Falcon”, this will be “Millennium Falcon Address”.
This will be the unique ID of the device tracker in Traccar Server followed by position_address .
This will be the address reported by the Traccar Server, if geo detection is not configured this will be unknown`.
The Traccar Server integration will create a sensor entity for each device registered in Traccar Server to show the altitude reported by the Traccar Server.
The name of the sensor will be set to what you have named it in Traccar Server followed by Altitude. If your device is named “Millennium Falcon”, this will be “Millennium Falcon Altitude”.
This will be the unique ID of the device tracker in Traccar Server followed by position_altitude .
This will be the altitude in meters. You can select a different unit in the entity options if you want.
The Traccar Server integration will create a sensor entity for each device registered in Traccar Server to show the remaining battery percentage reported by the Traccar Server.
The name of the sensor will be set to what you have named it in Traccar Server followed by Battery. If your device is named “Millennium Falcon”, this will be “Millennium Falcon Battery”.
This will be the unique ID of the device tracker in Traccar Server followed by position_attributes.batteryLevel .
This will be the battery percentage (level) as reported by the tracked device, if the device does not have a battery this will be unknown.
The Traccar Server integration will create a sensor entity for each device registered in Traccar Server to show the geofence reported by the Traccar Server.
The name of the sensor will be set to what you have named it in Traccar Server followed by Geofence. If your device is named “Millennium Falcon”, this will be “Millennium Falcon Geofence”.
This will be the unique ID of the device tracker in Traccar Server followed by geofence_geofence .
This will be geofence that the device is in, if you have overlapping geofences it will show the first one as reported by the Traccar Server.
The Traccar Server integration will create a sensor entity for each device registered in Traccar Server to show the speed reported by the Traccar Server.
The name of the sensor will be set to what you have named it in Traccar Server followed by Speed. If your device is named “Millennium Falcon”, this will be “Millennium Falcon Speed”.
This will be the unique ID of the device tracker in Traccar Server followed by position_speed .
This will be the speed of the device in knots. You can select a different unit in the entity options if you want.
So you set up the integration and it pulled in all your devices. Now what? Below are some examples of what you can do with the data provided by Traccar Server integration.
In this section you will find some example automations that you can use to get started with the Traccar Server integration.
Do something when a device enters a geofence
The allows you to do something when the device “Millennium Falcon” enters the defined geofence.
Show me the YAML!
triggers : - trigger : state entity_id : sensor.millennium_falcon_geofence to : ' Tatooine' actions : ...
Do something when a device is speeding
The allows you to do something when the device “Millennium Falcon” exceeds a defined speed.
triggers : - trigger : numeric_state entity_id : sensor.millennium_falcon_speed above : 1337 actions : ...
If you want to include the speed in a notification, you can use the {{ trigger.to_state.state }} template.
Partial example:
triggers : ... actions : - action : notify.notify data : message : " The current speed of the Millennium falcon is {{ trigger.to_state.state }}!"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Traccar Server integration was introduced in Home Assistant 2024.2, and it's used by
1039 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Car
Presence detection
Back to top
