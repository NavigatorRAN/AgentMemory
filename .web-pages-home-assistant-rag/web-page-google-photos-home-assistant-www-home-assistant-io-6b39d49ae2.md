---
source_url: "https://www.home-assistant.io/integrations/google_photos"
final_url: "https://www.home-assistant.io/integrations/google_photos"
canonical_url: "https://www.home-assistant.io/integrations/google_photos/"
source_handle: "web:www-home-assistant-io:6b39d49ae22f"
source_section: "integrations-google-photos"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fb5624f5c972027d9f96c14e97e0c10444e4dcf8a9a092a6f07479695e934525"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Photos - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_photos
- Final URL: https://www.home-assistant.io/integrations/google_photos
- Canonical URL: https://www.home-assistant.io/integrations/google_photos/
- Fetched at: 2026-06-28T02:46:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Google Photos in Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
List of actions
Troubleshooting
Related topics
Related links
The Google Photos integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to upload photos to your Google Photos using Home Assistant. The integration adds an action for uploading photos and a
media source to view or cast the content uploaded by
Home Assistant. This integration does not give Home Assistant access to your
entire Google Photos library.
You need to configure developer credentials to allow Home Assistant to access your Google Account.
These credentials are the same as the ones for Nest , Google Tasks , and Google Mail .
These are not the same as Device Auth credentials previously recommended for Google Calendar .
If you have already set up the correct credentials, you can do step 1 and then skip to step 13 on the below instructions.
Generate Client ID and Client Secret
This section explains how to generate a Client ID and Client Secret on
Google Developers Console .
First, go to the Google Developers Console to enable Google Photos Library API
The wizard will ask you to choose a project to manage your application. Select a project and select Continue .
Verify that your Google Photos Library API was enabled and select Go to credentials .
Navigate to APIs & Services (left sidebar) > Credentials .
Click on the field on the left of the screen, OAuth Consent Screen .
Select External and Create .
Set the App Name (the name of the application asking for consent) to anything you want, for example to Home Assistant .
You then need to select a Support email . To do this, from the dropdown menu, select your email address.
You finally need to complete the section: Developer contact information . To do this, enter your email address (the same as above is fine).
Scroll to the bottom and select Save and Continue . You don’t have to fill out anything else, or it may enable additional review.
You will then be automatically taken to the Scopes page. You do not need to add any scopes here, so select Save and Continue to move to the Optional info page. You do not need to add anything to the Optional info page, so select Save and Continue , which will take you to the Summary page. Select Back to Dashboard .
Select OAuth consent screen again and set Publish Status to Production . Otherwise, your credentials will expire every 7 days.
Make sure Publishing status is set to production.
Select Credentials in the menu on the left-hand side of the screen, then select Create credentials (at the top of the screen), then select OAuth client ID .
Set the Application type to Web application and give this credential set a name (like “Home Assistant Credentials”).
Add https://my.home-assistant.io/redirect/oauth to Authorized redirect URIs then select Create . This is not a placeholder and is the URI that must be used.
You will then be presented with a pop-up saying OAuth client created , showing Your Client ID and Your Client Secret . Make a note of these (for example, copy and paste them into a text editor), as you will need them shortly. Once you have noted these strings, select OK . If you need to find these credentials again at any point, then navigate to APIs & Services > Credentials , and you will see Home Assistant Credentials (or whatever you named them in the previous step) under OAuth 2.0 Client IDs . To view both the Client ID and Client secret , select the pencil icon. This will take you to the settings page for these credentials, and the information will be on the right-hand side of the page.
Double-check that the Google Photos Library API has been automatically enabled. To do this, select Library from the menu, then search for Google Photos Library API . If it is enabled, you will see API Enabled with a green tick next to it. If it is not enabled, then enable it.
To add the Google Photos service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Photos .
Follow the instructions on screen to complete the setup.
The integration setup will next give you instructions to enter the Application Credentials (OAuth Client ID and Client Secret) and authorize Home Assistant to access your Google Photos.
OAuth and Device Authorization steps
Continue through the steps of selecting the account you want to authorize.
NOTE : You may get a message telling you that the app has not been verified and you will need to acknowledge that to proceed.
You can now see the details of what you are authorizing Home Assistant to access with two options at the bottom. Select Continue . Keep in mind this is giving sensitive access to your private Photo Library.
The page will now display Link account to Home Assistant? , note Your instance URL . If this is not correct, refer to My Home Assistant . If everything looks good, select Link Account .
You may close the window, and return back to Home Assistant where you should see a Success! message from Home Assistant.
The Google Photos integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Upload ( google_photos.upload )
Uploads one or more photos or videos from Home Assistant to Google Photos.
For an overview of every action across all integrations, see the actions reference .
If you have an error with your credentials, you can delete them in the Application Credentials user interface.
Google Photos
Google Developers Console
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Photos service was introduced in Home Assistant 2024.10, and it's used by
757 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@allenporter
Categories
Media source
Back to top
