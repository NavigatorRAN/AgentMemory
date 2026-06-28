# Simplepush - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/simplepush
- Final URL: https://www.home-assistant.io/integrations/simplepush
- Canonical URL: https://www.home-assistant.io/integrations/simplepush/
- Fetched at: 2026-06-28T03:16:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Simplepush notifications to Home Assistant.

## Extracted Text

On this page
Configuration
Notifications
Examples
The Simplepush integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Simplepush to deliver notifications from Home Assistant to your Android and iOS device. Unlike similar apps the Simplepush app requires no registration and supports end-to-end encryption.
To add the Simplepush service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Simplepush .
Follow the instructions on screen to complete the setup.
To test if the service works, just send a message with curl from the command-line.
curl 'https://simplepu.sh/YOUR_SIMPLEPUSH_KEY/message'
If you enter your password and salt (as defined in the Simplepush app settings) during the configuration of this integration, all notifications sent from this integration will be end-to-end encrypted.
Simplepush can send a notification by calling the notify action .
You can specify the event under the data key.
Events can be used to customize the notification behavior.
It is also possible to specify attachments under the data key.
Attachments can be images, GIFs or video files that are accessible by a URL.
To use notifications, please see the getting started with automation page .
Send a notification with a title and event.
- action : notify.simplepush data : title : " This is the title" message : " This is the message" data : event : " event"
Send a notification with four attachments defined by their URL.
Attachments can be images, GIFs or video files.
- action : notify.simplepush data : message : " This is the message" data : attachments : - image : " https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg" - image : " https://upload.wikimedia.org/wikipedia/commons/d/d3/Newtons_cradle_animation_book_2.gif" - video : " http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" - video : " http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4" thumbnail : " http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Simplepush service was introduced in Home Assistant 0.29, and it's used by
94 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@engrbm87
Categories
Back to top
