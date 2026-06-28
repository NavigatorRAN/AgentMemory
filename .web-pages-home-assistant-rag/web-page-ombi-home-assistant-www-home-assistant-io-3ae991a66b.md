# Ombi - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ombi
- Final URL: https://www.home-assistant.io/integrations/ombi
- Canonical URL: https://www.home-assistant.io/integrations/ombi/
- Fetched at: 2026-06-28T03:05:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the Ombi integration in Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Full example for the configuration
List of actions
Related topics
The Ombi integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] monitors data from your Ombi instance.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] needs to authenticate to your Ombi instance with either a user password or an api_key .
To find your api_key open the Ombi web interface. Navigate to Settings and then to Ombi , you should then be able to see your api_key .
If you want to use password authentication simply use the same password you normally use to log in to Ombi. Alternatively, you can set up a separate local account in Ombi designated for Home Assistant. To do this, open the Ombi web interface. Navigate to User Management and then press Add User To Ombi . Input your desired user details and use the same details when configuring this integration.
If you want to enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry ombi : host : OMBI_HOST username : OMBI_USERNAME password : OMBI_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or IP Address Ombi is running on.
username string Required
Your Ombi username.
password string ( Exclusive )
Your Ombi password. password and api_key cannot be specified concurrently.
api_key string ( Exclusive )
Your Ombi API key. password and api_key cannot be specified concurrently.
port integer ( Optional , default: 5000 )
The port Ombi is running on.
urlbase string ( Optional )
The Base URL path of your Ombi instance.
ssl boolean ( Optional , default: false )
Whether or not to use SSL when connecting to Ombi.
# Example configuration.yaml entry ombi : host : OMBI_HOST username : OMBI_USERNAME api_key : OMBI_API_KEY port : OMBI_PORT urlbase : ombi/ ssl : true
The Ombi integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Submit movie request ( ombi.submit_movie_request )
Searches for a movie and requests the first result in Ombi.
Submit music request ( ombi.submit_music_request )
Searches for a music album and requests the first result in Ombi.
Submit TV request ( ombi.submit_tv_request )
Searches for a TV show and requests the first result in Ombi.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ombi integration was introduced in Home Assistant 0.100, and it's used by
42 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@larssont
Categories
Sensor
Back to top
