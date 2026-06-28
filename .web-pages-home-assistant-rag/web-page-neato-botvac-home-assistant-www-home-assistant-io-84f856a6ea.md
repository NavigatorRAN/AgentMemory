---
source_url: "https://www.home-assistant.io/integrations/neato"
final_url: "https://www.home-assistant.io/integrations/neato"
canonical_url: "https://www.home-assistant.io/integrations/neato/"
source_handle: "web:www-home-assistant-io:84f856a6eadc"
source_section: "integrations-neato"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "222185effc9a1806bb0440293915c9b072b24424fabb7be15cca401c71d6fcda"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Neato Botvac - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/neato
- Final URL: https://www.home-assistant.io/integrations/neato
- Canonical URL: https://www.home-assistant.io/integrations/neato/
- Fetched at: 2026-06-28T03:02:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Neato within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Button
Vacuum
Actions
Troubleshooting
My robot is unavailable
My robot is not detected by Home Assistant
There is a warning about a bad response but everything works as expected
Server got itself in trouble
There is an active alert for this integration!
LEARN MORE
The Neato integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Neato Botvac Connected Robots .
Important
Vorwerk is phasing out Neato cloud services. On 6 October 2025, they announced that the cloud platform can no longer be maintained in a reliable and future-proof way.
Because the Neato Developer Network is no longer available, you can no longer set up this integration as a new installation. Existing setups may continue to work until the cloud is fully shut down.
There is support for the following platform types within Home Assistant:
Camera - allows you to view the latest cleaning map.
Sensor - allows you to view the battery level.
Switch - allows you to enable or disable the schedule.
Button - allows you to dismiss an alert visible in the app.
Previously, you would visit the Neato Developer Network to create a new app and obtain credentials. The Neato Developer Network is no longer available, so new credentials can no longer be created. The steps below are kept for reference for users who already have existing credentials.
You will have to enter a name, a description, and the redirect URI:
Name : can be anything you like, for example, “Home Assistant”.
Description : can be anything you like, for example, “Home Assistant integration for Neato”
Redirect URI : https://my.home-assistant.io/redirect/oauth
Terms Of Service URL : leave blank
Privacy Policy URL : leave blank
You have to select all three scopes ( public_profile , control_robots and maps ).
I have manually disabled My Home Assistant
If you don’t have My Home Assistant on your installation,
you can use <HOME_ASSISTANT_URL>/auth/external/callback as the redirect URI
instead.
The <HOME_ASSISTANT_URL> must be the same as used during the configuration/
authentication process.
Internal examples: https://192.168.0.2:8123/auth/external/callback , https://homeassistant.local:8123/auth/external/callback .”
Your instance must be accessible via HTTPS. However, your
instance does not need to be exposed to the Internet.
To add the Neato Botvac hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Neato Botvac .
Follow the instructions on screen to complete the setup.
The integration configuration will ask for the Client ID and Client Secret created above. See Application Credentials for more details.
Note
After the update to firmware 4.0 (which adds cleaning maps) there is also support for displaying the maps of the Botvac D3 Connected and Botvac D5 Connected robots. More information on how to update can be found here .
Each neato vacuum has a Dismiss alert button. This allows you to dismiss an alert visible in the app (e.g. dust bin full) and preventing the vacuum to start cleaning.
The neato vacuum platform allows you to control your Neato Botvac Connected .
The status will contain attributes on the robots last clean session.
Currently supported actions are:
start
pause
stop
return_to_base
locate
clean_spot
And a specific integration-specific action:
neato.custom_cleaning
Action: Custom cleaning
The neato.custom_cleaning action starts a custom cleaning of your house. You can set the various options like in the mobile application (mode, map usage, navigation mode, zone).
Not all Botvac models support all the attributes. Only the Neato Botvac D7 supports the zone attribute.
Some information about the capabilities might be found on the Neato Developer Portal .
Data attribute Optional Description entity_id no Only act on a specific robot mode yes Set the cleaning mode: 1 for eco and 2 for turbo. Defaults to turbo if not set. navigation yes Set the navigation mode: 1 for normal, 2 for extra care, 3 for deep. Defaults to normal if not set. Deep cleaning is only supported on the Botvac D7. category yes Whether to use a persistent map or not for cleaning (that is, No go lines): 2 for no map, 4 for map. Default to using map if not set (and fallback to no map if no map is found). zone yes Only supported on the Botvac D7. Name of the zone to clean from the Neato app. Use unique names for the zones to avoid the wrong zone from running. Defaults to no zone, that is, complete house cleanup.
Try to restart the vacuum and wait about 5 minutes to see if it is no longer unavailable. If you are still having issues check the Neato app and make sure your robot is connected and working. If it is not then follow the steps in the app to reset your robot and give it the same name as before then restart Home Assistant.
Please check your logs if there are any warnings. When there is a message about your robot being offline, check if it is connected to the internet and available though the app. If there is a message about a bad response, try to reset this robot via your app.
Do you have a stale robot in your configuration? Try to look into your account and delete any stale robots. If these warnings are about actively used robots, please report an issue to help us solving this problem.
If you see this message after trying to set up Neato, please check if the setup still worked or not. If not, try again and make sure you start the process only once. Do not click the “Open External Page” button if a page has already opened by itself. Be patient and wait for the setup to complete.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Neato Botvac hub was introduced in Home Assistant 0.33, and it's used by
201 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Camera
Sensor
Switch
Back to top
