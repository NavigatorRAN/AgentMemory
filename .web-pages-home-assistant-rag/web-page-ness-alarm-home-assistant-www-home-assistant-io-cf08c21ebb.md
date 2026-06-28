# Ness Alarm - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ness_alarm
- Final URL: https://www.home-assistant.io/integrations/ness_alarm
- Canonical URL: https://www.home-assistant.io/integrations/ness_alarm/
- Fetched at: 2026-06-28T03:02:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Ness D8x/D16x alarm system with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Managing zones
List of actions
Related topics
The Ness Alarm integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows Home Assistant users who own a Ness D8x/D16x alarm system to leverage their alarm system and its sensors to provide Home Assistant with information about their homes. Connectivity between Home Assistant and the alarm is accomplished through an IP232 module that must be connected to the alarm.
There is currently support for the following device types within Home Assistant:
Binary sensor: Reports on zone statuses
Alarm control panel: Reports on alarm status, and can be used to arm/disarm the system
The module communicates via the Ness D8x/D16x ASCII protocol .
As part of the installation process of the IP232 module, the device will need to be configured with the correct settings. From the iComms Manual , there are 3 essential steps:
Setting up the IP232 module with the correct baud rate (9600).
Ensuring connectivity of the device on either a DHCP assigned or Static IP address.
Setting the alarm panel up to allow for serial control. On D8x/D16x panels this is enabled by setting P 199 E 1E to 6E to be ON (6E available on v6 panels and later only).
If the settings in steps 1 and 2 are not set correctly, the integration will not be able to communicate properly with the device. If the P 199 E from step 3 is not configured properly, data will not be sent to the integration when events occur.
Important
Incorrect configuration of these settings will prevent the integration from functioning properly.
To add the Ness Alarm integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ness Alarm .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of the IP232 module on your home network.
Port
The port on which the IP232 module listens for clients.
Infer arming state
Infer the disarmed arming state only via system status events. This works around a bug with some panels ( <v5.8 ) which emit update.status = [] when they are armed.
Adding zones allows you to monitor individual areas of your home, such as doors, windows, and motion sensors. Each zone appears as a binary sensor in Home Assistant.
After setting up the integration, you can add zones through the UI:
Find the Ness Alarm integration and select Configure .
Select Add zone to add a new zone.
Enter the zone number (1-32) and select the zone type (device class).
The zone will appear as a separate device in Home Assistant.
You can reconfigure a zone’s device class at any time by selecting the zone’s configure button.
The Ness Alarm integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Aux ( ness_alarm.aux )
Changes the state of an aux output on the Ness alarm panel.
Panic ( ness_alarm.panic )
Triggers a panic alarm on the Ness alarm panel.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ness Alarm integration was introduced in Home Assistant 0.85, and it's used by
50 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@nickw444
@poshy163
Categories
Alarm
Binary sensor
Back to top
