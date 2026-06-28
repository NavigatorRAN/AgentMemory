---
source_url: "https://www.home-assistant.io/integrations/fints"
final_url: "https://www.home-assistant.io/integrations/fints"
canonical_url: "https://www.home-assistant.io/integrations/fints/"
source_handle: "web:www-home-assistant-io:de8190e3fbfe"
source_section: "integrations-fints"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7c8e780f0c267f6f70fc80f80a792bfca59434b2d96a22f00fad26fd671ef207"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FinTS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fints
- Final URL: https://www.home-assistant.io/integrations/fints
- Canonical URL: https://www.home-assistant.io/integrations/fints/
- Fetched at: 2026-06-28T02:42:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use the FinTS sensor.

## Extracted Text

On this page
Configuration
Related topics
With the FinTS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you can fetch your account information from your bank. This only works with banks that support the FinTS (aka. HBCI) standard. The FinTS standard used by many German banks. So if you do not have a German bank account, this will most likely not work for you. To find out if your bank supports FinTS, check the bank’s website or call their hotline.
To find out the configuration for your bank, check their website or call their hotline. Do not use random information you find on the Internet! As you’re storing your bank account information in the Home Assistant configuration: Make sure that this configuration is not accessible to anyone.
For each account you have with the bank, a separate sensor is created. If you have several accounts with a bank, you can select which ones you want to have, and you can also give the accounts a name.
To enable FinTS, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : fints bank_identification_number : ID_FOR_YOUR_BANK username : YOUR_FINTS_USERNAME pin : YOUR_PIN url : URL_FOR_YOUR_BANK
Configuration Variables
Looking for your configuration file?
name string ( Optional )
Name of the bank.
bank_identification_number string Required
Bank identification number, in most cases the “Bankleitzahl”.
username string Required
Your FinTS username.
pin string Required
Your FinTS PIN or password.
url string Required
URL of your bank’s FinTS server.
accounts list ( Optional )
The balance accounts to show. If not set then all accounts will show up.
account string Required
The IBAN of the balance account.
Use this field to give the account a meaningful name.
holdings list ( Optional )
The holding accounts of your bank. If not set then all accounts will show up.
The classic account number.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FinTS service was introduced in Home Assistant 0.70, and it's used by
8 active installations.
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
