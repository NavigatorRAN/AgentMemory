# Apple iCloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/icloud
- Final URL: https://www.home-assistant.io/integrations/icloud
- Canonical URL: https://www.home-assistant.io/integrations/icloud/
- Fetched at: 2026-06-28T02:51:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use iCloud to track devices in Home Assistant.

## Extracted Text

On this page
Configuration
Two Factor Authentication
In case of troubleshooting
Platforms
Device tracker
Sensor
List of actions
The Apple iCloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence using the iCloud service. iCloud allows users to track their location on iOS devices.
There is currently support for the following platforms within Home Assistant:
It does require that your devices are registered with the Find My service.
To add the Apple iCloud hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Apple iCloud .
Follow the instructions on screen to complete the setup.
Warning
You may receive recurring emails and notifications from Apple stating that someone has logged into your account if the integration is improperly configured. If this occurs, select Don't Allow on your iOS device and reconfigure the Integration Credentials when prompted.
For the notification, press “Allow”, then “OK”.
To prevent excessive battery drainage, a dynamic interval is used for each individual device instead of a fixed interval for all devices linked to one account. The dynamic interval is based on the current zone of a device, the distance towards home and the battery level of the device.
Important
You need to use an app-specific password to set up this integration.
Delete the integration’s configuration (most likely in /config/.storage/icloud ), then retry.
The iCloud integration will track available devices on your iCloud account.
The iCloud integration will add a battery sensor for each iCloud devices available on your iCloud account.
The Apple iCloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Display message ( icloud.display_message )
Displays a message on an Apple device.
Lost device ( icloud.lost_device )
Puts an Apple device into Lost Mode.
Play sound ( icloud.play_sound )
Plays the Lost device sound on an Apple device.
Update ( icloud.update )
Requests a location and state update for the devices on an Apple Account.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Apple iCloud hub was introduced in Home Assistant 0.10, and it's used by
4422 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Quentame
@nzapponi
Categories
Presence detection
Back to top
