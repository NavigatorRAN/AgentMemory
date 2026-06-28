---
source_url: "https://www.home-assistant.io/integrations/freedns"
final_url: "https://www.home-assistant.io/integrations/freedns"
canonical_url: "https://www.home-assistant.io/integrations/freedns/"
source_handle: "web:www-home-assistant-io:f71a405c3b6d"
source_section: "integrations-freedns"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8d4825f51b80984ac72d214cd3c10e8d35eead5a2685d7a42612d49efe4c8ffd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FreeDNS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/freedns
- Final URL: https://www.home-assistant.io/integrations/freedns
- Canonical URL: https://www.home-assistant.io/integrations/freedns/
- Fetched at: 2026-06-28T02:44:12Z
- Content type: text/html; charset=UTF-8

## Description

Keep your DNS record up to date with FreeDNS.

## Extracted Text

On this page
Setup (Default API V1)
Configuration (API V1)
Setup (API V2)
Configuration (API V2)
With the FreeDNS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] you can keep your FreeDNS record up to date.
You need to determine your update URL or your access token.
Head over to the FreeDNS website and log in to your account.
Select the menu “Dynamic DNS”
You should now see your update candidates in a table at the bottom of the page.
Copy the link target of the “Direct URL”.
The access token is the part at the end of the link: https://freedns.afraid.org/dynamic/update.php?YOUR_UPDATE_TOKEN
Either put the token as access_token or the whole URL into the url attribute.
To use the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry freedns : access_token : YOUR_TOKEN
Head over to page Version 2 , and enable the candidate.
The access token is the part at the end of the link: http://sync.afraid.org/u/RANDOMIZED_TOKEN/
Put the whole URL into the url attribute.
(Instead of using the randomized token URL in the Version 2 there are other options to use for URL)
To use the integration in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry freedns : url : http://sync.afraid.org/u/RANDOMIZED_TOKEN/
Configuration Variables
Looking for your configuration file?
access_token string ( Optional )
Your access token. This is exclusive to url .
url string ( Optional )
The full update URL. This is exclusive to access_token .
scan_interval time ( Optional , default: 10 minutes )
How often to call the update service.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FreeDNS integration was introduced in Home Assistant 0.67, and it's used by
95 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Network
Back to top
