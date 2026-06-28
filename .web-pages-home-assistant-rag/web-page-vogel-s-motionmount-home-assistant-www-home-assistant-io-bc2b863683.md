---
source_url: "https://www.home-assistant.io/integrations/motionmount"
final_url: "https://www.home-assistant.io/integrations/motionmount"
canonical_url: "https://www.home-assistant.io/integrations/motionmount/"
source_handle: "web:www-home-assistant-io:bc2b86368329"
source_section: "integrations-motionmount"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b2e04009d079db4ce310ad6891d639e14096033647ffa27074830fe668ea0761"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Vogel's MotionMount - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/motionmount
- Final URL: https://www.home-assistant.io/integrations/motionmount
- Canonical URL: https://www.home-assistant.io/integrations/motionmount/
- Fetched at: 2026-06-28T03:01:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Vogel's MotionMount into Home Assistant.

## Extracted Text

On this page
Configuration
Removing the integration
To remove an integration instance from Home Assistant
Data updates
Known limitations
Supported devices
Unsupported devices
Supported functionality
Entities
Troubleshooting
Can’t connect to device
The Vogel’s MotionMount integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the position of your TVM 7675 Pro SIGNATURE MotionMount from Vogel’s.
This integration uses the Ethernet (IP) connection of your MotionMount. It’s not possible to connect using the RS-232 connection.
It provides information about the current position of the mount and allows setting a new position.
A use case would be to position the TV based on whether anyone is actively watching. The MotionMount provides an HDMI connection to monitor whether the TV is turned on and in response move it to a preset position or the last known position. However, if you also use the TV for background music, you probably don’t want the MotionMount to extend. By using a presence sensor to check whether anyone is actually in front of the TV, you can ensure the MotionMount only extends when the TV is actively being watched.
To add the Vogel’s MotionMount device to your Home Assistant instance, use this My button:
Vogel’s MotionMount can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Vogel’s MotionMount .
Follow the instructions on screen to complete the setup.
Host
Hostname or IP address of the device, for example: 192.168.1.2 .
Port
The TCP port of the device. Defaults to 23. Only change this when you’re absolutely certain that it shouldn’t be 23.
PIN
The user level pincode, if configured on the device.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
The MotionMount pushes new data to the integration.
The only exception is the presets. Changes to the presets are polled Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] , by default every 60 seconds.
The integration does not provide the ability to configure the MotionMount.
All settings, including configuring presets, should be done via the MotionMount app.
Only IP connections are supported. Connection via RS-232 or Bluetooth Low Energy is not supported.
The following devices are supported:
TVM 7675 Pro (SIGNATURE MotionMount with Pro extension)
The following devices are not supported:
TVM 7675 (SIGNATURE MotionMount without Pro extension)
TVM 7355 (NEXT MotionMount)
Sensors
Moving
Description : Indicates whether the MotionMount is moving.
Error Status
Description : The error status of the MotionMount.
None: There is no error.
Motor: There is a problem communicating with the motor.
HDMI CEC: There is a problem communicating with the TV. Check the HDMI cable.
Obstruction: The MotionMount detected an obstacle and stopped moving.
TV Width Constraint: The MotionMount detected that the TV moved too close to the wall and stopped moving.
Internal: There is an internal error. Refer to the MotionMount app for support.
Numbers
Extension
Description : The current extension of the MotionMount from the wall.
Turn
Description : The current rotation of the MotionMount.
Selects
Presets
Description : If the MotionMount is at a preset location, this shows the corresponding preset.
Any preset can be selected to move the MotionMount to this preset position.
Make sure the device is powered on.
Make sure the device is connected to the same network as Home Assistant.
Make sure the IP address of the MotionMount is configured correctly.
In case of doubt, perform a network reset by holding the reset button for approx. 5 seconds.
Result : The LED will start to blink slowly. This indicates that the network configuration is being reset to use DHCP.
Important : Don’t hold the reset button for too long (approx. 10 s). Holding the button for 10 s or longer starts a factory reset. A factory reset is indicated by the LED blinking fast.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Vogel's MotionMount device was introduced in Home Assistant 2024.1, and it's used by
5 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@laiho-vogels
Categories
Binary sensor
Number
Select
Sensor
Back to top
