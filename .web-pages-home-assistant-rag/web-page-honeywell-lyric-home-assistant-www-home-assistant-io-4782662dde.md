# Honeywell Lyric - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lyric
- Final URL: https://www.home-assistant.io/integrations/lyric
- Canonical URL: https://www.home-assistant.io/integrations/lyric/
- Fetched at: 2026-06-28T02:58:16Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate the Honeywell Lyric integration into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Selects
Sensors
The Honeywell Lyric integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates the Lyric thermostat platform into Home Assistant.
To set up this integration, you first must set up a developer account with Honeywell using the same email address as your Resideo account:
Go to the developer site and register with an account.
Next, create a new app via the My Apps section.
App Name: You can use any name here, but it must not contain special characters.
Callback URL: https://my.home-assistant.io/redirect/oauth
The app will be approved automatically. To view the Consumer Key and Consumer Secret values, select the name of the app. Copy the values, you will need them later.
I have manually disabled My Home Assistant
If you don’t have My Home Assistant on your installation,
you can use <HOME_ASSISTANT_URL>/auth/external/callback as the redirect URI
instead.
The <HOME_ASSISTANT_URL> must be the same as used during the configuration/
authentication process.
Internal examples: http://192.168.0.2:8123/auth/external/callback , http://homeassistant.local:8123/auth/external/callback .”
You can then add the integration in Home Assistant.
To add the Honeywell Lyric hub to your Home Assistant instance, use this My button:
Honeywell Lyric can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Honeywell Lyric .
Follow the instructions on screen to complete the setup.
The integration setup will ask for the Client ID and Client Secret . These correspond to the Consumer Key and Consumer Secret values from the app you created on the Honeywell developer site. See Application Credentials for more details.
Important
During setup, you will be redirected to Honeywell to sign in. Use your regular Resideo/Honeywell Home account here, not the developer account you created on the developer site. These are two separate accounts, even if they share the same email address.
Room priority
Description : Controls which room sensor the thermostat uses for its temperature reading.
Options : Follow me , and the name of each paired room sensor (such as “Bedroom” or “Office”).
Available for : T9 and T10 thermostats with at least one paired room sensor.
This integration provides the following sensors:
Name Description Indoor Temperature The reported temperature from the device Indoor Humidity The reported humidity from the device Outdoor Temperature Lyric’s outdoor temperature report Outdoor Humidity Lyric’s outdoor humidity Next Period Time The next time the thermostat will change Setpoint Status A description of the setpoint of the device
Additional sensors will be created for each room sensor accessory assigned to a thermostat device, if applicable:
Name Description Room Temperature The temperature reported from a room sensor accessory Room Humidity The humidity reported from a room accessory
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Honeywell Lyric hub was introduced in Home Assistant 2021.3, and it's used by
1264 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@timmo001
Categories
Climate
Select
Sensor
Back to top
