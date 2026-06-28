# Google Calendar - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google
- Final URL: https://www.home-assistant.io/integrations/google
- Canonical URL: https://www.home-assistant.io/integrations/google/
- Fetched at: 2026-06-28T02:46:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Google Calendar in Home Assistant.

## Extracted Text

On this page
Prerequisites
Scenario 1: You already have credentials
Scenario 2: You do not have credentials set up yet
Configuration
Troubleshooting
Video tutorial
Calendar entities
Calendar event automations
Calendar entity attributes
List of actions
More configuration
The Google Calendar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Google Calendar to Home Assistant. The integration adds calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] entities that are shown on the Calendar dashboard, and can be used for automations based on any event, or limited to specific matching criteria.
You need to configure developer credentials to allow Home Assistant to access your Google Account. The current recommended approach is to create Web Auth credentials for Google Calendar since
the same credentials work for all Google integrations. Previously, this integration only supported
Device Auth and those credentials are no longer recommended. You can continue to use Device Auth
credentials but they will only work with Google Calendar.
In this case, all you need to do is enable the API:
Go the Google Developers Console Google Calendar API .
Confirm the project and Enable the API.
Continue with the steps described in the Configuration section.
In this case, you need to generate a client secret first:
To generate client ID and client secret
This section explains how to generate a client ID and client secret on
Google Developers Console .
First, go to the Google Developers Console to enable Google Calendar API .
Select Create project , enter a project name and select Create .
Enable the Google Calendar API.
Navigate to APIs & Services (left sidebar) > Credentials .
In the left sidebar, select OAuth consent screen .
It will take you to the Overview page and ask for Project Configuration :
Complete the App Information:
Set the App name (the name of the application asking for consent) to anything you want, for example, Home Assistant .
For a Support email , choose your email address from the dropdown menu.
Select Next .
For Audience, select External then select Next .
Under Contact Information, enter your email address (the same as above is fine). Select Next .
Read the policy and check the box if you agree. Select Continue .
Select Create .
In the left sidebar, select Audience :
Under Publishing status > Testing , select Publish app .
Otherwise, your credentials will expire every 7 days.
In the left sidebar, select Clients :
Select + Create Client .
For Application type, choose Web Application and give this client ID a name (like “Home Assistant Client”).
Add https://my.home-assistant.io/redirect/oauth to Authorized redirect URIs then select Create .
Note : This is not a placeholder. It is the URI that must be used.
From the resulting dialog take a note of Client ID and Client Secret you can not retrieve it again after closing the dialog.
Once you have noted these strings, select Close .
Congratulations! You are now the keeper of a client secret. Guard it in your treasure box. In most cases, your new credentials will be active within a few minutes. However, Google states that activation may take up to five hours in some circumstances.
To add the Google Calendar service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Calendar .
Follow the instructions on screen to complete the setup.
The integration setup will next give you instructions to enter the Application Credentials (OAuth Client ID and Client Secret) and authorize Home Assistant to connect to Google Calendar.
OAuth and device authorization steps
Continue through the steps of selecting the account you want to authorize.
NOTE : You may get a message telling you that the app has not been verified and you will need to acknowledge that in order to proceed.
You can now see the details of what you are authorizing Home Assistant to access with two options at the bottom. Select Continue .
The page will now display Link account to Home Assistant? , note Your instance URL . If this is not correct, refer to My Home Assistant . If everything looks good, select Link Account .
You may close the window, and return back to Home Assistant where you should see a Success! message from Home Assistant.
If the setup process fails and you see an error message such as Authentication code expired, please try again you may want to try the flow again. You may also check the logs for additional error messages that may indicate a misconfiguration such as an invalid client id or secret.
If you have an error with your credentials, you can delete them in the application credentials user interface.
This video tutorial explains how to set up Google Calendar in Home Assistant and how you can trigger an automation based on a calendar event.
Each Google Calendar from My Calendars ( more info ) is represented as a calendar entity in Home Assistant.
For example, your calendar named Personal is created as entity calendar.personal . You may rename an entity, or disable any entities which you don’t need.
Individual Calendar Events are what is powering automations such as:
Turn on a light at the start of the event named Front Yard Light
Send a notification 5 minutes before the start of any event
Stop the media player 30 minutes after the end of the event named Exercise .
See calendar automations for an overview, and read more about calendar trigger variables for the available information you can use in a condition or action such as the event summary , description , location and more.
The calendar entity has additional attributes related to a single next upcoming event.
Tip
Using the entity state and attributes is more error prone and less flexible than using Calendar Automations. The calendar entity itself may only track a single upcoming active event and can’t handle multiple events with the same start time, or overlapping events.
Attributes
all_day : true / false if this is an all day event. Will be false if there is no event found.
message : The event summary.
description : The event description.
location : The event location.
start_time : Start time of event.
end_time : End time of event.
The Google Calendar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Create event in Google Calendar ( google.create_event )
Adds a new event to a calendar in Google Calendar.
For an overview of every action across all integrations, see the actions reference .
More Configuration
Warning
It is not recommended to new users to use these settings as they are not
compatible with other Home Assistant features, but this documentation is available
for existing users.
The integration supports additional configuration from a file google_calendars.yaml which is available for existing users before version 2022.06 . This file is no longer automatically populated.
Configuration Variables
Looking for your configuration file?
cal_id string Required
The Google generated unique id for this calendar.
Default:
DO NOT CHANGE THE DEFAULT VALUE
entities list Required
Yes, you can have multiple sensors for a calendar!
device_id string Required
The name that all your automations/scripts will use to reference this device.
name string Required
What is the name of your sensor that you’ll see in the frontend.
search string ( Optional )
If set will only trigger for matched events.
offset string ( Optional , default: !! )
A set of characters that precede a number in the event title for designating a pre-trigger state change on the sensor. This should be in the format of HH:MM or MM.
ignore_availability boolean ( Optional , default: true )
Should we respect free / busy flags?
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Calendar service was introduced in Home Assistant 0.33, and it's used by
7.5% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@allenporter
Categories
Calendar
Back to top
