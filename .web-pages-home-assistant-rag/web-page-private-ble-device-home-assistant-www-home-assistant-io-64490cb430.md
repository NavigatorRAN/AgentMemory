---
source_url: "https://www.home-assistant.io/integrations/private_ble_device"
final_url: "https://www.home-assistant.io/integrations/private_ble_device"
canonical_url: "https://www.home-assistant.io/integrations/private_ble_device/"
source_handle: "web:www-home-assistant-io:64490cb430a4"
source_section: "integrations-private-ble-device"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "11d5c02c6e002bb47284abc7b039f28e2c1e5e2fee4cec5d89f394d541ba9c20"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Private BLE Device - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/private_ble_device
- Final URL: https://www.home-assistant.io/integrations/private_ble_device
- Canonical URL: https://www.home-assistant.io/integrations/private_ble_device/
- Fetched at: 2026-06-28T03:09:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate private BLE devices into Home Assistant.

## Extracted Text

On this page
Configuration
Getting your Identity Resolving Key (IRK)
On macOS
On Windows / For Android
On Windows - for any devices that will connect to a computer
ESPresense
Some BLE devices use a privacy feature called Resolvable Private Addresses to stop businesses from tracking you when you are out with your smart devices. Instead of having a single static address that can be used to track you, its Bluetooth address changes frequently. If you have Bluetooth enabled and functioning and know your device’s Identity Resolving Key, you can add it to Home Assistant as a Private BLE Device. We can then work out which random MAC addresses are related to the IRK and track those.
In addition to telling you if your device is home or away, it can also tell you an estimated distance to the nearest Bluetooth dongle or proxy and its signal strength.
To add the Private BLE Device device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Private BLE Device .
Follow the instructions on screen to complete the setup.
Your device must be on and broadcasting in range before adding it to Home Assistant - we check that it’s visible to validate that your IRK is correct.
There are two common representations for encoding an IRK - base64 encoding or hex encoding. This integration supports both.
If you are trying to get the IRK for your iPhone or Apple Watch, you must be logged in to the Mac with the same iCloud account on those devices. This procedure should also work for devices that you pair with macOS.
Start the Keychain Access application.
Depending on your macOS version, Keychain Access may look different. On macOS 26, select Local Items in the sidebar on the left. On older macOS versions, select iCloud in the sidebar.
In the search bar in the upper right, type Bluetooth.
A list of GUIDs is shown.
Click on the first record in the list. At the top, as part of the Account field, you should see Public: XX:XX:XX:XX:XX:XX (or Random - you can ignore records starting with random).
Scroll down through the records to find the MAC address that matches your iPhone/Watch (you can find this in Settings > General > About on your phone/watch).
Select Show password .
You will have to enter your password, then enter your username and password.
macOS will show some XML. You are looking for the Remote IRK field. After that, there is a data field that contains a base64 encoded version of your Identity Resolving Key.
If you have a rooted Android phone, the IRK (and LTKs) can be viewed in the file /data/misc/bluedroid/bt_config.conf . The LE_LOCAL_KEY_IRK specifies the Android device’s own IRK, and the first 16 bytes of LE_KEY_PID for every bonded device in the file indicate the bonded device’s IRK. Be aware that keys stored in this file are a little-endian, so the byte order of keys in this file will need to be reversed. For example, the little-endian IRK 22BC0E3F2EACF08EE36B865553EA0B4E needs to be changed to 4E0BEA5355866BE38EF0AC2E3F0EBC22.
Alternatively, the IRK of an Android phone and/or secondary device can be obtained using Wireshark:
In developer settings on the Android phone, enable the “USB Debugging” and “Enable Bluetooth HCI snoop log” options.
Ensure a second Bluetooth device (e.g., smartwatch or earbuds) is unpaired.
Disable and re-enable Bluetooth on the phone ,then re-pair the secondary device.
Connect the Android phone to a computer with adb installed.
Establish an adb connection ( adb connect... ), then run the command: adb bugreport scanwatch .
In the generated scanwatch.zip file, locate and extract FS\data\misc\bluetooth\logs\btsnoop_hci.log .
Open btsnoop_hci.log in Wireshark and search for btsmp.id_resolving_key .
Select one of the frames and expand the “Bluetooth Security Manager Protocol.” The hex dump will show either the sending or receiving device IRK.
Reverse the value displayed. For example, if it is 763af6c7f7d94ad6c262158e2320544e , the IRK to use would be: 4e5420238e1562c2d64ad9f7c7f63a76 .
Get the PsExec tool from Microsoft. It’s available in the Sysinternals Suite . Download and extract the PsExec.exe or PsExec64.exe .
Open Command Prompt as Administrator: Press the Windows key, type cmd , right-click on Command Prompt , and select Run as administrator .
Run PsExec: Navigate to the folder where PsExec is located and run psexec -i -s cmd or psexec64 -i -s cmd . This command will open a new command prompt window with SYSTEM rights.
Verify SYSTEM Rights: In the new command prompt window, type whoami to confirm that you have SYSTEM rights.
Open Registry Editor with SYSTEM Rights: In the new command prompt window, type regedit to open the Registry Editor with SYSTEM rights.
Locate the IRK: Navigate to HKLM\SYSTEM\CurrentControlSet\Services\BTHPORT\Parameters\Keys . There is one subfolder that probably holds the computer’s Bluetooth radio’s MAC address, look inside it for the folder corresponding to the MAC address of your Bluetooth device.
Right-click the key(folder) and select export. Save the .reg file somewhere.
Open the .reg file in Notepad. To open the Replace window, press Ctrl+H. Find what: “,” and Replace with “”. Select Replace All . This removes all commas from the hex value.
Copy the IRK value (only the part after hex: ) and it can be used as-is. No reversing of byte order needs to be done.
If you already use Identity Resolving Key tracking with ESPresence then you already have a hex-encoded version of your Identity Resolving Key. Home Assistant can use the key in this format directly.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Private BLE Device device was introduced in Home Assistant 2023.10, and it's used by
3590 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Jc2k
Categories
Device tracker
Back to top
