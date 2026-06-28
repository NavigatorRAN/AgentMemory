---
source_url: "https://www.home-assistant.io/integrations/ebox"
final_url: "https://www.home-assistant.io/integrations/ebox"
canonical_url: "https://www.home-assistant.io/integrations/ebox/"
source_handle: "web:www-home-assistant-io:59b0d3d8c911"
source_section: "integrations-ebox"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cbb50500c718b1431d8b0e8381c8514e763b2d02087e396f35176bc6758bf9d8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# EBox - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ebox
- Final URL: https://www.home-assistant.io/integrations/ebox
- Canonical URL: https://www.home-assistant.io/integrations/ebox/
- Fetched at: 2026-06-28T02:38:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate EBox data usage within Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
Integrate your EBox account information into Home Assistant.
To use your EBox sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : ebox username : MYUSERNAME password : MYPASSWORD monitored_variables : - before_offpeak_download - before_offpeak_upload - before_offpeak_total
Configuration Variables
Looking for your configuration file?
username string Required
Your EBox username.
password string Required
Your EBox password.
name string ( Optional , default: EBox )
The name of the sensor.
monitored_variables list Required
Variables to monitor.
before_offpeak_download
Download before offpeak usage
before_offpeak_upload
Upload before offpeak usage
before_offpeak_total
Total before offpeak usage
offpeak_download
Download offpeak usage
offpeak_upload
Upload offpeak usage
offpeak_total
Total offpeak usage
download
Download usage
upload
Upload usage
total
Total usage
balance
Account balance
limit
Limit usage
usage
Percent usage
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EBox integration was introduced in Home Assistant 0.39, and it's used by
3 active installations.
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
