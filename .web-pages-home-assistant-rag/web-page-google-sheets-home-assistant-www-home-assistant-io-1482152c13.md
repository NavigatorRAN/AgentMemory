# Google Sheets - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_sheets
- Final URL: https://www.home-assistant.io/integrations/google_sheets
- Canonical URL: https://www.home-assistant.io/integrations/google_sheets/
- Fetched at: 2026-06-28T02:46:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Google Sheets in Home Assistant.

## Extracted Text

On this page
Prerequisites
Scenario 1: You already have credentials
Scenario 2: You do not have credentials set up yet
Configuration
List of actions
Troubleshooting
Video tutorial
The Google Sheets integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Google Drive to Home Assistant. The integration adds an action to allow you to append rows to a Sheets document. The idea is that you can store data on there for further processing. When you set up a config entry, your drive will have a new sheet called Home Assistant. You can then rename this to whatever you like.
Note :
The integration currently only has access to that one document that is created during setup.
You need to configure developer credentials to allow Home Assistant to access your Google Account.
These credentials are the same as the ones for Nest , YouTube , and Google Mail .
These are not the same as Device Auth credentials previously recommended for Google Calendar .
In this case, all you need to do is enable the API:
Go the Google Developers Console Google Drive API and Google Sheets API .
Confirm the project and Enable the API.
Continue with the steps described in the Configuration section.
In this case, you need to generate a client secret first:
To generate client ID and client secret
This section explains how to generate a client ID and client secret on
Google Developers Console .
First, go to the Google Developers Console to enable Google Drive API and Google Sheets API .
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
To add the Google Sheets service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Sheets .
Follow the instructions on screen to complete the setup.
The integration setup will next give you instructions to enter the Application Credentials (OAuth Client ID and Client Secret) and authorize Home Assistant to connect to Google Sheets.
OAuth and device authorization steps
Continue through the steps of selecting the account you want to authorize.
NOTE : You may get a message telling you that the app has not been verified and you will need to acknowledge that in order to proceed.
You can now see the details of what you are authorizing Home Assistant to access with two options at the bottom. Select Continue .
The page will now display Link account to Home Assistant? , note Your instance URL . If this is not correct, refer to My Home Assistant . If everything looks good, select Link Account .
You may close the window, and return back to Home Assistant where you should see a Success! message from Home Assistant.
The Google Sheets integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Append sheet ( google_sheets.append_sheet )
Adds rows of data to a Google Sheets document.
Get sheet ( google_sheets.get_sheet )
Retrieves rows of data from a Google Sheets document.
For an overview of every action across all integrations, see the actions reference .
If you have an error with your credentials you can delete them in the Application Credentials user interface.
This video tutorial explains how to set up the Google Sheets integration and how you can add data from Home Assistant to a Google Sheet.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Sheets service was introduced in Home Assistant 2022.10, and it's used by
2483 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Utility
Back to top
