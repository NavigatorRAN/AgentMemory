---
source_url: "https://www.home-assistant.io/integrations/google_maps"
final_url: "https://www.home-assistant.io/integrations/google_maps"
canonical_url: "https://www.home-assistant.io/integrations/google_maps/"
source_handle: "web:www-home-assistant-io:7b603a2a4414"
source_section: "integrations-google-maps"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "34796f18a75535610b1778902cd80fdf4dc5142e7e10e02bf9c4d3e8fdae9ab3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Maps - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_maps
- Final URL: https://www.home-assistant.io/integrations/google_maps
- Canonical URL: https://www.home-assistant.io/integrations/google_maps/
- Fetched at: 2026-06-28T02:46:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to use Google Maps Location Sharing to track devices in Home Assistant.

## Extracted Text

On this page
Setup
Note for existing location sharing users
Configuration
Related topics
The Google Maps integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence using the unofficial API of Google Maps Location Sharing .
You need two Google accounts. Account A is the account that has to be set up to share its location with account B. Account B is used to fetch the location of your device(s) and will be connected to this integration.
You first have to set up sharing of the location of account A through the Google Maps app on your mobile phone. Share your location with account B. You can find more information here .
Next, you have to retrieve a valid cookie from Google, while being logged in with account B. Log in with your credentials of account B on Google Maps with a PC with Firefox or Chrome. Make sure to use the .com TLD (e.g., maps.google.com), otherwise the cookie won’t be able to provide a valid session. After you have properly authenticated, you can retrieve the cookie with either Export cookies for Firefox (make sure that “Prefix HttpOnly cookies” is unchecked) or get_cookies.txt locally for Chrome/Chromium.
Save the cookie file to your Home Assistant configuration directory with the following name: .google_maps_location_sharing.cookies. followed by the slugified username of the NEW Google account (account B).
For example: If your email address was [email protected] , the filename would be: .google_maps_location_sharing.cookies.location_tracker_gmail_com .
If you already have other people sharing their location with your existing Account A and do not wish to ask them to also share their location with a new Account B. Simply repeat the steps above to obtain a valid cookie from Google for Account A. Then add both accounts to the device tracker configuration (don’t forget to include the multiple cookie files, one for each account being added to the integration).
# Example configuration.yaml entry device_tracker : - platform : google_maps username : " ACCOUNT_A_EMAIL" - platform : google_maps username : " ACCOUNT_B_EMAIL"
Note
If using more than one account, your device may appear twice. However, the parameters returned from Account A will not include a value for battery_level or entity_picture . These parameters will be present in the device tracker entity from Account B. Therefore, disregard the device tracker entity that is missing those parameters.
To integrate Google Maps Location Sharing in Home Assistant, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : google_maps username : " YOUR_EMAIL"
Once enabled and you have rebooted devices discovered through this integration will be listed in the known_devices.yaml file within your configuration directory.
They will be created with identifiers like google_maps_<numeric_id> . To be able to properly track entities you must set the track attribute to true .
Configuration Variables
Looking for your configuration file?
username string Required
The email address for the Google account that has access to your shared location.
max_gps_accuracy float ( Optional )
Sometimes Google Maps can report GPS locations with a very low accuracy (few kilometers). That can trigger false zoning. Using this parameter, you can filter these false GPS reports. The number has to be in meters. For example, if you put 200 only GPS reports with an accuracy under 200 will be taken into account - Defaults to 100km if not specified.
scan_interval integer ( Optional , default: 60 )
The frequency (in seconds) to check for location updates.
As of release 0.97 Google passwords are no longer required in your configuration. Users coming from earlier releases should only remove the password entry from their configuration file (username is still required) and restart Home Assistant. The cookie file previously generated should still be valid and will allow the tracker to continue functioning normally until the cookie is invalidated.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Maps integration was introduced in Home Assistant 0.67, and it's used by
353 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
