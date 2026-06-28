# Yale Home - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yale
- Final URL: https://www.home-assistant.io/integrations/yale
- Canonical URL: https://www.home-assistant.io/integrations/yale/
- Fetched at: 2026-06-28T03:29:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Yale devices into Home Assistant.

## Extracted Text

On this page
Configuration
Known working devices
Push updates not available for some entities
Binary sensor
Button
Event
Camera
Sensor
Integration with Yale Access Bluetooth
Troubleshooting offline key updates
Presence detection with lock operation
There is an active alert for this integration!
LEARN MORE
The Yale integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Yale devices in Home Assistant.
The login credentials used to authenticate the integration are the same as the ones used in the Yale Home app.
To add the Yale Home hub to your Home Assistant instance, use this My button:
Yale Home can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Yale Home .
Follow the instructions on screen to complete the setup.
Device Requires Connect Bridge or Doorbell Yale Assure Lock yes Yale Conexis L1 yes Yale Conexis L2 yes Yale Doorman L3 yes Yale Linus yes Yale Linus L2 no Yale Smart Safe yes
Other devices not listed above have not been tested and may not function as expected.
There is currently support for the following device types within Home Assistant:
Doorbell
Lock
Note
Most devices will need either a Yale Connect Bridge or a Doorbell to connect to Home Assistant.
While most entities can be updated via the push API, Yale/Yale does not offer a push API for some data, which means these entities will update slower:
Doorbell ding sensor (Doorman models only)
Lock Battery sensor
Lock Operation sensor
If you have a Yale Doorbell, once you have enabled the Yale integration, you should see the following sensors:
Doorbell ding sensor
Doorbell motion sensor
Doorbell online sensor
If you have a Yale Smart Lock with DoorSense, once you have enabled the Yale integration, you should see the following sensors:
Door sensor
Buttons are created to wake locks from a deep sleep. If your lock is not reporting a status, it may be in a deep sleep, and the button can be used to wake it. Locks are not automatically woken from deep sleep to preserve battery life.
If you have a Yale doorbell or lock that has a built-in doorbell, once you have enabled the Yale integration, you should see the following event entities:
Motion
Not all models include motion sensors and support for locks with built-in doorbells is limited to Yale Doorman models type 7 and 10.
The yale camera platform allows you to view the latest camera image (triggered by motion) by your Yale device in Home Assistant.
If you have a Yale Doorbell with a battery, once you have enabled the Yale integration, you should see the following sensors:
Doorbell Battery
If you have a Yale Smart Lock, once you have enabled the Yale integration, you should see the following sensors:
Lock Battery
Lock Operation
If you have a Yale Keypad, once you have enabled the Yale integration, you should see the following sensors:
Keypad Battery
Following Assa Abloy, Yale’s parent company, purchasing Yale in 2017, most newer devices use the Yale Home branding.
The Yale Access Bluetooth integration provides local control over Bluetooth of many Yale Home locks that use the same system.
For locks that support the Yale Access system, the Yale integration can keep your offline access keys up to date to ensure you can operate your lock over Bluetooth. The following requirements must be met for the offline key updates to work:
The Yale integration must support the lock.
The Yale Access Bluetooth integration must support the lock.
The Bluetooth integration must be active and functional.
The lock must be discoverable by the Yale Access Bluetooth integration .
The account logged in with the Yale integration must have the offline keys.
If you do not know which account has the offline keys, configure Yale integration with each different Owner account until you find the one that holds the keys. You may need to make a new owner account and grant the account access to your lock to force the keys to synchronize with the cloud service.
Ensure the lock is in range and discoverable by the Yale Access Bluetooth integration .
Using the lock operation sensors, you can detect when a user operates a lock and is physically present (not remote). The below automation example (added to automations.yaml ) will trigger when the user named “John Doe” in Yale locks or unlocks the door either from the keypad (if present), via Bluetooth from their phone, or by auto-unlock. The state of the sensor will be the name of the party operating the lock as returned by Yale.
- alias : " John Doe locks or unlocks the Front Door" triggers : - trigger : state entity_id : sensor.front_door_operator to : " John Doe" conditions : - condition : template value_template : " {{ not state_attr('sensor.front_door_operator', 'remote') }}" actions : - action : camera.turn_off entity_id : camera.inside
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yale Home hub was introduced in Home Assistant 2024.9, and it's used by
3831 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
Categories
Back to top
