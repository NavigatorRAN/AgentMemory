---
source_url: "https://www.home-assistant.io/integrations/google_tasks"
final_url: "https://www.home-assistant.io/integrations/google_tasks"
canonical_url: "https://www.home-assistant.io/integrations/google_tasks/"
source_handle: "web:www-home-assistant-io:464ddac576e7"
source_section: "integrations-google-tasks"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1a449b20bbed29bac654ea1a6a41e5ce28454af2c417ca4fba134ca61400f79c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Tasks - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_tasks
- Final URL: https://www.home-assistant.io/integrations/google_tasks
- Canonical URL: https://www.home-assistant.io/integrations/google_tasks/
- Fetched at: 2026-06-28T02:46:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Google Tasks in Home Assistant.

## Extracted Text

On this page
Prerequisites
Scenario 1: You already have credentials
Scenario 2: You do not have credentials set up yet
Configuration
Supported functionality
Entities
Actions
Examples
Low Battery Maintenance
Data updates
Known limitations
Troubleshooting
Can’t set up the integration
Removing the integration
To remove an integration instance from Home Assistant
Related topics
Related links
The Google Tasks integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Google Tasks
to Home Assistant. The integration adds a to-do list entity for
each task list, allowing you to create, update, or delete items on the list
from the To-do list dashboard.
You can use to-do lists in automations, such as adding a new task when Home Assistant detects
a device has low batteries. When you combine with a Home Assistant voice assistant, you can
manage your Google Tasks by saying something like Add clean out garage to personal task list .
You need to configure developer credentials to allow Home Assistant to access your Google Account.
These credentials are the same as the ones for Nest , Google Mail , and most other Google integrations.
These are not the same as Device Auth credentials previously recommended for Google Calendar .
In this case, all you need to do is enable the API:
Go the Google Developers Console Google Tasks API .
Confirm the project and Enable the API.
Continue with the steps described in the Configuration section.
In this case, you need to generate a client secret first:
To generate client ID and client secret
This section explains how to generate a client ID and client secret on
Google Developers Console .
First, go to the Google Developers Console to enable Google Tasks API .
Select Create project , enter a project name and select Create .
Enable the Google Tasks API.
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
To add the Google Tasks service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Tasks .
Follow the instructions on screen to complete the setup.
The integration setup will next give you instructions to enter the Application Credentials (OAuth Client ID and Client Secret) and authorize Home Assistant to connect to Google Tasks.
OAuth and device authorization steps
Continue through the steps of selecting the account you want to authorize.
NOTE : You may get a message telling you that the app has not been verified and you will need to acknowledge that in order to proceed.
You can now see the details of what you are authorizing Home Assistant to access with two options at the bottom. Select Continue .
The page will now display Link account to Home Assistant? , note Your instance URL . If this is not correct, refer to My Home Assistant . If everything looks good, select Link Account .
You may close the window, and return back to Home Assistant where you should see a Success! message from Home Assistant.
The Google Tasks integration provides the following entities.
To-do lists
The integration will create a to-do list entity for every task list.
For example, a Google Tasks list named My Tasks then will have a Home Assistant
to-do list entity named My Tasks .
The Google Task integration can create, update, or delete items on a to-do list.
The to-do list entities support creating, updating, and deleting items on the to-do
list. A to-do list item supports the following fields:
Item : The item is the Google Task Title field.
Due date : The Google Tasks Date. The time field in Google Tasks is not supported
by the Google Tasks API.
Description : The Google Tasks Details field.
Status : The Google Tasks Completed check box corresponds to the to-do list
status needs_action when not checked and completed when checked.
The Google Tasks integration provides all actions supported by a to-do list entity
including actions for retrieving, creating, updating, and deleting to-do list items and the fields
described above. See the To-do list: Actions documentation
for more details.
You can use Google Tasks to help you automate battery maintenance. To tackle this
you can use this blueprint to send a notification with devices that have low
low battery level. The notification includes a button that can add an item to your
Google Tasks to-do list.
Low Battery Notifications & Actions
The Google Tasks integration fetches task lists once initially, and creates a
to-do list for each task list. Data for each to-do list is refreshed by
polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] every 30 minutes.
Updates to the to-do list in Home Assistant use the Google Tasks API and changes
are reflected immediately in Google Tasks. This will also refresh the to-do
list contents, polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] again for any new changes.
There are some known Google Tasks API limitations that affect this integration:
Only supports polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] . Updates in Google Tasks are not reflected immediately in Home Assistant.
Only supports viewing or setting a task due date. A task due time is not supported.
Symptom: “The OAuth client was not found.”
When trying to configure the integration, the Google OAuth flows shows the message The OAuth client was not found and Error 401: invalid_client .
Description
This means that the application credentials in Home Assistant do not match the
OAuth credentials in the Google Cloud console.
Resolution
To resolve this issue:
Follow the instructions in Application Credentials to remove any existing credentials.
Follow the steps above in the Prerequisites .
Follow the steps above in the Configuration .
Symptom: “Unable to access the Google API: Tasks API has not been used in project before or it is disabled”
Home Assistant fails to configure the integration with the error Unable to access the
Google API: Google Tasks API has not been used in project before or it is disabled .
This means that Home Assistant is unable to use the Google Tasks API because it was not
enabled in the Google Cloud Console.
Follow the steps above in the Prerequisites to enable the Google Tasks API.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
You will be asked if you would like to remove Application Credentials which you can do if you no longer plan to use
Google Tasks with Home Assistant. You may want to also remove any credentials
in the Google Cloud Console, created above in the Prerequisites, if they are no
longer in use with any of your other Home Assistant integrations.
List of to do list integrations
To do list card
Google Tasks
Google Developers Console
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Tasks service was introduced in Home Assistant 2023.11, and it's used by
2333 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@allenporter
Categories
To-do list
Back to top
