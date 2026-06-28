---
source_url: "https://www.home-assistant.io/integrations/pushbullet"
final_url: "https://www.home-assistant.io/integrations/pushbullet"
canonical_url: "https://www.home-assistant.io/integrations/pushbullet/"
source_handle: "web:www-home-assistant-io:cc4cf0e65032"
source_section: "integrations-pushbullet"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f645d08ca6e799a8e688881907214471eb6a5ff11204d8cf4488681240a0bb4d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Pushbullet - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pushbullet
- Final URL: https://www.home-assistant.io/integrations/pushbullet
- Canonical URL: https://www.home-assistant.io/integrations/pushbullet/
- Fetched at: 2026-06-28T03:10:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to read user pushes in Home Assistant

## Extracted Text

On this page
Prerequisites
Configuration
Sensors
Notifications
Usage
URL support
File support
File URL support
Single target
There is currently support for the following device types within Home Assistant:
Sensor
Note
The free tier is limited to 500 pushes per month.
Notification Mirroring allows users to see their Android device’s notifications on their computer. It must be first enabled in the app and is currently only available on the Android platform. For more information, please see this announcement on the Pushbullet Blog.
Go to https://www.pushbullet.com/#settings/account to retrieve your API key/access token.
To add the Pushbullet service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Pushbullet .
Follow the instructions on screen to complete the setup.
The following sensors are created after setting up the integration:
Application name: The application sending the push.
Body: The notification message body.
Notification ID: The ID of the notification.
Tag: The notification tag (if the application sending supports it).
Package name: The name of the sender’s package.
Receiver Email: The email of the push’s target.
Sender Email: The email of the sender.
Sender device ID: The ID of the sender’s device.
Title: The title of the push.
Type: The type of the push.
“Body” and “Title” are enabled by default. The rest can be enabled from the UI.
The Pushbullet notification platform sends messages to Pushbullet , a free service to send information between your phones, browsers, and friends. The free tier is limited to 500 pushes per month.
Pushbullet is a notify platform and thus can be controlled by calling the notify action as described here . It will send a notification to all devices registered in the Pushbullet account. An optional target parameter can be given to Pushbullet to specify specific account’s devices, contacts or channels.
Type Prefix Suffix Example Device device/ Device nickname device/iphone Channel channel/ Channel tag channel/my_home Email email/ Contact’s email address email/ [email protected] SMS sms/ Contact’s phone number sms/0612345678
If using targets, your own account’s email address functions as ‘send to all devices’. All targets are verified (if exists) before sending, except email.
Example action payload
message : A message for many people target : - device/telephone - email/ [email protected] - channel/my_home - sms/0612345678
To use notifications, please see the getting started with automation page .
actions : - action : notify.NOTIFIER_NAME data : title : " Send URL" message : " This is an url" data : url : " google.com"
url ( Required ): Page URL to send with Pushbullet.
actions : - action : notify.NOTIFIER_NAME data : title : " Send file" message : " This is a file" data : file : /path/to/my/file
file ( Required ): File to send with Pushbullet.
actions : - action : notify.NOTIFIER_NAME data : title : " Send file" message : " This is a file URL" data : file_url : https://cdn.pixabay.com/photo/2014/06/03/19/38/test-361512_960_720.jpg
file_url ( Required ): File to send with Pushbullet.
actions : - action : notify.NOTIFIER_NAME data : title : " Send to one device" message : " This only goes to one specific device" target : device/DEVICE_NAME
target : Pushbullet device to receive the notification.
Important
Don’t forget to allowlist external directories , so Home Assistant has access to them.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pushbullet service was introduced in Home Assistant 0.44, and it's used by
1016 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@engrbm87
Categories
Back to top
