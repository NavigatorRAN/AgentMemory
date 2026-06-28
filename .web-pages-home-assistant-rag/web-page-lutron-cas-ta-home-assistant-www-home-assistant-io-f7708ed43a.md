# Lutron Caséta - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lutron_caseta
- Final URL: https://www.home-assistant.io/integrations/lutron_caseta
- Canonical URL: https://www.home-assistant.io/integrations/lutron_caseta/
- Fetched at: 2026-06-28T02:58:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Lutron Caseta devices with Home Assistant.

## Extracted Text

On this page
Configuration
Manual hub configuration
Cover
Light
Scene
Switch
Fan
Sensor
Button
Pico and Shade Remotes
Lutron is an American lighting control company. They have several lines of home automation devices that manage light switches, dimmers, occupancy sensors, and HVAC controls. The lutron_caseta integration in Home Assistant is responsible for communicating with the Lutron Caseta Smart Bridge for the Caseta product line of dimmers, switches, shades, and sensors. It will also communicate with the Lutron Radio RA2 Main Repeater for the RA2 Select product line of dimmers, switches, shades, and sensors.
This integration supports the Caséta , RA2 Select , RadioRA 3 , and Homeworks QSX (not QS) lines of products.
Supports Bridges:
Lutron Caséta Smart Hub (L-BDG2-WH)
Lutron Caséta Smart Bridge PRO (L-BDGPRO2-WH)
RA2 Select Main Repeaters (RR-SEL-REP2-BL)
QSX Processor (HQP7)
RadioRA 3 All-in-One Processor (RR-PROC3)
For the RadioRA 2 and HomeWorks QS product lines, see the Lutron integration .
The currently supported devices are:
Wall and plug-in dimmers as lights
Wall switches as switches
Scenes as scenes
Lutron shades as covers
Lutron smart fan speed control
Lutron Occupancy/Vacancy sensors
Pico Remotes as device triggers
Shade Remotes as device triggers
When configured, the Lutron Caséta integration will automatically discover the currently supported devices as set up in the Lutron Smart Bridge. The name assigned in the Lutron mobile app will be used to form the entity_id used in Home Assistant. e.g., a dimmer called ‘Lamp’ in a room called ‘Bedroom’ becomes light.bedroom_lamp in Home Assistant.
To add the Lutron Caséta hub to your Home Assistant instance, use this My button:
Lutron Caséta can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Lutron Caséta .
Follow the instructions on screen to complete the setup.
To use Lutron Caseta devices in your installation, you must first log in to your Lutron account and generate a certificate that allows Home Assistant to connect to your bridge. This can be accomplished by following the steps here , which will generate three files: caseta.key, caseta.crt, caseta-bridge.crt when you run it.
If you already have caseta.key , caseta.crt , caseta-bridge.crt , and cannot physically access the bridge to press the button, pairing can be done by utilizing these existing files.
Once you have the three necessary files, place them in your configuration directory and add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry lutron_caseta : - host : IP_ADDRESS keyfile : caseta.key certfile : caseta.crt ca_certs : caseta-bridge.crt
Note
Note that multiple hubs can be specified by using multiple configuration blocks, but each of them requires its own keyfile , certfile , and ca_certs to be generated and specified.
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of the Lutron Smart Bridge.
keyfile string Required
The private key that Home Assistant will use to authenticate to the bridge.
certfile string Required
The certificate chain that Home Assistant will use to authenticate to the bridge.
ca_certs string Required
The list of certificate authorities (usually only one) that Home Assistant will expect when connecting to the bridge.
Tip
It is recommended to assign a static IP address to your Lutron Smart Bridge. This ensures that it won’t change IP address, so you won’t have to change the host if it reboots and comes up with a different IP address.
Use a DHCP reservation on your router to reserve the address or in the PRO model of the Smart Bridge, set the IP address under Network Settings in the Advanced / Integration menu in the mobile app.
To get Lutron Caseta roller, honeycomb shades, wood blinds, lights, scene and switch working with Home Assistant, first follow the instructions for the general Lutron Caseta integration above.
After setup, shades will appear in Home Assistant using an entity_id based on the name used in the Lutron mobile app. For example, a shade called ‘Living Room Window’ will appear in Home Assistant as cover.living_room_window .
For more information on working with shades in Home Assistant, see the Covers integration .
Available actions: cover.open_cover , cover.close_cover , cover.stop_cover and cover.set_cover_position . Cover position ranges from 0 for fully closed to 100 for fully open.
Available actions for tilt-only wood blinds: cover.open_cover_tilt , cover.close_cover_tilt , cover.stop_cover_tilt , cover.toggle_tilt . Cover position is 0 or 100 for fully closed and 50 for fully open.
After setup, dimmable lights including wall and plug-in dimmers will appear in Home Assistant using an entity_id based on the name used in the Lutron mobile app. For example, a light called ‘Bedroom Lamp’ will appear in Home Assistant as light.bedroom_lamp .
For non-dimmable lights or switched loads, see the switch section on this page.
For more information on working with lights in Home Assistant, see the Lights integration .
The Lutron Caseta scene platform allows you to control your Smart Bridge Scenes that are created in the Lutron mobile app.
After setup, scenes will appear in Home Assistant using an entity_id based on the name used in the Lutron mobile app. For example, a scene called ‘Entertain’ will appear in Home Assistant as scene.entertain .
For more information on working with scenes in Home Assistant, see the Scenes integration .
Scenes are not directly supported on RA3 and QSX models, however the button platform (see below) can be used to activate scenes for these systems.
After setup, switches will appear in Home Assistant using an entity_id based on the name used in the Lutron mobile app. For example, a light switch called ‘Master Bathroom Vanity’ will appear in Home Assistant as switch.master_bathroom_vanity .
For dimmable lights including wall and plug-in dimmers, see the light section on this page.
For more information on working with switches in Home Assistant, see the Switches integration .
After setup, fans will appear in Home Assistant using an entity_id based on the name used in the Lutron mobile app. For example, a light switch called ‘Master Bedroom Ceiling Fan’ will appear in Home Assistant as fan.master_bedroom_ceiling_fan .
For more information on working with fans in Home Assistant, see the Fans integration .
For supported bridges, a switch entity will be created under the smart bridge called Smart Away. This switch toggles Smart Away on/off.
Occupancy sensors can be added to a Lutron Caseta system to trigger events when an area becomes vacant and, optionally, occupied. However, Lutron systems report occupancy and vacancy statuses only in occupancy groups – that is, groups of one or more sensors.
Occupancy groups will appear in Home Assistant using an entity_id based on the area name in which the first sensor of the group is located. For example, one or more sensors in the Master Bathroom will appear in Home Assistant as binary_sensor.master_bathroom_occupancy .
An occupancy group is considered occupied if any of the sensors in the group are currently in an “occupied” state. Specifically, this means that motion has been detected more recently than that sensor’s particular timeout setting. Only after all sensors in an occupancy group report being vacant does the occupancy group itself report being vacant.
Lutron Caseta occupancy sensors support 4 different timeouts and 3 different sensitivity levels, but those are only controllable from the devices themselves and cannot be set from either Home Assistant or even the Caseta mobile app.
Because Lutron Caseta devices automatically report state to Home Assistant (rather than relying on polling), occupancy status updates occur almost instantaneously.
For more information on working with binary sensors in Home Assistant, see the Binary Sensors integration
Button Entities are created for each Keypad button and Pico Remote button present within the system.
Radio RA3 and HomeWorks QSX systems can use these button entities to activate scenes that are defined within the Lutron system.
For more information on working with buttons in Home Assistant, see the Buttons integration .
Pico and Shade remotes are supported on the Smart Bridge (L-BDG2-WH), Smart Bridge PRO (L-BDGPRO2-WH), and RA2 Select (RR-SEL-REP2-BL) models.
Device triggers are implemented for press and release of each button on the remotes via watching for lutron_caseta_button_event events in the format:
{ "serial" : 28786608 , "type" : "FourGroupRemote" , "button_number" : 4 , "device_name" : "Shade Remote" , "area_name" : "Upstairs Hall" , "action" : "press" }
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Lutron Caséta hub was introduced in Home Assistant 0.41, and it's used by
2.4% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@swails
@danaues
@eclair4151
Categories
Binary sensor
Hub
Back to top
