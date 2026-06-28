# GPSLogger - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/gpslogger
- Final URL: https://www.home-assistant.io/integrations/gpslogger
- Canonical URL: https://www.home-assistant.io/integrations/gpslogger/
- Fetched at: 2026-06-28T02:47:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use GPSLogger to track devices in Home Assistant.

## Extracted Text

On this page
Configuration
Setup on your smartphone
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] sets up integration with GPSLogger . GPSLogger is an open source app for Android that allows users to update your location in Home Assistant.
To configure GPSLogger, you must set it up via the integrations panel in the configuration screen. This will give you the webhook URL to use during mobile device configuration (below).
Install GPSLogger for Android from GitHub or F-Droid on your device.
After the launch, go to General Options . Enable Start on bootup and Start on app launch .
GPSLogger Settings
Go to Logging details and disable Log to GPX . Enable Log to custom URL .
Logging Details
Right after enabling, the app will take you to the Log to custom URL settings.
Log to custom URL details
The relevant endpoint starts with: /api/webhook/ and ends with a unique sequence of characters. This is provided by the integrations panel in the configuration screen (configured above).
https://YOUR.DNS.HOSTNAME:PORT/api/webhook/WEBHOOK_ID
Add the above URL (updating YOUR.DNS.HOSTNAME:PORT to your details) into the URL field.
It’s HIGHLY recommended to use SSL/TLS.
Use the domain that Home Assistant is available on the internet (or the public IP address if you have a static IP address). This can be a local IP address if you are using an always on VPN from your mobile device to your home network.
Only remove PORT if your Home Assistant instance is using port 443. Otherwise set it to the port you’re using.
Add the following to HTTP Body :
latitude=%LAT&longitude=%LON&device=%SER&accuracy=%ACC
You can change the device identifier by replacing device=%SER with device=my_phone . Otherwise, your phone’s serial number is used.
Tip
You can append optional parameters to the HTTP body if GPSLogger provides them. Add only the parameters your device actually reports:
&battery=%BATT
&speed=%SPD
&direction=%DIR
&altitude=%ALT
&provider=%PROV
&activity=%ACT
If GPSLogger sends an empty value for a numeric parameter, like battery , speed , direction , or altitude , the webhook returns a 422 error.
Check that the HTTP Headers setting contains
Content-Type: application/x-www-form-urlencoded
Make sure that HTTP Method is changed to POST
If your battery drains too fast then you can tune the performance of GPSLogger under Performance .
Performance
A request can be forced from the app to test if everything is working fine.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GPSLogger integration was introduced in Home Assistant 0.34, and it's used by
807 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
