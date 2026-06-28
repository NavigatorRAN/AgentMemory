---
source_url: "https://www.home-assistant.io/integrations/fido"
final_url: "https://www.home-assistant.io/integrations/fido"
canonical_url: "https://www.home-assistant.io/integrations/fido/"
source_handle: "web:www-home-assistant-io:a406840e4d6f"
source_section: "integrations-fido"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "265a1ae1ddbc777dae60787922ef4885aa775408515596932b9964e48bbd7f35"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Fido - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fido
- Final URL: https://www.home-assistant.io/integrations/fido
- Canonical URL: https://www.home-assistant.io/integrations/fido/
- Fetched at: 2026-06-28T02:42:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Fido data usage within Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
Integrate your Fido account information into Home Assistant.
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : fido username : MYUSERNAME password : MYPASSWORD monitored_variables : - fido_dollar - balance - data_used
Configuration Variables
Looking for your configuration file?
username string Required
Your Fido username (your Fido phone number or your email).
password string Required
Your Fido password.
number string ( Optional )
Your Fido phone number (it will use your username if empty).
monitored_variables list Required
Variables to monitor.
fido_dollar
Your Fido dollar balance
balance
Your account balance
data_used
Current data used
data_limit
Current data limit
data_remaining
Current data remaining
text_used
SMS sent
text_limit
SMS limit
text_remaining
SMS remaining
mms_used
MMS sent
mms_limit
MMS limit
mms_remaining
MMS remaining
text_int_used
International SMS sent
text_int_limit
International SMS limit
text_int_remaining
International SMS remaining
talk_used
Talk time used
talk_limit
Talk time limit
talk_remaining
Talk time remaining
other_talk_used
Other talk time used (It could be international calls)
other_talk_limit
Other talk time limit
other_talk_remaining
Other talk time remaining
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fido integration was introduced in Home Assistant 0.39, and it's used by
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
