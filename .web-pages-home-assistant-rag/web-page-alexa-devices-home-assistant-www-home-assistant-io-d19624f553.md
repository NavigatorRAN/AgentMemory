# Alexa Devices - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/alexa_devices
- Final URL: https://www.home-assistant.io/integrations/alexa_devices
- Canonical URL: https://www.home-assistant.io/integrations/alexa_devices/
- Fetched at: 2026-06-28T02:27:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Alexa Devices into Home Assistant.

## Extracted Text

On this page
Supported devices
Configuration
List of actions
Notifications
Sensors
Alarm, timer, and reminder sensors
Environmental and device sensors
Supported functionality
Examples
Send announcement when you arrive home
Using advanced markup in a notification
Data updates
Known limitations
Troubleshooting
Unable to set up
Sensors unavailable
Removing the integration
To remove an integration instance from Home Assistant
The Alexa Devices integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control Alexa-enabled devices connected to your Amazon account.
The integration provides information on connected devices and enables control of the main features.
There is support for the following device families within Home Assistant:
Amazon Echo Auto
Amazon Echo Dot
Amazon Echo Flex
Amazon Echo Plus
Amazon Echo Show
Amazon Fire TV Stick
Amazon Fire Tablet
Amazon Air Quality Monitor
Third-party devices with built-in Alexa capabilities.
Warning
This integration requires multi-factor authentication using an authentication app (such as Microsoft Authenticator, for example). To enable MFA, in your Amazon account settings select Login & Security > 2-step verification > Backup methods > Add new app . See Amazon’s documentation for more information.
You must ensure the authenticator app is set up as your preferred method for 2FA.
To add the Alexa Devices hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Alexa Devices .
Follow the instructions on screen to complete the setup.
username
The email address of your Amazon account.
password
The password of your Amazon account.
otp
One-time password via Authenticator App.
The Alexa Devices integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Send info skill command ( alexa_devices.send_info_skill )
Runs a built-in Alexa info skill, such as the date, weather, or a joke.
Send sound ( alexa_devices.send_sound )
Plays one of the built-in Alexa sounds on a device.
Send text command ( alexa_devices.send_text_command )
Sends a text command to an Alexa device as if you had spoken it.
For an overview of every action across all integrations, see the actions reference .
This integration creates Speak and Announce notify entities for devices that support them. To make a device say something, use the generic notify.send_message action and target one of these entities.
The Speak entity reads your message out loud on the device. The Announce entity plays the Alexa notification chime first and then reads your message.
To send a message, target one of these notify entities and set the Message field to the text you want the device to say.
Tip
When sending notifications to multiple devices, you may experience delays due to rate limiting by Amazon. You can avoid this by sending notifications to speaker groups created in Alexa.
Advanced message markup
Amazon provide markup to control not only what is said but how it is said and to add additional option such as pausing and playing certain audio clips. Details of this are covered in Amazon’s documentation where there are lots of examples (just pass everything between the <speak> and </speak> elements into the message parameter of the action).
Audio files must meet certain criteria on size, bit and sample rates and must be served over HTTPS (see documentation for full details). These restrictions make them fine for text and sound effects but you will not be able to play music this way.
Amazon provide a set of sounds you can use which contains the markup you will need for that clip.
The integration creates sensor entities when the connected device exposes that information. Not every device supports every sensor.
All Alexa-enabled devices have timestamp sensors that show the next scheduled alarm, timer, and reminder along with their labels.
Temperature
Illuminance
Wi-Fi and Bluetooth connectivity
Air Quality Monitor sensors
Particulate Matter - 10 μm & 2.5 μm
Carbon Monoxide
Volatile Organic Compounds Index
Air Quality Index
In addition to sensors, you can use the following entities:
Button - Execute Alexa routines
Media Player - Play audio/video from several sources
Notify - Speak and Announce notifications
Select - Select default device
Switch - Do not disturb
automation : - alias : " Alexa Announce" id : " alexa_announce" triggers : - trigger : state entity_id : person.simone to : " home" actions : - action : notify.send_message data : message : Welcome home Simone target : entity_id : notify.echo_dot_living_room_announce
action : notify.send_message data : message : > Hello, lets have some examples. <amazon:emotion name="excited" intensity="medium"> This is me being mildly excited! </amazon:emotion> The farmer's dog was called <say-as interpret-as='spell-out'>bingo</say-as>. <prosody pitch='high'> I can sing high </prosody> <prosody pitch='low'> and I can sing low </prosody> target : entity_id : notify.study_dot_speak
action : notify.send_message data : message : > Stop! <break time='3s'/> Hammer Time. Watch out <audio src="soundbank://soundlibrary/scifi/amzn_sfx_scifi_laser_gun_battle_01"/> Shields up! <audio src="soundbank://soundlibrary/scifi/amzn_sfx_scifi_shields_up_01" /> <amazon:effect name="whispered"> <prosody rate="x-slow"><prosody volume="loud">Enough now</prosody></prosody> </amazon:effect> target : entity_id : notify.study_dot_speak
This integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the device every five minutes by default.
This integration requires multi-factor authentication using an authentication app (such as Microsoft Authenticator). To enable MFA, in your Amazon account settings, select Login & Security > 2-step verification > Backup methods > Add new app . See Amazon’s documentation for more information.
Reminders may not be added to the sensor if the configured account is linked to an Alexa Household.
Amazon Japan appears to use a different login mechanism to other locations preventing setup of the integration. This should be resolved in a future release.
Symptom: “CannotAuthenticate” Description
You will see MFA OTP code not found on login page or Cannot find "auth-mfa-otpcode" in html source in the logs when trying to set up the integration. This is because the authentication details are incorrect.
You need to ensure you are:
using the right credentials (The ones you would use to log in to the Alexa app and Amazon shopping site)
set up to use app based 2FA
not set up to receive SMS 2FA codes
To test this you should log in to your local Amazon shopping site in incognito/private mode in your browser and check you are prompted for the OTP code from your authenticator app, and you can log in successfully.
Symptom: “Too many requests”
You see something similar to
Error retrieving devices state: Too many requests for path ['listEndpoints']
Error retrieving data: CannotRetrieveData('Request failed: Bad Request')
Failed to obtain notification data. Timers and alarms have not been updated
In logs.
Description
This happens because of rate limits applied by Amazon. We are working to reduce these errors. If these errors are causing you issues, you can disable polling for the integration. Disabling polling will stop these errors, but it will also stop DND, sensors, and connectivity from being updated. However, speech, announcements, and text commands will continue to work.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Alexa Devices hub was introduced in Home Assistant 2025.6, and it's used by
4.6% of the active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@chemelli74
Categories
Binary Sensor
Button
Media Player
Select
Sensor
Switch
Back to top
