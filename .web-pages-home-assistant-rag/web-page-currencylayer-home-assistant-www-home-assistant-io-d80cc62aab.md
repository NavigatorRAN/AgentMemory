---
source_url: "https://www.home-assistant.io/integrations/currencylayer"
final_url: "https://www.home-assistant.io/integrations/currencylayer"
canonical_url: "https://www.home-assistant.io/integrations/currencylayer/"
source_handle: "web:www-home-assistant-io:d80cc62aabf0"
source_section: "integrations-currencylayer"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "66f6e3965a86e1837ffbda27e4461b5730d367d859ec925ee5e8f8df408203ca"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# currencylayer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/currencylayer
- Final URL: https://www.home-assistant.io/integrations/currencylayer
- Canonical URL: https://www.home-assistant.io/integrations/currencylayer/
- Fetched at: 2026-06-28T02:35:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on integrating exchange rates from https://currencylayer.com/ within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Currencylayer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will show you the current exchange rate from Currencylayer that provides real-time exchange rates for 170 currencies . The free account is limited to only USD as a base currency, allows 250 requests per month and updates daily.
Obtain your API key from here .
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : currencylayer api_key : YOUR_API_KEY base : USD quote : - EUR - INR
Configuration Variables
Looking for your configuration file?
api_key string Required
The API Key from Currencylayer .
quote string | list ( Optional , default: Exchange rate )
The symbol(s) of the quote or target currencies.
base string ( Optional , default: USD )
The symbol of the base currency.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The currencylayer integration was introduced in Home Assistant 0.32, and it's used by
32 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Finance
Back to top
