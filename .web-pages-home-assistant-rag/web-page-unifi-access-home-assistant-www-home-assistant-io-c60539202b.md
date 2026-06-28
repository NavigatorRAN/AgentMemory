---
source_url: "https://www.home-assistant.io/integrations/unifi_access"
final_url: "https://www.home-assistant.io/integrations/unifi_access"
canonical_url: "https://www.home-assistant.io/integrations/unifi_access/"
source_handle: "web:www-home-assistant-io:c60539202b94"
source_section: "integrations-unifi-access"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "73842a7635f7b115b8b0557bc3087230ad24e46f69a7521224609e5a4405257b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# UniFi Access - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/unifi_access
- Final URL: https://www.home-assistant.io/integrations/unifi_access
- Canonical URL: https://www.home-assistant.io/integrations/unifi_access/
- Fetched at: 2026-06-28T03:24:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate UniFi Access with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Entities
Actions
Data updates
Examples
Send a notification when the doorbell rings
React to door access events
Use a UniFi Access unlock button as a HomeKit lock
Known limitations
Troubleshooting
Cannot connect to the controller
Invalid authentication
Removing the integration
To remove an integration instance from Home Assistant
The UniFi Access integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor Ubiquiti UniFi Access devices from Home Assistant.
UniFi Access is a modern, IP-based door access control system by Ubiquiti . It supports a range of access readers, door locks, and hubs that can be managed through a local UniFi Access controller (such as a UniFi Dream Machine Pro or a dedicated UniFi Access application host).
With this integration, you can unlock doors, see whether doors are open or closed, receive doorbell notifications, and track access events directly from your Home Assistant dashboards and automations.
This integration communicates with the UniFi Access controller over the local network using its REST API and WebSocket interface, providing real-time door status updates without polling.
This integration supports any door managed by a UniFi Access controller, including doors equipped with:
UniFi Access Reader (UA Reader, UA Reader Pro, UA Reader Lite)
UniFi Access Lock (UA Lock)
UniFi Access Hub (UA Hub, UA Hub Ultra)
Before setting up this integration, make sure you have the following:
A running UniFi Access controller (for example, on a UniFi Dream Machine Pro or Cloud Key Gen2 Plus with the Access application installed).
An API token generated in the UniFi Access controller’s web interface:
Open your console’s IP address in a browser and select Access at the top.
In the left menu, go to Settings > General , then under API Token , select Create New .
Give the token a descriptive name, for example Home Assistant , and copy it — you will need it during setup.
For full details, see Ubiquiti’s Getting Started with the Official UniFi API and the UniFi Access API reference (PDF) , section “1.1 Create API Token & Download API Documentation”.
Your Home Assistant instance must be able to reach the UniFi Access controller on your local network.
Important
Create the token in the UniFi Access controller’s web interface, as shown above. Do not use the console’s Integrations page (the UniFi OS Control Plane), where UniFi Protect API keys are created. A key made there belongs to the console, and UniFi Access rejects it with a message that the key is associated with UniFi Protect. On newer consoles, the two pages look similar, so it is easy to pick the wrong one.
To add the UniFi Access hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select UniFi Access .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of the UniFi Access controller.
API Token
The API token generated in the UniFi Access controller settings. See Prerequisites for how to create one.
Verify SSL
Whether to verify the SSL certificate of the controller. Disable this if you are using a self-signed certificate. Disabled by default.
The UniFi Access integration provides the following entities.
Buttons
Each door registered in your UniFi Access controller is represented as an unlock button entity in Home Assistant.
Unlock : Triggers the configured door lock relay to open the door for its configured duration.
Events
Each door provides two event entities:
Doorbell : Fires a ring event when someone presses the doorbell at the door.
Note
Doorbell entities are created for all doors because the UniFi Access API does not expose per-door doorbell capability information. Not every hardware combination supports doorbell ring events, and there is currently no official list of supported combinations. If you do not receive ring events, your device may not support this feature.
Access : Fires an event when someone attempts to unlock a door:
access_granted : The door was successfully unlocked (API result: ACCESS ).
access_denied : The access attempt was denied (API result: BLOCKED or any other non- ACCESS value).
The event includes the following additional attributes when available:
actor : The name of the person who attempted access.
authentication : The authentication method used (for example, NFC, PIN code, Face).
result : The raw result from the UniFi Access controller (for example, ACCESS , BLOCKED ).
Images
Door thumbnail
Description : Shows the most recent snapshot captured by the door’s camera. The image is updated automatically whenever the UniFi Access controller sends a new thumbnail via WebSocket, for example after an access event.
Binary sensors
Each door registered in your UniFi Access controller is represented by a binary sensor entity that reports the door position.
Door : Turns on when the door is open and off when the door is closed.
Switches
The integration provides two switch entities for controlling the emergency modes of your UniFi Access controller.
These switches affect all doors managed by the controller at once and have direct physical security and safety implications. Make sure to restrict access to these switches in your dashboards and avoid triggering them accidentally in automations.
Evacuation
Description : Activates or deactivates the evacuation mode on your UniFi Access controller. When turned on, all doors managed by the controller are unlocked to allow evacuation.
Lockdown
Description : Activates or deactivates the lockdown mode on your UniFi Access controller. When turned on, the controller triggers a facility-wide lockdown, locking all doors to restrict access.
Selects
For controllers that support temporary lock rules, each door exposes the following select entity:
Door Lock Rule : Sets the active temporary lock rule for the door. Available options are custom , keep_lock , keep_unlock , lock_early , lock_now , reset , and schedule . Returns unknown when no temporary rule is active.
Sensors
For controllers that support temporary lock rules, each door also exposes the following diagnostic sensor entity:
Rule End Time : Reports the date and time when the active temporary lock rule expires. Returns unknown when no temporary rule is active or when the rule has no expiry.
For controllers that support temporary lock rules, the integration also provides the unifi_access.set_lock_rule action.
Use this action to apply a temporary lock rule to a specific door from an automation or script. It complements the existing Door Lock Rule select entity and adds support for setting the interval directly. In the automation editor, select the UniFi Access door device you want to target.
Data attribute Optional Description device_id no The UniFi Access door device to update. rule no The lock rule to apply. Supported values are custom , keep_lock , keep_unlock , lock_early , and reset . interval yes How long the rule stays active, as a duration (for example, "00:30:00" for 30 minutes). Defaults to 10 minutes when omitted.
Example action:
action : unifi_access.set_lock_rule data : device_id : 0123456789abcdef0123456789abcdef rule : keep_lock interval : hours : 0 minutes : 30 seconds : 0
The integration uses a local push architecture via WebSocket. When a door’s lock or position status changes, or when the emergency mode (evacuation or lockdown) is updated, the UniFi Access controller pushes updates to Home Assistant in real time. No polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] is performed.
Get notified on your phone or trigger any action when someone rings a UniFi Access doorbell.
Send a notification or trigger an action when someone unlocks a door or when an access attempt is denied.
HomeKit natively supports door locks, which lets you unlock doors with Siri or from the Home app. Because a door strike only supports a momentary unlock pulse — there is no physical lock state to read back — the UniFi Access integration correctly models door openers as button entities. This is by design and cannot be changed within the integration itself. As a result, HomeKit Bridge cannot expose them as locks directly.
You can work around this by creating a Template Lock helper that wraps the unlock button. The lock always reports as locked (because the door re-locks itself after the momentary pulse), and the unlock action calls the button. HomeKit handles this pattern gracefully.
Step 1: Create a Template Lock helper
Go to Settings > Devices & services > Helpers .
Select + Create helper .
Select Template , then select Template Lock .
Fill in the form:
Name : for example, Front door .
Value template : enter true (this makes the lock always report as locked , which is correct for a door that re-locks itself after each pulse).
Lock action : leave empty (no-op).
Unlock action : use the action picker to select button.press , then choose your UniFi Access unlock button entity, for example button.front_door_unlock .
Open action : leave empty.
Select Submit .
Step 2: Expose the lock to HomeKit Bridge
Go to Settings > Devices & services and open your HomeKit Bridge integration.
Select Configure on your bridge instance.
Verify that the newly created lock.front_door entity is not filtered out. If needed, add it explicitly under the entity filter.
Restart Home Assistant so the new lock entity is picked up by HomeKit Bridge.
After restarting, HomeKit Bridge automatically exposes the entity as a Door Lock accessory in the Home app.
How it works
Saying “Hey Siri, unlock the front door” sends an unlock command to Home Assistant, which calls button.press on the UniFi Access unlock button.
The door opens momentarily and then re-locks itself.
Because the value template always returns true (locked), HomeKit correctly shows the door as locked again after the pulse — no extra automation is needed.
No per-door lock command : The UniFi Access API only supports unlocking individual door entities. The controller-wide lockdown emergency mode is a separate feature and can lock all doors simultaneously.
Single controller : Each configuration entry connects to one UniFi Access controller. If you have multiple controllers, add a separate integration entry for each.
Symptom: “Could not connect” error during setup
When trying to set up the integration, the form shows a connection error.
Description
This means your Home Assistant instance cannot reach the UniFi Access controller on the network.
Resolution
To resolve this issue, try the following steps:
Verify that the UniFi Access controller is reachable from your Home Assistant instance (check the host or IP address).
Make sure no firewall is blocking the connection.
Ensure the UniFi Access application is running on the controller.
Symptom: “Invalid authentication” error during setup
The integration reports invalid authentication when trying to connect.
The API token may have been revoked, expired, or entered incorrectly.
Verify that the API token has not been revoked or expired in the UniFi Access controller settings.
Re-enter the token or generate a new one.
If the integration was already set up, use the Reconfigure option in the integration settings.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After removal, you may also want to revoke the API token in your UniFi Access controller settings.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The UniFi Access hub was introduced in Home Assistant 2026.4, and it's used by
846 active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@imhotep
@RaHehl
Categories
Doorbell
Lock
Sensor
Back to top
