---
source_url: "https://www.home-assistant.io/integrations/youtube"
final_url: "https://www.home-assistant.io/integrations/youtube"
canonical_url: "https://www.home-assistant.io/integrations/youtube/"
source_handle: "web:www-home-assistant-io:43fa9719df72"
source_section: "integrations-youtube"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d991f1f19acf1fe43c7554a8c40616bed3f0d38fba444639abb0964a0fc44729"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# YouTube - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/youtube
- Final URL: https://www.home-assistant.io/integrations/youtube
- Canonical URL: https://www.home-assistant.io/integrations/youtube/
- Fetched at: 2026-06-28T03:30:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate YouTube within Home Assistant.

## Extracted Text

On this page
Prerequisites
Scenario 1: You already have credentials
Scenario 2: You do not have credentials set up yet
Configuration
Removing the integration
To remove an integration instance from Home Assistant
The YouTube integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect YouTube channels to Home Assistant.
For every channel you add, it will create sensors for:
Views count
Subscriber count
Video count
The latest uploaded video
To be able to configure the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you need to have a YouTube channel.
To learn how to create one, refer to the YouTube documentation .
You need to configure developer credentials to allow Home Assistant to access your Google Account.
These credentials are the same as the ones for Nest , Google Mail and Google Sheets .
These are not the same as the one for Google Calendar .
In this case, all you need to do is enable the API:
Go the Google Developers Console YouTube Data API v3 .
Confirm the project and Enable the API.
Continue with the steps described in the Configuration section.
In this case, you need to generate a client secret first:
To generate client ID and client secret
This section explains how to generate a client ID and client secret on
Google Developers Console .
First, go to the Google Developers Console to enable YouTube Data API v3 .
Select Create project , enter a project name and select Create .
Enable the YouTube Data API v3.
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
To add the YouTube service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select YouTube .
Follow the instructions on screen to complete the setup.
The integration setup will next give you instructions to enter the Application Credentials (OAuth Client ID and Client Secret) and authorize Home Assistant to connect to YouTube.
OAuth and device authorization steps
Continue through the steps of selecting the account you want to authorize.
NOTE : You may get a message telling you that the app has not been verified and you will need to acknowledge that in order to proceed.
You can now see the details of what you are authorizing Home Assistant to access with two options at the bottom. Select Continue .
The page will now display Link account to Home Assistant? , note Your instance URL . If this is not correct, refer to My Home Assistant . If everything looks good, select Link Account .
You may close the window, and return back to Home Assistant where you should see a Success! message from Home Assistant.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The YouTube service was introduced in Home Assistant 2023.6, and it's used by
962 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Sensor
Back to top
