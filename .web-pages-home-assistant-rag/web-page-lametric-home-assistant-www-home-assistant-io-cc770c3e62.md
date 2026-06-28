---
source_url: "https://www.home-assistant.io/integrations/lametric"
final_url: "https://www.home-assistant.io/integrations/lametric"
canonical_url: "https://www.home-assistant.io/integrations/lametric/"
source_handle: "web:www-home-assistant-io:cc770c3e625c"
source_section: "integrations-lametric"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ef9f0c807b2f3b19f69c996a33c37a6c06e3b30ffd89e19996d40a35b4ceda23"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# LaMetric - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lametric
- Final URL: https://www.home-assistant.io/integrations/lametric
- Canonical URL: https://www.home-assistant.io/integrations/lametric/
- Fetched at: 2026-06-28T02:55:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate LaMetric TIME with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Buttons
Numbers
Selects
Sensors
Switches
Update
List of actions
Notifications
Data updates
Examples
Notify on arrival
Doorbell notification with sound
Notification sounds
Known limitations
Troubleshooting
The brightness does not go to 100%
Cannot connect during manual setup
Use your own LaMetric application credentials
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The LaMetric integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you integrate your LaMetric TIME smart clock with Home Assistant, so you can display notifications, charts, and other visual updates on the device.
Use cases for this integration include:
Sending notifications to the clock when events happen in your home, such as a doorbell ring, a delivery arrival, or a washing machine finishing.
Displaying a chart of recent energy usage, temperature, or any other numeric value from your home.
Controlling the device’s brightness, volume, and Bluetooth state from automations.
Cycling through the clock’s apps or dismissing notifications without touching the device.
The following LaMetric devices are known to be supported:
LaMetric TIME
Your LaMetric device must be powered on and connected to the same local network as Home Assistant. In most cases, the device is discovered automatically.
To add the LaMetric device to your Home Assistant instance, use this My button:
LaMetric can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LaMetric .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your LaMetric device. Only required when adding the device manually.
API key
The device API key, which you can find in the LaMetric developer portal. Only required when adding the device manually.
During setup, you can choose between two methods:
Automatic : Sign in with your LaMetric account to let Home Assistant fetch your devices and their credentials for you.
Manual : Enter the device’s hostname or IP address and API key. This method does not require a LaMetric account.
Next app
Description : Switch to the next app displayed on the LaMetric device.
Entity category : Configuration
Previous app
Description : Switch to the previous app displayed on the LaMetric device.
Dismiss current notification
Description : Dismiss the currently shown notification.
Dismiss all notifications
Description : Dismiss all queued notifications.
Brightness
Description : Control the brightness of the display in percent.
Volume
Description : Control the volume of the device in percent.
Brightness mode
Description : Choose whether the brightness is set manually or automatically based on ambient light.
Wi-Fi signal
Description : The current Wi-Fi signal strength in percent.
Entity category : Diagnostic
Bluetooth
Description : Toggle the device’s Bluetooth radio on or off.
The integration provides an update entity that shows whether a firmware update is available for your LaMetric device.
The LaMetric integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Display a chart ( lametric.chart )
Display a chart on a LaMetric device from a list of numeric data points.
Display a message ( lametric.message )
Display a message, with an optional icon, on a LaMetric device.
For an overview of every action across all integrations, see the actions reference .
You can send notifications to your LaMetric device using the Notifications integration.
Each LaMetric device added to Home Assistant has its own notify. action. The action name matches the name of your device as shown in your LaMetric account. For example, if you have a device called “My LaMetric”, the action becomes notify.my_lametric .
The notification action against a LaMetric device accepts the following additional optional parameters:
Configuration Variables
Looking for your configuration file?
icon string ( Optional )
The ID of an icon or animation. The full list of icons and their IDs is in the LaMetric icon gallery .
cycles integer ( Optional , default: 1 )
How many times the notification is displayed. Set to 0 to keep it on screen until it is dismissed.
priority string ( Optional , default: info )
Defines the priority of the notification. Allowed values are info , warning , and critical .
icon_type string ( Optional , default: none )
Defines the nature of the notification. Allowed values are none , info , and alert .
sound string ( Optional , default: none )
The sound to play with the notification. For the list of supported sounds, see Notification sounds .
The integration polls the LaMetric device every 30 seconds over the local network for the latest state.
Send a notification to the LaMetric device when someone arrives at school, with a custom sound, icon, and priority:
alias : " Send notification on arrival at school" triggers : - trigger : state entity_id : device_tracker.tom_mobile from : " not_home" to : " school" actions : - action : notify.my_lametric data : message : " Tom has arrived at school!" data : sound : " notification" icon : " 51" cycles : 0 priority : " critical" icon_type : " info"
Play a sound and show a message on the LaMetric device when the doorbell is pressed:
alias : " Doorbell notification" triggers : - trigger : state entity_id : binary_sensor.doorbell to : " on" actions : - action : notify.my_lametric data : message : " Ding dong!" data : sound : " knock-knock" icon : " a13710" priority : critical icon_type : alert
The following notification sounds can be used with the sound parameter on the notify and action calls:
alarm1
alarm2
alarm3
alarm4
alarm5
alarm6
alarm7
alarm8
alarm9
alarm10
alarm11
alarm12
alarm13
bicycle
car
cash
cat
dog
dog2
energy
knock-knock
letter_email
lose1
lose2
negative1
negative2
negative3
negative4
negative5
notification
notification2
notification3
notification4
open_door
positive1
positive2
positive3
positive4
positive5
positive6
statistic
thunder
water1
water2
win
win2
wind
wind_short
The integration communicates with the LaMetric device over the local network. If the device is not reachable, its entities become unavailable.
When the LaMetric device is powered through a USB port on a computer, the display brightness is limited. For full brightness, use a proper USB charger.
The list of supported sounds is fixed by the device firmware. Adding custom sounds is not possible.
When the LaMetric is powered through a USB port on a computer, the brightness is limited. To get the full brightness, use a proper USB charger.
If you see a “Cannot connect” error when adding the device manually, verify that:
The device is powered on and connected to your network.
The hostname or IP address you entered is correct.
The API key matches the one shown in the LaMetric developer portal.
If you prefer not to use the Home Assistant account linking service, you can set up the LaMetric application manually.
However, at this point, it is easier to choose the Enter manually option during the integration setup. This avoids the use of the account linking service and does not require any of the steps below.
If you still want to set up your own LaMetric application for importing your LaMetric devices, use the following steps:
Sign in with your LaMetric account at developer.lametric.com .
Select Create and choose Notification app.
Fill in the form. You can put almost anything in the fields, they just need to be populated:
App Name : Home Assistant
Description : Home Assistant
Redirect URI : https://my.home-assistant.io/redirect/oauth
Privacy Policy : http://localhost/
Check the basic and read_devices permission boxes.
Select Save .
You will be directed to your Notification Apps list . Select Home Assistant and copy your Client ID and Client Secret.
You can then add the credentials to Application Credentials and set up the integration.
I have manually disabled My Home Assistant
If you don’t have My Home Assistant on your installation, you can use <HOME_ASSISTANT_URL>/auth/external/callback as the redirect URI instead.
The <HOME_ASSISTANT_URL> must be the same as used during the configuration and authentication process.
Internal examples: http://192.168.0.2:8123/auth/external/callback , http://homeassistant.local:8123/auth/external/callback .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Debug logs and diagnostics
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LaMetric device was introduced in Home Assistant 0.49, and it's used by
1072 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@robbiet480
@frenck
@bachya
Categories
Button
Number
Select
Sensor
Switch
Back to top
