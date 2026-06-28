# HTML5 Push Notifications - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/html5
- Final URL: https://www.home-assistant.io/integrations/html5
- Canonical URL: https://www.home-assistant.io/integrations/html5/
- Fetched at: 2026-06-28T02:50:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use the HTML5 push notifications platform from Home Assistant.

## Extracted Text

On this page
Supported platforms
Prerequisites
Configuration
Setting up your browser
Supported functionality
Notifiers
Events
List of actions
Automating notification events
Received event
Clicked event
Closed event
Enabling HTML5 Push Notifications behind an NGINX reverse proxy with authentication
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related links
The HTML5 Push Notifications integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you receive push notifications in supported browsers.
The following platforms are known to support web push notifications:
On desktop (Windows/macOS/Linux) and Android: Chrome/Chromium, Firefox, Edge, Brave, Opera, Vivaldi.
Since iOS / iPadOS 16.4, for installed web apps (PWAs).
In Brave on desktop, open brave://settings/privacy or go to Settings > Privacy and Security , and ensure that Use Google services for push messaging is enabled.
Your Home Assistant instance must be reachable from outside your local network over HTTPS, or you must be able to complete an alternative Domain Name Verification Method for the domain used by Home Assistant.
If using a reverse proxy, HTTP Basic Authentication must be temporarily disabled to allow registering or unregistering push notifications. It can be re-enabled afterwards.
Your Home Assistant setup must use a valid SSL/TLS certificate. This does not need to be configured directly in Home Assistant (for example, it can be handled by NGINX in front of Home Assistant). See Enabling HTML5 Push Notifications behind an NGINX reverse proxy with authentication .
You must accept the notification permission prompt in your browser.
To add the HTML5 Push Notifications service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select HTML5 Push Notifications .
Follow the instructions on screen to complete the setup.
Email
Email address used for contact information. This address is included in the metadata of every notification.
VAPID private key
Private key used for push notification authentication. If omitted, a key will be generated automatically.
Assuming you have already configured the platform:
Open the Home Assistant User profile page in a supported browser .
To open the page, select the User Profile link above or in Home Assistant, select your user account initials at the bottom of the sidebar.
Assuming you have met all the requirements above, you should see a Receive notifications toggle.
If the toggle is greyed out, make sure you are viewing Home Assistant via its external HTTPS address.
Also, make sure you have added the HTML5 Push Notifications integration to Home Assistant.
Turn on the toggle and name the device.
Within a few seconds, you should be prompted to allow notifications from Home Assistant.
Assuming you accept, that’s all there is to it!
Note: If you aren’t prompted for a device name when enabling notifications, open the html5_push_registrations.conf file in your configuration directory. You will see a new entry for the browser you just added. Rename it from unnamed device to a name of your choice, which will make it easier to identify later. Do not change anything else in this file! You need to restart Home Assistant after making any changes to the file.
The HTML5 Push Notifications integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will add a notify entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] for your configured device. To send a notification, you can use the Notify: Send message ( notify.send_message ) action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] . For more customizable notifications, you can use the HTML5 Push Notifications: Send message ( html5.send_message ) action instead. For further instructions on how to use HTML5 Push Notifications in automations, please see the getting started with automation page .
Action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called *sequence*. [Learn more] action: html5.send_message
data:
title: "Reminder"
message: "Have you considered frogs?"
target:
entity_id: notify.my_desktop
The HTML5 Push Notifications integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] creates an event entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] for each configured device. Home Assistant will update the event state whenever a notification is:
received : The notification arrives on the device.
clicked : The recipient interacts with the notification.
closed : The notification is dismissed without interaction.
Each event includes state attributes that provide additional context:
tag : The identifier of the notification.
action : The identifier of the action, if the recipient selected an action button in the notification.
Any extra data that was included in the payload of the notification.
The HTML5 Push Notifications integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Dismiss message ( html5.dismiss_message )
Dismiss a message.
Send message ( html5.send_message )
Send a notification message via web push. Optionally customize the notification with images, action buttons, and other settings.
For an overview of every action across all integrations, see the actions reference .
During the lifespan of a single push notification, Home Assistant will emit a few different events to the event bus which you can use to write automations against.
Common event payload parameters are:
Parameter Description action The action key that you set when sending the notification of the action clicked. Only appears in the clicked event. data The data dictionary you originally passed in the notify payload, minus any parameters that were added to the HTML5 notification ( actions , badge , body , dir , icon , image , lang , renotify , requireInteraction , tag , timestamp , vibrate , silent ). tag The unique identifier of the notification. Can be overridden when sending a notification to allow for replacing existing notifications. target The target that this notification callback describes. type The type of event callback received. Can be received , clicked or closed .
You can use the target parameter to write automations against a single target . For more granularity, use action and target together to write automations which will do specific things based on what target clicked an action.
You will receive an event named html5_notification.received when the
notification is received on the device.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "HTML5 push notification received and displayed on device"
triggers:
- trigger: event
event_type: html5_notification.received
You will receive an event named html5_notification.clicked when the notification or a notification action button is clicked. The action button clicked is available as action in the event_data .
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "HTML5 push notification clicked"
event_type: html5_notification.clicked
or
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "HTML5 push notification action button clicked"
event_data:
action: open_door
You will receive an event named html5_notification.closed when the notification is closed.
event_type: html5_notification.closed
If your Home Assistant instance is behind an NGINX reverse proxy with authentication enabled, device events may fail to reach Home Assistant. This happens because the authentication token used by the HTML5 Push Notifications integration may not pass through the proxy correctly.
To allow callback requests from devices, add the following location block to your NGINX configuration:
location /api/notify.html5/callback { if ( $http_authorization = "" ) { return 403 ; }
allow all ;
proxy_pass http://localhost:8123 ;
proxy_set_header Host $host ;
proxy_redirect http:// https:// ; }
This configuration allows requests to the callback endpoint to bypass htpasswd authentication, while still requiring the Authorization HTTP header to be present.
If callbacks still do not work, explicitly forward the Authorization header to Home Assistant by adding:
proxy_set_header Authorization $http_authorization ;
proxy_pass_header Authorization ;
The HTML5 Push Notifications integration sends notifications to target devices through push messaging services, while events from devices are pushed directly to your Home Assistant instance.
Supported features can vary depending on the browser and platform you are using. Refer to the MDN Notifications API documentation for a detailed overview of compatibility across environments.
The HTML5 Push Notifications integration relies on an active internet connection for sending notifications and receiving events. If you encounter issues, verify that your network connection is stable and your Home Assistant instance is reachable from the internet.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ). If you have collected the debug log, provide it with the issue report.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
MDN Notifications API documentation
Domain name verification
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The HTML5 Push Notifications service was introduced in Home Assistant 0.27, and it's used by
1.1% of the active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@alexyao2015
@tr4nt0r
Categories
Event
Notifications
Back to top
