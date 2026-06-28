# Blockchain.com - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/blockchain
- Final URL: https://www.home-assistant.io/integrations/blockchain
- Canonical URL: https://www.home-assistant.io/integrations/blockchain/
- Fetched at: 2026-06-28T02:31:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Blockchain.com data within Home Assistant.

## Extracted Text

On this page
Related topics
The Blockchain.com integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] displays Bitcoin wallet balances from blockchain.com .
To add the Blockchain sensor to your installation, specify a list of bitcoin addresses to watch in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
. The sensor state will be the sum of the balances of all addresses listed.
Currently, the original Bitcoin address format is supported.
For example, the newer Segwit and Taproot format are not supported.
# Example configuration.yaml entry sensor : - platform : blockchain addresses : - ' 1BMsHFczb2vY1BMDvFGWgGU8mkWVm5fupp' - ' 183J5pXWqYYsxZ7inTVw9tEpejDXyMFroe'
Configuration Variables
Looking for your configuration file?
addresses string | list Required
List of bitcoin wallet addresses to watch.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Blockchain.com integration was introduced in Home Assistant 0.47, and it's used by
33 active installations.
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
