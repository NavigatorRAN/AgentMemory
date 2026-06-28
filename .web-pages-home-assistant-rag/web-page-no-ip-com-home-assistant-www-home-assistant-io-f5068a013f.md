---
source_url: "https://www.home-assistant.io/integrations/no_ip"
final_url: "https://www.home-assistant.io/integrations/no_ip"
canonical_url: "https://www.home-assistant.io/integrations/no_ip/"
source_handle: "web:www-home-assistant-io:f5068a013ff0"
source_section: "integrations-no-ip"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "04c2a687aba2e2852519c3e7ebd671fe86ad99bb296fadd03088aab2806ad5c2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# No-IP.com - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/no_ip
- Final URL: https://www.home-assistant.io/integrations/no_ip
- Canonical URL: https://www.home-assistant.io/integrations/no_ip/
- Fetched at: 2026-06-28T03:03:38Z
- Content type: text/html; charset=UTF-8

## Description

Keep your computer registered with the NO-IP.com dynamic DNS.

## Extracted Text

On this page
Related topics
With the No-IP.com integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] you can keep your current IP address in sync with your NO-IP.com hostname or domain.
Note that it does not confirm your hostname (as is required periodically for free domain names); you will still need to do that manually.
To use the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry no_ip : domain : subdomain.domain.com username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
domain string Required
Your fully qualified domain name (FQDN).
username string Required
The generated username for this DDNS record.
password string Required
The generated password for this DDNS record.
timeout integer ( Optional , default: 10 )
Timeout (in seconds) for the API calls.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The No-IP.com integration was introduced in Home Assistant 0.57, and it's used by
404 active installations.
Its IoT class is Cloud Polling.
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
