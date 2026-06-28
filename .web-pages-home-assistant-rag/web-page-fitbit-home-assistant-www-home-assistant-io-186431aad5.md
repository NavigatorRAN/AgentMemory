---
source_url: "https://www.home-assistant.io/integrations/fitbit"
final_url: "https://www.home-assistant.io/integrations/fitbit"
canonical_url: "https://www.home-assistant.io/integrations/fitbit/"
source_handle: "web:www-home-assistant-io:186431aad54c"
source_section: "integrations-fitbit"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "dacee5a7ecc4c44e2035fddafd8553453a2eb103ec2c5365213c69d17d92fd7a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Fitbit - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fitbit
- Final URL: https://www.home-assistant.io/integrations/fitbit
- Canonical URL: https://www.home-assistant.io/integrations/fitbit/
- Fetched at: 2026-06-28T02:42:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Fitbit devices within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Additional information
Troubleshooting
Resetting a broken or incorrect configuration
“Connection failed” after authorization
The Fitbit integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to expose data from Fitbit to Home Assistant.
You need to configure developer credentials to allow Home Assistant to access your Fitbit account.
Generate Client ID and Client Secret
Your Fitbit account must be registered as a Developer account at the Fitbit Developer Portal , and have a verified email address.
Visit Register an application .
Enter an Application Name of your choosing, for example Home Assistant .
Since we are creating a Personal registration, the details for Description , Application Website URL , and Organization must be filled in. However, the contents do not matter and will only be shown to you on the authorization page later.
Set OAuth 2.0 Application Type to Personal .
Under Redirect URL , add https://my.home-assistant.io/redirect/oauth .
You can leave Default Access Type as Read Only .
Read the terms of service, check the box, then select Register .
You will then be shown the page with your registered application, showing OAuth 2.0 Client ID and Client Secret . Make a note of these (for example, copy and paste them into a text editor), as you will need them shortly. You can always revisit this page through the Manage My Apps tab.
To add the Fitbit service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fitbit .
Follow the instructions on screen to complete the setup.
The integration setup will next give you instructions to enter the Application Credentials (OAuth Client ID and Client Secret) and authorize Home Assistant to access your Fitbit account
OAuth and Authorization steps
Continue through the steps of selecting the account you want to authorize.
You will be asked to grant access to specific data in your Fitbit account.
For Home Assistant to understand your account, select profile .
All other data is optional. Home Assistant will create entities based on the information you select. For example, if you allow access to Activity and exercise , then Home Assistant will create activity-related sensors such as sensor.step .
The page will now display Link account to Home Assistant? , note Your instance URL . If this is not correct, refer to My Home Assistant . If everything looks good, select Link Account .
You may close the window, and return back to Home Assistant where you should see a Success! message from Home Assistant.
Please be aware that Fitbit has very low rate limits, 150 per user per hour. The clock resets at the top of the hour (meaning it is not a rolling 60 minutes). There is no way around the limits. Due to the rate limits, the sensor only updates every 30 minutes. You can manually trigger an update by restarting Home Assistant. Keep in mind that 1 request is used for every sensor.
The unit system that the sensor will use is based on the country you set in your Fitbit profile.
If the Fitbit integration was initially configured incorrectly, simply removing and re-adding the integration may not be sufficient. When removing the integration, Home Assistant asks whether the existing application credentials should be kept or removed.
If you choose to keep them, the previously stored (and possibly incorrect) credentials will continue to be used automatically during the next setup attempt, which can lead to repeated connection failures.
To fully reset the configuration, the stored application credentials must also be removed (see Deleting application credentials ).
Symptom
In some cases, the authorization appears to succeed, but Home Assistant returns a Connection failed error after redirecting back from Fitbit.
The Home Assistant Core log typically shows the message Failed to fetch user profile for Fitbit API: Error from Fitbit API .
Description
This is usually caused by missing permissions. The Fitbit integration requires the Profile scope. If Profile is not enabled during authorization, Home Assistant cannot fetch the user profile and the setup fails.
Resolution
In the Fitbit permission settings, enable Profile .
Repeat the authorization steps.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fitbit service was introduced in Home Assistant 0.19, and it's used by
1444 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@allenporter
Categories
Health
Back to top
