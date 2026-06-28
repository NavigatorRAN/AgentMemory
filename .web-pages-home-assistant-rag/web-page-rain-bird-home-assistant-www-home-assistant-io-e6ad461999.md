# Rain Bird - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rainbird
- Final URL: https://www.home-assistant.io/integrations/rainbird
- Canonical URL: https://www.home-assistant.io/integrations/rainbird/
- Fetched at: 2026-06-28T03:11:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Rain Bird LNK WiFi Module within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Configuration options
Data updates
Supported functionality
Entities
List of actions
Known Limitations
Removing the integration
To remove an integration instance from Home Assistant
The Rain Bird integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows interacting with LNK WiFi module of the Rain Bird Irrigation system in Home Assistant.
There is currently support for the following device types within Home Assistant:
Binary sensor
Calendar
Number
Switch
Home Assistant allows you to control the irrigation values, log details about
the device including optional rain sensor, and allow you to view any upcoming
irrigations schedules on a calendar.
Follow the Rain Bird instructions for set up of your sprinkler system
Follow the setup guide for installing your LNK WiFi Module
Complete the necessary steps in the Rain Bird App
Home Assistant should auto discover the device on your network based on the mac address. Otherwise you will need to know the devices IP address on your network to let Home Assistant know how to connect to it.
To add the Rain Bird hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Rain Bird .
Follow the instructions on screen to complete the setup.
Host
The IP address of your Rain Bird device. You can find the IP address under the device in the Rain Bird app under Controller Settings > Network Info .
Password
The password used to authenticate the Rain Bird device.
The integration provides the following configuration options:
Default irrigation time
The number of minutes that the irrigation will run when turning on a zone switch. The default is 6 minutes. This can be overridden with an action (see below).
The Rain Bird integration fetches available irrigation zones once, then polls
every minute to check the current state of each valve. The irrigation schedule
calendar is only fetched every 15 minutes.
The Rain Bird integration provides the following entities.
Rain sensor
Description : The rain sensor will tell if you if the device has detected rain.
Available for devices : The rain sensor is an optional add-on for the device purchased from Rain Bird.
Controller irrigation schedule
Description : The irrigation schedule calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more]
entity is created for each schedule configured in the Rain Bird app. You can view the program schedule
in the Home Assistant calendar UI, or trigger other automations based on the irrigation start or end time.
Available for devices : Only available for Rain Bird devices irrigation schedules.
Rain Delay
Description : Lets you set and view the number of days, if any, the automatic irrigation schedule has
been delayed due to rain. You may use the number entity with an automation such as increasing the number
of days to delay irrigation when combined with another weather forecast integration in Home Assistant.
Irrigation Zone
Description : Switches are automatically added for all available zones of
configured controllers. Turning on the switch will open the irrigation valve for that zone.
Available for devices : All
The Rain Bird integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Start irrigation ( rainbird.start_irrigation )
Starts a Rain Bird sprinkler zone for a set number of minutes.
For an overview of every action across all integrations, see the actions reference .
The new Rain Bird 2.0 App and Firmware is not compatible with Home Assistant.
The upgrade process will migrate devices to require use of the new Rain Bird
IQ4 cloud, and Home Assistant will not be able to access the device.
The Rain Bird LNK WiFi can only receive one incoming request at a time. It may
not be possible for Home Assistant to send commands to the device while you
are also using the Rain Bird App. Home Assistant tries to carefully limit
connections to the device to avoid failures.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rain Bird hub was introduced in Home Assistant 0.61, and it's used by
2179 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@konikvranik
@allenporter
Categories
Irrigation
Sensor
Back to top
