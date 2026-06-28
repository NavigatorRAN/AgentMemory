# Bring! - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bring
- Final URL: https://www.home-assistant.io/integrations/bring
- Canonical URL: https://www.home-assistant.io/integrations/bring/
- Fetched at: 2026-06-28T02:32:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Bring! todo list with Home Assistant.

## Extracted Text

On this page
About Bring!
How you can use this integration
Prerequisites
Configuration
Configuration parameters
Sensors
Events
List of actions
Automations
Grocery shopping reminder 🛒
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related topics
Related links
The Bring! integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to sync your Bring! shopping lists with Home Assistant.
Bring! is a grocery shopping list app that allows users to create shared lists and organize grocery shopping with family, partners, or roommates.
Available as a mobile app on Google Play for Android and the App Store for iOS . Bring! also offers a web version at web.getbring.com .
Automated notifications : Receive alerts on your phone when essential items are added to your list or when the quantity of items reaches a set value.
List updates based on events : Automatically add items to your shopping list when appliances are low on supplies, like dishwasher salt, or need routine maintenance, such as tub cleaner for the washer.
Voice control : Add items to your Bring! shopping list using Assist , Home Assistant’s voice assistant.
Geofencing : Receive reminders when you are near a specific store and need to pick up items, based on your location.
For authentication, the integration requires the email and password of your Bring! account. If you don’t have an account, you can sign up via the mobile app or the web version.
If you signed up using Apple ID , Google Sign-in , or Facebook Login , you will need to create a password to use the integration.
On mobile: Open the Bring! app and go to Profile > More settings > Change password .
On the web: Visit Settings > Reset password or go directly to Reset Password .
You can still log in with your existing authentication method afterward.
To add the Bring! service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Bring! .
Follow the instructions on screen to complete the setup.
Email
The email address associated with your Bring! account.
Password
The password to log in to your Bring! account.
Urgent : Shows the number of items tagged with the Urgent badge on the shopping list. Completed items are excluded.
On occasion : Displays the count of items marked with the If convenient badge.
Discount only : Indicates the number of items tagged with the Offer badge.
Region & Language : The sensor can be used for diagnostics. If everything is set correctly, it will display the selected region for the shopping list. If it shows Unknown , the region has not been set properly in the Bring! app.
List access : Indicates whether the shopping list is personal (private) or shared (accessible to others).
Activities: The event entity displays the most recent activity on a Bring! shopping list, including the activity type and the profile picture of the user who performed it. There are three types of activities: Items added (when a user adds items to the list), Items removed (when a user removes items), and Items changed (when a user modifies item details or quantity). The event attributes provide additional details, including the list of added, removed, or modified items, the user’s name, and the exact time of the activity.
The Bring! integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Send message ( bring.send_message )
Sends a push notification to members of a shared Bring! list.
Send reaction ( bring.send_reaction )
Sends an emoji reaction to a recent activity on a Bring! list.
For an overview of every action across all integrations, see the actions reference .
Get started with these automation examples for Bring! , each featuring ready-to-use blueprints!
Get notified when it’s time to go grocery shopping. A notification is sent when your shopping list reaches a set threshold or when urgent items are added.
Example YAML configuration
triggers : - trigger : numeric_state entity_id : todo.shopping_list above : 10 id : shopping list too long - trigger : numeric_state entity_id : sensor.shopping_list_urgent above : 0 id : shopping is urgent actions : - choose : - conditions : - condition : trigger id : shopping list too long sequence : - action : - action : notify.notify data : message : >- The list is getting long, plan a trip to the grocery shop in the next days title : Shopping needed soon 🛒 - conditions : - condition : trigger id : shopping is urgent sequence : - action : - action : notify.notify data : title : 🚨 Time to go shopping! 🛒 message : Urgent groceries needed! Grab your shopping bag and go! - delay : hours : 1 mode : single alias : " Bring!: Grocery shopping reminder 🛒" description : " Get notified when it's time to go grocery shopping. A notification is sent when your shopping list reaches a set threshold or when urgent items are added."
This integration syncs your lists by polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Bring! service every 90 seconds or immediately after an action is performed in Home Assistant, such as adding an item. If you prefer a less frequent update, custom polling interval can also be defined — see Defining a custom polling interval for details.
Changes made in Home Assistant are reflected instantly in the Bring! app, while changes in the Bring! app may be delayed by up to 90 seconds due to the polling interval.
To receive push notifications in the Bring! app when items are added or removed in Home Assistant, or when triggered by the bring.send_message action, it is recommended to use a dedicated account (such as email: [email protected] ) when setting up the integration.
The Bring! integration relies on an active internet connection to communicate with Bring!. If you encounter issues, verify that your network connection is stable. Additionally, the Bring! service itself may experience downtime, whether unexpected or due to scheduled maintenance.
A 502 - Bad Gateway error ( aiohttp.client_exceptions.ClientResponseError: 502, message='Bad Gateway' ) is known to occur occasionally (1–2 times per day) but is usually temporary. The integration will retry automatically after 90 seconds, so there’s no need to take action.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible, please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
List of to do list integrations
To do list card
Bring!
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bring! service was introduced in Home Assistant 2024.2, and it's used by
1.3% of the active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@miaucl
@tr4nt0r
Categories
To-do list
Back to top
