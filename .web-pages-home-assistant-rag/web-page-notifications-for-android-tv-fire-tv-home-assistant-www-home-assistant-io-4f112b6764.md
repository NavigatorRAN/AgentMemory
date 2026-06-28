# Notifications for Android TV / Fire TV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nfandroidtv
- Final URL: https://www.home-assistant.io/integrations/nfandroidtv
- Canonical URL: https://www.home-assistant.io/integrations/nfandroidtv/
- Fetched at: 2026-06-28T03:03:10Z
- Content type: text/html; charset=UTF-8

## Description

Notifications for Android TV / Fire TV

## Extracted Text

On this page
Configuration
Actions
Action: Notify
Action data for sending images and icons
Notification integration for Notifications for Android TV and Notifications for Fire TV . You can use this integration to send notifications to your Android TV device. An overlay with the message content will appear for a configurable amount of seconds and then disappear again. Sending images (e.g., security cam) and custom icons is supported too. Icons are essentially the same as images (any image format supported by Android TV is supported), but are displayed small and to the left of the notification whereas images are large and above the notification.
The notifications are in the global scope of your Android TV device. They will be displayed regardless of which application is running.
When setting this up be aware, that there are two apps: one for your smartphone to send notifications (not required for this platform) and one for your Android TV device to receive the notifications. The app available in the store of your Android TV device is the one that is needed to display notifications sent from Home Assistant. The In-App purchases only apply to the client for Android smartphones, so there isn’t any limit when pushing notifications from Home Assistant.
To add the Notifications for Android TV / Fire TV service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Notifications for Android TV / Fire TV .
Follow the instructions on screen to complete the setup.
The notify.[name_of_your_tv] action sends a notification to your Android TV. The following options can be specified inside the data field for the notify action:
Configuration Variables
Looking for your configuration file?
duration integer
The duration in seconds for which the notification will be displayed.
fontsize string
Has to be one of: small , medium , large or max .
position string
Has to be one of: bottom-right , bottom-left , top-right , top-left or center .
color string
Has to be one of: grey , black , indigo , green , red , cyan , teal , amber or pink .
transparency string
Has to be one of: 0% , 25% , 50% , 75% or 100% .
timeout integer
The timeout in seconds for trying to send the notification to the device.
interrupt boolean
If set to true, 1, on etc., the notification is interactive and can be dismissed or selected to display more details. Depending on the running app (e.g., Netflix), this may stop playback.
This is a fully customized YAML you can use inside data to test how the final notification will look like (for using this inside an action look at the example at the end of this page):
fontsize : " large" position : " center" duration : 2 transparency : " 0%" color : " red" interrupt : 1
Data attribute Optional Description image yes Groups the attributes for image upload. It can take a url or path . It is optional unless you use authentication options. Then, either url or path has to be provided. icon yes Groups the attributes for icon upload. It can take a url or path . It is optional unless you use authentication options. Then, either url or path has to be provided. path yes Local path of an image file. Is placed inside image , icon , or both. url yes URL of an image file. Is placed inside image , icon or both. username yes Username if the URL requires authentication. Is placed inside image , icon or both`. password yes Password if the URL requires authentication. Is placed inside image , icon or both. auth yes If set to digest HTTP-Digest-Authentication is used. If missing, HTTP-BASIC-Authentication is used and is placed inside image , icon or both.
Example action data for both image and icons:
# If your urls do not require extra authentication icon : " http://[url to image file]" image : " http://[url to image file]" # Paths in most cases icon : " /you/path/location" image : " /you/path/location" # Or alternatively icon : path : " /you/path/location" image : path : " /you/path/location" # If your urls require extra authentication image : url : " http://[url to image file]" username : " optional user, if necessary" # Optional password : " optional password, if necessary" # Optional auth : " digest" # Optional icon : url : " http://[url to image file]" username : " optional user, if necessary" # Optional password : " optional password, if necessary" # Optional auth : " digest" # Optional
Example of an automation with an action, full configuration:
action : notify.living_room_tv data : title : " Thanks for the water!" message : " Nigel is {{ states('sensor.nigel_moisture') }}% moisture" data : duration : 4 position : " bottom-left" fontsize : " medium" transparency : " 75%" color : " teal" interrupt : 0
path is validated against the allowlist_external_dirs in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Notifications for Android TV / Fire TV service was introduced in Home Assistant 0.32, and it's used by
4412 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Notifications
Back to top
