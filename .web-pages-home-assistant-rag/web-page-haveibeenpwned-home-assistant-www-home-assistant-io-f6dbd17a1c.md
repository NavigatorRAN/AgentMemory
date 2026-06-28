---
source_url: "https://www.home-assistant.io/integrations/haveibeenpwned"
final_url: "https://www.home-assistant.io/integrations/haveibeenpwned"
canonical_url: "https://www.home-assistant.io/integrations/haveibeenpwned/"
source_handle: "web:www-home-assistant-io:f6dbd17a1ced"
source_section: "integrations-haveibeenpwned"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0de1b0efa15848d5de91895f4a063fe356d7d74763c188e4c5a464e6936972c6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# HaveIBeenPwned - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/haveibeenpwned
- Final URL: https://www.home-assistant.io/integrations/haveibeenpwned
- Canonical URL: https://www.home-assistant.io/integrations/haveibeenpwned/
- Fetched at: 2026-06-28T02:48:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate HaveIBeenPwned sensor into Home Assistant.

## Extracted Text

On this page
Configuration
Breach meta data
Related topics
The HaveIBeenPwned integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] creates sensors that check for breached email accounts on haveibeenpwned .
To use this integration you need to purchase an API key. Visit the API key page on the HIBP website to purchase one.
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. It will list every specified email address as a sensor showing the number of breaches on that email account.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry using cloud based emoncms sensor : - platform : haveibeenpwned email : - [email protected] - [email protected] api_key : API_KEY
Configuration Variables
Looking for your configuration file?
email list Required
List of email addresses.
api_key string Required
HaveIBeenPwned API Key
If one of your email accounts is breached the sensor will display breach meta data. It will list the title of the site where your email
account has been breached as well as the added date of the breach data. This data is displayed in descending order so that the state attribute
breach 1 will always contain the last known breach for the specific email account, if there are any breaches detected.
Note
The sensor will scan all email addresses specified with a 5 second delay between all breach data requests on Home Assistant startup.
After this initial startup scanning, the sensor will only scan one email account per 15 minutes to prevent abuse, and not hammer “the
Have I been Pwned” service, as this breach data almost never changes.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The HaveIBeenPwned integration was introduced in Home Assistant 0.31, and it's used by
13 active installations.
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
