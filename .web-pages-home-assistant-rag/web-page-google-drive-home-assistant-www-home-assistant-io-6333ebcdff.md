---
source_url: "https://www.home-assistant.io/integrations/google_drive"
final_url: "https://www.home-assistant.io/integrations/google_drive"
canonical_url: "https://www.home-assistant.io/integrations/google_drive/"
source_handle: "web:www-home-assistant-io:6333ebcdffc2"
source_section: "integrations-google-drive"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a5185abe18dc892dcb953a7f29c2d5e42b44722918ac645a466402323ea32fc6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Drive - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_drive
- Final URL: https://www.home-assistant.io/integrations/google_drive
- Canonical URL: https://www.home-assistant.io/integrations/google_drive/
- Fetched at: 2026-06-28T02:46:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Google Drive in Home Assistant.

## Extracted Text

On this page
Prerequisites
Scenario 1: You already have credentials
Scenario 2: You do not have credentials set up yet
Configuration
Sensors
Examples
Send alert when drive is near storage limit
Removing the integration
To remove an integration instance from Home Assistant
Known limitations
Troubleshooting
Related topics
Related links
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Google Drive with Home Assistant Backups .
When you set up this integration, your Google Drive will have a new folder called Home Assistant where all the backups will be stored. A separate folder is created for each of your Home Assistant instances. You can rename this folder to whatever you like in Google Drive at any point in time. If you delete the folder, it will automatically be re-created as long as you have the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enabled.
To open the backup folder, go to Settings > Devices & services > Google Drive , and select Visit .
For a video walkthrough of the setup instructions, see this video from 13:50 to 19:20
You need to configure developer credentials to allow Home Assistant to access your Google Account.
These credentials are the same as the ones for Google Sheets , Nest , YouTube , and Google Mail .
These are not the same as Device Auth credentials previously recommended for Google Calendar .
In this case, all you need to do is enable the API:
Go the Google Developers Console Google Drive API .
Confirm the project and Enable the API.
Continue with the steps described in the Configuration section.
In this case, you need to generate a client secret first:
To generate client ID and client secret
This section explains how to generate a client ID and client secret on
Google Developers Console .
First, go to the Google Developers Console to enable Google Drive API .
Select Create project , enter a project name and select Create .
Enable the Google Drive API.
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
To add the Google Drive service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Drive .
Follow the instructions on screen to complete the setup.
The integration setup will next give you instructions to enter the Application Credentials (OAuth Client ID and Client Secret) and authorize Home Assistant to connect to Google Drive.
OAuth and device authorization steps
Continue through the steps of selecting the account you want to authorize.
NOTE : You may get a message telling you that the app has not been verified and you will need to acknowledge that in order to proceed.
You can now see the details of what you are authorizing Home Assistant to access with two options at the bottom. Select Continue .
The page will now display Link account to Home Assistant? , note Your instance URL . If this is not correct, refer to My Home Assistant . If everything looks good, select Link Account .
You may close the window, and return back to Home Assistant where you should see a Success! message from Home Assistant.
The integration provides the following sensors, which are updated every 6 hours:
Total available storage : The storage limit, if applicable. This will be unknown if the user has unlimited storage.
Used storage : The total storage usage across all Google services.
Used storage in Drive : The usage by all files in Google Drive. This entity is disabled by default.
Used storage in Drive Trash : The usage by trashed files in Google Drive. This entity is disabled by default.
Total size of backups : The sum of the size of all backups for the current Home Assistant’s installation.
For users that are part of an organization with pooled storage, information about the available storage and used storage across all services is for the organization, rather than the individual user.
Get started with these automation examples.
Send an alert when the drive usage is close to the storage limit and needs clean up.
Example YAML configuration
Create an automation with the following code. Remember to replace your_email_gmail_com with the actual ID of your sensors (found in Settings > Devices & services > Entities ) and replace notify.my_device with your actual notifier.
alias : Alert when Google Account is close to storage limit description : Send notification to phone when drive needs clean up. triggers : - trigger : template value_template : > {% set used = states('sensor.your_email_gmail_com_used_storage') | float(0) %} {% set total = states('sensor.your_email_gmail_com_total_available_storage') | float(0) %} {{ used > (total * 0.9) }} actions : - action : notify.send_message target : entity_id : notify.my_device data : title : Google Account is almost full! message : > Google Account has used up {{ states('sensor.your_email_gmail_com_used_storage') }}GB of {{ states('sensor.your_email_gmail_com_total_available_storage') | float }}GB.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
If you remove the integration, the backup folder in Google Drive is not automatically deleted. You have to manually delete it in Google Drive.
The integration can only access files that it creates in the backup folder. It cannot access or modify any other files in your Google Drive.
If you have an error with your credentials, you can delete them in the Application Credentials user interface.
Creating backups in home assistant
Google Drive
Google Developer Console
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Drive service was introduced in Home Assistant 2025.2, and it's used by
2.6% of the active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tronikos
Categories
Backup
Back to top
