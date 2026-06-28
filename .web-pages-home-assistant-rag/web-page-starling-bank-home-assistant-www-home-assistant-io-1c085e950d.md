# Starling Bank - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/starlingbank
- Final URL: https://www.home-assistant.io/integrations/starlingbank
- Canonical URL: https://www.home-assistant.io/integrations/starlingbank/
- Fetched at: 2026-06-28T03:18:46Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate your Starling Bank account within Home Assistant.

## Extracted Text

On this page
Access token
Configuration
Related topics
The Starling Bank integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your account balance data as sensors in Home Assistant.
Turn off the lights when money’s tight?
Play a song when you reach a savings goal?
Sound an alarm if you go into your overdraft?
You can find more information about Starling Bank at their website . Information on their API can be found on their developers site .
Once you have your own Starling bank account you will need to sign up for a Starling developer account here . You won’t need to do any development but you will need to get a “Personal Access Token” that will allow the integration to access your account balance.
Note
You control what access is granted using this token. This integration only needs very basic access (see below).
Once you’ve signed up:
Connect your personal Starling Bank account to your developer account. Head to Personal Access Page of your developer account.
Follow the instructions to generate the QR code to scan within the Starling mobile app to authorize and link your bank account to the developer account.
Head to the Personal Access Section of your developer account.
Click “Create Token”.
Give your token a name, e.g., “Home Assistant”.
Tick the permissions “account:read” and “balance:read”. The others you can leave un-ticked.
Click “Create” and make a note of the newly created token, you will need this for your Home Assistant configuration.
To add Starling account balance sensors to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : starlingbank accounts : - access_token : YOUR_PERSONAL_ACCESS_TOKEN
Configuration Variables
Looking for your configuration file?
accounts list Required
A list of Starling accounts. Allows you to monitor multiple Starling accounts.
name string ( Optional , default: Starling )
A friendly name for your account.
sandbox boolean ( Optional , default: false )
For test purposes. Set to true if you are using an access token for a sandbox Starling account.
access_token string Required
Your personal access token.
balance_types list ( Optional )
Choose to monitor your cleared or effective balance (or both).
Default:
Both balance types will be monitored.
cleared_balance
Excludes outstanding transactions.
effective_balance
Includes outstanding transactions.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Starling Bank integration was introduced in Home Assistant 0.79, and it's used by
61 active installations.
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
