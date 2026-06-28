---
source_url: "https://www.home-assistant.io/integrations/yalexs_ble"
final_url: "https://www.home-assistant.io/integrations/yalexs_ble"
canonical_url: "https://www.home-assistant.io/integrations/yalexs_ble/"
source_handle: "web:www-home-assistant-io:fe1dde644567"
source_section: "integrations-yalexs-ble"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "50a43e6ddce55ab821f4b5400ff6e8e4cbc65f5e140b2e836deb36b881d95662"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Yale Access Bluetooth - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yalexs_ble
- Final URL: https://www.home-assistant.io/integrations/yalexs_ble
- Canonical URL: https://www.home-assistant.io/integrations/yalexs_ble/
- Fetched at: 2026-06-28T03:30:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Yale Access Bluetooth devices into Home Assistant.

## Extracted Text

On this page
Configuration
Supported devices
Limited support devices
Deadlock support
Troubleshooting
Push updates
Options
Door sensors
Obtaining the offline key
Yale Access, Yale Home, or August Cloud
iOS - Yale Access App or August App
Android - Yale Access App or August App
Android - Yale Home
Lock frequently requires re-authentication
Integrates Yale Access Bluetooth devices into Home Assistant.
To add the Yale Access Bluetooth device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Yale Access Bluetooth .
Follow the instructions on screen to complete the setup.
The Yale Access Bluetooth integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will automatically discover devices once the Bluetooth integration is enabled and functional.
Devices must have a Yale Access module installed to function with this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] if one is not already built-in.
YRD216 (Yale Assure Lock Keypad with Physical Key)
YRL216 (Yale Assure Door Lever Lock with Push Button Keypad)
YRD226 (Yale Assure Lock Touchscreen Deadbolt with Physical Key)
YRL226 (Yale Assure Door Lever Lock Keypad)
YRD256 (Yale Assure Lock Keypad)
YRD420 (Yale Assure Lock 2)
YRD450 (Yale Assure Lock 2 Key Free)
YUR/SSDL/1/SIL and MBK (Yale Unity Screen Door Lock - Australia)
YUR/DEL/1/SIL and MBK (Yale Unity Entrance Lock - Australia)
IES-D210W-G0 (Yale Smart Safe)
YRSM-1 (Yale Smart Safe)
ASL-05 (August WiFi Smart Lock - Gen 4)
ASL-03 (August Smart Lock Pro - Gen 3)
ASL-02 (August Smart Lock Pro - Gen 2)
These devices do not send updates, but can be locked and unlocked.
MD-04I (Yale Conexis L1 (requires yale access module), Yale Conexis L2)
YRCB-490 (Yale Smart Cabinet Lock)
Some Yale locks support a deadlock function (secure mode) for locking both the inside and outside. A secure mode lock entity (initially disabled) is exposed for all locks and can be enabled where the lock is known to support this capability.
Lock operation requires setting up an encrypted connection highly sensitive to latency. It is recommended to use a High-Performance Bluetooth adapter or ESPHome Bluetooth proxy for stable operation.
Some locks only send push updates when they have an active HomeKit pairing. If your lock is not sending push updates, ensure it’s paired with a HomeKit using an iOS device or the HomeKit controller integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] . The lock cannot be paired via HomeKit Controller and the Yale Access Bluetooth integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] on the same Home Assistant instance as they will both try to access the lock simultaneously and fail.
One easy way to fix this is to create a new/second home in the Apple Home app and add the lock to that new home. Push updates should occur as intended after the lock is added.
Alternatively, call the homeassistant.update_entity action to force the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to update the lock state, or enable the always connected option.
To define options for Yale Access Bluetooth, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Yale Access Bluetooth are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
If the lock does not support push updates via advertisements or you want lock operation to be more responsive, you can enable always connected mode. Always connected will cause the lock to stay connected to Home Assistant via Bluetooth, which will use more battery.
The lock must be calibrated in the Yale Access App for the door sensors to function correctly. If the door sensor has an unknown state or is not updating, try recalibrating the lock in the app.
The offline key and slot number are required to operate the lock. These credentials can be found in multiple places depending on the lock brand and model.
The Yale or August cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can automatically provision the offline key if the configured account has the key loaded. You may need to create or use a non-primary existing account with owner-level access to the lock, as not all accounts will have the key loaded. If the lock was not discovered by Home Assistant when the cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] was loaded, reload the cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] once the lock has been discovered.
If the offline key can automatically be provisioned, you will not be asked to enter it and the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] should be automatically added, configured and running.
Most Yale branded locks can use the cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to obtain the offline key. Accessing the August cloud to receive the key may only work if the lock was purchased in a market that sells under both brands and the Yale cloud should be tried for other markets.
The iOS app will only save the offline key to your device’s filesystem if Auto-Unlock has been enabled and used at least once. Auto-Unlock can be disabled once the key has been loaded.
Using iMazing or iPhone Backup Extractor , find the backup files for the Yale Access app.
Look in the Library/Preferences .plist files for the Yale Access app and find the one with the value of key and slot using Xcode or any binary plist viewer.
The Android app will only save the offline key to your device’s filesystem if Auto-Unlock has been enabled and used at least once. Auto-Unlock can be disabled once the key has been loaded.
Root access is required to copy the ModelDatabase.db from /data/data/com.august.bennu/databases . Once copied, you can use DB Browser for SQLite to open the ModelDatabase.db , navigate to the table LockData and find the column offlineKeys . There, you will find a JSON that includes the key and slot properties.
Root access is required to copy the ModelDatabase.sql from /data/data/com.assaabloy.yale/databases . Once copied, you can use DB Browser for SQLite to open the ModelDatabase.sql , navigate to the table LockData and find the column offlineKeys . There, you will find a JSON that includes the key and slot properties.
If you use the key from an iOS or Android device that you also frequently use to operate the lock, you may find that the key is rotated, and the integration can no longer authenticate. If you are using the Yale or August integration to keep the key up to date, it may need to be reloaded to update the key.
To avoid the problem, create a second owner account in the Yale Home or August app, log in to it once on your iOS or Android device, operate the locks, log out of the account, remove the Yale or August integration from Home Assistant, and set up the integration again with the secondary owner account. This method avoids the problem because there is no longer an iOS or Android device logged into the secondary owner account that can rotate the key unexpectedly.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yale Access Bluetooth device was introduced in Home Assistant 2022.9, and it's used by
2413 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
Categories
Binary sensor
Lock
Sensor
Back to top
