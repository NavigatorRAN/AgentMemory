---
source_url: "https://www.home-assistant.io/integrations/opendisplay"
final_url: "https://www.home-assistant.io/integrations/opendisplay"
canonical_url: "https://www.home-assistant.io/integrations/opendisplay/"
source_handle: "web:www-home-assistant-io:60f2fed2fdad"
source_section: "integrations-opendisplay"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "08a65e3eb374ab47a7df6ed6bb5bb6cffd0e7147fca30d12cff6f6b7fd4d8f18"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# OpenDisplay - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/opendisplay
- Final URL: https://www.home-assistant.io/integrations/opendisplay
- Canonical URL: https://www.home-assistant.io/integrations/opendisplay/
- Fetched at: 2026-06-28T03:05:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate OpenDisplay e-paper displays into Home Assistant.

## Extracted Text

On this page
Supported devices
Unsupported devices
Prerequisites
Configuration
Encryption
Supported functionality
Sensors
Button events
List of actions
Examples
Uploading an image
Updating the display on a schedule
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The OpenDisplay integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you use OpenDisplay e-paper displays with Home Assistant over Bluetooth Low Energy.
Any device running the OpenDisplay firmware .
For a full list of supported boards and displays, see the OpenDisplay hardware compatibility page .
Displays with 40-pin or 60-pin connectors (for example, 10.3” monochrome panels) are not supported due to connector incompatibility.
Shelly Bluetooth proxies do not support active BLE connections and cannot be used to upload images.
A working Bluetooth setup that supports active connections:
Built-in adapter : Supported
ESPHome Bluetooth proxy : Supported (firmware 2022.9.3 or later)
Shelly Bluetooth proxy : Not supported
An OpenDisplay device powered on and within Bluetooth range.
To add the OpenDisplay device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OpenDisplay .
Follow the instructions on screen to complete the setup.
Once the Bluetooth integration is active, OpenDisplay devices are discovered automatically.
OpenDisplay devices can be configured to require AES-128 encryption for all Bluetooth Low Energy communication.
If your device has encryption enabled, the setup flow will ask for a 32-character hexadecimal encryption key after the initial connection attempt. The key is shown on the display when the device boots.
Tip
To avoid typing the key manually, scan the QR code on your device’s display. The encryption key is shown on the page that opens, tap it to copy it to your clipboard, then paste it into Home Assistant.
If the encryption key changes after the device has been set up, Home Assistant will prompt you to re-enter the key.
The OpenDisplay integration provides the following entities.
Temperature : Chip temperature
Battery Voltage : (Only if the device has a battery configured) Shows the current voltage of the attached battery
OpenDisplay Flex devices with configured physical inputs show up as event Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] in Home Assistant. One event Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is created for each physical button.
button_down : Fires when the button is pressed.
button_up : Fires when the button is released.
Note
Events are detected by comparing consecutive BLE advertisements, so no active Bluetooth connection is needed. A very fast press-and-release between two advertisements may not be observed.
Turn on a light when a button is pressed
triggers : - trigger : state entity_id : event.opendisplay_1234_button_1 attribute : event_type to : button_down actions : - action : light.turn_on target : entity_id : light.my_light
The OpenDisplay integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Upload image ( opendisplay.upload_image )
Uploads an image to an OpenDisplay device.
For an overview of every action across all integrations, see the actions reference .
Upload an image from local media
action : opendisplay.upload_image data : device_id : " your_device_id" image : media_content_id : " media-source://media_source/local/photo.png" media_content_type : " image/png"
You can use an automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] to refresh the display at a set time each day.
Update display daily at 8:00 AM
triggers : - trigger : time at : " 08:00:00" actions : - action : opendisplay.upload_image data : device_id : " your_device_id" image : media_content_id : " media-source://media_source/local/daily.png" media_content_type : " image/png"
BLE range is limited. Displays far from a Bluetooth adapter may experience unreliable transfers.
Starting a new upload while one is already in progress cancels the ongoing transfer.
Device is not discovered
Check that the Bluetooth integration is set up and working, then confirm your OpenDisplay device is powered on and in range of your Home Assistant host or a Bluetooth proxy.
Authentication failed
This means the encryption key stored in Home Assistant no longer matches the key configured on the device. Go to Settings > Devices & services > OpenDisplay and select Re-authenticate to enter the correct key.
Upload fails with a connection error
BLE connections can drop at longer ranges. Try moving the display closer to your Bluetooth adapter. If you are using an ESPHome proxy, check that it has a stable Wi-Fi connection.
Image appears rotated or upside down
The integration applies EXIF orientation automatically. If the result is still rotated, use the rotation parameter in the Upload image action to correct it manually.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenDisplay device was introduced in Home Assistant 2026.4, and it's used by
38 active installations.
Its IoT class is Local Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@g4bri3lDev
Categories
DIY
Event
Back to top
