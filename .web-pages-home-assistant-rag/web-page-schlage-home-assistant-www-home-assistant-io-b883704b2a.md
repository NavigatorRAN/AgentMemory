# Schlage - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/schlage
- Final URL: https://www.home-assistant.io/integrations/schlage
- Canonical URL: https://www.home-assistant.io/integrations/schlage/
- Fetched at: 2026-06-28T03:13:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Schlage WiFi smart locks into Home Assistant.

## Extracted Text

On this page
Known working devices
Configuration
Data updates
Binary sensor
Select
Sensor
Switch
Actions
Action: Get Codes
Action: Add Code
Action: Delete Code
Removing the integration
To remove an integration instance from Home Assistant
The Schlage integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides connectivity with Schlage WiFi smart locks through Schlage’s cloud API.
Schlage Encode Smart WiFi Deadbolt
Schlage Encode Smart WiFi Lever
Schlage Encode Plus Smart WiFi Deadbolt
Other devices not listed above have not been tested and may not function as expected.
There is currently support for the following device types within Home Assistant:
Lock
To add the Schlage hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Schlage .
Follow the instructions on screen to complete the setup.
The Schlage integration fetches updated lock state data every 30 seconds.
Once you have enabled the Schlage integration, you should see the following binary sensor:
Keypad disabled - Indicates that the keypad has been disabled, typically due to too many incorrect lock codes being attempted.
Once you have enabled the Schlage integration, you should see the following selects:
Auto Lock Time - Configure the time until the deadbolt automatically locks, or disable the auto-lock feature entirely. For example, 0 : auto-lock is disabled, 15 : auto-lock after 15 seconds, 300 : auto-lock after 5 minutes.
Once you have enabled the Schlage integration, you should see the following sensors:
Lock Battery
Once you have enabled the Schlage integration, you should see the following switches:
1-Touch Locking - When enabled, locks the lock with a press of the Schlage button.
Keypress Beep - Controls whether the lock will emit beeping tones on use.
You can use the schlage.get_codes action to retrieve the codes stored on your lock. This action returns all codes related to the Entity ID.
Get codes action details
Data attribute Optional Description Example entity_id no Lock entity to use (one or more) lock.front_door
# Example action action : schlage.get_codes data : entity_id : - lock.front_door
The returned codes will be in the following format:
lock.front_door : 93ab517c-0000-0000-0000-000000000000 : name : Example Person code : " 3333" 82958b77-0000-0000-0000-000000000000 : name : Example person 2 code : " 2222"
You can use the schlage.add_code action to add a new code to your lock. The code must be between 4 and 8 digits long.
Add code action details
Data attribute Optional Description Example entity_id no Lock entity to use (one or more) lock.front_door name no Name for the code Example Person code no Code to add (4-8 digits) 3333 notify_on_use yes Whether the native Schlage notification should be sent when this PIN is used true
# Example action action : schlage.add_code data : entity_id : - lock.front_door name : Example Person code : " 3333" notify_on_use : true
You can use the schlage.delete_code action to delete a code from your lock.
Delete code action details
Data attribute Optional Description Example entity_id no Lock entity to use (one or more) lock.front_door name no Name for the code to delete. The name evaluation for deletion is case insensitive Example Person
# Example action action : schlage.delete_code data : entity_id : - lock.front_door name : Example Person
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Schlage hub was introduced in Home Assistant 2023.9, and it's used by
2938 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dknowles2
Categories
Back to top
