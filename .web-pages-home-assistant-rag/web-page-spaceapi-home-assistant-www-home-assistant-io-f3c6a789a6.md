---
source_url: "https://www.home-assistant.io/integrations/spaceapi"
final_url: "https://www.home-assistant.io/integrations/spaceapi"
canonical_url: "https://www.home-assistant.io/integrations/spaceapi/"
source_handle: "web:www-home-assistant-io:f3c6a789a6bc"
source_section: "integrations-spaceapi"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d9e1a04c63648f20a58d66353a87cc06e30772a0973fd3b90ad2e5eb5dc7f347"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SpaceAPI - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/spaceapi
- Final URL: https://www.home-assistant.io/integrations/spaceapi
- Canonical URL: https://www.home-assistant.io/integrations/spaceapi/
- Fetched at: 2026-06-28T03:18:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure the SpaceAPI for Home Assistant.

## Extracted Text

On this page
Configuration
Accessing the API
API version
Public access and CORS
Testing the endpoint
Examples
Eastermundigen
Related topics
The Space API integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allow Hackerspaces and Makerspaces to expose information to web apps or any other application with the SpaceAPI . It does this by exposing an API on Home Assistant that hosts the JSON payload that SpaceAPI uses.
To set up the spaceapi integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry spaceapi : space : HACKERSPACE_NAME logo : URL_FOR_LOGO url : URL location : address : ADDRESS contact : email : EMAIL_ADDRESS issue_report_channels : - email state : entity_id : binary_sensor.front_door
Configuration Variables
Looking for your configuration file?
space string Required
Name of the Hackerspace.
logo string Required
URL which is publicly accessible of the logo.
url string Required
URL of the hackerspace’s website.
location map ( Optional )
Location of the Hackerspace.
address string Required
The physical address of the Hackerspace.
spacefed map ( Optional )
A flag indicating if the hackerspace uses SpaceFED, a federated login scheme so that visiting hackers can use the space Wi-Fi with their home space credentials.
spacenet boolean Required , default: false
Set to true or false depending on whether your space supports spacenet
spacesaml boolean Required , default: false
Set to true or false depending on whether your space uses SpaceSAML
contact map Required
Contact information of the Hackerspace. At least one entry is mandatory.
phone string ( Optional )
The phone number of the Hackerspace.
sip string ( Optional )
The SIP URI for Voice-over-IP of the Hackerspace.
keymasters list ( Optional )
Persons who carry a key and can open the space upon request. One of the fields must be specified.
name string ( Optional )
Real Name of the keymaster.
irc_nick string ( Optional )
Contact the person with this nickname directly in irc if available. The irc channel to be used is defined in the contact/irc field.
Phone number of the keymaster.
email string ( Optional )
Email address of the keymaster.
twitter string ( Optional )
X username of the keymaster.
irc string ( Optional )
The IRC channel of the Hackerspace
The X account of the Hackerspace.
facebook string ( Optional )
The facebook URL of the Hackerspace.
identica string ( Optional )
The Identi.ca or StatusNet account of the Hackerspace.
foursquare string ( Optional )
The Foursquare ID of the Hackerspace.
email string Required
The email address of the Hackerspace.
ml string ( Optional )
The mailing list of the Hackerspace.
jabber string ( Optional )
The public Jabber/XMPP multi-user chatroom of the Hackerspace.
issue_mail string ( Optional )
A separate email address for issue reports.
issue_report_channels list ( Optional )
Removed . V15 of SpaceAPI no longer supports this. The reporting channel for issues. Valid values are email , issue_mail , twitter or ml
state list Required
The current state of the Hackerspace.
entity_id string Required
The entity_id of a binary sensor that represents whether the space is currently open or closed. If the binary sensor is unavailable, the state provided will be false.
icon_open string ( Optional )
The URL which is publicly accessible of the icon for the open Hackerspace.
icon_closed string ( Optional )
The URL which is publicly accessible of the icon for the closed Hackerspace.
feeds map ( Optional )
Feeds where users can get updates of your space.
blog map ( Optional )
The blog of your Hackerspace.
type string ( Optional )
Type of the feed, for example rss, atom, ical
Feed URL
wiki map ( Optional )
The wiki of your Hackerspace.
calendar map ( Optional )
The calendar of your Hackerspace.
flicker map ( Optional )
The Flicker stream of your Hackerspace.
cache map ( Optional )
Removed . V15 of SpaceAPI no longer supports this. Specifies options about caching of your SpaceAPI endpoint. Use this if you want to avoid hundreds/thousands of application instances crawling your status.
schedule string Required
Cache update cycle. Valid values are m.02 | m.05 | m.10 | m.15 | m.30 | h.01 | h.02 | h.04 | h.08 | h.12 | d.01 |
projects list ( Optional )
Your project sites (links to GitHub, wikis or wherever your projects are hosted).
radio_show list ( Optional )
Removed . V15 of SpaceAPI no longer supports this. A list of radio shows that your hackerspace might broadcast.
name string Required
The name of the radio show.
The stream URL of the radio show.
type string Required
The stream encoder. Valid values are mp3 or ogg
start string Required
Specify the start time by using the ISO 8601 standard.
end string Required
Specify the end time by using the ISO 8601 standard.
sensors list ( Optional )
List of sensors to expose.
temperature string Required
List of temperature sensors.
humidity string Required
List of humidity sensors.
Although SpaceAPI supports many other sensors, this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] only supports temperature or humidity.
Once configured, the SpaceAPI endpoint is available at:
https://[DOMAIN_OR_IP_WITH_PORT]/api/spaceapi
Replace [DOMAIN_OR_IP_WITH_PORT] with your Home Assistant instance’s domain or IP address and port (for example: http://192.168.1.100:8123/api/spaceapi or https://homeassistant.local:8123/api/spaceapi ).
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] implements SpaceAPI version 13 (v0.13).
The SpaceAPI endpoint is publicly accessible without authentication. This is intentional, as SpaceAPI is a standard for sharing hackerspace status information with the public. Cross-origin requests ( CORS ) are also allowed, so web apps can query the endpoint directly from a browser.
You can test your SpaceAPI endpoint using curl:
curl http://YOUR_HOME_ASSISTANT_URL:8123/api/spaceapi
The response will be a JSON payload conforming to the SpaceAPI v0.13 specification, containing information about your hackerspace including status, location, contact details, and sensor data.
In this section you find some real-life examples of how to use this integration.
A possible configuration entry for Eastermundigen , a Hackerspace in Switzerland, could look like this.
# Example configuration.yaml entry spaceapi : space : Eastermundigen logo : https://eastermundigen.ch/logo.png url : https://eastermundigen.ch location : address : " Steinbruchweg 16, 3072 Ostermundigen, Schweiz" contact : phone : " +41311111111" twitter : " @eastermundigen" email : " [email protected] " issue_report_channels : - email state : entity_id : " binary_sensor.front_door" icon_open : https://eastermundigen.ch/open.png icon_closed : https://eastermundigen.ch/close.png sensors : temperature : - " sensor.temperature_in" - " sensor.temperature_out" humidity : - " sensor.humidity_in" - " sensor.humidity_out"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SpaceAPI service was introduced in Home Assistant 0.70, and it's used by
3 active installations.
Its IoT class is Calculated.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Social
Back to top
