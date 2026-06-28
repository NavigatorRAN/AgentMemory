---
source_url: "https://www.home-assistant.io/integrations/reddit"
final_url: "https://www.home-assistant.io/integrations/reddit"
canonical_url: "https://www.home-assistant.io/integrations/reddit/"
source_handle: "web:www-home-assistant-io:5ba17a102292"
source_section: "integrations-reddit"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4d1fea6107750d8b3c13c3b481ee226ed170a4ee722ee519a569abb2a63fd1dd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Reddit - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/reddit
- Final URL: https://www.home-assistant.io/integrations/reddit
- Canonical URL: https://www.home-assistant.io/integrations/reddit/
- Fetched at: 2026-06-28T03:11:39Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate the Reddit sensor into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Reddit integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates data from Reddit to monitor your favorite subreddits.
To set up this sensor, you will need to generate a client_id and client_secret for the user account you will use to connect. Follow the first steps in this Wiki page .
Important
This integration does not support Reddit’s two-factor authentication. If you use two-factor authentication for your Reddit account, create a separate Reddit account without two-factor authentication for use with Home Assistant.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : reddit username : !secret reddit_username password : !secret reddit_password client_id : !secret reddit_client_id client_secret : !secret reddit_client_secret subreddits : - news - worldnews
Configuration Variables
Looking for your configuration file?
username string Required
Your Reddit account username.
password string Required
Your Reddit account password.
client_id string Required
Your Reddit account client ID.
client_secret string Required
Your Reddit account client secret
subreddits list Required
List of subreddits you want to get data on.
sort_by string ( Optional , default: hot )
Sort reddit posts by new , top , controversial and hot .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Reddit integration was introduced in Home Assistant 0.89, and it's used by
23 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
