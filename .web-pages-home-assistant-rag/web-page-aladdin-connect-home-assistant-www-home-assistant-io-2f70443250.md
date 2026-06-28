# Aladdin Connect - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aladdin_connect
- Final URL: https://www.home-assistant.io/integrations/aladdin_connect
- Canonical URL: https://www.home-assistant.io/integrations/aladdin_connect/
- Fetched at: 2026-06-28T02:27:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Genie Aladdin Connect garage door openers with Home Assistant for monitoring and control.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Entities
Examples
Send a notification when the garage door is left open
Close the garage door at night
Data updates
Known limitations
Troubleshooting
Setup fails with “cloud not enabled”
OAuth sign-in fails or times out
Doors are not showing up after setup
Device becomes unavailable
Removing the integration
To remove an integration instance from Home Assistant
The Aladdin Connect integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you open, close, and check the status of Genie Aladdin Connect garage doors through Home Assistant. It also reports the battery level of your opener’s backup battery.
With this integration, you could get a notification when the garage door has been left open, or have it close automatically at a set time each night.
Any garage door opener that works with the AladdinConnect app should work with this integration. Aladdin Connect devices on your network can also be discovered automatically using DHCP discovery.
You need the following before you start:
An active Home Assistant Cloud subscription, since the integration authenticates through it.
Install the AladdinConnect app on your phone and create an account.
Add your garage door opener to the app and confirm you can open and close it.
To add the Aladdin Connect hub to your Home Assistant instance, use this My button:
Aladdin Connect can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Aladdin Connect .
Follow the instructions on screen to complete the setup.
During setup, you will be redirected to sign in with your Aladdin Connect account. After you authorize Home Assistant, your garage doors will be added automatically. There are no additional parameters to configure.
The Aladdin Connect integration provides the following entities.
Covers
Garage door
Description : Your garage door. You can open and close it, and it reports its current status: open, opening, closed, or closing.
Device class : Garage
Sensors
Battery level
Description : The battery level of your opener’s backup battery, as a percentage. Useful for knowing when the battery needs replacing.
Entity category : Diagnostic
Remarks : Disabled by default. To use this sensor, enable it manually from the entity’s settings.
If someone leaves the garage door open for more than 10 minutes, this automation sends a notification to your phone.
Example YAML configuration
alias : " Notify when garage left open" description : > Send a notification if the garage door stays open for more than 10 minutes. triggers : - trigger : state entity_id : cover.garage_door to : " open" for : minutes : 10 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Garage door open" message : " The garage door has been open for 10 minutes."
This automation closes the garage door automatically at 10 PM if it happens to be open.
alias : " Close garage door at night" description : > Close the garage door at 10 PM if it is still open. triggers : - trigger : time at : " 22:00:00" conditions : - condition : state entity_id : cover.garage_door state : " open" actions : - action : cover.close_cover target : entity_id : cover.garage_door
Door status and battery level are updated by polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Aladdin Connect cloud service every 15 seconds. All communication goes through the cloud API. There is no local or push-based option.
Only doors that are owned by your Aladdin Connect account are available. Doors that your account has been granted shared access to are not supported.
There is no position control. You can open or close the door, but you cannot stop it at a specific position.
All communication goes through the cloud. There is no local or LAN-based control, so the integration stops working if your internet connection drops.
A Home Assistant Cloud subscription is required for authentication.
This error means Home Assistant Cloud is not active. Go to Settings > Home Assistant Cloud and verify you have an active Home Assistant Cloud subscription.
Check your internet connection and try again. If it keeps happening, open the AladdinConnect app on your phone and sign out and back in to confirm your credentials still work.
Only doors you own appear in Home Assistant. Shared doors are not supported. Open the AladdinConnect app and check that the missing door is listed under your own account, not under a shared section.
The garage door entity shows as unavailable when it cannot reach the Aladdin Connect cloud service. Check your internet connection first. Then open the AladdinConnect app and see if you can still control the door from there. If the app also cannot connect, the Aladdin Connect service may be down.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Aladdin Connect hub was introduced in Home Assistant 0.75, and it's used by
1361 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@swcloudgenie
Categories
Cover
Back to top
