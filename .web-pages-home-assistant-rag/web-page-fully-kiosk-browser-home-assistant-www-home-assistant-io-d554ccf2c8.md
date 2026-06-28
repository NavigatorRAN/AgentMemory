# Fully Kiosk Browser - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fully_kiosk
- Final URL: https://www.home-assistant.io/integrations/fully_kiosk
- Canonical URL: https://www.home-assistant.io/integrations/fully_kiosk/
- Fetched at: 2026-06-28T02:44:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Fully Kiosk Browser with Home Assistant

## Extracted Text

On this page
Requirements
Configuration
Capabilities
Actions
Removing the integration
To remove an integration instance from Home Assistant
Fully Kiosk Browser is a powerful kiosk browser for Android devices. It provides several features for monitoring and controlling your Android device. This integration gives you access to control your device and view the status in Home Assistant.
This integration requires the Fully Remote Admin feature to be enabled in the Fully Kiosk Browser app. This feature requires the paid Fully Plus license. You can test it out for free, but Fully Kiosk Browser will display a watermark on your device.
You will need the IP address of your device, and the Fully Remote Admin password you set in the Fully Kiosk Browser app.
To add the Fully Kiosk Browser device to your Home Assistant instance, use this My button:
Fully Kiosk Browser can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fully Kiosk Browser .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your device.
Password
The Fully Remote Admin password from the Fully Kiosk Browser app.
Uses an SSL certificate
Whether Fully Kiosk Browser is configured to use an SSL certificate for connections.
Verify SSL certificate
Whether to verify the SSL certificate when connecting to Fully Kiosk Browser. This should be off for self-signed certificates.
The following is available as sensors:
Device plugged in
Kiosk mode enabled/disabled
Battery level
Current page
Current foreground app
Device storage space available
Device RAM available
The following controls are available:
Bring Fully Kiosk to the foreground
Send Fully Kiosk to the background
Load the start URL
Restart the Fully Kiosk Browser app
Reboot your device (requires root)
Maintenance mode on/off
Lock/unlock kiosk mode
Motion detection on/off
Screensaver on/off
Screensaver timer
Screensaver brightness
Screen on/off
Screen off timer
Screen brightness
Play and stop media files
Set device volume
Clear Fully Kiosk Browser cache
The following is available as camera entity:
Camera (the camera only works in Fully Kiosk if the Motion detection is set to On ).
The following is available as image entity:
Screenshot
The following notify entities that can be passed to notify.send_message action are available:
Text-to-speech
Overlay message
Note
The Fully Kiosk Browser app does not provide feedback on the device volume or media playback status, so we are unable to display the current volume level or playback status.
Action load_url
You can use the fully_kiosk.load_url action to have the tablet open the specified URL.
Data attribute Optional Description device_id yes Device ID (or list of device IDs) to load the URL on. url yes The URL to load.
Example:
action : fully_kiosk.load_url data : url : " https://home-assistant.io" target : device_id : a674c90eca95eca91f6020415de07713
Action set_config
You can use the fully_kiosk.set_config action to change the many configuration parameters of Fully Kiosk Browser.
Data attribute Optional Description device_id no Device ID (or list of device IDs) to load the URL on. key no The configuration parameter key. The list of available keys can be found in the Fully Kiosk Browser remote admin panel by clicking the Show keys button. value no The value to set the configuration parameter to.
action : fully_kiosk.set_config data : key : " startURL" value : " https://home-assistant.io" target : device_id : a674c90eca95eca91f6020415de07713
Action start_application
You can use the fully_kiosk.start_application action to have the tablet launch the specified app.
Data attribute Optional Description device_id yes Device ID (or list of device IDs) to load the URL on. application yes The package name of the app to load.
action : fully_kiosk.start_application data : application : " de.ozerov.fully" target : device_id : a674c90eca95eca91f6020415de07713
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fully Kiosk Browser device was introduced in Home Assistant 2022.9, and it's used by
4.2% of the active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@cgarwood
Categories
Binary sensor
Camera
Notifications
Sensor
Switch
Back to top
