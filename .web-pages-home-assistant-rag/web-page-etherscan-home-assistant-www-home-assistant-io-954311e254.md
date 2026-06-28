---
source_url: "https://www.home-assistant.io/integrations/etherscan"
final_url: "https://www.home-assistant.io/integrations/etherscan"
canonical_url: "https://www.home-assistant.io/integrations/etherscan/"
source_handle: "web:www-home-assistant-io:954311e254bd"
source_section: "integrations-etherscan"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4f7a311aba1fb771bdf48fe51d56295013c214062860dbdffc2e8832cf88bda2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Etherscan - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/etherscan
- Final URL: https://www.home-assistant.io/integrations/etherscan
- Canonical URL: https://www.home-assistant.io/integrations/etherscan/
- Fetched at: 2026-06-28T02:41:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Etherscan.io data within Home Assistant.

## Extracted Text

On this page
Related topics
The Etherscan integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] displays Ether and ERC-20 token balances from Etherscan.io .
To add the Etherscan sensor to your installation, specify an Ethereum address to watch in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. You can also optionally provide a token name to retrieve and ERC-20 token balance. If no token is provided then the balance retrieved will be in ETH. You can also optionally provide the token contract address in case the token name is not found.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : etherscan address : " 0xfB6916095ca1df60bB79Ce92cE3Ea74c37c5d359" - platform : etherscan address : " 0xfB6916095ca1df60bB79Ce92cE3Ea74c37c5d359" token : OMG - platform : etherscan address : " 0xfB6916095ca1df60bB79Ce92cE3Ea74c37c5d359" token_address : " 0xef68e7c694f40c8202821edf525de3782458639f" token : LRC
Configuration Variables
Looking for your configuration file?
address string Required
Ethereum wallet address to watch.
name string ( Optional , default: ETH Balance )
The name of the sensor used in the frontend.
token string ( Optional )
The ERC20 token symbol. For example, OMG.
token_address string ( Optional )
The ERC20 token contract address.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Etherscan integration was introduced in Home Assistant 0.47, and it's used by
31 active installations.
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
