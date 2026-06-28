# Glossary - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/glossary
- Final URL: https://www.home-assistant.io/docs/glossary
- Canonical URL: https://www.home-assistant.io/docs/glossary/
- Fetched at: 2026-06-28T02:22:13Z
- Content type: text/html; charset=UTF-8

## Description

Definitions of the most common terms used in Home Assistant: integrations, entities, devices, automations, and more.

## Extracted Text

On this page
A
Action
Actor
App
Area
Automation
B
Backup
Binary sensor
Blueprint
Button
C
Calendar entity
Category
Climate
Cloud-independent
Commissioning
Component
Condition
Configuration file
Cover
Custom integration
Customize
D
Device
Device tracker
Diagnostics
Discovery
Domain
E
Entity
Event
Event entity
F
Floor
Frontend
G
Group
H
HASS
HassOS
Helper
Home Assistant Container
Home Assistant Core
Home Assistant Operating System
Home Assistant Supervised
Home Assistant Supervisor
Host
I
Image
Integration
Intent
L
Label
Light
Local control
Long-term statistics
Lovelace
M
Matter
N
Notification
P
Package
Platform
Polling
R
Reload
S
Scene
Script
Selector
Sensor
Service
State
Switch
T
TTS
Template
Thread
Thread border router
Trigger
U
Update
V
Valve
Variables
Y
YAML
Z
Zone
any
boolean
datetime
float
integer
iterable
list
string
template filter
template function
template test
Home Assistant has a vocabulary of its own. Most of it comes up in everyday use: integrations, entities, devices, automations, dashboards. This page is a quick reference for what every term means and how the pieces fit together. Whenever you see a term you do not recognize in the documentation or in the user interface, you can come back here.
Actions are used in several places in Home Assistant. As part of a script or
automation, actions define what is going to happen once a trigger is
activated. In scripts, an action is called sequence . An action is a software
function that interacts with targets to make something happen . Actions can use other actions
and/or scenes to interact with entities and cause these entities to do
something. Actions can also include conditions and a delay. An action can
perform multiple actions at the same time. For example, if your presence is
detected in a room, an action may perform one action to turn on a light and
perform another action to start playing music after a delay. Actions are also
used on the dashboard, for example as tap or hold action on a UI element.
When triggered, the action performs another action. Home Assistant provides a series of predefined actions,
such as homeassistant.turn_on , homeassistant.toggle , or
homeassistant.reload .
Read more about Action
An entity that receives a control signal and performs an action in a system.
Apps, formerly known as add-ons, are additional standalone third-party software packages that can be installed on Home Assistant OS. Most of these applications can be integrated into Home Assistant using integrations. Examples of apps are: an MQTT broker, database service, or a file server.
Read more about App
An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. Areas allow you to target actions at an entire group of devices. For example, turning off all the lights in the living room. Locations within your home such as living room, dance floor, etc. Areas can be assigned to floors. Areas can also be used for automatically generated cards, such as the Area card .
Read more about Area
Automations connect one or more triggers to one or more actions in a ‘when trigger then do action’ fashion with additional optional conditions. For example, an automation might connect the trigger ‘sunset’ to the action ‘turn the lights on’ but only if the condition ‘someone is home’ is met. Pre-made automations for common use-cases are available via the blueprints feature .
Read more about Automation
Home Assistant has built-in functionality to create files containing a copy of your configuration. This can be used to restore your Home Assistant as well as migrate to a new system. The backup feature is available for all installation types .
Read more about Backup
A binary sensor returns information about things that only have two states - such as on or off.
Read more about Binary sensor
A blueprint is a script , automation , or template entity configuration with certain parts marked as configurable. This allows you to create multiple scripts, automations, or template entities based on the same blueprint, with each having its own configuration-specific settings. Blueprints are shared by the community on the blueprints exchange in the forum.
Read more about Blueprint
A button entity can fire an event, or trigger an action towards a device or service. It can be compared to a physical push button. The button entity does not have a state like on or off , but keeps the timestamp of when it was last pressed in the Home Assistant UI or via an action.
Read more about Button
A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services.
Read more about Calendar entity
A category is an organization tool that allows grouping items in a table. Like labels, categories allow grouping irrespective of the items’ physical location. For example, on the automations page, you can create the categories “Notifications” or “NFC tags” to view your automations grouped or filtered. Categories are unique for each table. The automations page can have different categories than the scene, scripts, or helpers settings page.
Read more about Category
The Climate entity allows you to control and monitor HVAC (heating, ventilating, and air conditioning) devices and thermostats.
Read more about Climate
Home Assistant is cloud-independent, meaning it does not need an internet connection or a vendor cloud account to keep your smart home running. Devices that talk over local protocols such as Zigbee, Z-Wave, Matter, Thread, and ESPHome continue to work even when the internet is down or a manufacturer shuts down its cloud service. Optional cloud features, such as Home Assistant Cloud , can be added on top, but the core of your smart home stays on your own hardware.
In the context of Matter devices, commissioning is the process of adding a device to a Matter controller. It is the equivalent of pairing a device in Zigbee or Z-Wave. Commissioning is done by scanning a QR code or entering a code manually. The code is printed on the device or its packaging. The code contains information about the device, such as its type, manufacturer, and serial number. The controller uses this information to identify the device and to download the required information to control the device. For example, the controller downloads the device’s capabilities, such as the supported commands and the available attributes. The controller also downloads the device’s configuration, such as the device’s name and location.
Read more about Commissioning
Better known as: Integrations. Integrations used to be known as components.
Conditions are an optional part of an automation that will prevent an action from firing if they are not met.
Read more about Condition
The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI.
Read more about Configuration file
Covers are devices such as blinds, garage doors, etc that can be opened and closed and optionally set to a specific position.
Read more about Cover
A custom integration is an integration that has been created by someone from the Home Assistant community and has been published for others to use at their own risk. Custom integrations are not supported by the Home Assistant project. They are not reviewed or tested by the Home Assistant development team and thus may negatively impact the stability of your Home Assistant instance. An example of a custom integration is the Spook integration.
Customization allows you to overwrite the default parameters of your devices in the configuration.
A device is a model representing a physical or logical unit that contains
entities. Example for a device as a physical unit A smart plug named
‘Coffee machine’ which provides 2 entities: a switch entity to turn power
on or off (‘Coffee machine power switch’) and a sensor entity for power
monitoring (‘Coffee machine power sensor’). Example for a device as a
logical unit An ecobee thermostat with 4 room sensors. This thermostat is
seen as 5 devices in Home Assistant: 1 device for the thermostat with 4
sensors, and 1 device for each room sensor. Each device can be in a
different area and may have more than one input or output within that area.
Devices have properties such as ID, manufacturer, name, model, hardware
version, firmware version, connections, etc.
Device trackers are used to track the presence, or location, of a device.
Read more about Device tracker
The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker.
Read more about Diagnostics
Discovery is the automatic setup of zeroconf/mDNS and uPnP devices after they are discovered.
Each integration in Home Assistant has a unique identifier: a domain. All of the entities and actions available in Home Assistant are provided by integrations and thus belong to such a domain. The first part of the entity or action, before the . shows the domain they belong to. For example light.kitchen is an entity in the light domain from the light integration , while hue.activate_scene is the activate_scene action for the hue domain which belongs to the Hue integration .
An entity represents a sensor, actor, or function in Home Assistant.
Entities are used to monitor physical properties or to control other
entities. An entity is usually part of a device or a service. Entities have
states. Example for entities as part of a device A combined temperature
and humidity sensor device provides two sensor entities. One for temperature
(e.g. sensor.temperature with state 21.0 and unit °C ) and one for
humidity (e.g. sensor.humidity with state 65.4 and unit % ). Example
for entities as part of a service A weather service that provides 3
entities: wind speed, air pressure, and ozon level. Example of an entity
used for control A fan that is turned on when the temperature exceeds
30 °C. There are standardized types of entities for common integrations
such as light, switch, camera, sensor, fan, or vacuum. Some entities are not
part of a device or service. Examples of standalone entities are automation,
script, scene entities, and helper entities (e.g. input helpers). Most
properties of entities are related to the state. Entities have optional
attributes such as friendly name, unit of measurement, and an icon or
picture that can be displayed in the frontend.
Read more about Entity
Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed.
Read more about Event
Events are signals that are emitted when something happens, for example, when a user presses a physical button like a doorbell or when a button on a remote control is pressed.
Read more about Event entity
A floor in Home Assistant is a logical grouping of areas that are meant to match the physical floors in your home. Devices & entities are not assigned to floors but to areas. A floor has properties such as: Floor ID, name, aliases (for use in assistants), an icon, and a floor level. Some of these properties are optional. The level number can be negative to reflect floors below the basement. Floors can be used in automations and scripts as a target for actions. For example, to turn off all the lights on the downstairs floor when you go to bed.
Read more about Floor
The frontend is a necessary component for the UI, it is also where you can define your themes.
Read more about Frontend
Groups are a way to organize your entities into a single unit.
Read more about Group
HASS is an abbreviation for Home Assistant that was commonly used in the past. This abbreviation is no longer actively used. It is recommended to use the full name “Home Assistant” instead of abbreviations.
Another name for Home Assistant Operating System
Read more about HassOS
A helper is a virtual entity you create inside Home Assistant. It is not backed by a physical device. Helpers store values, track state, or do calculations that your automations and dashboards need. Some helpers include toggles, number sliders, dropdown lists, text fields, date/time pickers, counters, timers, and schedules. Other helpers derive their value from other entities. For example, computing a minimum or maximum, tracking a trend, measuring utility consumption, or applying a filter. Depending on the type, you can create a helper in Settings > Devices & services > Helpers or with a YAML configuration. Helpers appear as regular entities and can be used in automations, conditions, dashboards, and templates.
Read more about Helper
Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker.
Read more about Home Assistant Container
Home Assistant Core is the Python program at the heart of Home Assistant. It is part of all installation types. It can be installed standalone (without Home Assistant Supervisor) as a container using Docker (this is typically referred to as the Home Assistant Container installation type). For development, Core can also be run using a Virtual Environment (previously referred as the Home Assistant Core installation type. For production setup, the Home Assistant Core installation type is deprecated .
Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users.
The Home Assistant Supervised installation type is a full UI managed home automation ecosystem that runs the Home Assistant Core program, the Home Assistant Supervisor and apps. It comes pre-installed on Home Assistant OS, but can be installed standalone on Debian Linux systems. It leverages Docker, which is managed by the Home Assistant Supervisor. The Home Assistant Supervised installation type is deprecated .
The Home Assistant Supervisor is a program that manages a Home Assistant installation, taking care of installing and updating Home Assistant, apps, itself, and, if used, updating the Home Assistant Operating System.
A device that can communicate with other devices on a network. During setup and configuration, an input requesting a Host typically refers to a device’s network address so that Home Assistant can attempt to connect to it. This may be in the form of a hostname, URL, IP address or some other type of network identifier. If you do not know the hostname or IP address of a device, you can find it in your router’s webinterface. For example, if your device is connected wirelessly, somewhere there is a page listing all the devices that are connected to your network. It depends on your router, where exactly this page is. It could be under Network > Wireless .
Read more about Host
The Image integration allows other integrations to display a static image.
Read more about Image
Integrations connect and integrate Home Assistant with devices, services, and more. They contain all the logic to handle vendor- and device-specific implementations, such as authentication or specific protocols. The integration brings such device-specific elements into Home Assistant in a standardized way. For example, the Hue integration integrates the Philips Hue bridge and its connected bulbs into Home Assistant, making them available as Home Assistant light entities you can control.
Read more about Integration
Intent is a term used with voice assistants. The intent is what Home Assistant thinks you want it to do when it extracts a command from your voice or text utterance. Currently, the following intents are supported out of the box: HassTurnOn, HassTurnOff, HassGetState, and HassLightSet. These intents allow you to turn things on or off, inquire about a state, or change the brightness or color of a light.
Read more about Intent
Labels in Home Assistant allow grouping elements irrespective of their physical location or type. Labels can be assigned to areas, devices, entities, automations, scenes, scripts, and helpers. Labels can be used in automations and scripts as a target for actions. Labels can also be used to filter data. For example, you can filter the list of devices to show only devices with the label heavy energy usage or turn these devices off when there is not a lot of solar energy available.
Read more about Label
A light has a brightness you can control, and optionally color temperature or RGB color control.
Read more about Light
Local control means Home Assistant talks to your devices directly over your own network, without sending the commands through a vendor cloud first. Local control makes your smart home faster, keeps your data on your own hardware, and keeps things working when the internet is down. Many integrations in Home Assistant use local control out of the box, including those for Zigbee, Z-Wave, Matter, Thread, and ESPHome devices.
Home Assistant saves long-term statistics for a sensor if the entity has a state_class of measurement, total, or total_increasing. For short-term statistics, a snapshot is taken every 5 minutes. For long-term statistics, an hourly aggregate is stored of the short-term statistics. Short-term statistics are automatically purged after a predefined period (default is 10 days). Long-term statistics are never purged.
Read more about Long-term statistics
Lovelace is the original code name of the UI that is now known as Home Assistant dashboards .
Matter is an open-source standard that defines how to control smart home devices on a Wi-Fi or Thread network. The aim of the standard is to improve security and to make devices interoperable across vendors, replacing proprietary protocols for smart home ecosystems. Unlike other standards, Matter allows joining the same device to multiple controllers. For example, you can add a light to Google Home, Apple Home, and Home Assistant at the same time. A bridge device can be used to connect devices running on other smart home technologies such as Zigbee or Z-Wave.
Read more about Matter
You can use notifications to send messages, pictures, and more, to devices.
Read more about Notification
Packages allow you to bundle different component configurations together.
Read more about Package
Platforms are building blocks provided by some integrations to be used by other integrations. For example, the Light integration provides the light platform that is utilized by all integrations providing light entities such as e.g. Hue .
Read more about Platform
Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic.
Read more about Polling
Applies the changes made to the Home Assistant configuration files. Changes are normally automatically updated. However, changes made outside of the front end will not be reflected in Home Assistant and require a reload. To perform a manual reload, go to Settings > System > Restart Home Assistant (top right) > Quick reload . More granular reload options are available in YAML configuration reloading section in Settings > Developer tools > YAML .
Scenes capture the states you want certain entities to be. For example, a scene can specify that light A should be turned on and light B should be bright red.
Read more about Scene
Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on.
Read more about Script
Selectors are components for the user interface. Some selectors can, for example, show a toggle button to turn something on or off, while another select can filter a list of devices to show only devices that have motion-sensing capabilities.
Read more about Selector
Sensors return information about a thing, for instance the level of water in a tank.
Read more about Sensor
The term “service” in Home Assistant is used in the sense of an information
service . For example, the municipal waste management service that provides
entities for organic, paper, and packaging waste. In terms of functionality,
the information service is like a device. It is called service to avoid
confusion, as it does not come with a piece of hardware.
The state holds the information of interest of an entity. For example, if a
light is on or off, the current temperature, or the amount of energy used. Entities store 3
timestamps related to the state: last_updated , last_changed , and last_reported . Each
entity has exactly one state and the state only holds one value at a time.
However, entities can store attributes related to that state. For example,
the state of a light is on , and the related state attributes could be its
current brightness and color values. State change events can be used as triggers.
The current state can be used in conditions.
Read more about State
Switches are things that have two states you can select between, such as turning on or off a socket.
Read more about Switch
TTS (text-to-speech) allows Home Assistant to talk to you.
Read more about TTS
A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions.
Read more about Template
Thread is a low-power mesh networking standard that is specifically designed for smart home applications. It is a protocol that defines how devices communicate. Mesh topology means that the devices can communicate with each other directly, without going through a central controller first. Thread uses the same radio frequency (RF) technology as Zigbee, but provides IP connectivity similar to Wi-Fi. Unlike Zigbee, Thread does not specify how to control devices. How Thread-enabled devices are controlled is specified in a higher level protocol such as HomeKit or Matter.
Read more about Thread
A Thread border router forwards data packets between your local network and the Thread network. This enables smart home devices within a Thread network to communicate with IPv6-capable devices in your local network. A Thread border router is connected to your network either via Wi-Fi or Ethernet and uses its radio frequency (RF) radio to communicate with the Thread mesh network. In case of Matter, the data that is forwarded is encrypted. Examples of Thread border routers are the Nest Hub (2nd gen), the HomePod mini, and the Home Assistant Connect ZBT-2 together with the OpenThread Border Router app.
Read more about Thread border router
A trigger is a set of values or conditions of a platform that are defined to cause an automation to run.
Read more about Trigger
An update entity is an entity that indicates if an update is available for a device or service. This can be any update, be it a firmware update for a device like a light bulb or router, or a software update for an app or a container.
Read more about Update
Valves are devices to control the flow of liquids and gases. All valves in Home Assistant can be opened and closed. Some valves can also be set to a specific position.
Read more about Valve
Variables are used to store values in memory that can be processed for example, in a script.
Read more about Variables
YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files.
Read more about YAML
Zones allow you to specify certain regions on a map. They enable zone presence-detection and can be used in automations. For example, to start the vacuum after you left home or start the heating at home when you leave the office.
Read more about Zone
A flexible type that can be a string, number, list, or any other type. Used when a function or filter works with multiple types, and the actual result depends on what you pass in.
A value that is either true or false. Used for on/off states, yes/no conditions, and similar binary choices.
A value representing a specific moment in time, including the date, time, and time zone. For example, 2026-04-05 14:30:00+00:00. Used for timestamps, scheduling, and time-based calculations.
A number that can have decimal places, like 21.5 or 3.14. Used for temperatures, percentages, and other measurements that need precision.
A whole number without decimal places, like 1, 42, or -5. Used for counts, indices, and whole values.
A sequence of values produced by filters like map, select, or selectattr. You can loop through it once. To reuse it or work with it as a list, apply | list at the end of the chain.
An ordered collection of values, like a list of entity IDs or a list of numbers. Written with square brackets in templates, for example [1, 2, 3].
A piece of text, like a name, message, or entity ID. In templates, wrap strings in quotes, like “living_room” or “lights are on”.
A template filter transforms a value using the pipe (|) operator. It takes the value on the left and returns a modified result. For example, states(“sensor.temperature”) | float converts the state to a number.
Read more about template filter
A template function is called by name with parentheses, like states(“sensor.temperature”) or now(). It takes input values as arguments and returns a result.
Read more about template function
A template test checks a condition using the “is” keyword and returns true or false. For example, value is number checks if a value is a number.
Read more about template test
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
