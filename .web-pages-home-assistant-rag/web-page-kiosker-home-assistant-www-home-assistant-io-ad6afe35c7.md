# Kiosker - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/kiosker
- Final URL: https://www.home-assistant.io/integrations/kiosker
- Canonical URL: https://www.home-assistant.io/integrations/kiosker/
- Fetched at: 2026-06-28T02:54:34Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Kiosker with Home Assistant

## Extracted Text

On this page
Requirements
Supported devices
Configuration
Capabilities
Supported functionality
Sensors
Binary sensors
Switches
Buttons
Data updates
Troubleshooting
Can’t set up the device
Device went unavailable
Removing the integration
To remove an integration instance from Home Assistant
Kiosker is a powerful yet easy-to-use web kiosk for iPad and iPhone. This integration gives you control over your Kiosker app via the Kiosker API.
This integration requires that you have bought Kiosker Pro or have a valid Kiosker subscription. You can try Kiosker, including this integration, free for 7 days.
You need to enable the API server in Kiosker settings. You also need to generate an access token, and find the IP address of the device. Please refer to the Kiosker documentation for further information on how to configure the Kiosker App.
You need to run version 26.4.1 or later for this integration to be fully functional.
To add the Kiosker device to your Home Assistant instance, use this My button:
Kiosker can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Kiosker .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of the device.
API Token
The generated API token from the Kiosker App.
Use SSL
Connect to the Kiosker App using HTTPS. The Kiosker API has to be configured for SSL.
Verify certificate
Verify SSL certificate. Enable for valid certificates only.
Note
Due to Apple’s restrictive approach to device control, it’s not possible to control any physical features like the screen or device sleep through this integration.
This integration exposes all Kiosker API functionality to Home Assistant.
The Kiosker integration provides the following entities.
Battery level
Shows the current battery percentage of your device.
Last interaction
Shows when your device was last interacted with.
Last motion
Shows when motion was last detected. This is available if a screensaver with motion detection is scheduled or if the camera sensor is enabled.
Ambient light
Shows the current ambient light level. This is available if a screensaver with motion detection is scheduled or if the camera sensor is enabled.
Charging state
Shows whether the device is connected to a charger.
Screensaver state
Shows whether the screensaver is currently active.
Blackout state
Shows whether the screen is currently blacked out. Has extra attributes with the blackout data when active.
Disable screensaver
Disables the currently active screensaver.
Ping
Sends a ping to the device to verify it is reachable. A logbook entry is
created when the device responds.
Refresh page
Reloads the current page displayed on the device.
Go home
Navigates the device to its configured home URL.
Go forward
Navigates forward in the browser history.
Go back
Navigates backward in the browser history.
Print page
Triggers a print of the current page.
Clear cache
Clears the browser cache on the device.
Clear cookies
Clears all cookies on the device.
Dismiss screensaver
Dismisses the currently active screensaver.
This integration fetches data from the device every 15 seconds.
Symptom
When trying to set up the integration, the form shows an error message.
Description
This means that Home Assistant can’t connect to the Kiosker App.
Resolution
Make sure that Kiosker is running in the foreground.
Make sure that the API is enabled in the settings.
Make sure that you have generated an API token.
Make sure that the host or IP is correct.
If you have enabled IP-filtering, make sure that your host IP is in the whitelist.
If you have enabled TLS, make sure that you have installed a valid certificate in the Kiosker App, typically a self-signed certificate.
If you have enabled Verify certificate , make sure that the certificate is valid and that the root certificate is marked as trusted on the host.
The device and entities are greyed out.
Make sure that you have generated an API token and has not changed it.
Make sure that the host or IP is correct and that it has not changed.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Kiosker device was introduced in Home Assistant 2026.5, and it's used by
18 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Claeysson
Categories
Binary sensor
Button
Sensor
Switch
Back to top
