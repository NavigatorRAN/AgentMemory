---
source_url: "https://www.home-assistant.io/integrations/google_assistant"
final_url: "https://www.home-assistant.io/integrations/google_assistant"
canonical_url: "https://www.home-assistant.io/integrations/google_assistant/"
source_handle: "web:www-home-assistant-io:b2f6d0691d1f"
source_section: "integrations-google-assistant"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "785c87bdd00bb8980d2ddb108e3e472bf2cad01a3d348302859d3a316bf15543"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Assistant - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_assistant
- Final URL: https://www.home-assistant.io/integrations/google_assistant
- Canonical URL: https://www.home-assistant.io/integrations/google_assistant/
- Fetched at: 2026-06-28T02:46:28Z
- Content type: text/html; charset=UTF-8

## Description

Setup for Google Assistant integration

## Extracted Text

On this page
Automatic setup via Home Assistant Cloud
Manual setup (if you don’t have Home Assistant Cloud)
Prerequisites
Google Cloud Platform configuration
Allow other users
Utilize device sync
Enable local fulfillment
YAML configuration
Available domains
Secure devices
Room/Area support
Climate operation modes
TV Channels
Troubleshooting
Unlink and relink
Failed linking - Could not update the setting. Please check your connection
The Google Assistant integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Home Assistant devices via Google Assistant on your mobile, tablet, or Google Home device.
If you want to send commands to Google Assistant to control devices supported by Google Assistant but not by Home Assistant, or broadcast messages to Google Assistant speakers and displays without interrupting music/video playback, take a look at the Google Assistant SDK integration.
With Home Assistant Cloud , you can connect your Home Assistant instance in a few simple clicks to Google Assistant. With Home Assistant Cloud you don’t have to deal with dynamic DNS, SSL certificates, or opening ports on your router. Just log in via the user interface and a secure connection with the cloud will be established. Home Assistant Cloud requires a paid subscription after a 30-day free trial.
For Home Assistant Cloud users, documentation can be found here .
The Google Assistant integration (without Home Assistant Cloud) requires a bit more setup than most due to the way Google requires Assistant Apps to be set up.
To use Google Assistant, your Home Assistant configuration has to be externally accessible with a hostname and SSL certificate .
If you haven’t already configured that, you should do so before continuing.
If you make DNS changes to accomplish this, ensure you have allowed up to the full 48 hours for DNS changes to propagate, otherwise, Google may not be able to reach your server.
Once you have confirmed you can reach your Home Assistant from outside your home network, you can set up the Google integration:
Create a new project in the Google Home Developer Console .
Select Create a Project
On the Get started page, select Create project .
Give your project a name and select Create project .
Save your Project ID (it’s under the main project name) for use below.
Select Add a Cloud-to-Cloud integration .
In the bottom right corner, select Next: Develop , then select Next: Setup .
Select all applicable device types (you can select them all).
Create an app icon 144 x 144 pixels and upload it.
Under Account Linking , in the OAuth Client ID field, enter https://oauth-redirect.googleusercontent.com/r/[YOUR_PROJECT_ID] .
Replace [YOUR_PROJECT_ID] with your project ID from above.
Fill in the details:
In the Client Secret field, add any string (without special characters).Home Assistant doesn’t need this field.
In the Authorization URL field, enter https://[yourdomain:port]/auth/authorize .
In the Token URL field, enter https://[yourdomain:port]/auth/token .
In the Cloud fulfillment URL field, enter https://[yourdomain:port]/api/google_assistant .
For now, skip Local fulfillment and App Flip .
Under Scope(s) , enter email . Select Add scope and enter name .
Leave the checkbox Have Google transmit Client ID and secret via HTTP basic auth header unchecked/cleared.
Select Save .
Result : You will see your project saved with the status Draft .
You do not need to test.
In the left hand menu of your project, select the Analytics link.
Select the hamburger menu on the top left and select APIs and Services .
Enable device sync ( see below for more information ).
In the left hand menu, select Credentials .
In the Credentials view, select Create credentials and next Service account .
Service account name : Give your account a self-selected name.
Select Create and Continue .
Under Select a role , select Service Accounts > Service Account Token Creator .
Select Continue and then Done .
Under Service Accounts , there should now be an account called [name from 3.2.1]@[projectname].iam.gserviceaccount.com.
Select the pencil button of that service account.
Go to Keys and Add key .
Create a private key in JSON format.
This will start a download of a JSON file.
Rename the file to SERVICE_ACCOUNT.json .
In Home Assistant, add this file to your config-folder. This will be the same folder as your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
In the navigation bar in Google Cloud, select the magnifier icon, search for Homegraph API , and select it.
Enable the HomeGraph API.
Add the google_assistant integration configuration to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file and restart Home Assistant following the configuration guide below.
Add services in the Google Home App (note that app versions may be slightly different).
Open the Google Home app.
Select the Devices tab at the bottom and select the + Add button on the bottom right corner.
In the Choose a device screen, select Works with Google Home . You should have [test] <Action Name> listed under Add new . Selecting that should lead you to a browser to log in to your Home Assistant instance, then redirect back to a screen where you can set rooms and nicknames for your devices if you wish.
Important
If you’ve added Home Assistant to your phone’s home screen, you have to first remove it from the home screen. Otherwise, this HTML5 app will show up instead of a browser. Using it would prevent Home Assistant redirecting back to the Google Home app.
If you want to allow other household users to control the devices:
Open the project you created in the Google Home Developer Console .
Select Members on the top of the page. This redirects you to the Google Cloud Platform IAM permissions page.
Select Grant access at the middle of the page.
Enter the email address of the user you want to add.
Select Select a role and choose Project > Viewer .
Copy and share the project link ( https://console.home.google.com/projects/YOUR_PROJECT_ID ) with the new user.
Have the new user open the link with their own Google account, agree to the Terms of Service popup(s).
Have the new user go to their Google Assistant app to add [test] your app name to their account.
You are now able to support active reporting of state to Google’s server (configuration option report_state ) and synchronize Home Assistant devices with the Google Home app ( google_assistant.request_sync service).
Try it with “OK Google, sync my devices” - the Google Home app should import your exposed Home Assistant devices and prompt you to assign them to rooms.
Google Assistant devices can send their commands locally to Home Assistant allowing them to respond faster.
Your Home Assistant instance needs to be connected to the same network as the Google Assistant device that you’re talking to so that it can be discovered via mDNS discovery (UDP broadcasts).
Your Google Assistant devices will still communicate via the internet to:
Get credentials to establish a local connection.
Send commands that involve a secure device .
Send commands if local fulfillment fails.
The HTTP integration must not be configured to use an SSL certificate with the ssl_certificate option .
This is because the Google Assistant device will connect directly to the IP of your Home Assistant instance and will fail if it encounters an invalid SSL certificate.
For secure remote access, use a reverse proxy such as the NGINX SSL app (formerly known as NGINX SSL add-on) instead of directing external traffic straight to Home Assistant.
Expand the Cloud-to-cloud menu on the left and select Develop , then select Edit next to your integration.
Scroll down and enable Local fulfillment
Upload JavaScript files
Download app.js from here
Select Upload your JavaScript targeting Node and upload the app.js from step 4.1.
Select Upload your JavaScript targeting Chrome (browser) and upload the same app.js from step 4.1.
Check the box Support local queries .
Add device scan configuration:
Select + Add scan configuration if no configuration exists.
For Discovery protocol select mDNS .
Set Enter mDNS service name to _home-assistant._tcp.local
Select Add field , then under Select a field , choose Name .
Enter a new Value field set to .*\._home-assistant\._tcp\.local
Scroll to bottom of page and Save your changes.
Either wait for 30 minutes, or restart all your Google Assistant devices.
Restart Home Assistant Core.
With a Google Assistant device, try saying “OK Google, sync my devices.” This can be helpful to avoid issues, especially if you are enabling local fulfillment sometime after adding cloud Google Assistant support.
You can debug the setup by following these instructions .
Now add your setup to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, such as:
# Example configuration.yaml entry google_assistant : project_id : YOUR_PROJECT_ID service_account : !include SERVICE_ACCOUNT.json report_state : true exposed_domains : - switch - light entity_config : switch.kitchen : name : CUSTOM_NAME_FOR_GOOGLE_ASSISTANT aliases : - BRIGHT_LIGHTS - ENTRY_LIGHTS light.living_room : expose : false room : LIVING_ROOM
Configuration Variables
Looking for your configuration file?
project_id string Required
Project ID from the Google Home Developer Console (looks like words-2ab12 ).
secure_devices_pin string ( Optional )
Pin code to say when you want to interact with a secure device.
service_account map Required
Service account information. You can use an include statement with your downloaded JSON file, enter data here directly or use secrets file to populate.
private_key string Required
Private key in PEM format
client_email string Required
Service email address
report_state boolean ( Optional , default: false )
Actively report state changes on entities. This speeds up response time for actions affecting multiple entities since Google Assistant knows beforehand what state they are. It is also required for some features on visual controls.
expose_by_default boolean ( Optional , default: true )
Expose devices in all supported domains by default. If exposed_domains domains is set, only these domains are exposed by default. If expose_by_default is set to false, devices have to be manually exposed in entity_config .
exposed_domains list ( Optional )
List of entity domains to expose to Google Assistant if expose_by_default is set to true. This has no effect if expose_by_default is set to false.
entity_config map ( Optional )
Entity specific configuration for Google Assistant
YOUR_ENTITY_ID map ( Optional )
Entity to configure
name string ( Optional )
Name of the entity to show in Google Assistant
expose boolean ( Optional , default: true )
Force an entity to be exposed/excluded.
aliases list ( Optional )
Aliases that can also be used to refer to this entity
room string ( Optional )
Allows for associating this device to a Room in Google Assistant.
Currently, the following domains are available to be used with Google Assistant, listed with their default types:
alarm_control_panel (arm/disarm)
binary_sensor (entities with device class: carbon_monoxide , door , garage_door , lock , moisture , opening , smoke , window )
button (scene)
camera (streaming, requires compatible camera)
climate (on/off, temperature setting, hvac_mode)
cover (on/off/set position/stop/start=toggle cover)
event (only entities with device class doorbell are supported)
fan (on/off/speed percentage/preset mode)
group (on/off)
humidifier (humidity setting/on/off/mode)
input_boolean (on/off)
input_button (scene)
input_select (option/setting/mode/value)
light (on/off/brightness/rgb color/color temp)
lawn_mower (dock/start/pause)
lock
media_player (on/off/set volume (via set volume)/source (via set input source)/control playback)
scene
script (scene)
select
sensor (entities with device class: aqi , carbon_dioxide , carbon_monoxide , humidity , pm10 , pm25 , temperature , volatile_organic_compounds )
switch (on/off)
vacuum (dock/start/stop/pause)
valve (open/close/set position/stop/start=toggle valve)
water_heater (on-off/temperature setting/operation mode)
Note
Some of these devices may not display correctly in the Google Home app, such as media_player, however voice commands will still work.
Certain devices are considered secure. This includes devices in the lock domain, the alarm_control_panel domain, as well as covers with device types door , garage , or gate .
By default, secure devices cannot be opened by Google Assistant unless a secure_devices_pin code is set up. To allow opening, set the secure_devices_pin to something. You will then be prompted to speak the pin when opening the device. Closing or locking these devices does not require a pin.
If a code is set for the Alarm control panel, it must be the same as the secure_devices_pin . If code_arm_required is set to false , the system will arm without prompting for the pin.
Entities that have not been explicitly assigned to rooms but have been placed in Home Assistant areas will return room hints to Google with the devices in those areas.
Some devices, such as scene or script , must be assigned to an area before other members of a shared Google Home Household can use them. This is because household members in a shared Google Home will not be able to view devices that are not assigned to a room unless they were the user who linked the service to Google Home. This issue isn’t immediately apparent because script and scene devices aren’t visible in the main Google Home dashboard.
The automatic room assignment will not work when multiple homes are set up in your Google account.
There is not an exact 1-1 match between Home Assistant and Google Assistant for the available operation modes.
Here are the modes that are currently available:
off
heat
cool
heatcool (auto)
fan-only
dry
eco
There is no TV channel object in Home Assistant. TV channel can only be changed by number, not by name (for example, Turn to channel two ).
Some of the troubleshooting steps below reference the legacy Actions on Google console . This console is separate from the Google Home Developer Console used in the setup steps above. If you configured the integration following the current setup instructions, your project lives in the Google Home Developer Console and some of the legacy steps may not apply.
404 errors on request sync
Syncing from Google Assistant may fail after a period of time, likely around 30 days, due to the fact that your Actions on Google app is technically in testing mode and has never been published. Eventually, it seems that the test expires. Control of devices will continue to work but syncing may not. If you say “Ok Google, sync my devices” and get the response “Unable to sync Home Assistant” (or whatever you named your project), this can usually be resolved by going back to your test app in the Actions on Google console and clicking Simulator under TEST . Regenerate the draft version Test App and try asking Google to sync your devices again. If regenerating the draft does not work, go back to the Action section and just hit the enter key for the URL to recreate the Preview.
Syncing from Home Assistant will always work and will automatically update entity changes.
The request_sync service requires that the initial sync from Google includes the agent_user_id . If not, the service will log an error that reads something like “Request contains an invalid argument”. If this happens, then unlink the account from Home Control and relink.
The request_sync service may fail with a 404 if the project_id of the HomeGraph API differs from the project_id of the Actions SDK found in the preferences of your project on Actions on Google console . Resolve this by:
Removing your project from the Google Cloud API Console .
Add a new project to the Actions on Google console Here you get a new project_id .
Run through the previously mentioned [Actions on Google console] setup instructions until the step to create a service_account .
Once you begin to create a new service_account in the [Google Cloud API Console], ensure you select the project created in [Actions on Google console] by verifying the project_id .
Enable HomeGraph API to the new project.
Verify that the Google Assistant is available on https://[YOUR HOME ASSISTANT URL:PORT]/api/google_assistant If it is working it should return 405: Method Not Allowed when opened in a browser or via curl.
403 errors on request sync
The request_sync action may fail with a 403 if the HomeGraph API is not enabled. Go to Google API Console and verify that HomeGraph API is enabled for your project.
404 errors on report state
If you receive 404 errors linked to reporting state in your log, Home Assistant is reporting state for entities that were never synced to Google. Ask your Google Home to Sync my devices or run the google_assistant.request_sync action.
Error during linking: “Could not update the setting. Please check your connection”
Your Cloud fulfillment URL may be invalid or unreachable. Recheck the Cloud fulfillment URL as specified in Manual setup and verify that it’s publicly reachable.
500 / 429 error on request sync
This error may occur if the service key is invalid. Try deleting and creating a new service account and key.
NGINX
When using NGINX, ensure that your proxy_pass line does not have a trailing / , as this will result in errors. Your line should look like:
proxy_pass http://localhost:8123;
If you’re having trouble with Account linking failed after you unlinked your service, try clearing the browser history and cache.
If you’re having trouble linking your account, with the error message Could not update the setting. Please check your connection after logging into your Home Assistant instance, try setting expose_by_default: false then exposing a single simple device (light or switch preferably). It is also worth checking if any home ad blocker is disabled if you are having issues.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Assistant system was introduced in Home Assistant 0.56, and it's used by
3.6% of the active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Voice
Back to top
