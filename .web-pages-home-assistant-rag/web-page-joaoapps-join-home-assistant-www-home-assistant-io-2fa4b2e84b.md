# Joaoapps Join - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/joaoapps_join
- Final URL: https://www.home-assistant.io/integrations/joaoapps_join
- Canonical URL: https://www.home-assistant.io/integrations/joaoapps_join/
- Fetched at: 2026-06-28T02:53:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for how to integrate the Join by Joaoapps service within Home Assistant.

## Extracted Text

On this page
Related topics
The Joaoapps Join integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] exposes actions from
Join . In Home Assistant, the Joaoapps Join features are
divided up in two locations, the Join integration, and the Joaoapps Join notify platform.
The notify platform allows us to send messages to Joaoapps Join devices, the integration
allows us to access the other special features that Joaoapps Join offers. When in doubt, you can reference the API documentation this is based on.
In the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file you need to provide the API key and device id
or name of the target device. You can find your device id and API key
here .
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - platform : joaoapps_join api_key : YOUR_API_KEY device_id : DEVICE_ID device_ids : DEVICE_ID_1,DEVICE_ID_2 device_names : DEVICE_1_NAME,DEVICE_2_NAME name : NAME joaoapps_join : - name : NAME_OF_GROUP device_id : GROUP.GROUP_NAME api_key : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
api_key string Required
The API key for Join.
device_id string ( Optional )
The id of your device or group
device_ids string ( Optional )
Comma separated list of device ids or groups.
device_names string ( Optional )
Comma separated list of device names.
name string ( Optional )
The name parameter is optional but needed if you want to use multiple notification platforms. The platform will be exposed as notify.<name> action. The name will default to notify if not supplied. See the Notifications integration for more details.
Use only one of device_id , device_ids , or device_names , this will determine the notification recipient(s).
# Example configuration.yaml entry notify : - platform : joaoapps_join api_key : YOUR_API_KEY device_id : DEVICE_ID1 name : NAME1 - platform : joaoapps_join api_key : YOUR_API_KEY device_id : DEVICE_ID2 name : NAME2
The notify action has several optional parameters: icon , smallicon , image , sound , url , notification_id , category , tts , tts_language and vibration .
You can use them like so:
message : Hello from Home Assistant! title : Home Assistant data : icon : https://goo.gl/xeetdy smallicon : https://goo.gl/xeetdy vibration : 0,65,706,86,657,95,668,100 image : https://www.home-assistant.io/images/favicon-192x192-full.png sound : https://goo.gl/asasde.mp3 url : https://home-assistant.io notification_id : hass-notification category : Custom Notification Category tts : Notification from Home Assistant tts_language : english actions : Netflix : Tweet : - Tweet from HASS! Sleep :
The actions exposed in the joaoapps_join integration can be used with the
action data described below:
Action Data joaoapps_join/ring joaoapps_join/send_sms {"number":"5553334444", "message":"Hello!"} joaoapps_join/send_tasker {"command":"test"} joaoapps_join/send_url {"url":"http://google.com"} joaoapps_join/send_wallpaper {"url":"http://www.planwallpaper.com/static/images/ZhGEqAP.jpg"} joaoapps_join/send_file {"url":"http://download.thinkbroadband.com/5MB.zip"}
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Joaoapps Join integration was introduced in Home Assistant 0.24, and it's used by
138 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Notifications
Back to top
