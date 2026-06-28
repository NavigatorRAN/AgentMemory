---
source_url: "https://www.home-assistant.io/integrations/foursquare"
final_url: "https://www.home-assistant.io/integrations/foursquare"
canonical_url: "https://www.home-assistant.io/integrations/foursquare/"
source_handle: "web:www-home-assistant-io:8f138593c893"
source_section: "integrations-foursquare"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "acba70240ca13702759e92dd277411f24d06020e47e8aa2ef7ab44b33199a2a5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Foursquare - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/foursquare
- Final URL: https://www.home-assistant.io/integrations/foursquare
- Canonical URL: https://www.home-assistant.io/integrations/foursquare/
- Fetched at: 2026-06-28T02:44:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to the Foursquare API into Home Assistant.

## Extracted Text

On this page
Getting the access token
Real-Time API
Check ins
Related topics
The Foursquare integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] accepts pushes from the Foursquare Real-Time API and an action to check users in on Swarm.
To enable Foursquare, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry foursquare : access_token : " <foursquare access token>" push_secret : " <foursquare push secret>"
Configuration Variables
Looking for your configuration file?
access_token string Required
A Foursquare API access token.
push_secret string Required
The push secret that Foursquare provides to you in the app dashboard.
After you have registered your APP on your My Apps Page you get a CLIENT_ID and you have specified a
REDIRECT_URL which can be any URL you like, but since it will get your access token via an HTTP GET request, it should be a URL which will ignore the access_token HTTP GET variable. A good idea is to choose the URL of your Home Assistant.
Visit the following URL in your browser:
https://foursquare.com/oauth2/authenticate?client_id=CLIENT_ID&response_type=token&redirect_uri=YOUR_REGISTERED_REDIRECT_URI
and change the CLIENT_ID and YOUR_REGISTERED_REDIRECT_URL to your actual values.
You will receive an OAuth request landing page, asking you if you want to connect your Foursquare account to your newly created app. Say “Yes”.
After that, you will get redirected to your REDIRECT_URL with the access_token as an HTTP GET variable. Copy everything after the = and paste it in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] as the access_token .
The integration accepts pushes from Foursquare at /api/foursquare . The route does not require authentication.
Foursquare check-in events can be used out of the box to trigger automation actions, e.g.:
automation : - alias : " Trigger action when you check into a venue." triggers : - trigger : event event_type : foursquare.push actions : - action : script.turn_on target : entity_id : script.my_action
To check a user in, use the foursquare/checkin action.
Parameters:
venueId ( Required ): The Foursquare venue where the user is checking in.
eventId ( Optional ): The event the user is checking in to.
shout ( Optional ): A message about your check-in. The maximum length of this field is 140 characters.
mentions ( Optional ): Mentions in your check-in. This parameter is a semicolon-delimited list of mentions. A single mention is of the form “start,end,userid”, where start is the index of the first character in the shout representing the mention, end is the index of the first character in the shout after the mention, and userid is the userid of the user being mentioned. If userid is prefixed with “fbu-”, this indicates a Facebook userid that is being mention. Character indices in shouts are 0-based.
broadcast ( Optional ): “Who to broadcast this check-in to. Accepts a comma-delimited list of values: private (off the grid) or public (share with friends), Facebook share on Facebook, X share on X, followers share with followers (celebrity mode users only), If no valid value is found, the default is public.”
ll ( Optional ): Latitude and longitude of the user’s location. Only specify this field if you have a GPS or other device reported location for the user at the time of check-in.
llAcc ( Optional ): Accuracy of the user’s latitude and longitude, in meters.
alt ( Optional ): Altitude of the user’s location, in meters.
altAcc ( Optional ): Vertical accuracy of the user’s location, in meters.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Foursquare integration was introduced in Home Assistant 0.26, and it's used by
10 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Social
Back to top
