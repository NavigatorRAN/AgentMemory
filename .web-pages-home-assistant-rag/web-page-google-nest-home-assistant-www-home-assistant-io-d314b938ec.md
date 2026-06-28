---
source_url: "https://www.home-assistant.io/integrations/nest"
final_url: "https://www.home-assistant.io/integrations/nest"
canonical_url: "https://www.home-assistant.io/integrations/nest/"
source_handle: "web:www-home-assistant-io:d314b938ec5f"
source_section: "integrations-nest"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "242a4422026777e4dbe63cc205cc0915c472d61ce9e54321f928813d92d8037d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Nest - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nest
- Final URL: https://www.home-assistant.io/integrations/nest
- Canonical URL: https://www.home-assistant.io/integrations/nest/
- Fetched at: 2026-06-28T03:02:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Nest into Home Assistant.

## Extracted Text

On this page
Configuration
Climate
Sensor
Camera
Event
List of actions
Device Triggers
Google Home App Notification Settings
Media source
Media Attachments
Known limitations
Google account types
Google Advanced Protection Program
Google Home App migration and cameras
Temperature sensors partially supported
Troubleshooting
Can’t link Google account
Can’t find devices
Authentication problems
Integration set up failure
Nest integration data issues
Removing the integration
To remove an integration instance from Home Assistant
The Google Nest integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate a few supported Google Nest devices in Home Assistant. This integration uses the Smart Device Management API and Google’s Cloud Pubsub to efficiently listen for changes in device state or other events. See Supported Devices for all devices supported by the SDM API.
There is currently support for the following device types within Home Assistant:
Cameras and doorbells use Automation and device triggers for events and a media source for capturing media images on supported devices. Other device types like Smoke and CO Alarms or Security systems are not currently supported by the SDM API.
You are in control of the information and capabilities exposed to Home Assistant. You can authorize a single device, multiple devices, or different levels of functionality such as motion events, live streams, for any particular device. The integration is flexible enough to adapt based on what you allow.
Prerequisites
The Nest Device Access Console Pub/Sub setup process has changed as of January 23rd 2025. Please make sure you are using the latest version of Home Assistant.
The Nest Smart Device Management (SDM) API requires a US$5 fee . Before buying, make sure your device is supported .
The SDM API is also incompatible with some Google Account types or Security settings, including Google Workspace and the Advanced Protection Program. See Known limitations below.
Important: Remove existing Google credentials first
If you have previously set up the Google integration or a Nest integration, you should remove any existing Google integration credentials before proceeding.
To remove existing credentials:
Go to Settings > Devices & services .
Select the three dots (⋮) menu in the upper right corner.
Review the list for any previous Google or Nest integrations.
Remove any existing Google/Nest integration by selecting it and choosing “Delete”.
This ensures that Home Assistant will use your latest Google integration configuration and prevents authentication conflicts.
To add the Nest integration to your Home Assistant, use this My Button:
Manual configuration steps
Browse to your Home Assistant instance.
In the bottom right corner, select the
Add Integration button.
From the list, select Nest and follow the instructions on screen.
The integration setup steps will walk you through the process of configuring a Google Cloud Project, Device Access Project, and finally link your account to Home Assistant. Make sure you are running the most recent version of Home Assistant.
Create and configure Cloud Project [Cloud Console]
By the end of this section you will have a Cloud Project with the necessary APIs enabled
Go to the Google Cloud Console .
If this is your first time here, you likely need to create a new Google Cloud project. Click Create Project then New
Project .
Give your Cloud Project a name then click Create .
You will need to hold on to your Cloud Project ID to enable a subscription to receive updates from devices. Visit the Cloud Console and copy the Project ID needed by Home Assistant.
Go to APIs & Services > Library where you can enable APIs.
From the API Library search for Smart Device management and click Enable .
From the API Library search for Cloud Pub/Sub API in the Cloud Console and click Enable .
You now have a cloud project ready for the next section to configure authentication with OAuth.
Configure OAuth Consent screen [Cloud Console]
By the end of this section you will have configured the OAuth consent screen, needed to give Home Assistant access to your cloud project.
Go to the Branding page in the Google Auth Platform Console.
If prompted to configure OAuth, click Get started and follow the setup wizard. When the wizard asks for user type, select External , and only continue once the OAuth consent configuration has been created.
Click Branding in the left sidebar. Fill in the required fields:
App name : Enter a name (e.g. Home Assistant). This is shown during the OAuth login flow.
User support email : Select your Google account email.
Developer contact email : Enter your email address under Developer contact information.
Leave all other fields (App logo, App domain, Authorized domains) empty to avoid triggering Google’s verification process. Click Save .
Click Audience in the left sidebar.
Under User type , confirm it shows External .
Under Test users , click + Add users and add your Google account email (e.g. your @gmail.com address). Click Save .
Still on the Audience page, under Publishing status , click Publish app to set the status to In production .
Make sure the status is not Testing , or you will get logged out every 7 days.
The warning says your app will be available to any user with a Google Account. This refers to the fields you entered on the Branding page if someone finds the URL. This does not expose your Google Account or Nest data.
Configure OAuth Application Credentials [Cloud Console]
By the end of this section you will have the OAuth Client ID and Client Secret needed for Application Credentials setup.
The steps below use Web Application Auth with My Home Assistant to handle Google’s strict URL validation rules like requiring SSL and a publicly resolvable redirect URL.
Navigate to the Credentials page and click Create Credentials .
From the drop-down list select OAuth client ID .
Enter Web Application for the Application type.
Pick a name for your credential.
Add Authorized redirect URIs end enter https://my.home-assistant.io/redirect/oauth
Click Create to create the credential.
You should now be presented with an OAuth client created message.
You now have the OAuth Client ID and OAuth Client Secret needed by Home Assistant. Follow the instructions for Application Credentials to add the OAuth Client ID and OAuth Client Secret in Home Assistant.
Create a Device Access Project [Device Access Console]
Now that you have authentication configured, you will create a Nest Device Access Project which requires a US$5 fee . Once completed, you will have a Device Access Project ID .
Go to the Device Access Registration page.
Note
Read the warnings on the page before proceeding, including Google Account type limitations.
Select the button Go to the Device Access Console .
Check the box to “Accept the Terms of Service” and select Continue to Payment where you need to pay a fee (currently US$5).
Now the Device Access Console should be visible. Select Create project .
Give your Device Access project a name and select Next .
Next you will be asked for an OAuth client ID which you created in the previous step and select Next .
Leave Enable Events unchecked for now and Create project . You need a Pub/Sub topic
(created in the next section) to enable events. This requires additional setup in the
Google Cloud Pub/Sub console so we will skip that step for now then come back to it in
the next section.
You now have a Device Access Project ID needed by Home Assistant.
Enable events and Pub/Sub topic [Device Access & Cloud Console]
The Nest Device Access Console Pub/Sub setup process has changed as of January 23rd 2025. Please make sure you are using the latest version of Home Assistant. .
This section describes how to configure your Device Access Project with a Pub/Sub topic
to publish events for devices in your home. Home Assistant and the Device Access Project must be configured to use the Topic Name otherwise you will not receive events.
If you previously set up events, then your Device Access Project may have already created a topic for you and you can use that topic name. For new projects, or if you disable events, you need to create the topic yourself following the instructions below.
Go to the Pub/Sub Google Cloud Console .
Select Create Topic .
Enter a Topic ID such as home-assistant-nest . You may leave the default settings.
Select Create to create the topic.
You now have a Topic Name needed by the Device Access Console and Home Assistant. The full Topic Name that contains your Cloud Project ID and the Topic ID such as projects/<cloud console id>/topics/home-assistant-nest .
Next, you need to give the Device Access Console permission to publish to your Topic. From the Pub/Sub Topic page select Add Principal .
In New Principals enter [email protected]
In Select a Role under Pub/Sub select Pub/Sub Publisher and Create .
Next you can configure the Device Access Console to use this topic. Visit the Device Access Console .
Select the Device Access Project you previously created. It should show the Pub/Sub topic
as disabled. If there is an existing topic shown, then you may delete it and use
the one you just created to avoid getting them mixed up.
Select … next to Pub/Sub topic , then Enable events with PubSub topic .
Enter the full Pub/Sub Topic Name and select Add & Validate . If you see an error, then
review the previous steps again and configure the topic and permissions.
You have successfully configured events and the Pub/Sub topic used by Home Assistant.
Link Google Account
In this section you will authorize Home Assistant to access your account by generating an Authentication Token .
See Troubleshooting below for steps to resolve the common misconfigurations that result in errors such as Can’t link… or Error 400 from Google.
In Home Assistant, you should already be going through the setup flow. If not, go back and click the My: Add Integration button above to start the setup. The integration will ask you for all of the necessary integration configuration.
Once all configuration information is entered in Home Assistant, a new tab opens, allowing you to choose a Google account. This should be the same developer account you configured above.
The Google Nest permissions screen will allow you to choose which devices to configure and lets you select devices from multiple homes. You likely want to enable everything, however, you can leave out any feature you do not wish to use with Home Assistant.
You will get redirected to another account selection page.
You may see a warning screen that says Google hasn’t verified this app since you just set up an un-verified developer workflow. Click Continue to proceed.
Then you will be asked to grant access to additional permissions. Click Allow .
Confirm you want to allow persistent access to Home Assistant.
You will now see a page hosted by My Home Assistant asking if you would like to Link account to Home Assistant? Click Link Account to continue.
If all went well, you will next configure events and Pub/Sub topic. Nest will attempt
to automatically find a Pub/sub topic either created by the Device Access Console
or manually by you.
If you instead see the error message No eligible Pub/Sub topics found, please ensure Device Access Console has a Pub/Sub topic. then follow the steps in the previous section to enable events and create a Pub/Sub topic in another browser tab. Once you have created and configured the topic, you may press on this screen Submit to refresh the list of topics and continue.
Home Assistant uses a Subscription to subscribe to device events published on the topic. You can select the subscription you created in the Device Access Console or the integration will automatically create one for you if you don’t have one already.
If all went well, you are ready to go!
![Screenshot of success](/images/integrations/nest/finished.png)
All Google Nest Thermostat models are exposed as a climate entity that use the Thermostat Traits in the SDM API. State changes to the thermostat are reported to Home Assistant through the Cloud Pubsub subscriber.
Given a thermostat named Upstairs then the climate entity is created with a name such as climate.upstairs
This feature is enabled by the following permissions:
Allow Home Assistant to access and control your thermostat
All Google Nest Thermostat models have traits exposed from the SDM API. The initial values of the sensors are fetched on startup, then updated regularly using the Cloud Pubsub subscriber. The following traits are supported with sensors:
Temperature
Humidity
Given a thermostat named Upstairs then sensors are created with names such as sensor.upstairs_temperature or sensor.upstairs_humidity .
Home Assistant supports all SDM API features. However, every Camera or Doorbell device has a different set of built-in capabilities. A Camera device has one of the following live stream types:
RTSP : These devices have an HLS stream served by the Home Assistant Core. These cameras support server-side camera actions like stream recording or image preview. See Low Latency HLS as a great option to enable to reduce stream latency.
WebRTC : These devices support direct browser to camera communication and a super low latency stream. A Picture Glance Card can show the live stream in the grid with the Camera View set to live (not recommended for battery-powered cameras). camera actions like stream recording are not supported .
Given a camera named Front Yard , then the camera is created with a name such as camera.front_yard .
Allow Home Assistant to see and display your camera’s livestream
Other permissions in the Nest or Google Home apps .
All cameras also expose event entities for automation. Some camera models also
support capturing media (snapshots or clips) through device triggers. The table below summarizes the supported SDM API features for each device.
Device Live stream Event entities / triggers Media source
for triggers Nest Cam (indoor, wired)
Nest Cam (outdoor, battery) WebRTC Motion
Person N/A Nest Cam Indoor
Nest Cam IQ Indoor
Nest Cam IQ Outdoor
Nest Cam Outdoor RTSP
Recording Motion
Person
Sound Snapshot (jpg) Nest Cam with floodlight WebRTC Motion
Person N/A Nest Doorbell (battery) WebRTC Motion
Chime Clip Preview (mp4, gif) Nest Doorbell (wired, 1st gen) RTSP
Sound
Chime Snapshot (jpg) Nest Doorbell (wired, 2nd gen) WebRTC Motion
Chime Clip Preview (mp4, gif) Nest Hub Max RTSP
Snapshot (jpg)
All doorbells and cameras support event entities. See the Event integration documentation for more about how to use event entities in automations.
There are two classes of event entities that are available based on the above camera features:
motion for cameras that support any of the event types camera_motion , camera_person , or camera_sound
doorbell for all cameras that are doorbells and support ring events. In the camera feature table above, this capability is listed as “Chime”.
Nest event entities are updated immediately when an event message is received
without waiting for any media to be fetched. See Device Triggers for media support.
The Google Nest integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set fan timer ( nest.set_fan_timer )
Sets the Nest thermostat fan to run for a specific duration.
For an overview of every action across all integrations, see the actions reference .
The Nest integration provides device triggers to enable automation in Home Assistant. You should review the Automating Home Assistant getting started guide on automations or the Automation documentation for full details.
Device triggers will wait to fire after any media associated with the event is downloaded. Use an
event entity for immediate notifications without media.
Example Device Trigger / Event payload
This is an example of what the nest_event payload looks like for a Device Trigger that you can use to power automations.
Doorbell device trigger payloads use the doorbell_chime event, not ring .
{ "event_type" : "nest_event" , "data" : { "device_id" : "EXAMPLE_DEVICE_ID" , "type" : "doorbell_chime" , "timestamp" : "2022-01-26T04:56:54.031000+00:00" , "nest_event_id" : "EXAMPLE_EVENT_ID" , "attachment" : { "image" : "/api/nest/event_media/DEVICE_ID/EVENT_ID/thumbnail" , "video" : "/api/nest/event_media/DEVICE_ID/EVENT_ID" , } "zones" : [ "Zone 1" ], }, }
device_id : The Home Assistant device identifier for the camera
nest_event_id : is an opaque identifier that identifies the event.
attachment : May be present if the device supports snapshots or clips and depends on the device’s capabilities. This is a URL where media can be fetched from the media source.
zones : Zones triggering the event if available. Zones are configured in the Google Home App, though not supported by all cameras. Events in the area outside of a named zone will be an empty zone name.
Continue reading below to Media Source Attachments to see how to use media with notification actions.
Allow Home Assistant to know when there’s a camera event
Allow Home Assistant to know when there’s a doorbell event
Other permissions and notification settings in the Nest or Google Home apps .
The Google Home App Notifications settings control not only which notifications are sent to your phone,
but also what gets published to the Pub/Sub feed.
For example, if you enable Away-only notifications , Home Assistant will only receive events when your phone is away from home.
Another thing that may not be intuitive, is that seeing the event in your device history does not mean it was published to the feed.
However, if you are getting push notifications, the settings are likely working.
Note: The exact settings and effect they have on the feed may vary by camera model or app version.
If you are still not getting notifications, you can read this [troubleshooting guide from Google]
( https://support.google.com/googlenest/answer/9230439#zippy=%2Cyour-camera-detected-something-but-you-didnt-get-a-camera-alert )
Google Home App Setting Notes Notifications: Push Required for any detection event to be published Notifications: Away-Only Events will only be published when a user is detected as away from home Seen: Motion Required for Motion events to be published Seen: Person Required for Person events to be published
The Nest media source platform allows you to browse clips for recent camera events. Home Assistant is not intended to be a Network Video Recorder (NVR) platform, however, basic support for capturing recent events is supported.
The table above describes which devices support image snapshots or 10-frame mp4 video clips.
The Media Source APIs can be used in Companion App Attachments for Notifications as actions for Device Triggers above like Doorbell Pressed . You will need to be familiar with both the Media Sources supported for your camera, as well as the media capabilities of the companion apps.
/api/nest/event_media/DEVICE_ID/EVENT_ID : Media for the event, which supports image snapshots (jpg) or clip previews (mp4) depending on the camera type.
/api/nest/event_media/DEVICE_ID/EVENT_ID/thumbnail : A thumbnail preview of the media, which supports image snapshots (jpg) or clip previews (gif) depending on the camera type.
You can use the Nest Device Trigger payload fields attachment.image or attachment.video in an automation to send a notification from an actions as shown in the examples below.
Example Action: Clip Preview (mp4) attachment for Android or iOS
Example for cameras that support Clip Previews used with iOS which can render video in notifications.
action : notify.mobile_app_iphone data : message : Doorbell Pressed title : Someone pressed the doorbell data : image : " {{ trigger.event.data.attachment.image }}" video : " {{ trigger.event.data.attachment.video }}"
Example Action: Clip Preview thumbnail (gif) for Android or iOS
Example for cameras that support Clip Previews, but transcoded to an animated gif (Android does not render video notifications).
action : notify.mobile_app_android data : message : Doorbell Pressed title : Someone pressed the doorbell data : image : " {{ trigger.event.data.attachment.image }}"
Example Action: Snapshot (jpg) attachment for Android or iOS
Example for cameras that support Snapshot (jpg) on either Android or iOS.
action : notify.mobile_app data : message : Doorbell Pressed title : Someone pressed the doorbell data : image : " {{ trigger.event.data.attachment.image }}"
Based on the events you’ve selected to share from this device, allow Home Assistant to access camera video clips
Based on the events you’ve selected to share from this device, allow Home Assistant to access camera snapshots
There are limitations to which Google accounts can use the SDM API. See the Device Access Registration documentation for details.
The primary limitations are the following:
Google Workspace accounts are not supported. Only consumer accounts (for example, gmail.com) can be used.
Once a Google Account is associated with your Device Access Project, it cannot be changed. Be sure you are signed in to the correct Google Account before continuing.
Keep in mind, the US$5 registration fee is non-refundable.
The “Restricted” API scopes required for device control are automatically blocked for Google Advanced Protection Program users.
Important
Workaround: If you have enabled AP, create and use a secondary, standard Google Account (non-AP) to host the devices:
Create a new Google Account without Advanced Protection (if you don’t have one already).
Create a new Home in the Google Home app using this new account.
Remove your Nest devices from your main account and re-add them to this new Home . Note that this may delete saved video history or settings for some devices.
Invite your main account (the one with AP) as a Family Member to the new Home . This allows you to retain control in the Google Home app on your phone.
Connect Home Assistant using the new standard account credentials.
*[AP]: Advanced Protection Program
Migrating your cameras to the Google Home App converts cameras from RTSP to WebRTC, which results in the loss of snapshot functionality. Additionally, there is a known issue where media is not currently published for these events; this has been reported to the Nest SDM team and is an unexpected side effect of their migration.
Additional Nest temperature sensors are not supported by the SDM API. The temperature reported by the API will be pulled from whichever device is currently configured as the Active Sensor, which can be adjusted via manual selection or the schedule offered in the Nest App. If multiple sensors are available, only the temperature from the active sensor will be displayed.
Symptom: Can’t link to [Project Name]: Please contact [Project Name] if the issue persists Description
The error Can’t link to [Project Name] typically means that the OAuth Client ID used is
mismatched in Home Assistant Application Credentials .
Resolution
The simplest approach is to remove Application Credentials from Home Assistant and then verify
that the OAuth Client ID used must be consistent across these three places:
Google Cloud Console - See instructions above to create new Web Auth OAuth Credentials if needed.
Device Access Project - The OAuth Client ID for your Device Access Project must refer to the Web Auth OAuth Client ID in the Google Cloud Console.
Make sure you are using the same Google Account in the Device Access Console and Google Cloud Console. For example, double-check the photo and account name in the top right of the screen.
Application Credentials - Home Assistant needs to be configured with the same credentials. Delete any existing entries if they do not match, then either manually enter or re-enter as part of the setup.
Symptom: No access to partner information or Information could not be retrieved Description
The error No access to partner information or Information could not be retrieved shown
during the account linking process means that the Google Account used cannot access the Google Home.
You can organize your homes and devices in the Google Home App and share homes and devices across accounts. Ensure the account being used has access to the Home.
If you formerly had a Nest account, ensure that it is migrated successfully to a Google Account. If your Google Home has multiple members, the individual who initially set up the home must complete the migration of their Nest Account to a Google Account before you can establish a connection with Home Assistant.
Symptom: Error 400: redirect_uri_mismatch Description
This error Error 400: redirect_uri_mismatch means that your OAuth Client ID is not configured to match the My Home Assistant callback URL. Home Assistant’s redirect URL behavior may have changed since you initially set this up!
For users with a default configuration:
This should show the redirect URI https://my.home-assistant.io/redirect/oauth in the error message. If the error message has a different URL, then you are running an older version of Home Assistant need to upgrade or manually disabled My Home Assistant (see below).
Go back to the API Console and select your OAuth 2.0 Client ID .
Add the URL https://my.home-assistant.io/redirect/oauth to the list of Authorized redirect URIs and click Save and start the flow over.
For users who have manually disabled My Home Assistant :
Google applies strict Redirect URI validation rules to keep your login credentials secure. In practice, this means that you must access Home Assistant over SSL and a public top-level domain . See the documentation on Securing and note that you don’t actually need to enable remote access.
If you don’t have My Home Assistant on your installation,
you can use <HOME_ASSISTANT_URL>/auth/external/callback as the redirect URI
instead.
The <HOME_ASSISTANT_URL> must be the same as used during the configuration/
authentication process.
Symptom: Something went wrong: Please contact the developer of this app if the issue persists Description
This typically means you are using the wrong type of credential or have credentials
mixed up between accounts.
Make sure the credential in the Google Cloud Console is a Web Application credential following the instructions above. If you have multiple Google accounts logged into the current browser session, Google may default to the first logged in account while switching between pages. To avoid this, log out of other accounts or use a private/incognito browser window with only the desired Google account logged in.
Symptom: Something went wrong, please try again in a few minutes Description
According to Google’s Partner Connections Manager Error Reference , this error covers all other undocumented internal errors within Partner Connections. One of the issues that cause this error is synchronization problems between the Nest and Google Home apps.
Confirm that your Nest device is visible within the Google Home App and Nest App under the same Home. If it is missing within Google Home, create a new dummy home on the Nest app, which triggers the synchronization process. (This is the workaround recommended by the Google support team). The dummy entry can be deleted once the Nest device is visible within the Google Home app.
Symptom: Error 403: access_denied or Access blocked: home-assistant.io has not completed Google’s verification process Description
The error Error 403: access_denied means that the OAuth Consent screen may be misconfigured,
either because it does not allow access to your Google Account or because you have entered
extra information that triggered Google’s verification process. Google will require
verification when you add extra information to the branding page.
Visit the OAuth Verification Center and
confirm the Verification Status is Verification not required . If verification
is required:
Navigate to the Branding page.
Remove additional fields that are not required and Save. See the set up instruction above and
make sure not to enter extra fields.
Go back to the Verification Center and confirm the status is correct.
Additionally you need to make sure the Audience configuration is correct by following these steps:
Visit the OAuth Audience page.
Make sure the account is set to In production .
You may now repeat the integration setup and account linking steps.
Symptom: Error: invalid_client no application name Description
The error Error: invalid_client no application name means the OAuth Consent screen has not been
fully configured for the project and needs additional information.
Visit the OAuth Consent Screen and
enter the required fields (App Name, Support Email, Developer Email) and leave everything else as default.
Symptom: Devices do not appear in Home Assistant Description
This typically means that Home Assistant does not have access to the device because it was not returned
from the SDM API.
You can manage the devices and permissions shared with Home Assistant in the Nest Partner Connections Manager . Home Assistant automatically updates to reflect any changes you make. For more details, refer to the SDM API Troubleshooting documentation.
Symptom: Thermostats do not appear in Home Assistant or are unavailable
There have been reports that Thermostats may not appear or are unavailable due to a bug in the SDM API. A common fix to get the API to work again is to try these steps:
Restart the Thermostat device. See How to restart or reset a Nest thermostat for more details.
In the official Nest app or on https://home.nest.com : Move the Thermostat to a different or fake/temporary room.
Home Assistant automatically updates to reflect any changes you make and will discover new devices that appear in the API.
Symptom: Devices do not appear when the API is disabled Description
The SDM API may not return devices for the authorized account when the SDM API is disabled.
Double-check that GCP is configured correctly and Enable the API and authorize at least one device in the OAuth setup flow. If you have trouble here, then you may want to walk through the Google instructions and issue commands directly against the API until you successfully get back the devices.
Symptom: Re-authentication required often Description
You may be asked to reauthenticate more often than you expect, such as every 7 days. This means an OAuth Consent Screen is misconfigured, or your authentication token was revoked by Google for some other reason.
This most likely reason is the OAuth Consent Screen is set to Testing by default which expires the token after 7 days.
Follow the steps above to set it to Production to resolve this and reauthorize your integration one more time to get a new token.
You may also see this as the error message invalid_grant: Token has been expired or revoked .
See Google Identity: Refresh token expiration for more reasons on why your token may have expired.
Symptom: Configuration error: Failed to create subscriber subscription/name was not found Description
The integration fails to start because it attempts to create a subscriber with a subscription
name that is not found in your Google Account. By default, Google pub/sub subscriptions will be deleted after 31 days of inactivity ( reference ). If this happens, then the integration will fail, and you will see the preceding log line in your Home Assistant logs.
Resolution.
To repair the subscriber:
Go to the Device Access Console and re-enable the Pub/Sub topic.
The Nest integration may need to be recreated to pick up the new Pub/Sub topic.
(Optional) To prevent future expirations, go to your Google Cloud Console Pub/Sub subscription page and edit the Pub/Sub subscription created by Nest to not expire by default.
Symptom: Not receiving camera motion and person events
The Nest integration subscribes a Google Pub/sub subscription to listen for camera motion
or person events. The settings in the Google Home app also control which events
are published, so if they are not set properly you may not receive events.
Verify that you have allowed Home Assistant to access camera streams, and permissions are correctly set in Partner Connections Manager .
If you are then still not seeing events, it’s possible you need to adjust the Google Home App settings. Refer to the Google Home App Notification Settings for details.
Symptom: Devices not receiving updated information Description
You may see changes in Google Home that are unexpectedly not reflected in Home Assistant. The Nest integration subscribes to updates from a Google Pub/sub subscription and problems with stale information
usually indicate a problem with subscriber configuration.
Changes for things like sensors or thermostat temperature set points should be instantly published to a topic and received by the Home Assistant subscriber when everything is configured correctly.
To learn more about how Google Pub/Sub works see the Pull subscription workflow documentation . The steps in the following section will:
Verify the Nest Device Access Console is configured with a Pub/Sub topic for publishing messages
(Optional) Verify topic message publishing. These steps are available for some topic configurations.
Verify Pub/Sub subscription message routing
Verify Home Assistant is receiving messages on the Pub/Sub subscription
Verify the Nest Device Access Console configuration
Visit the Device Access Console
Click the Home Assistant device access project
Verify the Pub/Sub topic is Enabled . If not, follow the integration configuration instructions.
If the Pub/Sub topic starts with projects/<your cloud project>/topics/home-assistant- then you are using a topic created by Home Assistant. You may follow the steps in the next section to verify the topic.
If the Pub/Sub topic starts with projects/sdm-prod/topics then you are using a topic created by the Device Access console. This is the old way, but works completely fine. You should skip the next section.
(Optional) Verify topic message publishing. Skip this section if using a topic name starting with projects/sdm-prod/topics
Visit the Pub/Sub Topics Cloud Console
Click the Home Assistant Topic ID matching the Device Access Console configuration.
View the Subscriptions tab and confirm there is a Subscription ID. This will be verified in the next section.
Click the Metrics tab and set the zoom to 6 hours or 1 day .
View the Published message count . This counts messages published by the device to the topic. If the number of messages is not what you expect then it indicates:
A problem with the device connecting to Google: Verify the device works in the Google Home App.
An issue with the SDM API: This requires Device Access Support to diagnose or address.
Visit the Pub/Sub Subscriptions Cloud Console
Click the Home Assistant Subscription ID
Confirm the Topic name is the same as in the Nest Device Access Console above.
View the Metrics tab in the bottom panel, which includes:
Delivery metrics : The Publish message count shows messages are published on the topic that are routed to the subscription. You may need to scroll down to see this.
Oldest unacked message age shows messages not being fully received by the Home Assistant nest integration. See the next section for diagnosing this.
Click the Messages tab
Click Pull to see a sample of received messages published on the topic. These correspond to messages optionally verified by the Published message count in the previous section. If there are no messages published then it indicates either:
A Subscription misconfiguration: Confirm the Topic ID matches the Device Access Console. If they do not match, then follow the integration configuration instructions to resolve this.
Click the arrow for a received message to View all row content to make it easier to see the full contents of the received messages. You may confirm the message contains the information you expect to see and corresponds with messages received by Home Assistant in the next section.
Verify Home Assistant is receiving messages
Enable debug logs for the Nest integration. See Debug logs and diagnostics for instructions.
View the raw logs
Successfully received event messages will appear in debug logs similar to the following:
Example debug log: Received 1 message
2025-11-08 09:15:57.620 DEBUG (MainThread) [google_nest_sdm.streaming_manager] Received 1 messages
2025-11-08 09:15:57.621 DEBUG (MainThread) [google_nest_sdm.event] EventMessage raw_data={'eventId': 'xxxxxx-yyyy-zzzz-aaaa', 'timestamp': '2025-11-08T17:15:56.470930Z', 'resourceUpdate': {'name': 'enterprises/...'}}
2025-11-08 09:15:57.621 DEBUG (MainThread) [google_nest_sdm.device] Processing update xxxxxx-yyyy-zzzz-aaaa @ 2025-11-08 17:15:56.470930+00:00
2025-11-08 09:15:57.621 DEBUG (MainThread) [google_nest_sdm.device] Trait update {'sdm.devices.traits.ThermostatMode': {'mode': 'COOL', 'availableModes': ['HEAT', 'COOL', 'HEATCOOL', 'OFF']}, 'sdm.devices.traits.ThermostatEco': {'availableModes': ['OFF', 'MANUAL_ECO'], 'mode': 'OFF', 'heatCelsius': 4.4444427, 'coolCelsius': 24.444443}, 'sdm.devices.traits.ThermostatTemperatureSetpoint': {'coolCelsius': 25.997345}, 'name': 'enterprises/<project id>/devices/<device_id>'}
2025-11-08 09:17:14.406 DEBUG (MainThread) [google_nest_sdm.subscriber_client] Sending streaming pull request (acking 1 messages)
Subscription pull requests are long running, and reconnect every few minutes. This is normal and you will see debug messages like API error in streaming pull and then Event stream connection established . The Pull subscription workflow documentation describes how this works in more detail. The following debug logs indicate the Subscription connection is working properly.
Example debug log: Event stream connection established
2025-11-08 09:19:50.827 DEBUG (MainThread) [google_nest_sdm.subscriber_client] API error in streaming pull: 503 The service was unable to fulfill your request. Please try again. [code=8a75]
2025-11-08 09:19:50.828 DEBUG (MainThread) [google_nest_sdm.streaming_manager] Disconnected from event stream: API error when streaming iterator: 503 The service was unable to fulfill your request. Please try again. [code=8a75]
2025-11-08 09:19:50.830 DEBUG (MainThread) [google_nest_sdm.streaming_manager] Reconnecting stream in 10.0 seconds
...
2025-11-08 09:20:00.837 DEBUG (MainThread) [google_nest_sdm.subscriber_client] Sending streaming pull request for projects/<your cloud project>/subscriptions/home-assistant-prod
2025-11-08 09:20:01.004 DEBUG (MainThread) [google_nest_sdm.streaming_manager] Event stream connection established
2025-11-08 09:20:01.004 DEBUG (MainThread) [google_nest_sdm.subscriber_client] Starting streaming iterator
Confirm the Subscription ID from the Sending streaming pull request message in the debug logs match the Subscription ID verified above in the cloud console. If they do not match, then follow the integration configuration instructions to resolve this.
When reporting issues for the Nest integration please include details such as messages published by the device and details from the debug log.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After deleting the integration, you may also want to remove any unused information in
your Google Account that was added during the set up process. See the integration
configuration instructions for how to find where OAuth credentials and Device Access projects
are configured.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Nest hub was introduced in Home Assistant 0.7, and it's used by
3.9% of the active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@allenporter
Categories
Doorbell
Hub
Back to top
