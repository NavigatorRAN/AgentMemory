---
source_url: "https://www.home-assistant.io/integrations/homee"
final_url: "https://www.home-assistant.io/integrations/homee"
canonical_url: "https://www.home-assistant.io/integrations/homee/"
source_handle: "web:www-home-assistant-io:9e0625bfc0a0"
source_section: "integrations-homee"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2d0959da7162f5221401429366c4110b558d279fcdc6c6d050a4a92b63974152"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Homee - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/homee
- Final URL: https://www.home-assistant.io/integrations/homee
- Canonical URL: https://www.home-assistant.io/integrations/homee/
- Fetched at: 2026-06-28T02:49:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up homee devices in Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
Unsupported devices
Homeegrams (automations)
Limitations
Examples
Use a Homeegram as trigger
Troubleshooting
homee device not working as expected
Integration not loading or homee device not showing up in HA
Reconfiguration
To start the reconfiguration
Removing the integration
To remove an integration instance from Home Assistant
homee is a smart home system, able to integrate various protocols such as Z-Wave, Zigbee, EnOcean, and more. The homee integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will let you use the devices A device is a model representing a physical or logical unit that contains entities. from your homee in Home Assistant.
You need to create a new user in your homee app. Create a user that is only used by Home Assistant. For security reasons, it’s recommended to:
Use a strong, unique password.
Restrict the user’s permissions for what you want to do from Home Assistant.
Do not use this account for any other purpose.
In your homee app, in the top-left corner, tap the menu button.
On the top right of the opening menu, tap the gear icon.
Choose Manage users .
Choose Add user and configure the desired values.
To add the Homee hub to your Home Assistant instance, use this My button:
Homee can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Homee .
Follow the instructions on screen to complete the setup.
Host
The IP Address of your homee.
User
The username you chose in the Prerequisites.
Password
The password for that user.
Available devices will automatically show up in your Home Assistant installation.
Devices you add in homee appear automatically in Home Assistant. If you remove a device from homee, it is also removed from Home Assistant.
The integration basically supports all devices that are working in homee. Since development relies on an unofficial and outdated description of the interface and reverse engineering, not all functions of a device may work as expected.
A list of known devices and their status can be found in the old custom integration’s wiki .
If you think a device is not correctly supported, see below .
Commands of the “Warema WMS Handsender” remote controls are not passed to the external API by the homee cube. Therefore these devices show up in Home Assistant, but have no function.
Homeegrams are automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] in homee. The integration implements them as switches Switches are things that have two states you can select between, such as turning on or off a socket. [Learn more] that the user can trigger and that momentarily turn on if the Homeegram is played in homee, so they can also be used as a trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] in Home Assistant.
Although turning off a Homeegram in HA can be triggered by the user, it is not supported and will raise an error.
Only Homeegrams that perform at least two actions are enabled by default to avoid creating many low-value entities in your Home Assistant installation.
Changed values are reported from homee in defined time intervals and not always in realtime. For example, while a cover moves, the position is updated only every few seconds and intermediate states may be missed by Home Assistant.
If you don’t want to recreate your automations in Home Assistant, you can use your existing Homeegrams as trigger.
triggers:
- trigger: state
entity_id:
- switch.homeegrams_test_hg
to:
- "on"
actions:
- action: cover.open_cover
target:
entity_id: cover.rolladen_arbeitszimmer
First, see the general Home Assistant troubleshooting guide .
The homee integration supports debug logs and diagnostics .
Make sure, the device A device is a model representing a physical or logical unit that contains entities. works as expected in homee.
If a homee device shows up in Home Assistant, but does not work as expected or is missing entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , open a report and attach error logs and the device’s diagnostics The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker. [Learn more] data.
Check that the homee-user, used for Home Assistant, is allowed to see the device.
If that is the case, open a report and attach error logs and the diagnostic data of the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] .
This integration supports reconfiguration, allowing you to change the IP address, even after a device has already been set up.
Go to Settings > Devices & services and select the homee integration card.
From the list of hubs, select the one you want to reconfigure.
Next to the entry, select the three dots menu. Then, select Reconfigure .
This integration follows standard integration removal, and once the integration is removed, you can also remove the dedicated user from your homee.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Homee hub was introduced in Home Assistant 2025.2, and it's used by
350 active installations.
Its IoT class is Local Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Taraman17
Categories
Alarm
Binary sensor
Button
Climate
Cover
Event
Fan
Light
Lock
Number
Select
Sensor
Switch
Valve
Back to top
